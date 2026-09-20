/-
! # Assembling the general family's trace-agreement transfer premise

`Correctness.generalTraceAgreement_forward` takes a per-step transfer condition as a premise. This module
assembles that condition from what is already proved, leaving exactly one residue named and visible.

## The three cases, and where each comes from

A source `Common.WeakStep` carries one label, and `DTR.GeneralLabel` has three shapes:

* **τ** — discharged outright, from `Correctness.generalTauSteps_forward` and
  `Common.WeakStep.of_tauSteps`. A τ-labelled weak step *is* a τ closure, so no per-statement lemma is
  needed: the closure theorem already covers `assign`, `trace` and `send` together. This is why no
  `generalTrace_forward_weak` / `generalAssign_forward_weak` / `generalSend_forward_weak` exist — they would
  duplicate `generalTauSteps_forward`.
* **`.timeAdvance`** — discharged by reusing `Correctness.generalTimeAdvance_forward_weak`, with the source
  step inverted first. Only `DTR.GeneralStep.timeProgress` can carry that label, so the inversion has one
  case.
* **`.consume`** — **kept as a premise**, in exactly the shape
  `Correctness.generalConsume_forward_weak_of_fireRepresentative` produces. That premise is the α′
  representative package, which this development has deliberately not discharged. Supplying it here would
  claim the frozen question was settled.

## What the relation has to carry, and why it is bundled

The generic trace theorem is parametric in `related`, but the two τ paddings are crossed by
`generalTauSteps_forward_raw`, which consumes **both** store-key uniqueness invariants at every step. A bare
`GeneralStateCorrespondence` is therefore not enough to run the induction, so `GeneralTraceRelated` bundles
the correspondence with both invariants. That is not a strengthening of anything: both invariants are proved
reachable-state facts (`DTR.generalStoreKeyUnique_of_reachable`, `LF.generalStoreKeyUnique_of_reachable`), so
a caller starting from initial states holds them already.

Bundling also makes the relation *inductive* along the transfer, which is the property the generic theorem
needs: each case re-establishes both invariants rather than assuming they survive.

## What this module does not do

It changes no theorem shape. It does not strengthen `hConsumeAnswer`, does not touch the forward spine, does
not modify any `GeneralInstantBlock` proof, does not revisit α or F27, and adds no runtime field. The two
private helpers below are local twins of `private` lemmas in
`Relico/Correctness/GeneralInstantBlockForward.lean`; the house rule prefers duplicating a small lemma over
de-privatising one.
-/
import Relico.Correctness.GeneralObservable
import Relico.Correctness.GeneralConsumeAnswer

set_option autoImplicit false

namespace Relico
namespace Correctness

/-!
## Two local twins

Both exist as `private` declarations in `Relico/Correctness/GeneralInstantBlockForward.lean`. Duplicated
rather than de-privatised, and the duplication is deliberate: that file's copies serve the block induction
and these serve the trace transfer, so a later change to either breaks only its own consumer.
-/

/--
Source actor-store key uniqueness survives a τ closure.

The mirror of `LF.generalStoreKeyUnique_of_tauSteps` for the side that has only the per-step theorem. The
label filter plays no role — `DTR.generalStoreKeyUnique_of_step` holds at any label — which is why the
induction has no case on it.
-/
private theorem generalStoreKeyUnique_of_sourceTauStepsLocal
    {model : DTR.GeneralModel}
    {config config' : DTR.GeneralRuntimeConfiguration}
    (hUnique :
      DTR.GeneralStoreKeyUnique config)
    (hSteps :
      Common.TauSteps
        (DTR.GeneralStep model)
        DTR.GeneralLabel.isTau
        config
        config') :
    DTR.GeneralStoreKeyUnique config' := by
  revert hUnique

  induction hSteps with

  | refl current =>
      intro hUniqueCurrent

      exact hUniqueCurrent

  | cons headStep headIsTau remainingSteps IH =>
      intro hUniqueStep

      exact
        IH
          (DTR.generalStoreKeyUnique_of_step
            hUniqueStep
            headStep)

/--
A weak step absorbs a τ closure on its left.

`Common.TauSteps.trans` concatenates the closures. The middle step's own `tau` alternative is harmless: a
τ-labelled weak step is carried by the constructor whatever the label index says, and the concatenation is
still the right splice.
-/
private theorem weakStep_prependTauLocal
    {State : Type}
    {Label : Type}
    {step : Common.LabeledTransition State Label}
    {isTau : Label → Prop}
    {source middle target : State}
    {label : Label}
    (hPrefix :
      Common.TauSteps
        step
        isTau
        source
        middle)
    (hStep :
      Common.WeakStep
        step
        isTau
        middle
        label
        target) :
    Common.WeakStep
      step
      isTau
      source
      label
      target := by

  cases hStep with

  | tau hTau hSteps =>
      exact
        Common.WeakStep.tau
          hTau
          (Common.TauSteps.trans
            hPrefix
            hSteps)

  | visible hVisible hInner hRaw hSuffix =>
      exact
        Common.WeakStep.visible
          hVisible
          (Common.TauSteps.trans
            hPrefix
            hInner)
          hRaw
          hSuffix

/--
A weak step absorbs a τ closure on its right.
-/
private theorem weakStep_appendTauLocal
    {State : Type}
    {Label : Type}
    {step : Common.LabeledTransition State Label}
    {isTau : Label → Prop}
    {source middle target : State}
    {label : Label}
    (hStep :
      Common.WeakStep
        step
        isTau
        source
        label
        middle)
    (hSuffix :
      Common.TauSteps
        step
        isTau
        middle
        target) :
    Common.WeakStep
      step
      isTau
      source
      label
      target := by

  cases hStep with

  | tau hTau hSteps =>
      exact
        Common.WeakStep.tau
          hTau
          (Common.TauSteps.trans
            hSteps
            hSuffix)

  | visible hVisible hPrefix hRaw hInner =>
      exact
        Common.WeakStep.visible
          hVisible
          hPrefix
          hRaw
          (Common.TauSteps.trans
            hInner
            hSuffix)

/--
A weak step at an internal label is its τ closure.

The `visible` alternative is refuted by the label's own τ-ness: the constructor's first field contradicts
it. This is what lets a τ answer's weak step be spliced as a raw closure rather than nested as a weak step.
-/
private theorem weakStep_tauSteps_of_tauLabelLocal
    {State : Type}
    {Label : Type}
    {step : Common.LabeledTransition State Label}
    {isTau : Label → Prop}
    {source target : State}
    {label : Label}
    (hTau :
      isTau label)
    (hStep :
      Common.WeakStep
        step
        isTau
        source
        label
        target) :
    Common.TauSteps
      step
      isTau
      source
      target := by

  cases hStep with

  | tau _ hSteps =>
      exact
        hSteps

  | visible hVisible _ _ _ =>
      exact
        absurd
          hTau
          hVisible

/--
A visible weak step absorbs a τ closure on either end.

The splice each visible case performs: the source's own weak step pads its visible step with τ segments, the
answer's weak step pads its own, and composing means concatenating four τ segments around one visible step
rather than nesting weak steps.

`cases` on the middle step rather than `induction`, since `Common.WeakStep` has no premise of its own type.
The `tau` alternative is refuted by `hVisible`, which is why visibility is taken explicitly rather than
recovered from the label — the caller has it either way, and taking it keeps the lemma independent of which
labels a family calls internal.
-/
private theorem weakStep_padTauLocal
    {State : Type}
    {Label : Type}
    {step : Common.LabeledTransition State Label}
    {isTau : Label → Prop}
    {source before after target : State}
    {label : Label}
    (hVisible :
      ¬ isTau label)
    (hPrefix :
      Common.TauSteps
        step
        isTau
        source
        before)
    (hMiddle :
      Common.WeakStep
        step
        isTau
        before
        label
        after)
    (hSuffix :
      Common.TauSteps
        step
        isTau
        after
        target) :
    Common.WeakStep
      step
      isTau
      source
      label
      target := by

  cases hMiddle with

  | tau hTau _ =>
      exact
        absurd
          hTau
          hVisible

  | visible _ hInnerPrefix hStep hInnerSuffix =>
      exact
        Common.WeakStep.visible
          hVisible
          (Common.TauSteps.trans
            hPrefix
            hInnerPrefix)
          hStep
          (Common.TauSteps.trans
            hInnerSuffix
            hSuffix)

/-!
## The relation the transfer is inductive along
-/

/--
The correspondence together with both store-key invariants.

The relation `Correctness.generalTraceAgreement_forward` is instantiated at. Bundled rather than passed as
three arguments because the generic theorem takes **one** relation, and because the invariants have to be
re-established at each transfer step rather than assumed to survive — a bundle makes that an obligation the
type system checks.

Neither invariant is a new assumption: both are reachable-state facts
(`DTR.generalStoreKeyUnique_of_reachable`, `LF.generalStoreKeyUnique_of_reachable`), so a caller starting
from initial states holds them. What they buy is the ability to cross τ segments at all —
`generalTauSteps_forward_raw` consumes both at every step.
-/
def GeneralTraceRelated
    (model : DTR.GeneralModel)
    (config : DTR.GeneralRuntimeConfiguration)
    (state : LF.GeneralRuntimeState) :
    Prop :=
  GeneralStateCorrespondence
      model
      config
      state ∧
    DTR.GeneralStoreKeyUnique config ∧
      LF.GeneralStoreKeyUnique state

/-!
## The assembled transfer condition

One theorem, three cases, one residue.
-/

/--
**The trace-agreement transfer condition for the general family, assembled.**

Every source weak step is answered by a target weak step of the quotient system, with the relation
re-established and the two labels observing the same thing. This is precisely
`Correctness.generalTraceAgreement_forward`'s `hForward` premise at `Correctness.GeneralTraceRelated`, so a
caller feeds it straight in.

**The three cases.**

* **τ** — `generalTauSteps_forward` produces the target closure and `Common.WeakStep.of_tauSteps` labels it
  `LF.GeneralLabel.tau`. The observation obligation closes because *both* projections send their internal
  label to `none`. No per-statement theorem is involved: a τ-labelled weak step *is* a τ closure, and the
  closure theorem covers `assign`, `trace` and `send` at once — which is why no
  `generalTrace_forward_weak` / `generalAssign_forward_weak` / `generalSend_forward_weak` exist or are needed.
* **`.timeAdvance`** — the visible source step is `cases`d (only `DTR.GeneralStep.timeProgress` carries that
  label) and `generalTimeAdvance_forward_weak` supplies the answer, lifted by
  `LF.GeneralStepModulo.weakStep_of_raw`. Both observed endpoints agree because
  `GeneralStateCorrespondence.logicalTime` equates the clocks and the answer's event sits at `future`.
* **`.consume`** — **delegated to `hConsumeAnswer`**, the premise. Not discharged and not weakened: its shape
  is what `generalConsume_forward_weak_of_fireRepresentative` produces, so a caller who can supply an
  α-representative discharges it by applying that theorem. The α′ question stays open, named, and visible.

**Why the paddings are crossed in the raw system.** Both τ segments are answered by
`generalTauSteps_forward_raw` and lifted only at the splice. `Common.TauSteps` over `LF.GeneralStepModulo`
cannot preserve `LF.GeneralStoreKeyUnique` — a modulo step may switch α-representatives and α cannot see
occurrence multiplicity — so the invariant is re-established on raw closures and never transported through α.

**Why the three τ statement forms are refuted rather than handled** in the `visible` case: they carry
`DTR.GeneralLabel.tau`, so `hVisible : ¬ isTau label` becomes `¬ True` once the label is fixed. `absurd
True.intro hVisible` closes each. A fourth τ rule would appear here as a new unhandled case rather than
falling through.

No theorem shape changed, no `GeneralInstantBlock` proof touched, no α or F27 decision revisited, no runtime
field added.
-/
theorem generalTraceTransfer_forward
    {model : DTR.GeneralModel}
    {program : LF.GeneralProgram}
    {routes : List Translation.GeneralRoute}
    (hCompiled :
      Translation.compileGeneralModel model =
        .ok program)
    (hRoutes :
      Translation.routesOf model =
        .ok routes)
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
    (hModelWellFormed :
      model.wellFormed = true)
    (hConsumeResidue :
      ∀ (stepConfig stepConfig' : DTR.GeneralRuntimeConfiguration)
        (stepState : LF.GeneralRuntimeState)
        (receiver : ActorName)
        (message : DTR.GeneralMessage),
        GeneralTraceRelated
          model
          stepConfig
          stepState →
        DTR.GeneralStep
          model
          stepConfig
          (DTR.GeneralLabel.consume
            receiver
            message)
          stepConfig' →
        LF.GeneralNoPastPending stepState ∧
          LF.GeneralKindOrigin
            model
            program
            routes
            stepState ∧
          message.arrival = stepConfig.now ∧
          DTR.GeneralActorSelection.UniqueDueAtSelected
            stepConfig.erase
            {
              actorName := receiver
              logicalTime := stepConfig.now
            } ∧
          (∀ (front back : LF.GeneralEventQueue)
            (event : LF.GeneralPendingEvent),
            stepState.pending = front ++ event :: back →
            GeneralConsumeMatch receiver message event →
            event.tag = stepState.currentTag ∧
              (∀ x ∈ front, x.tag = event.tag) ∧ event ∉ front) ∧
          (∀ (event : LF.GeneralPendingEvent)
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
            serverK.name = message.messageName))
    (config : DTR.GeneralRuntimeConfiguration)
    (state : LF.GeneralRuntimeState)
    (label : DTR.GeneralLabel)
    (config' : DTR.GeneralRuntimeConfiguration)
    (hRelated :
      GeneralTraceRelated
        model
        config
        state)
    (hStep :
      Common.WeakStep
        (DTR.GeneralStep model)
        DTR.GeneralLabel.isTau
        config
        label
        config') :
    ∃ (targetLabel : LF.GeneralLabel)
      (state' : LF.GeneralRuntimeState),
      Common.WeakStep
          (LF.GeneralStepModulo program)
          LF.GeneralLabel.isTau
          state
          targetLabel
          state' ∧
        GeneralTraceRelated
          model
          config'
          state' ∧
        GeneralObservable.ofSourceLabel label =
          GeneralObservable.ofTargetLabel targetLabel := by

  obtain ⟨hCorrespondence, hUniqueS, hUniqueT⟩ :=
    hRelated

  cases hStep with

  | tau hTau hSteps =>

      -- The whole τ case. The closure theorem already covers all three τ statement forms.
      obtain ⟨stateRaw, hRawSteps, hRawCorrespondence⟩ :=
        generalTauSteps_forward_raw
          hCompiled
          hRoutes
          hEnvNodup
          hNames
          hCorrespondence
          hUniqueS
          hUniqueT
          hSteps

      refine
        ⟨LF.GeneralLabel.tau,
         stateRaw,
         Common.WeakStep.of_tauSteps
           LF.GeneralLabel.isTau_tau
           (LF.GeneralStepModulo.tauSteps_of_raw
             hRawSteps),
         ⟨hRawCorrespondence,
          generalStoreKeyUnique_of_sourceTauStepsLocal
            hUniqueS
            hSteps,
          LF.generalStoreKeyUnique_of_tauSteps
            hUniqueT
            hRawSteps⟩,
         ?_⟩

      -- Both sides observe nothing, so the projections agree without either being computed.
      rw [
        (GeneralObservable.ofSourceLabel_eq_none_iff_isTau
          label).mpr
          hTau
      ]

      rfl

  | visible hVisible hPrefix hVisibleStep hSuffix =>

      -- The τ prefix, crossed in the RAW target system so the invariant survives it.
      obtain ⟨stateBefore, hRawPrefix, hCorrespondenceBefore⟩ :=
        generalTauSteps_forward_raw
          hCompiled
          hRoutes
          hEnvNodup
          hNames
          hCorrespondence
          hUniqueS
          hUniqueT
          hPrefix

      have hUniqueSBefore :
          DTR.GeneralStoreKeyUnique _ :=
        generalStoreKeyUnique_of_sourceTauStepsLocal
          hUniqueS
          hPrefix

      have hUniqueTBefore :
          LF.GeneralStoreKeyUnique stateBefore :=
        LF.generalStoreKeyUnique_of_tauSteps
          hUniqueT
          hRawPrefix

      cases hVisibleStep with

      | assign hActor hBody hEvaluate =>
          exact
            absurd
              True.intro
              hVisible

      | trace hActor hBody =>
          exact
            absurd
              True.intro
              hVisible

      -- Stage I's local declaration is τ, so it is refuted by the visibility premise
      -- exactly as the τ rules above are.
      | localDecl hActor hBody hEvaluate =>
          exact
            absurd
              True.intro
              hVisible

      | send hSender hBody hArguments hTarget hReceiver =>
          exact
            absurd
              True.intro
              hVisible

      -- Stage H's three step-into rules are τ, so they are refuted by the visibility premise
      -- exactly as the three τ rules above are.
      | branchTrue hActor hBody hCondition =>
          exact
            absurd
              True.intro
              hVisible

      | branchFalse hActor hBody hCondition =>
          exact
            absurd
              True.intro
              hVisible

      | resume hActor hBody hFrames =>
          exact
            absurd
              True.intro
              hVisible

      | take hSelected hName hActor hIdle hDue hArrival hServer =>

          -- The source consume step, reused for the residue and for the answer.
          have hTakeStep :=
            DTR.GeneralStep.take
              hSelected
              hName
              hActor
              hIdle
              hDue
              hArrival
              hServer

          -- The genuine α′ residue for this step, supplied by the caller.
          obtain
              ⟨hResNoPast,
               hResOrigin,
               hResArrival,
               hResUniqueDue,
               hResFrontSameTag,
               hResServerName⟩ :=
            hConsumeResidue
              _
              _
              stateBefore
              _
              _
              ⟨hCorrespondenceBefore,
               hUniqueSBefore,
               hUniqueTBefore⟩
              hTakeStep

          -- The consume case: built from the residue by `generalConsumeAnswer`.
          obtain
              ⟨stateAfter,
               event,
               hAnswerStep,
               hAnswerMatch,
               hAfterCorrespondence,
               hAfterUniqueT⟩ :=
            generalConsumeAnswer
              hModelWellFormed
              hCompiled
              hEnvNodup
              hNames
              hCorrespondenceBefore
              hUniqueSBefore
              hUniqueTBefore
              hTakeStep
              hResNoPast
              hResOrigin
              hResArrival
              hResUniqueDue
              hResFrontSameTag
              hResServerName

          -- The receiver identity, read off the match.
          have hAnswerTarget :=
            hAnswerMatch.1

          -- The source invariant after the step; key uniqueness never crosses α.
          have hAfterUniqueS :
              DTR.GeneralStoreKeyUnique _ :=
            DTR.generalStoreKeyUnique_of_step
              hUniqueSBefore
              hTakeStep

          -- The τ suffix, again raw.
          obtain ⟨stateFinal, hRawSuffix, hFinalCorrespondence⟩ :=
            generalTauSteps_forward_raw
              hCompiled
              hRoutes
              hEnvNodup
              hNames
              hAfterCorrespondence
              hAfterUniqueS
              hAfterUniqueT
              hSuffix

          refine
            ⟨LF.GeneralLabel.consume
                 event.target
                 event.kind,
             stateFinal,
             weakStep_padTauLocal
               (LF.GeneralLabel.not_isTau_consume
                 event.target
                 event.kind)
               (LF.GeneralStepModulo.tauSteps_of_raw
                 hRawPrefix)
               hAnswerStep
               (LF.GeneralStepModulo.tauSteps_of_raw
                 hRawSuffix),
             ⟨hFinalCorrespondence,
              generalStoreKeyUnique_of_sourceTauStepsLocal
                hAfterUniqueS
                hSuffix,
              LF.generalStoreKeyUnique_of_tauSteps
                hAfterUniqueT
                hRawSuffix⟩,
             ?_⟩

          -- Receiver identity is the whole observation, and the answer supplies it.
          rw [
            GeneralObservable.ofSourceLabel_consume,
            GeneralObservable.ofTargetLabel_consume,
            hAnswerTarget
          ]

      | timeProgress hForward hQuiescent hSelected =>

          -- The time case: `generalTimeAdvance_forward_weak`, reused unchanged.
          obtain ⟨event, hEventTime, hAnswerStep, hAnswerCorrespondence⟩ :=
            generalTimeAdvance_forward_weak
              program
              model
              _
              stateBefore
              _
              hCorrespondenceBefore
              hForward
              hQuiescent
              hSelected

          have hAnswerUniqueT :
              LF.GeneralStoreKeyUnique
                {
                  currentTag := event.tag
                  reactors := stateBefore.reactors
                  pending := stateBefore.pending
                } :=
            hUniqueTBefore

          -- The τ suffix.
          -- The source invariant after the clock moves. `timeProgress` rebuilds the configuration with the
          -- SAME actor store, so this is the per-step theorem at the rule itself rather than a new fact.
          have hUniqueSAfter :
              DTR.GeneralStoreKeyUnique _ :=
            DTR.generalStoreKeyUnique_of_step
              hUniqueSBefore
              (DTR.GeneralStep.timeProgress
                (model := model)
                hForward
                hQuiescent
                hSelected)

          obtain ⟨stateFinal, hRawSuffix, hFinalCorrespondence⟩ :=
            generalTauSteps_forward_raw
              hCompiled
              hRoutes
              hEnvNodup
              hNames
              hAnswerCorrespondence
              hUniqueSAfter
              hAnswerUniqueT
              hSuffix

          refine
            ⟨LF.GeneralLabel.timeAdvance
                 stateBefore.currentTag.time
                 event.tag.time,
             stateFinal,
             weakStep_padTauLocal
               (LF.GeneralLabel.not_isTau_timeAdvance
                 stateBefore.currentTag.time
                 event.tag.time)
               (LF.GeneralStepModulo.tauSteps_of_raw
                 hRawPrefix)
               (LF.GeneralStepModulo.weakStep_of_raw
                 hAnswerStep)
               (LF.GeneralStepModulo.tauSteps_of_raw
                 hRawSuffix),
             ⟨hFinalCorrespondence,
              generalStoreKeyUnique_of_sourceTauStepsLocal
                hUniqueSAfter
                hSuffix,
              LF.generalStoreKeyUnique_of_tauSteps
                hAnswerUniqueT
                hRawSuffix⟩,
             ?_⟩

          -- Both endpoints agree: the source's clock is the target's by `logicalTime`, and the answer's
          -- event sits at the source's `future`.
          rw [
            GeneralObservable.ofSourceLabel_timeAdvance,
            GeneralObservable.ofTargetLabel_timeAdvance,
            hEventTime,
            hCorrespondenceBefore.logicalTime
          ]

/-!
## The row

The forward trace agreement with its transfer condition discharged down to the one residue.
-/

/--
**Forward trace agreement for the general family, with the transfer condition assembled.**

The row this milestone exists to produce. Everything is discharged except the `.consume` answer, which is
carried through as `hConsumeAnswer` — the α′ representative residue, unchanged and unweakened.

Read it as: *given a way to answer one source consume, every source execution is answered by a target
execution observing the same sequence.* The τ and `.timeAdvance` cases are not assumptions of this theorem;
they are proved inside it, from `generalTauSteps_forward` and `generalTimeAdvance_forward_weak` respectively.

`Correctness.GeneralTraceRelated` is the relation, so the conclusion also re-establishes both store-key
invariants at the end state — which is what makes the result composable with another execution segment
rather than terminal.
-/
theorem generalTraceAgreement_of_consumeAnswer
    {model : DTR.GeneralModel}
    {program : LF.GeneralProgram}
    {routes : List Translation.GeneralRoute}
    (hCompiled :
      Translation.compileGeneralModel model =
        .ok program)
    (hRoutes :
      Translation.routesOf model =
        .ok routes)
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
    (hModelWellFormed :
      model.wellFormed = true)
    (hConsumeResidue :
      ∀ (stepConfig stepConfig' : DTR.GeneralRuntimeConfiguration)
        (stepState : LF.GeneralRuntimeState)
        (receiver : ActorName)
        (message : DTR.GeneralMessage),
        GeneralTraceRelated
          model
          stepConfig
          stepState →
        DTR.GeneralStep
          model
          stepConfig
          (DTR.GeneralLabel.consume
            receiver
            message)
          stepConfig' →
        LF.GeneralNoPastPending stepState ∧
          LF.GeneralKindOrigin
            model
            program
            routes
            stepState ∧
          message.arrival = stepConfig.now ∧
          DTR.GeneralActorSelection.UniqueDueAtSelected
            stepConfig.erase
            {
              actorName := receiver
              logicalTime := stepConfig.now
            } ∧
          (∀ (front back : LF.GeneralEventQueue)
            (event : LF.GeneralPendingEvent),
            stepState.pending = front ++ event :: back →
            GeneralConsumeMatch receiver message event →
            event.tag = stepState.currentTag ∧
              (∀ x ∈ front, x.tag = event.tag) ∧ event ∉ front) ∧
          (∀ (event : LF.GeneralPendingEvent)
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
            serverK.name = message.messageName))
    {config config' : DTR.GeneralRuntimeConfiguration}
    {state : LF.GeneralRuntimeState}
    {labels : List DTR.GeneralLabel}
    (hRelated :
      GeneralTraceRelated
        model
        config
        state)
    (hSteps :
      Common.WeakSteps
        (DTR.GeneralStep model)
        DTR.GeneralLabel.isTau
        config
        labels
        config') :
    ∃ (targetLabels : List LF.GeneralLabel)
      (state' : LF.GeneralRuntimeState),
      Common.WeakSteps
          (LF.GeneralStepModulo program)
          LF.GeneralLabel.isTau
          state
          targetLabels
          state' ∧
        GeneralTraceRelated
          model
          config'
          state' ∧
        Common.observableProjection
            GeneralObservable.ofSourceLabel
            labels =
          Common.observableProjection
            GeneralObservable.ofTargetLabel
            targetLabels :=
  generalTraceAgreement_forward
    (GeneralTraceRelated model)
    (generalTraceTransfer_forward
      hCompiled
      hRoutes
      hEnvNodup
      hNames
      hModelWellFormed
      hConsumeResidue)
    hRelated
    hSteps

/-!
## The backward direction

`Correctness.generalTraceAgreement_backward` needs the mirror transfer condition. **It is not the mirror of
the forward one**, and the asymmetry is measured rather than assumed — the audit that produced this section
is recorded in the docstring of `generalTraceTransfer_backward` below.

Two of the three cases are in hand and are reused unchanged:
`Correctness.generalConsume_backward_weakStep_of_takeRepresentative` and
`Correctness.generalTimeAdvance_backward_weak`. The τ case is a **premise**, for reasons that are structural
rather than a matter of effort.
-/

/--
**The backward trace-agreement transfer condition, assembled.**

Every target weak step of the quotient system is answered by a source weak step, with the relation
re-established and the two labels observing the same thing. This is
`Correctness.generalTraceAgreement_backward`'s `hBackward` premise at `Correctness.GeneralTraceRelated`.

**Three cases, two reused, one a premise.**

* **`.consume`** — `hConsumeResidue`, the **per-segment** residue: one `LF.GeneralStepModulo` consume segment
  at a time, with the τ padding around it answered here by threading `hTauAnswer`. A caller discharges it per
  occurrence by `generalConsumeBackwardAnswer`, which applies
  `generalConsume_backward_weakStep_of_takeRepresentative` to the occurrence's take package and upgrades the
  conclusion to the full relation at the occurrence's canonical endpoint — supplying `hName`, the per-step
  actor agreement, on the way. The α-freedom sits inside the segment, which is exactly where the caller's
  own representative choice put it; no modulo step is inverted.
* **`.timeAdvance`** — `hTimeAnswer`, whose shape is exactly `generalTimeAdvance_backward_weak`'s
  conclusion. Also a premise rather than an inlined application, and for a reason worth stating: that
  theorem is proved against `LF.GeneralStep`, while this transfer is handed an `LF.GeneralStepModulo` step.
  Inverting the modulo step to reach the raw one is precisely what is forbidden here, so the caller — who
  holds the raw step — applies it and hands the answer in.
* **τ** — `hTauAnswer`, the premise this milestone introduces.

**Why the τ case cannot be derived, in three independent ways.** All three were measured against the
definitions, not assumed:

1. **The target's τ set has five constructors, not three.** `LF.GeneralStep.now_eq_of_tau`'s own case list
   is `assign`, `trace`, `schedule`, `setPort`, `microstepAdvance`. The source has three. So there is no
   shape-by-shape correspondence to induct along.
2. **`microstepAdvance` has no source counterpart at all.** It is P24's measured divergence — a zero-delay
   send costs the target a microstep the source never takes — so a backward τ step there must be answered by
   *zero* source steps. No forward case ever had to answer a step with nothing.
3. **The quotient runs the wrong way, and deliberately.** `LF.GeneralStepModulo.tauSteps_of_raw` and
   `weakStep_of_raw` lift raw to modulo; `weakStep_of_raw`'s docstring records that "the converse is
   deliberately absent: a modulo weak step may switch representatives between segments, and that is the
   quotient's semantics, not an accident to be undone." A backward τ closure would have to invert exactly
   that, which reopens the frozen α′ question.

So the τ answer is carried as a premise, named and visible, exactly as the forward direction carries its
α-representative package. **No modulo-to-raw lemma is added, no α′ decision is touched, and no backward τ
closure is attempted.**

**What is still proved here rather than assumed:** that the three premises *compose* into the shape the
generic trace theorem consumes, that the observation obligation is discharged in every case, and that both
store-key invariants are threaded. The τ premise's observation obligation closes from
`ofTargetLabel_eq_none_iff_isTau` and `ofSourceLabel_eq_none_iff_isTau` together — a target τ step must be
answered by a source label that is *also* internal, which the premise's own `isTau` conclusion supplies.

The consume premise is now the per-segment residue `hConsumeResidue`; `GeneralInstantBlock` untouched, no
runtime field, no F27 change.
-/
theorem generalTraceTransfer_backward
    {model : DTR.GeneralModel}
    {program : LF.GeneralProgram}
    (hTauAnswer :
      ∀ (stepConfig : DTR.GeneralRuntimeConfiguration)
        (stepState stepState' : LF.GeneralRuntimeState)
        (label : LF.GeneralLabel),
        GeneralTraceRelated
          model
          stepConfig
          stepState →
        LF.GeneralLabel.isTau label →
        Common.WeakStep
          (LF.GeneralStepModulo program)
          LF.GeneralLabel.isTau
          stepState
          label
          stepState' →
        ∃ (sourceLabel : DTR.GeneralLabel)
          (stepConfig' : DTR.GeneralRuntimeConfiguration),
          DTR.GeneralLabel.isTau sourceLabel ∧
            Common.WeakStep
              (DTR.GeneralStep model)
              DTR.GeneralLabel.isTau
              stepConfig
              sourceLabel
              stepConfig' ∧
            GeneralTraceRelated
              model
              stepConfig'
              stepState')
    (hConsumeResidue :
      ∀ (stepConfig : DTR.GeneralRuntimeConfiguration)
        (before after : LF.GeneralRuntimeState)
        (target : ActorName)
        (kind : LF.GeneralEventKind),
        GeneralTraceRelated
          model
          stepConfig
          before →
        LF.GeneralStepModulo
          program
          before
          (LF.GeneralLabel.consume
            target
            kind)
          after →
        ∃ (message : DTR.GeneralMessage)
          (stepConfig' : DTR.GeneralRuntimeConfiguration),
          Common.WeakStep
              (DTR.GeneralStep model)
              DTR.GeneralLabel.isTau
              stepConfig
              (DTR.GeneralLabel.consume
                target
                message)
              stepConfig' ∧
            GeneralTraceRelated
              model
              stepConfig'
              after)
    (hTimeAnswer :
      ∀ (stepConfig : DTR.GeneralRuntimeConfiguration)
        (stepState stepState' : LF.GeneralRuntimeState)
        (before after : LogicalTime),
        GeneralTraceRelated
          model
          stepConfig
          stepState →
        Common.WeakStep
          (LF.GeneralStepModulo program)
          LF.GeneralLabel.isTau
          stepState
          (LF.GeneralLabel.timeAdvance
            before
            after)
          stepState' →
        ∃ stepConfig' : DTR.GeneralRuntimeConfiguration,
          Common.WeakStep
              (DTR.GeneralStep model)
              DTR.GeneralLabel.isTau
              stepConfig
              (DTR.GeneralLabel.timeAdvance
                before
                after)
              stepConfig' ∧
            GeneralTraceRelated
              model
              stepConfig'
              stepState')
    (config : DTR.GeneralRuntimeConfiguration)
    (state : LF.GeneralRuntimeState)
    (label : LF.GeneralLabel)
    (state' : LF.GeneralRuntimeState)
    (hRelated :
      GeneralTraceRelated
        model
        config
        state)
    (hStep :
      Common.WeakStep
        (LF.GeneralStepModulo program)
        LF.GeneralLabel.isTau
        state
        label
        state') :
    ∃ (sourceLabel : DTR.GeneralLabel)
      (config' : DTR.GeneralRuntimeConfiguration),
      Common.WeakStep
          (DTR.GeneralStep model)
          DTR.GeneralLabel.isTau
          config
          sourceLabel
          config' ∧
        GeneralTraceRelated
          model
          config'
          state' ∧
        GeneralObservable.ofTargetLabel label =
          GeneralObservable.ofSourceLabel sourceLabel := by

  -- The label decides which premise answers. Splitting on the LABEL rather than on the step is what keeps
  -- this independent of the target's τ constructor count: a sixth τ rule would change nothing here.
  cases label with

  | tau =>

      obtain ⟨sourceLabel, config', hSourceTau, hSourceStep, hSourceRelated⟩ :=
        hTauAnswer
          config
          state
          state'
          LF.GeneralLabel.tau
          hRelated
          LF.GeneralLabel.isTau_tau
          hStep

      refine
        ⟨sourceLabel,
         config',
         hSourceStep,
         hSourceRelated,
         ?_⟩

      -- Both sides observe nothing. The premise's own `isTau` conclusion is what makes the source side
      -- internal too — without it a target τ step could be answered by a visible source label, and the
      -- observation would not agree.
      rw [
        (GeneralObservable.ofSourceLabel_eq_none_iff_isTau
          sourceLabel).mpr
          hSourceTau
      ]

      rfl

  | timeAdvance before after =>

      obtain ⟨config', hSourceStep, hSourceRelated⟩ :=
        hTimeAnswer
          config
          state
          state'
          before
          after
          hRelated
          hStep

      exact
        ⟨DTR.GeneralLabel.timeAdvance
           before
           after,
         config',
         hSourceStep,
         hSourceRelated,
         rfl⟩

  | consume target kind =>

      -- The weak step's own decomposition: a τ prefix, the single consume segment, a τ suffix. The τ
      -- padding is answered by `hTauAnswer` on both sides of the segment, so the residue premise only
      -- carries one consume segment at a time — the caller's own representative choice sits inside it.
      cases hStep with

      | tau hTau _ =>
          exact
            absurd
              hTau
              (LF.GeneralLabel.not_isTau_consume
                target
                kind)

      | visible _hVisible hPrefix hSegment hSuffix =>
          rename_i segmentBefore segmentAfter

          -- The τ prefix, answered; the relation re-establishes at the segment's source.
          obtain ⟨_, configPrefix, hPrefixTau, hPrefixStep, hRelatedBefore⟩ :=
            hTauAnswer
              config
              state
              segmentBefore
              LF.GeneralLabel.tau
              hRelated
              LF.GeneralLabel.isTau_tau
              (Common.WeakStep.of_tauSteps
                LF.GeneralLabel.isTau_tau
                hPrefix)

          -- The segment's residue: the source consume answering the target's own consume segment.
          obtain ⟨message, configConsume, hConsumeStep, hRelatedAfter⟩ :=
            hConsumeResidue
              configPrefix
              segmentBefore
              segmentAfter
              target
              kind
              hRelatedBefore
              hSegment

          -- The τ suffix, answered the same way.
          obtain ⟨_, configFinal, hSuffixTau, hSuffixStep, hRelatedFinal⟩ :=
            hTauAnswer
              configConsume
              segmentAfter
              state'
              LF.GeneralLabel.tau
              hRelatedAfter
              LF.GeneralLabel.isTau_tau
              (Common.WeakStep.of_tauSteps
                LF.GeneralLabel.isTau_tau
                hSuffix)

          -- Both τ answers are τ-labelled, so each is a raw closure and the three pieces splice into
          -- one weak step at the consume label.
          have hPrefixTauSteps :=
            weakStep_tauSteps_of_tauLabelLocal
              hPrefixTau
              hPrefixStep

          have hSuffixTauSteps :=
            weakStep_tauSteps_of_tauLabelLocal
              hSuffixTau
              hSuffixStep

          exact
            ⟨DTR.GeneralLabel.consume
               target
               message,
             configFinal,
             weakStep_prependTauLocal
               hPrefixTauSteps
               (weakStep_appendTauLocal
                 hConsumeStep
                 hSuffixTauSteps),
             hRelatedFinal,
             rfl⟩

/--
**The per-occurrence discharge of the backward `.consume` residue** — the mirror of
`Correctness.generalConsumeAnswer`.

`generalTraceTransfer_backward`'s `hConsumeResidue` answers one `LF.GeneralStepModulo` consume segment at a
time. This theorem is what a caller holding a real occurrence applies: it takes the take package the
occurrence's fire premises supply — the binder list
`generalConsume_backward_weakStep_of_takeRepresentative` reads, with the τ alignment collapsed to the
vacuous one — and returns the residue premise's shape at that occurrence's own canonical endpoint.

Three things sit on top of the core theorem, and none of them is new content:

* the relation is upgraded to `GeneralTraceRelated` — the endpoint's `LF.GeneralStoreKeyUnique` comes from
  `Store.keysUnique_update` over the representative's own invariant, which the caller reads off the
  representative package's `hBeforeReactors` and their relation at `state`;
* the answered label is stated at the *target's* receiver: `hMatch`'s own target conjunct and `hTarget` tie
  `actorName` to it. `hName`, the F76 scheduler-compatibility residue, stays an explicit premise — this
  theorem does not derive which actor the source selects;
* the answered endpoint is the core theorem's pinned literal, the same construction the occurrence's raw
  segment performs. A caller whose segment was built from these premises identifies their `after` with it
  and instantiates the residue premise at exactly this state.

The τ padding is not this theorem's business: the residue premise is per-segment, and
`generalTraceTransfer_backward` threads `hTauAnswer` around the segment itself.
-/
theorem generalConsumeBackwardAnswer
    (program : LF.GeneralProgram)
    (model : DTR.GeneralModel)
    (config : DTR.GeneralRuntimeConfiguration)
    (state : LF.GeneralRuntimeState)
    (hRelated : GeneralTraceRelated model config state)
    (actorName : ActorName)
    (actor : DTR.GeneralActorRuntime)
    (message : DTR.GeneralMessage)
    (earlier later : DTR.GeneralMessageBag)
    (hDue :
      actor.state.bag =
        earlier ++ message :: later)
    (server : DTR.GeneralMessageServer)
    (event : LF.GeneralPendingEvent)
    (hMatch :
      GeneralConsumeMatch
        actorName
        message
        event)
    (hEventTime :
      event.tag.time =
        state.currentTag.time)
    (selected :
      DTR.GlobalMultiStorePayloadActorPriority.ReadyActor)
    (hSelected :
      DTR.GeneralActorSelection.selectedActor
          model
          config.erase =
        some selected)
    (hName :
      selected.actorName = actorName)
    (hActor :
      Store.lookup config.actors actorName =
        some actor)
    (hIdle :
      actor.idle = true)
    (hArrival :
      message.arrival = selected.logicalTime)
    (hServer :
      DTR.GeneralModel.messageServerFor?
          model
          actorName
          message.messageName =
        some server)
    (before : LF.GeneralRuntimeState)
    (hAlpha :
      LF.generalStateAlphaEquiv
        before
        state)
    (hEarliest :
      LF.GeneralRuntimeState.earliestPendingEvent?
          before =
        some event)
    (hTagAligned :
      event.tag = before.currentTag)
    (earlier' later' : LF.GeneralEventQueue)
    (hQueue :
      before.pending =
        earlier' ++ event :: later')
    (reactorRT : LF.GeneralReactorRuntime)
    (hUniqueT :
      before.reactors.filter
          (fun entry =>
            decide (entry.1 = event.target)) =
        [(event.target, reactorRT)])
    (hReactorBefore :
      Store.lookup
          before.reactors
          event.target =
        some reactorRT)
    (hIdleRT :
      reactorRT.idle = true)
    (reaction : LF.GeneralReaction)
    (hReaction :
      LF.GeneralProgram.reactionFor?
          program
          event.target
          event.kind =
        some reaction)
    (hParams :
      reaction.parameters =
        server.parameters.map
          (fun parameter =>
            parameter.name))
    (env : Translation.GeneralOutputPortEnv)
    (hEnv :
      outputPortEnvOfActorName model actorName =
        some env)
    (hBody :
      GeneralContinuationCompiles
        env
        server.body
        reaction.body)
    (hPaired :
      GeneralActorCorresponds
        env
        actorName
        actor
        reactorRT
        state.pending)
    (hUniqueTStore :
      LF.GeneralStoreKeyUnique before)
    (target : ActorName)
    (hTarget :
      event.target = target) :
    ∃ config' : DTR.GeneralRuntimeConfiguration,
      Common.WeakStep
          (DTR.GeneralStep model)
          DTR.GeneralLabel.isTau
          config
          (DTR.GeneralLabel.consume
            target
            message)
          config' ∧
        GeneralTraceRelated
          model
          config'
          {
          currentTag := before.currentTag

          reactors :=
            Store.update
              before.reactors
              event.target
              {
              valuation :=
                LF.bindReactionParameters
                  reaction.parameters
                  event.payload
                  reactorRT.valuation

              activeBody := reaction.body
              frames := []
            }

          pending := earlier' ++ later'
        } := by

  obtain ⟨hCorrespondence, hUniqueSStore, _⟩ :=
    hRelated

  obtain ⟨hTake, _hTargetStep, hPostCorrespondence, hPostUniqueS⟩ :=
    generalConsume_backward_weakStep_of_takeRepresentative
      program
      model
      config
      state
      hCorrespondence
      actorName
      actor
      message
      earlier
      later
      hDue
      server
      event
      hMatch
      hEventTime
      selected
      hSelected
      hName
      hActor
      hIdle
      hArrival
      hServer
      state
      (Common.TauSteps.refl state)
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
      hUniqueT
      hReactorBefore
      hIdleRT
      reaction
      hReaction
      hParams
      env
      hEnv
      hBody
      hUniqueSStore
      hPaired

  have hActorEq :
      actorName = target :=
    (hTarget.symm.trans hMatch.1).symm

  refine
    ⟨{
      now := config.now

      actors :=
        Store.update
          config.actors
          actorName
          {
            state :=
              {
                valuation :=
                  DTR.bindParameters
                    server.parameters
                    message.payload
                    actor.state.valuation

                bag := earlier ++ later
              }

            activeBody := server.body
            frames := []
          }
    },
     ?_,
     ?_⟩

  · rw [← hActorEq]

    exact
      hTake

  · refine
      ⟨hPostCorrespondence,
       hPostUniqueS,
       ?_⟩

    exact
      Store.keysUnique_update
        hUniqueTStore

/--
**Backward trace agreement for the general family, with the transfer condition assembled.**

The mirror of `generalTraceAgreement_of_consumeAnswer`, and together with it the pair that makes the
observable-trace story a bisimulation rather than a simulation.

Three residues rather than the forward direction's one, and the count is the honest measurement: the target
has five τ constructors against the source's three, `microstepAdvance` has no source counterpart, and the
quotient has no sound inverse. Each residue is per-step and named. Two of the three have existing theorems
whose conclusions are exactly their shapes — `generalConsume_backward_weakStep_of_takeRepresentative` (via
its discharge adapter `generalConsumeBackwardAnswer`) and `generalTimeAdvance_backward_weak` — so a caller
holding raw target steps discharges them directly.
-/
theorem generalTraceAgreement_backward_of_answers
    {model : DTR.GeneralModel}
    {program : LF.GeneralProgram}
    (hTauAnswer :
      ∀ (stepConfig : DTR.GeneralRuntimeConfiguration)
        (stepState stepState' : LF.GeneralRuntimeState)
        (label : LF.GeneralLabel),
        GeneralTraceRelated
          model
          stepConfig
          stepState →
        LF.GeneralLabel.isTau label →
        Common.WeakStep
          (LF.GeneralStepModulo program)
          LF.GeneralLabel.isTau
          stepState
          label
          stepState' →
        ∃ (sourceLabel : DTR.GeneralLabel)
          (stepConfig' : DTR.GeneralRuntimeConfiguration),
          DTR.GeneralLabel.isTau sourceLabel ∧
            Common.WeakStep
              (DTR.GeneralStep model)
              DTR.GeneralLabel.isTau
              stepConfig
              sourceLabel
              stepConfig' ∧
            GeneralTraceRelated
              model
              stepConfig'
              stepState')
    (hConsumeResidue :
      ∀ (stepConfig : DTR.GeneralRuntimeConfiguration)
        (before after : LF.GeneralRuntimeState)
        (target : ActorName)
        (kind : LF.GeneralEventKind),
        GeneralTraceRelated
          model
          stepConfig
          before →
        LF.GeneralStepModulo
          program
          before
          (LF.GeneralLabel.consume
            target
            kind)
          after →
        ∃ (message : DTR.GeneralMessage)
          (stepConfig' : DTR.GeneralRuntimeConfiguration),
          Common.WeakStep
              (DTR.GeneralStep model)
              DTR.GeneralLabel.isTau
              stepConfig
              (DTR.GeneralLabel.consume
                target
                message)
              stepConfig' ∧
            GeneralTraceRelated
              model
              stepConfig'
              after)
    (hTimeAnswer :
      ∀ (stepConfig : DTR.GeneralRuntimeConfiguration)
        (stepState stepState' : LF.GeneralRuntimeState)
        (before after : LogicalTime),
        GeneralTraceRelated
          model
          stepConfig
          stepState →
        Common.WeakStep
          (LF.GeneralStepModulo program)
          LF.GeneralLabel.isTau
          stepState
          (LF.GeneralLabel.timeAdvance
            before
            after)
          stepState' →
        ∃ stepConfig' : DTR.GeneralRuntimeConfiguration,
          Common.WeakStep
              (DTR.GeneralStep model)
              DTR.GeneralLabel.isTau
              stepConfig
              (DTR.GeneralLabel.timeAdvance
                before
                after)
              stepConfig' ∧
            GeneralTraceRelated
              model
              stepConfig'
              stepState')
    {config : DTR.GeneralRuntimeConfiguration}
    {state state' : LF.GeneralRuntimeState}
    {labels : List LF.GeneralLabel}
    (hRelated :
      GeneralTraceRelated
        model
        config
        state)
    (hSteps :
      Common.WeakSteps
        (LF.GeneralStepModulo program)
        LF.GeneralLabel.isTau
        state
        labels
        state') :
    ∃ (sourceLabels : List DTR.GeneralLabel)
      (config' : DTR.GeneralRuntimeConfiguration),
      Common.WeakSteps
          (DTR.GeneralStep model)
          DTR.GeneralLabel.isTau
          config
          sourceLabels
          config' ∧
        GeneralTraceRelated
          model
          config'
          state' ∧
        Common.observableProjection
            GeneralObservable.ofTargetLabel
            labels =
          Common.observableProjection
            GeneralObservable.ofSourceLabel
            sourceLabels :=
  generalTraceAgreement_backward
    (GeneralTraceRelated model)
    (generalTraceTransfer_backward
      hTauAnswer
      hConsumeResidue
      hTimeAnswer)
    hRelated
    hSteps

end Correctness
end Relico
