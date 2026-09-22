import Relico.DTR.DisciplinedModel
import Relico.Common.DisciplinedRank
import Relico.LF.GeneralRuntime

set_option autoImplicit false

namespace Relico
namespace DTR

/-!
# A toy instantiation of QueueOrderIso for the DTR side
-/

namespace DisciplinedDTRModel

def prefixOfMessage
    (model : DTR.DisciplinedDTRModel)
    (firingGeneration : Nat)
    (delay : Delay)
    (receiver : ActorName)
    (message : DTR.GeneralMessage) :
    Disciplined.MessageOrderPrefix :=
  let senderInst : Option DTR.GeneralActorInstance :=
    model.toGeneralModel.instances
      |> List.find? (fun inst => inst.name = message.sender)
  let className : ClassName :=
    match senderInst with
    | some inst => inst.className
    | none => ⟨""⟩
  let emissionRank : Nat :=
    match model.emissionRankOf? className message.messageName with
    | some rank => rank
    | none => 0
  {
    arrival := message.arrival
    generation := Disciplined.stampGeneration firingGeneration delay
    receiverRank := model.rankOf receiver
    emission := emissionRank
  }

def matchesMessageEvent
    (receiver : ActorName)
    (message : DTR.GeneralMessage)
    (event : LF.GeneralPendingEvent) :
    Prop :=
  event.target = receiver ∧
    event.tag.time = message.arrival

end DisciplinedDTRModel

end DTR
end Relico
