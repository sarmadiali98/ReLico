import Relico.Common.DisciplinedRank
import Relico.Common.QueueOrderIso
import Relico.DTR.DisciplinedModel
import Relico.DTR.DisciplinedModelToy
import Relico.LF.GeneralRuntime

set_option autoImplicit false

namespace Relico
namespace Disciplined

namespace QueueOrderCorrespondence

def prefixOfEvent
    (model : DTR.DisciplinedDTRModel)
    (event : LF.GeneralPendingEvent) :
    MessageOrderPrefix :=
  {
    arrival := event.tag.time
    generation := event.tag.microstep
    receiverRank := DTR.DisciplinedDTRModel.rankOf model event.target
    emission := 0
  }

theorem stampGeneration_transpose
    (firingGeneration : Nat)
    (delay : Delay)
    (tag : LF.Tag)
    (hTag : tag.microstep = firingGeneration) :
    stampGeneration firingGeneration delay =
      (LF.Tag.schedule tag delay).microstep := by
  rw [stampGeneration, LF.Tag.schedule]

  by_cases hZero : delay.value = 0
  · simp [hZero, hTag]

  · simp [hZero]

/-- Key-functional correspondence: equal scheduling keys imply the message
and event match at the corresponding-receiver level.

Requires both the DTR receiver and the LF event target to be present in
the model's rank environment, which holds under well-formedness of the
disciplined model. -/
theorem prefixOfMessage_eq_prefixOfEvent_imp_matches
    (model : DTR.DisciplinedDTRModel)
    (firingGeneration : Nat)
    (delay : Delay)
    (receiver : ActorName)
    (message : DTR.GeneralMessage)
    (event : LF.GeneralPendingEvent)
    (hReceiverIn : receiver ∈ model.rankEnvironment)
    (hTargetIn : event.target ∈ model.rankEnvironment)
    (hKey :
      DTR.DisciplinedDTRModel.prefixOfMessage
        model firingGeneration delay receiver message =
      prefixOfEvent model event) :
    DTR.DisciplinedDTRModel.matchesMessageEvent
      receiver message event := by
  have hArrival :
      event.tag.time = message.arrival := by
    exact (congrArg (·.arrival) hKey).symm

  have hRank :
      DTR.DisciplinedDTRModel.rankOf model receiver =
        DTR.DisciplinedDTRModel.rankOf model event.target := by
    exact congrArg (·.receiverRank) hKey

  have hRankEnv :
      model.rankEnvironment.Nodup :=
    model.actorRanks_distinct

  have hTarget :
      event.target = receiver := by
    rw [DTR.DisciplinedDTRModel.rankOf, DTR.DisciplinedDTRModel.rankOf] at hRank
    exact (RankEnvironment.rankOf_eq_of_mem_of_nodup
      model.rankEnvironment
      hRankEnv
      receiver
      event.target
      hReceiverIn
      hTargetIn
      hRank).symm

  exact ⟨hTarget, hArrival⟩

/-- The concrete DTR/LF selection-agreement theorem.

Lifts the generic `selectMinimumKeyed_corresponds` to the specific
DTR/LF scheduling keys and `matchesMessageEvent` correspondence,
bridging `selectMinimumKeyed prefixOfMessage` and
`selectMinimumKeyed prefixOfEvent`. -/
theorem selectMinimumKeyed_corresponds_DTR_LF
    (model : DTR.DisciplinedDTRModel)
    (firingGeneration : Nat)
    (delay : Delay)
    (receiver : ActorName)
    (messages : List DTR.GeneralMessage)
    (pending : List LF.GeneralPendingEvent)
    (hReceiverIn : receiver ∈ model.rankEnvironment)
    (hAllTargetsIn :
      ∀ (e : LF.GeneralPendingEvent), e.target ∈ model.rankEnvironment)
    (hIso :
      QueueOrderIso
        (fun m => DTR.DisciplinedDTRModel.prefixOfMessage
          model firingGeneration delay receiver m)
        (prefixOfEvent model)
        (fun m e => DTR.DisciplinedDTRModel.matchesMessageEvent
          receiver m e)
        messages
        pending)
    {message : DTR.GeneralMessage}
    {event : LF.GeneralPendingEvent}
    (hMessage :
      selectMinimumKeyed
        (fun m => DTR.DisciplinedDTRModel.prefixOfMessage
          model firingGeneration delay receiver m)
        messages = some message)
    (hEvent :
      selectMinimumKeyed (prefixOfEvent model) pending = some event) :
    DTR.DisciplinedDTRModel.matchesMessageEvent
      receiver message event := by
  refine QueueOrderIso.selectMinimumKeyed_corresponds hIso hMessage hEvent ?_
  intro m e hKey
  exact prefixOfMessage_eq_prefixOfEvent_imp_matches
    model firingGeneration delay receiver m e
    hReceiverIn
    (hAllTargetsIn e)
    hKey

end QueueOrderCorrespondence

end Disciplined
end Relico
