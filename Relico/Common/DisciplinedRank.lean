import Relico.Common.Name
import Relico.Common.Time

set_option autoImplicit false

namespace Relico

namespace Disciplined

/-!
# Scheduling-order keys and selection for the priority-disciplined families

Proposed decision 0048 introduces a priority-disciplined scheduling semantics
for Timed Rebeca models and a restricted deterministic execution model of the
translated Lingua Franca program, with a weak bisimulation between the two.
This module is the scheduling-order layer both families share, and it is
deliberately free of any DTR- or LF-specific import: neither family's step
relation appears here, only the order both schedulers agree to consult.

## What a key is, and what it is not

A `MessageOrderPrefix` is scheduling metadata. Its `arrival` component is a
message's logical arrival time; its `generation` component is the scheduling
round the message was created in, stamped from the sender's firing context at
send time by `stampGeneration`; its `receiverRank` and `emission` components
are the completed priority ranks of the receiving actor and of the sending
site within the receiver's compiled reaction list.

None of this is a clock. The source family's time remains `LogicalTime`, no
step of either family advances a generation as a matter of time, and no
observable label mentions any component of a key. Generation exists for one
reason: LF's superdense execution order processes the events of one logical
time in microstep order, so a source scheduler aligned with that order must
distinguish same-arrival messages created in different rounds. The
generation index is exactly that distinction and nothing more.

## Selection, and why occurrence is first-match

`selectMinimumKeyed` reads as a scheduler: take the minimal key among the
pending items, then the earliest pending occurrence carrying it. Spelling
occurrence as "first match in list order" rather than as an explicit index
makes both families' tie rules the same rule — the source's bag chronology
and the target's queue insertion order are both `List` order — and it keeps
the selection theorems free of index arithmetic.

## The permutation invariants

The two theorems at the bottom of this file are the kernels of the
queue-order isomorphism the bisimulation carries as an invariant.
`selectMinimumKeyed_of_perm` says that two pending lists whose key multisets
agree select occurrences with the same key: the scheduler-agreement half.
`perm_map_append` says that appending one occurrence with one key to both
sides preserves that agreement: the preservation half a send step needs.
Both are stated over arbitrary item types so that the source family and the
target family instantiate them with their own items and their own key
functions.
-/

/-- A completed rank environment: actor names in the order the discipline
schedules them, most eligible first. The translator's
`priorityOrderedInstances` — actor priority, ties completed by declaration
order — is the intended instantiation, but this layer says nothing about
where the list comes from. -/
abbrev RankEnvironment :=
  List ActorName

namespace RankEnvironment

/-- The rank a name carries in a rank environment.

An occurrence-based definition rather than `List.indexOf`, so that the
lemmas later stages need are proved against this file's own equations
instead of against library lemmas whose spelling moves between core
versions. A name absent from the environment ranks as the environment's
length — the same convention `indexOf` uses — and the well-formedness
layers of the disciplined families require every runtime actor name to be
present, so the degenerate rank is unreachable there. -/
def rankOf
    (ranks : RankEnvironment)
    (name : ActorName) :
    Nat :=
  match ranks with
  | [] => 0
  | head :: rest =>
      if head = name then
        0
      else
        rankOf rest name + 1

  /-- If a rank environment has no duplicate names, `rankOf` is injective
  on names present in the environment. -/
  theorem rankOf_eq_of_mem_of_nodup
      (ranks : RankEnvironment)
      (hNodup : ranks.Nodup)
      (name₁ name₂ : ActorName)
      (h₁ : name₁ ∈ ranks)
      (h₂ : name₂ ∈ ranks)
      (hEq : rankOf ranks name₁ = rankOf ranks name₂) :
      name₁ = name₂ := by
    induction ranks with
    | nil => simp at h₁
    | cons head tail ih =>
        by_cases h₁' : head = name₁
        · subst h₁'
          by_cases h₂' : head = name₂
          · subst h₂'; rfl
          · unfold rankOf at hEq
            simp only [if_neg h₂'] at hEq
            cases hEq
        · by_cases h₂' : head = name₂
          · subst h₂'
            unfold rankOf at hEq
            simp only [if_neg h₁'] at hEq
            cases hEq
          · rcases List.mem_cons.mp h₁ with hEq₁ | hInTail₁
            · exact (h₁' hEq₁.symm).elim
            · rcases List.mem_cons.mp h₂ with hEq₂ | hInTail₂
              · exact (h₂' hEq₂.symm).elim
              · have hTailNodup : tail.Nodup := List.nodup_cons.mp hNodup |>.right
                unfold rankOf at hEq
                simp only [h₁', h₂', if_false] at hEq
                have hEq' : rankOf tail name₁ = rankOf tail name₂ := by omega
                exact ih hTailNodup hInTail₁ hInTail₂ hEq'

end RankEnvironment

/-- The generation a send stamps on the message it creates.

The transpose of `LF.Tag.schedule`'s microstep arithmetic: a zero delay
advances the round, a positive delay lands in the first round of the later
logical time. This layer cannot import the LF side, so the equation
`stampGeneration firingGeneration delay =
    (LF.Tag.schedule ⟨time, firingGeneration⟩ delay).microstep`
belongs to the correctness bridge that sees both families. -/
def stampGeneration
    (firingGeneration : Nat)
    (delay : Delay) :
    Nat :=
  if delay.value = 0 then
    firingGeneration + 1
  else
    0

@[simp]
theorem stampGeneration_zero
    (firingGeneration : Nat) :
    stampGeneration firingGeneration ⟨0⟩ =
      firingGeneration + 1 := by
  simp [stampGeneration]

theorem stampGeneration_positive
    (firingGeneration : Nat)
    (delay : Delay)
    (hPositive : 0 < delay.value) :
    stampGeneration firingGeneration delay =
      0 := by
  have hNonzero : delay.value ≠ 0 :=
    Nat.ne_of_gt hPositive

  simp [stampGeneration, hNonzero]

/-!
## The order on keys
-/

/-- The scheduling-order key of one pending occurrence.

Four components, in the order the discipline consults them: logical arrival
time; the generation of the sending round; the completed rank of the
receiving actor; and the emission position of the sending site within the
receiver's reaction list — which already encodes message-server priority,
self-delivery precedence, sender priority, and site walk order, because the
translator emits reactions in exactly that completed order.

`arrival` is typed `Nat`, not `LogicalTime`, and that is deliberate: F72
measured that `omega` cannot see through `LogicalTime`, and this layer's
order facts are exactly the kind of component arithmetic `omega` should
close. The key is scheduling metadata rather than a time-domain citizen —
nothing in either family's time story reads it back — so it carries the
unwrapped number. Assigning a message's `LogicalTime` arrival into this
field needs no coercion, because `LogicalTime` is an abbreviation of `Nat`. -/
structure MessageOrderPrefix where
  arrival :
    Nat

  generation :
    Nat

  receiverRank :
    Nat

  emission :
    Nat

deriving Repr, DecidableEq, BEq, Inhabited

namespace MessageOrderPrefix

/-- Lexicographic order on keys: arrival, then generation, then receiver
rank, then emission.

Spelled as four flat disjuncts rather than as nested pairs, so that
transitivity and totality are one `omega` each over the component
arithmetic. The same shape `LF.Tag.PrecedesOrEqual` uses for its two
components, grown to four. -/
def PrecedesOrEqual
    (left right : MessageOrderPrefix) :
    Prop :=
  left.arrival < right.arrival ∨
    (left.arrival = right.arrival ∧
      left.generation < right.generation) ∨
    (left.arrival = right.arrival ∧
      left.generation = right.generation ∧
      left.receiverRank < right.receiverRank) ∨
    (left.arrival = right.arrival ∧
      left.generation = right.generation ∧
      left.receiverRank = right.receiverRank ∧
        left.emission ≤ right.emission)

instance instDecidablePrecedesOrEqual
    (left right : MessageOrderPrefix) :
    Decidable (PrecedesOrEqual left right) := by
  unfold PrecedesOrEqual

  infer_instance

theorem precedesOrEqual_refl
    (key : MessageOrderPrefix) :
    PrecedesOrEqual key key :=
  Or.inr
    (Or.inr
      (Or.inr
        ⟨rfl, rfl, rfl, Nat.le_refl key.emission⟩))

theorem precedesOrEqual_trans
    {left middle right : MessageOrderPrefix}
    (hLeft :
      PrecedesOrEqual left middle)
    (hRight :
      PrecedesOrEqual middle right) :
    PrecedesOrEqual left right := by
  unfold PrecedesOrEqual at hLeft hRight ⊢

  rcases hLeft with
    h1 | ⟨h1, h2⟩ | ⟨h1, h2, h3⟩ | ⟨h1, h2, h3, h4⟩ <;>
    rcases hRight with
      h1' | ⟨h1', h2'⟩ | ⟨h1', h2', h3'⟩ | ⟨h1', h2', h3', h4'⟩ <;>
    omega

theorem precedesOrEqual_total
    (left right : MessageOrderPrefix) :
    PrecedesOrEqual left right ∨
      PrecedesOrEqual right left := by
  unfold PrecedesOrEqual

  omega

theorem precedesOrEqual_antisymm
    {left right : MessageOrderPrefix}
    (hLeft :
      PrecedesOrEqual left right)
    (hRight :
      PrecedesOrEqual right left) :
    left = right := by
  unfold PrecedesOrEqual at hLeft hRight

  rcases hLeft with
    h1 | ⟨h1, h2⟩ | ⟨h1, h2, h3⟩ | ⟨h1, h2, h3, h4⟩ <;>
    rcases hRight with
      h1' | ⟨h1', h2'⟩ | ⟨h1', h2', h3'⟩ | ⟨h1', h2', h3', h4'⟩ <;>
    first
      | (exfalso; omega)
      | (
          have hEmission :
              left.emission = right.emission :=
            Nat.le_antisymm h4 h4';

          cases left;

          cases right;

          simp_all
        )

  /-- Extensionality for `MessageOrderPrefix`. -/
  @[ext]
  theorem ext
      {left right : MessageOrderPrefix}
      (hArrival : left.arrival = right.arrival)
      (hGeneration : left.generation = right.generation)
      (hReceiverRank : left.receiverRank = right.receiverRank)
      (hEmission : left.emission = right.emission) :
      left = right := by
    cases left
    cases right
    simp_all

end MessageOrderPrefix

/-!
## Membership under permutation
-/

/-- Membership transfers along a permutation of keys.

Stated and proved here rather than reaching for a library spelling, because
the four-constructor induction below is the whole proof and the disciplined
families' queue-order isomorphism leans on it at every step. -/
theorem perm_mem
    {left right : List MessageOrderPrefix}
    (hPerm : left.Perm right) :
    ∀ key, key ∈ left → key ∈ right := by
  induction hPerm with

  | nil =>
      intro key hMem

      exact hMem

  | cons _ _ inductionHypothesis =>
      intro key hMem

      rcases List.mem_cons.mp hMem with
        rfl | hInTail

      · exact List.mem_cons_self

      · exact
          List.mem_cons_of_mem _
            (inductionHypothesis key hInTail)

  | swap _ _ _ =>
      intro key hMem

      rcases List.mem_cons.mp hMem with
        rfl | hInTail

      · exact
          List.mem_cons.mpr
            (Or.inr List.mem_cons_self)

      · rcases List.mem_cons.mp hInTail with
          rfl | hInRest

        · exact List.mem_cons_self

        · exact
            List.mem_cons_of_mem _
              (List.mem_cons_of_mem _ hInRest)

  | trans _ _ first second =>
      intro key hMem

      exact
        second key
          (first key hMem)

/-!
## The minimal key of a list
-/

/-- The accumulator fold of `minimalPrefix`.

The same incumbent discipline as `selectEarliestEvent`: the candidate
replaces the incumbent only when it strictly precedes it, so among equal
keys the earlier-walked one is kept. -/
def minimumSoFar
    (best : MessageOrderPrefix) :
    List MessageOrderPrefix → MessageOrderPrefix

  | [] =>
      best

  | candidate :: rest =>
      if
          MessageOrderPrefix.PrecedesOrEqual
            candidate
            best
      then
        minimumSoFar candidate rest
      else
        minimumSoFar best rest

/-- The fold really does compute a member. -/
theorem minimumSoFar_mem :
    ∀ (items : List MessageOrderPrefix)
      (best : MessageOrderPrefix),
      minimumSoFar best items ∈ best :: items := by
  intro items

  induction items with

  | nil =>
      intro best

      simp only [minimumSoFar]

      exact List.mem_cons_self

  | cons candidate rest inductionHypothesis =>
      intro best

      by_cases hPrecedes :
        MessageOrderPrefix.PrecedesOrEqual
          candidate
          best

      · simp only [minimumSoFar, if_pos hPrecedes]

        exact
          List.mem_cons_of_mem best
            (inductionHypothesis candidate)

      · simp only [minimumSoFar, if_neg hPrecedes]

        rcases
            List.mem_cons.mp
              (inductionHypothesis best) with
          hEq | hInRest

        · rw [hEq]

          exact List.mem_cons_self

        · exact
            List.mem_cons_of_mem best
              (List.mem_cons_of_mem candidate hInRest)

/-- The fold really does compute a minimum: its result precedes every
member of the list it was seeded with, the seed included. -/
theorem minimumSoFar_minimal :
    ∀ (items : List MessageOrderPrefix)
      (best candidate : MessageOrderPrefix),
      candidate ∈ best :: items →
        MessageOrderPrefix.PrecedesOrEqual
          (minimumSoFar best items)
          candidate := by
  intro items

  induction items with

  | nil =>
      intro best candidate hMem

      simp only [List.mem_singleton] at hMem

      subst hMem

      exact MessageOrderPrefix.precedesOrEqual_refl _

  | cons head rest inductionHypothesis =>
      intro best candidate hMem

      by_cases hPrecedes :
        MessageOrderPrefix.PrecedesOrEqual
          head
          best

      · simp only [minimumSoFar, if_pos hPrecedes]

        rcases List.mem_cons.mp hMem with
          hEqBest | hInTail

        · rw [hEqBest]

          exact
            MessageOrderPrefix.precedesOrEqual_trans
              (inductionHypothesis head head
                List.mem_cons_self)
              hPrecedes

        · rcases List.mem_cons.mp hInTail with
            hEqHead | hInRest

          · rw [hEqHead]

            exact
              inductionHypothesis head head
                List.mem_cons_self

          · exact
              inductionHypothesis head candidate
                (List.mem_cons_of_mem head hInRest)

      · have hBest :
            MessageOrderPrefix.PrecedesOrEqual
              best
              head :=
            (MessageOrderPrefix.precedesOrEqual_total
                head
                best).resolve_left
              hPrecedes

        simp only [minimumSoFar, if_neg hPrecedes]

        rcases List.mem_cons.mp hMem with
          hEqBest | hInTail

        · rw [hEqBest]

          exact
            inductionHypothesis best best
              List.mem_cons_self

        · rcases List.mem_cons.mp hInTail with
            hEqHead | hInRest

          · rw [hEqHead]

            exact
              MessageOrderPrefix.precedesOrEqual_trans
                (inductionHypothesis best best
                  List.mem_cons_self)
                hBest

          · exact
              inductionHypothesis best candidate
                (List.mem_cons_of_mem best hInRest)

/-- The minimal key of a nonempty list, as an option. -/
def minimalPrefix :
    List MessageOrderPrefix →
    Option MessageOrderPrefix

  | [] =>
      none

  | head :: rest =>
      some (minimumSoFar head rest)

theorem minimalPrefix_mem
    {items : List MessageOrderPrefix}
    {best : MessageOrderPrefix}
    (h :
      minimalPrefix items = some best) :
    best ∈ items := by
  cases items with

  | nil =>
      simp [minimalPrefix] at h

  | cons head rest =>
      simp only [minimalPrefix, Option.some.injEq] at h

      rw [← h]

      exact minimumSoFar_mem rest head

theorem minimalPrefix_minimal
    {items : List MessageOrderPrefix}
    {best : MessageOrderPrefix}
    (h :
      minimalPrefix items = some best) :
    ∀ candidate, candidate ∈ items →
      MessageOrderPrefix.PrecedesOrEqual
        best
        candidate := by
  cases items with

  | nil =>
      simp [minimalPrefix] at h

  | cons head rest =>
      simp only [minimalPrefix, Option.some.injEq] at h

      intro candidate hMem

      rw [← h]

      exact
        minimumSoFar_minimal
          rest
          head
          candidate
          hMem

/-- The minimum of a list of keys is a fact about the multiset, not about
the list's order: a permutation has the same minimum.

This is the load-bearing permutation-invariance of the whole design. The
source family's pending items and the target family's pending items are
ordered differently — bag chronology against queue insertion — so the
invariant relating them can only ever be a statement up to permutation, and
this theorem is what lets a scheduler agreement exist at all under such an
invariant. -/
theorem minimalPrefix_of_perm
    {left right : List MessageOrderPrefix}
    (hPerm : left.Perm right) :
    minimalPrefix left = minimalPrefix right := by
  cases left with

  | nil =>
      have hRightNil : right = [] := by
        cases right with

        | nil => rfl

        | cons head rest =>
            exact
              (List.not_mem_nil
                (perm_mem hPerm.symm head
                  List.mem_cons_self)).elim

      rw [hRightNil]

  | cons headLeft restLeft =>
      cases right with

      | nil =>
          exact
            (List.not_mem_nil
              (perm_mem hPerm headLeft
                List.mem_cons_self)).elim

      | cons headRight restRight =>
          cases hLeft :
            minimalPrefix (headLeft :: restLeft) with

          | none =>
              simp [minimalPrefix] at hLeft

          | some bestLeft =>
              cases hRight :
                minimalPrefix (headRight :: restRight) with

            | none =>
                simp [minimalPrefix] at hRight

            | some bestRight =>
                have hMemLeft :
                    bestLeft ∈ headLeft :: restLeft :=
                  minimalPrefix_mem (h := hLeft)

                have hMemRight :
                    bestRight ∈ headRight :: restRight :=
                  minimalPrefix_mem (h := hRight)

                have hMinimalLeft :
                    ∀ candidate,
                      candidate ∈ headLeft :: restLeft →
                        MessageOrderPrefix.PrecedesOrEqual
                          bestLeft
                          candidate :=
                  minimalPrefix_minimal (h := hLeft)

                have hMinimalRight :
                    ∀ candidate,
                      candidate ∈ headRight :: restRight →
                        MessageOrderPrefix.PrecedesOrEqual
                          bestRight
                          candidate :=
                  minimalPrefix_minimal (h := hRight)

                have hBest :
                    bestLeft = bestRight :=
                  MessageOrderPrefix.precedesOrEqual_antisymm
                    (hMinimalLeft bestRight
                      (perm_mem hPerm.symm bestRight hMemRight))
                    (hMinimalRight bestLeft
                      (perm_mem hPerm bestLeft hMemLeft))

                simp only [hBest]

/-!
## The first occurrence satisfying a predicate
-/

/-- The first list item satisfying a predicate, if there is one.

`List.find?` in house clothing: defined by this file's own structural
equations so the three lemmas below are proved against them, which keeps
this layer's dependency on library spellings to the constructor lemmas
`List.mem_cons` already uses everywhere. -/
def firstWith
    {α : Type}
    (predicate : α → Bool) :
    List α → Option α

  | [] =>
      none

  | head :: rest =>
      if predicate head then
        some head
      else
        firstWith predicate rest

theorem firstWith_mem
    {α : Type}
    (predicate : α → Bool)
    (items : List α)
    {item : α}
    (h :
      firstWith predicate items = some item) :
    item ∈ items := by
  induction items with

  | nil =>
      simp [firstWith] at h

  | cons head rest inductionHypothesis =>
      by_cases hPredicate : predicate head

      · simp only [firstWith, if_pos hPredicate, Option.some.injEq] at h

        rw [← h]

        exact List.mem_cons_self

      · simp only [firstWith, if_neg hPredicate] at h

        exact
          List.mem_cons_of_mem head
            (inductionHypothesis h)

theorem firstWith_predicate
    {α : Type}
    (predicate : α → Bool)
    (items : List α)
    {item : α}
    (h :
      firstWith predicate items = some item) :
    predicate item = true := by
  induction items with

  | nil =>
      simp [firstWith] at h

  | cons head rest inductionHypothesis =>
      by_cases hPredicate : predicate head

      · simp only [firstWith, if_pos hPredicate, Option.some.injEq] at h

        rw [← h]

        exact hPredicate

      · simp only [firstWith, if_neg hPredicate] at h

        exact inductionHypothesis h

theorem firstWith_isSome
    {α : Type}
    (predicate : α → Bool)
    (items : List α)
    (item : α)
    (hMem : item ∈ items)
    (hPredicate : predicate item = true) :
    (firstWith predicate items).isSome = true := by
  induction items with

  | nil =>
      simp at hMem

  | cons head rest inductionHypothesis =>
      by_cases hHead : predicate head

      · simp only [firstWith, if_pos hHead]

        simp

      · simp only [firstWith, if_neg hHead]

        rcases List.mem_cons.mp hMem with
          rfl | hInTail

        · exact absurd hPredicate hHead

        · exact inductionHypothesis hInTail

/-!
## Selection by key
-/

/-- The disciplined scheduler's selection: the earliest pending occurrence,
where "earliest" means the minimal scheduling-order key and, among
occurrences sharing that key, the first in list order.

Both disciplined families instantiate this one function — the source over
its due messages in bag order, the target over its pending events in queue
order — so any theorem about selection is proved once, here, and inherited
by both. -/
def selectMinimumKeyed
    {α : Type}
    (prefixOf : α → MessageOrderPrefix)
    (items : List α) :
    Option α :=
  match
      minimalPrefix (items.map prefixOf) with
  | none => none
  | some best =>
      firstWith
        (fun item =>
          decide (prefixOf item = best))
        items

theorem selectMinimumKeyed_mem
    {α : Type}
    (prefixOf : α → MessageOrderPrefix)
    (items : List α)
    {item : α}
    (h :
      selectMinimumKeyed prefixOf items = some item) :
    item ∈ items := by
  simp only [selectMinimumKeyed] at h

  cases hMinimal :
    minimalPrefix (items.map prefixOf) with

  | none =>
      rw [hMinimal] at h

      simp at h

  | some best =>
      rw [hMinimal] at h

      exact firstWith_mem _ items h

theorem selectMinimumKeyed_minimal
    {α : Type}
    (prefixOf : α → MessageOrderPrefix)
    (items : List α)
    {item : α}
    (h :
      selectMinimumKeyed prefixOf items = some item) :
    ∀ other, other ∈ items →
      MessageOrderPrefix.PrecedesOrEqual
        (prefixOf item)
        (prefixOf other) := by
  intro other hMemOther

  simp only [selectMinimumKeyed] at h

  cases hMinimal :
    minimalPrefix (items.map prefixOf) with

  | none =>
      rw [hMinimal] at h

      simp at h

  | some best =>
      rw [hMinimal] at h

      have hItemBest :
          prefixOf item = best :=
        of_decide_eq_true
          (firstWith_predicate _ items h)

      rw [hItemBest]

      exact
        minimalPrefix_minimal
          (h := hMinimal)
          (prefixOf other)
          (List.mem_map.mpr ⟨other, hMemOther, rfl⟩)

/-- What the selected occurrence's key is: the minimal key of the pending
list. Stated as an option equation so that it covers the empty case and
composes by rewriting. -/
theorem selectMinimumKeyed_prefix
    {α : Type}
    (prefixOf : α → MessageOrderPrefix)
    (items : List α) :
    (selectMinimumKeyed prefixOf items).map prefixOf
      = minimalPrefix (items.map prefixOf) := by
  simp only [selectMinimumKeyed]

  cases hMinimal :
    minimalPrefix (items.map prefixOf) with

  | none =>
      simp

  | some best =>
      obtain ⟨item, hMem, hEq⟩ :=
        List.mem_map.mp
          (minimalPrefix_mem (h := hMinimal))

      dsimp only

      cases hFind :
        firstWith
          (fun candidate =>
            decide (prefixOf candidate = best))
          items with

      | none =>
          have hSome :=
            firstWith_isSome
              (fun candidate =>
                decide (prefixOf candidate = best))
              items
              item
              hMem
              (by rw [hEq]; simp)

          rw [hFind] at hSome

          simp at hSome

      | some found =>
          have hPred :=
            firstWith_predicate
              (fun candidate =>
                decide (prefixOf candidate = best))
              items
              hFind

          simp only [Option.map_some]

          rw [of_decide_eq_true hPred]

/-- Two pending lists whose key multisets agree select occurrences with the
same key.

This is the scheduler-agreement kernel of the queue-order isomorphism: the
bisimulation's invariant relates the source's due messages and the target's
pending events by a permutation of keys, and this theorem turns that
invariant into "both schedulers pick corresponding work" without any
assumption about how either list is ordered internally. Which occurrence of
a repeated key is picked is decided by list order on each side, and the
invariant pairs repeated keys in order, so the occurrences correspond too —
that half belongs to the families' own correspondence layer, which knows the
pairing. -/
theorem selectMinimumKeyed_of_perm
    {α β : Type}
    (prefixLeft : α → MessageOrderPrefix)
    (left : List α)
    (prefixRight : β → MessageOrderPrefix)
    (right : List β)
    (hPerm :
      (left.map prefixLeft).Perm
        (right.map prefixRight)) :
    (selectMinimumKeyed prefixLeft left).map prefixLeft
      = (selectMinimumKeyed prefixRight right).map prefixRight := by
  rw [
    selectMinimumKeyed_prefix,
    selectMinimumKeyed_prefix,
    minimalPrefix_of_perm hPerm
  ]

/-!
## Preservation under append
-/

/-- Appending one occurrence with one key to both sides of a key-multiset
agreement preserves the agreement.

This is the preservation kernel a disciplined send step needs: the source
appends a stamped message to a bag, the target appends the corresponding
event to the queue, the two appends carry the same key, and the queue-order
isomorphism survives. The take case — removing the selected occurrence from
both sides — is the symmetric kernel, and belongs to the families'
correspondence layer with the selection theorems above already in hand. -/
theorem perm_map_append
    {α β : Type}
    (prefixLeft : α → MessageOrderPrefix)
    (left : List α)
    (prefixRight : β → MessageOrderPrefix)
    (right : List β)
    (itemLeft : α)
    (itemRight : β)
    (hPerm :
      (left.map prefixLeft).Perm
        (right.map prefixRight))
    (hKey :
      prefixLeft itemLeft =
        prefixRight itemRight) :
    ((left ++ [itemLeft]).map prefixLeft).Perm
      ((right ++ [itemRight]).map prefixRight) := by
  simp only [
    List.map_append,
    List.map_cons,
    List.map_nil
  ]

  rw [hKey]

  exact List.Perm.append_right _ hPerm

end Disciplined

end Relico
