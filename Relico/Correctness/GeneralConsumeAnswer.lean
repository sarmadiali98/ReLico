import Relico.Correctness.GeneralWeakBisimulation
import Relico.LF.GeneralKindOrigin

set_option autoImplicit false

namespace Relico
namespace Correctness

/-!
# The consume answer adapter

This module removes the artificial `hConsumeAnswer` hole that
`Relico/Correctness/GeneralInstantBlockForward.lean` and
`Relico/Correctness/GeneralTraceTransfer.lean` still take as a premise.

It is a thin adapter over the two theorems that already carry the real content:

* `generalConsumeRepresentativePackage` builds the α′ representative and every geometric
  fact of the consume core.
* `generalConsume_forward_weak_of_fireRepresentative` fires that representative and produces
  the `WeakStep` together with the source/target `GeneralStateCorrespondence`.

The one fact neither of those can supply is the **server bridge**: the kind-origin resolution
(`LF.generalKindOrigin_resolution`) names a message server `serverK` by the event's *kind*,
while the consume core fires against the DTR server `serverD` resolved by the *message name*.
`GeneralConsumeMatch` deliberately carries only target/time/payload (F78), so the identity
`serverK = serverD` is not derivable from it — it reduces to the single explicit atom
`serverK.name = message.messageName`, which `generalConsumeServerBridge` takes as a hypothesis.
-/

/--
Two message servers of one class with the same name are the same server, given the class's
server names are duplicate-free.

The occurrence-exact uniqueness the bridge needs to collapse the kind-origin server onto the
message-resolved one: both sit in the receiving class's `messageServers`, and
`generalTriggerDistinctnessAt` decides that list's names are `Nodup`.
-/
private theorem messageServer_eq_of_name_of_nodup
    {servers : List DTR.GeneralMessageServer}
    {left right : DTR.GeneralMessageServer}
    (hNodup :
      (servers.map
        (fun server => server.name)).Nodup)
    (hLeft : left ∈ servers)
    (hRight : right ∈ servers)
    (hName : left.name = right.name) :
    left = right := by
  induction servers with

  | nil =>
      simp at hLeft

  | cons head remaining inductionHypothesis =>
      rw [List.map_cons, List.nodup_cons] at hNodup

      obtain ⟨hNotMem, hRemaining⟩ := hNodup

      rcases List.mem_cons.mp hLeft with rfl | hLeftMem

      · rcases List.mem_cons.mp hRight with rfl | hRightMem

        · rfl

        · exact
            absurd
              (hName.symm ▸
                List.mem_map.mpr
                  ⟨right, hRightMem, rfl⟩)
              hNotMem

      · rcases List.mem_cons.mp hRight with rfl | hRightMem

        · exact
            absurd
              (hName ▸
                List.mem_map.mpr
                  ⟨left, hLeftMem, rfl⟩)
              hNotMem

        · exact
            inductionHypothesis
              hRemaining
              hLeftMem
              hRightMem

/--
**The server bridge.** Convert the kind-origin resolution package into the DTR-server package the
forward consume core reads.

The resolution corollary (`LF.generalKindOrigin_resolution`) is applied by the caller and its
outputs handed in here: the reaction `program.reactionFor?` finds for the event's kind, its
parameter-name and compiled-body equations *stated at the kind-origin server* `serverK`, the
originating class, the reactor `reactionFor?` resolves through, and the compilation environment.

Given the DTR server `serverD` that `messageServerFor?` resolves for the taken message's name, plus
the one non-derivable atom `serverK.name = message.messageName`, this rewrites the package onto
`serverD`: `serverK` and `serverD` are both members of the receiving class's `messageServers`
(`serverD` because `messageServerFor?` succeeded there, `serverK` from the resolution) and share a
name, so class-level name uniqueness collapses them. The environment fact is re-expressed as the
`outputPortEnvOfActorName` the core takes, and the compiled body as `GeneralContinuationCompiles`.
-/
theorem generalConsumeServerBridge
    {model : DTR.GeneralModel}
    {program : LF.GeneralProgram}
    {routes : List Translation.GeneralRoute}
    {event : LF.GeneralPendingEvent}
    {receiver : ActorName}
    {message : DTR.GeneralMessage}
    {reaction : LF.GeneralReaction}
    {reactiveClass : DTR.GeneralReactiveClass}
    {serverK serverD : DTR.GeneralMessageServer}
    {reactor : LF.GeneralReactor}
    {env : Translation.GeneralOutputPortEnv}
    (hModelWellFormed :
      model.wellFormed = true)
    (hCompiled :
      Translation.compileGeneralModel model =
        .ok program)
    (hMatch :
      GeneralConsumeMatch receiver message event)
    (hServerD :
      DTR.GeneralModel.messageServerFor?
          model
          receiver
          message.messageName =
        some serverD)
    (hReaction :
      program.reactionFor?
          event.target
          event.kind =
        some reaction)
    (hParams :
      reaction.parameters =
        serverK.parameters.map
          (fun parameter => parameter.name))
    (hClassMember :
      reactiveClass ∈ model.classes)
    (hServerMember :
      serverK ∈ reactiveClass.messageServers)
    (hReactor :
      program.reactorOfInstance? event.target =
        some reactor)
    (hClassCompiled :
      Translation.compileGeneralReactiveClass
          model.classes
          routes
          reactiveClass =
        .ok reactor)
    (hEnv :
      Translation.outputPortEnvOf
          model.classes
          reactiveClass =
        .ok env)
    (hBody :
      Translation.compileGeneralBody
          env
          { bodyKey := .messageServer serverK.name,
            selfSends :=
              Translation.selfSendsOfClass
                reactiveClass }
          0
          serverK.body =
        .ok reaction.body)
    (hServerName :
      serverK.name = message.messageName) :
    program.reactionFor?
        event.target
        event.kind =
      some reaction ∧
    reaction.parameters =
      serverD.parameters.map
        (fun parameter => parameter.name) ∧
    outputPortEnvOfActorName model receiver =
      some env ∧
    GeneralContinuationCompiles
      env
      serverD.body
      reaction.body := by
  -- The event's target is the receiver, so the resolution's class is the receiver's class.
  have hTarget :
      event.target = receiver :=
    hMatch.1

  have hClassOfReceiver :
      model.classOfActor? receiver =
        some reactiveClass := by
    rw [← hTarget]
    exact
      classOfActor?_of_reactorOfInstance?
        hCompiled
        hReactor
        hClassMember
        hClassCompiled

  -- `messageServerFor?` therefore resolves inside `reactiveClass.messageServers`.
  have hServerDLookup :
      DTR.GeneralReactiveClass.messageServer?
          reactiveClass
          message.messageName =
        some serverD := by
    rw [
      DTR.GeneralModel.messageServerFor?,
      hClassOfReceiver
    ] at hServerD
    exact hServerD

  have hServerDMemName :
      serverD ∈ reactiveClass.messageServers ∧
        serverD.name = message.messageName :=
    DTR.GeneralModel.findMessageServer?_mem_and_name
      reactiveClass.messageServers
      message.messageName
      serverD
      hServerDLookup

  obtain ⟨hServerDMember, hServerDName⟩ := hServerDMemName

  -- Class-level server-name uniqueness collapses the kind-origin server onto the DTR server.
  have hServerNames :
      (reactiveClass.messageServers.map
        (fun server => server.name)).Nodup :=
    (LF.generalTriggerDistinctnessAt
        hModelWellFormed
        hCompiled
        hClassMember
        hClassCompiled
        (LF.mem_reactors_of_reactorOfInstance?
          hReactor)).2.2

  have hServerEq :
      serverK = serverD :=
    messageServer_eq_of_name_of_nodup
      hServerNames
      hServerMember
      hServerDMember
      (by rw [hServerName, hServerDName])

  subst hServerEq

  -- The environment equation the core takes.
  have hEnvName :
      outputPortEnvOfActorName model receiver =
        some env :=
    outputPortEnvOfActorName_eq
      hClassOfReceiver
      hEnv

  -- The compiled body as a continuation-compiles relation.
  have hCompiles :
      GeneralContinuationCompiles
        env
        serverK.body
        reaction.body :=
    generalContinuationCompiles_messageServerEntry
      reactiveClass
      serverK
      env
      reaction
      model.classes
      hServerMember
      hServerNames
      hEnv
      hBody

  exact
    ⟨hReaction,
     hParams,
     hEnvName,
     hCompiles⟩

/--
**The consume answer, for a single source `.consume` step.**

This is the real content behind the `hConsumeAnswer` residue that
`GeneralInstantBlockForward` and `GeneralTraceTransfer` currently take as a premise. Given a
corresponding pair with both stores key-unique and a source `DTR.GeneralStep.take`, it produces the
fired event, the target's modulo weak step at that event's own label, the match, the post-state
correspondence, and the target invariant re-established — exactly the shape
`generalConsume_forward_weak_of_fireRepresentative` produces.

It does not discharge the frozen α′ decision (`hFrontSameTag`), the scheduler/selection facts
(`hArrival`, `hUniqueDue`), the two structural invariants (`hNoPast`, `hOrigin`), nor the
server-origin name compatibility (`hServerName`): those are the genuine residue, carried here as
explicit premises. What it removes is the opaque `Common.WeakStep` existential, replacing it with the
package/bridge/core assembly.

The assembly is: DTR `take` inversion (`GeneralStep.result_of_consume`) → representative package
(`generalConsumeRepresentativePackage`) → kind-origin resolution (`LF.generalKindOrigin_resolution`)
→ server bridge (`generalConsumeServerBridge`) → forward weak theorem
(`generalConsume_forward_weak_of_fireRepresentative`) → package final witnesses. The environment is
kept as the correspondence's own `.choose` throughout, reconciled with the resolution env by
`Option.some.inj` rather than by a second witness; `before.pending`'s correspondence is transported
to `stepState.pending` along the package's own `hAlpha` queue α-equivalence; and the target invariant
is `Store.keysUnique_update` over `before.reactors = stepState.reactors`, never crossing α.
-/
theorem generalConsumeAnswer
    {model : DTR.GeneralModel}
    {program : LF.GeneralProgram}
    {routes : List Translation.GeneralRoute}
    {stepConfig stepConfig' : DTR.GeneralRuntimeConfiguration}
    {stepState : LF.GeneralRuntimeState}
    {receiver : ActorName}
    {message : DTR.GeneralMessage}
    (hModelWellFormed :
      model.wellFormed = true)
    (hCompiled :
      Translation.compileGeneralModel model =
        .ok program)
    (hEnvNodup :
      ∀ candidate ∈ model.instances,
        ∀ candidateEnv : Translation.GeneralOutputPortEnv,
          (∃ candidateClass : DTR.GeneralReactiveClass,
            model.class? candidate.className =
                some candidateClass ∧
              Translation.outputPortEnvOf
                  model.classes
                  candidateClass =
                .ok candidateEnv) →
          (List.map
            (fun candidateEntry =>
              candidateEntry.outputPort.value)
            candidateEnv).Nodup)
    (hNames :
      (List.map
        (fun candidate =>
          candidate.name)
        model.instances).Nodup)
    (hCorrespondence :
      GeneralStateCorrespondence
        model
        stepConfig
        stepState)
    (hUniqueS :
      DTR.GeneralStoreKeyUnique stepConfig)
    (hUniqueT :
      LF.GeneralStoreKeyUnique stepState)
    (hStep :
      DTR.GeneralStep
        model
        stepConfig
        (DTR.GeneralLabel.consume
          receiver
          message)
        stepConfig')
    (hNoPast :
      LF.GeneralNoPastPending stepState)
    (hOrigin :
      LF.GeneralKindOrigin
        model
        program
        routes
        stepState)
    (hArrival :
      message.arrival = stepConfig.now)
    (hUniqueDue :
      DTR.GeneralActorSelection.UniqueDueAtSelected
        stepConfig.erase
        {
          actorName := receiver
          logicalTime := stepConfig.now
        })
    (hFrontSameTag :
      ∀ (front back : LF.GeneralEventQueue)
        (event : LF.GeneralPendingEvent),
        stepState.pending = front ++ event :: back →
        GeneralConsumeMatch receiver message event →
        event.tag = stepState.currentTag ∧
          (∀ x ∈ front, x.tag = event.tag) ∧ event ∉ front)
    (hServerName :
      ∀ (event : LF.GeneralPendingEvent)
        (reaction : LF.GeneralReaction)
        (reactiveClass : DTR.GeneralReactiveClass)
        (serverK : DTR.GeneralMessageServer),
        event ∈ stepState.pending →
        GeneralConsumeMatch receiver message event →
        program.reactionFor?
            event.target
            event.kind =
          some reaction →
        reactiveClass ∈ model.classes →
        serverK ∈ reactiveClass.messageServers →
        reaction.parameters =
          serverK.parameters.map
            (fun parameter => parameter.name) →
        serverK.name = message.messageName) :
    ∃ (stepState' : LF.GeneralRuntimeState)
      (event : LF.GeneralPendingEvent),
      Common.WeakStep
          (LF.GeneralStepModulo program)
          LF.GeneralLabel.isTau
          stepState
          (LF.GeneralLabel.consume
            event.target
            event.kind)
          stepState' ∧
        GeneralConsumeMatch
          receiver
          message
          event ∧
        GeneralStateCorrespondence
          model
          stepConfig'
          stepState' ∧
        LF.GeneralStoreKeyUnique stepState' := by
  -- DTR `take` inversion: the actor, the bag split, idleness, the message server, and the pinned
  -- post-configuration.
  obtain
      ⟨actor, earlier, later, server,
       hActor, hDue, hIdle, hServer, hResult⟩ :=
    hStep.result_of_consume

  -- The representative package: the α′ representative and every geometric fact of the consume core.
  obtain
      ⟨before, event, earlier', later', reactorRT,
       hMatch, hEventMember, hEventTime, hAlpha, hEarliest,
       hTagAligned, hQueue, hReactorBefore, hIdleRT, hUniqueFilterT,
       hBeforeReactors, hPairedBefore⟩ :=
    generalConsumeRepresentativePackage
      program
      model
      stepConfig
      stepState
      hCorrespondence
      hNoPast
      hUniqueS
      hUniqueT
      receiver
      actor
      message
      earlier
      later
      hDue
      server
      hServer
      hActor
      hIdle
      hArrival
      hUniqueDue
      hEnvNodup
      hNames
      hCompiled
      hFrontSameTag

  -- The correspondence's own chosen environment for the taking actor.
  obtain ⟨reactorChoose, hEnvChoose, _, _⟩ :=
    (hCorrespondence.reactorOfActor
        receiver
        actor
        (Store.mem_of_lookup
          stepConfig.actors
          receiver
          actor
          hActor)).choose_spec

  -- Kind-origin resolution: the reaction the event's kind fires and its compiled-program facts.
  obtain
      ⟨reaction, reactiveClass, serverK, reactorLF, envRes, compiledBody,
       hReactionRes, hParamsRes, hBodyEqRes, hClassMem, hServerMem,
       hReactorInst, hClassCompiled, hEnvOf, hBodyRes⟩ :=
    LF.generalKindOrigin_resolution
      hModelWellFormed
      hCompiled
      hOrigin
      hEventMember

  -- The server-origin name compatibility, the one non-derivable atom.
  have hServerNameEq :
      serverK.name = message.messageName :=
    hServerName
      event
      reaction
      reactiveClass
      serverK
      hEventMember
      hMatch
      hReactionRes
      hClassMem
      hServerMem
      hParamsRes

  -- The server bridge rewrites the kind-origin package onto the DTR server the core reads.
  obtain ⟨hReactionOut, hParamsOut, hEnvNameOut, hCompilesOut⟩ :=
    generalConsumeServerBridge
      hModelWellFormed
      hCompiled
      hMatch
      hServer
      hReactionRes
      hParamsRes
      hClassMem
      hServerMem
      hReactorInst
      hClassCompiled
      hEnvOf
      (by
        rw [hBodyEqRes]
        exact hBodyRes)
      hServerNameEq

  -- The chosen environment and the resolution environment are the same, both being
  -- `outputPortEnvOfActorName model receiver`.
  have hEnvEq :
      (hCorrespondence.reactorOfActor
          receiver
          actor
          (Store.mem_of_lookup
            stepConfig.actors
            receiver
            actor
            hActor)).choose =
        envRes :=
    Option.some.inj
      (hEnvChoose.symm.trans hEnvNameOut)

  -- Transport the actor correspondence from `before.pending` to `stepState.pending` along the
  -- package's own queue α-equivalence, then re-express it at the resolution environment.
  have hPaired :
      GeneralActorCorresponds
        envRes
        receiver
        actor
        reactorRT
        stepState.pending := by
    rw [← hEnvEq]
    exact
      generalActorCorresponds_of_queueAlphaEquiv
        _
        receiver
        actor
        reactorRT
        hPairedBefore
        hAlpha.2.2.2

  -- The DTR occurrence-exact singleton filter at the taking actor.
  have hUniqueSFilter :
      stepConfig.actors.filter
          (fun entry =>
            decide (entry.1 = receiver)) =
        [(receiver, actor)] :=
    Store.filter_eq_singleton_of_keysUnique_of_mem
      hUniqueS
      (Store.mem_of_lookup
        stepConfig.actors
        receiver
        actor
        hActor)

  -- Fire the representative: the modulo weak step and the post-state correspondence.
  obtain ⟨hWeakStep, hCorr'⟩ :=
    generalConsume_forward_weak_of_fireRepresentative
      program
      model
      stepConfig
      stepState
      hCorrespondence
      receiver
      actor
      message
      earlier
      later
      hDue
      server
      event
      hMatch
      hEventTime
      stepState
      (Common.TauSteps.refl stepState)
      rfl
      rfl
      before
      hAlpha
      hEarliest
      hTagAligned
      earlier'
      later'
      hQueue
      reactorRT
      hUniqueFilterT
      hReactorBefore
      hIdleRT
      reaction
      hReactionOut
      hParamsOut
      envRes
      hEnvNameOut
      hCompilesOut
      hUniqueSFilter
      hPaired

  refine
    ⟨_, event, hWeakStep, hMatch, ?_, ?_⟩

  · -- Post-state correspondence, with the pinned configuration substituted.
    rw [hResult]
    exact hCorr'

  · -- Target key-uniqueness: `Store.update` over the α-untouched reactor store.
    show
      Store.KeysUnique
        (Store.update
          before.reactors
          event.target
          _)
    refine Store.keysUnique_update ?_
    rw [hBeforeReactors]
    exact hUniqueT

end Correctness
end Relico
