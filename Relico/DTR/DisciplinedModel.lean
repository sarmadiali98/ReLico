import Relico.DTR.GeneralSyntax
import Relico.DTR.GeneralState
import Relico.DTR.GeneralWellFormed
import Relico.Common.DisciplinedRank

set_option autoImplicit false

namespace Relico
namespace DTR

/-!
# The priority-disciplined DTR model

A `DisciplinedDTRModel` extends `DTR.GeneralModel` with the scheduling
metadata that the weak bisimulation requires.
-/

structure ActorRanking where
  actorRank : Nat
  emissionRank : Nat
deriving Repr, DecidableEq, BEq, Inhabited

structure SiteEmission where
  emissionRank : Nat
deriving Repr, DecidableEq, BEq, Inhabited

/--
A pair of an actor name and its ranking.
-/
abbrev ActorRankEntry := ActorName × ActorRanking

/--
A triple of class name, message name, and site emission.
-/
abbrev SiteEmissionEntry := ClassName × MsgName × SiteEmission

/--
A DTR model with the scheduling metadata the weak bisimulation needs.
-/
structure DisciplinedDTRModel where
  toGeneralModel : DTR.GeneralModel

  actorRanks : List ActorRankEntry

  siteEmissions : List SiteEmissionEntry

  actorRanks_complete :
    ∀ (actor : DTR.GeneralActorInstance),
      actor ∈ toGeneralModel.instances →
        ∃ (ranking : ActorRanking),
          (actor.name, ranking) ∈ actorRanks

  siteEmissions_complete :
    ∀ (reactiveClass : DTR.GeneralReactiveClass),
      reactiveClass ∈ toGeneralModel.classes →
        ∀ (messageServer : DTR.GeneralMessageServer),
          messageServer ∈ reactiveClass.messageServers →
            ∀ stmt,
              stmt ∈ messageServer.body →
                match stmt with
                | .send _ messageName _ _ =>
                  ∃ emission,
                    (reactiveClass.name, messageName, emission) ∈ siteEmissions
                | _ => True

  actorRanks_distinct :
    (actorRanks.map (fun entry => entry.1)).Nodup

  siteEmissions_distinct :
    ∀ (className : ClassName),
      let emissionsForClass : List Nat :=
        siteEmissions
          |> List.filter (fun (c, _, _) => c = className)
          |> List.map (fun (_, _, e) => e.emissionRank)
      emissionsForClass.Nodup

namespace DisciplinedDTRModel

def rankEnvironment
    (model : DTR.DisciplinedDTRModel) :
    Disciplined.RankEnvironment :=
  model.actorRanks.map (·.1)

def rankOf
    (model : DTR.DisciplinedDTRModel)
    (name : ActorName) :
    Nat :=
  Disciplined.RankEnvironment.rankOf
    model.rankEnvironment
    name

def emissionRankOf?
    (model : DTR.DisciplinedDTRModel)
    (className : ClassName)
    (messageName : MsgName) :
    Option Nat :=
  match
    List.find?
      (fun (c, m, _) =>
        c = className ∧ m = messageName)
      model.siteEmissions with
  | some (_, _, emission) => some emission.emissionRank
  | none => none

end DisciplinedDTRModel

end DTR
end Relico
