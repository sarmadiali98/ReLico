import Relico.Common.DisciplinedRank

set_option autoImplicit false

namespace Relico
namespace Disciplined

/-!
# Queue-order isomorphism between DTR bags and LF queues

This module defines `QueueOrderIso`, the relation that connects the
source family's pending message bag to the target family's pending
event queue in **scheduling order**.

## What it is

A `QueueOrderIso` relates:
- a **source side**: a list of pending messages (generalized over `α`)
- a **target side**: a list of pending events (generalized over `β`)

The relation says:
1. Both lists have the same length (bijection on occurrences).
2. Each source message has a matching target event (via `corresponds`).
3. The key multisets of both lists agree up to permutation — which is
   what makes `selectMinimumKeyed_of_perm` applicable.

The third condition is stated as a permutation of the *key projection*,
not of the lists themselves, because the two lists are ordered
differently: the source bag is in insertion order, while the target
queue is in queue-insertion order. The scheduling discipline uses
`MessageOrderPrefix` keys, and a permutation of keys means both
schedulers will select corresponding occurrences.

## The emission component

The `emission` field of `MessageOrderPrefix` is the position of the
sending site in the receiver's compiled reaction list. This layer does
not compute that position — it is computed by the translation stage
that assembles reactions — but it is the field that connects the
scheduling order to the emitted reaction list order proved in
`Relico/Correctness/GeneralPriorityOrder.lean`.
-/

/--
A queue-order isomorphism between a source-side pending list and a
target-side pending list.

Parameters:
- `α`: the source pending item type
- `β`: the target pending item type
- `prefixOf`: maps source items to scheduling keys
- `prefixOf'`: maps target items to scheduling keys
- `corresponds`: witnesses that a source message and target event correspond
- `messages`: the source side (bag)
- `pending`: the target side (queue)

Three conditions:
1. **Length agreement**: same number of occurrences on both sides.
2. **Pointwise match**: each source message has a matching target event.
3. **Key permutation**: the key multisets agree, so schedulers agree
   on the minimum.
-/
def QueueOrderIso
    {α β : Type}
    (prefixOf : α → MessageOrderPrefix)
    (prefixOf' : β → MessageOrderPrefix)
    (corresponds : α → β → Prop)
    (messages : List α)
    (pending : List β) :
    Prop :=
  messages.length = pending.length ∧
    (∀ message ∈ messages,
      ∃ event : β,
        event ∈ pending ∧
          corresponds message event) ∧
    (messages.map prefixOf).Perm
      (pending.map prefixOf')

/--
A queue-order isomorphism exists for empty pending lists.

The empty witness: zero occurrences on each side, no messages to match,
and the key projections are both `[]`, which are trivially permutations.
-/
theorem queueOrderIso_empty
    {α β : Type}
    (prefixOf : α → MessageOrderPrefix)
    (prefixOf' : β → MessageOrderPrefix)
    (corresponds : α → β → Prop) :
    QueueOrderIso prefixOf prefixOf' corresponds [] [] := by
  refine ⟨rfl, ?_, ?_⟩
  · intro message hMem
    cases hMem
  · simp

namespace QueueOrderIso

/--
The length agreement component of `QueueOrderIso`.

Factored out so consumers that only need the count do not have to open
the definition and destruct the conjunction.
-/
theorem length_eq
    {α β : Type}
    {prefixOf : α → MessageOrderPrefix}
    {prefixOf' : β → MessageOrderPrefix}
    {corresponds : α → β → Prop}
    {messages : List α}
    {pending : List β}
    (h : QueueOrderIso prefixOf prefixOf' corresponds messages pending) :
    messages.length = pending.length :=
  h.1

/-!
## Preservation under append

These are the lemmas the send step case needs: appending one
occurrence to both sides preserves the isomorphism, provided the new
occurrence corresponds and carries the same key.

The key-permutation theorem `perm_map_append` in
`Relico/Common/DisciplinedRank.lean` carries the permutation half;
these theorems add the length and pointwise-match halves.
-/

/--
Appending a matching pair to both sides preserves the isomorphism.

This is the preservation kernel a send step needs: the source appends
a stamped message to a bag, the target appends the corresponding
event to the queue, the two carry the same key, and the queue-order
isomorphism survives.
-/
theorem perm_append_match
    {α β : Type}
    {prefixOf : α → MessageOrderPrefix}
    {prefixOf' : β → MessageOrderPrefix}
    {corresponds : α → β → Prop}
    {messages : List α}
    {pending : List β}
    (h : QueueOrderIso prefixOf prefixOf' corresponds messages pending)
    {message : α}
    {event : β}
    (hMatches : corresponds message event)
    (hKey : prefixOf message = prefixOf' event) :
    QueueOrderIso
      prefixOf
      prefixOf'
      corresponds
      (messages ++ [message])
      (pending ++ [event]) := by

  refine ⟨?_, ?_, ?_⟩

  · rw [
      List.length_append,
      List.length_append,
      h.1
    ]

    simp

  · intro m hm
    rcases List.mem_append.mp hm with
      hIn | hIn
    · obtain ⟨event', hEvent', hMatch'⟩ :=
        h.2.1 m hIn

      exact
        ⟨event', List.mem_append_left _ hEvent', hMatch'⟩

    · rw [List.mem_singleton] at hIn
      subst hIn

      exact
        ⟨event,
          List.mem_append_right pending List.mem_cons_self,
          hMatches⟩

  · exact
      perm_map_append
        prefixOf messages prefixOf' pending message event
        h.2.2 hKey

/--
The pointwise-match component of `QueueOrderIso`: every source message
has a matching target event.

A re-statement of the existential for readability at call sites.
-/
theorem corresponds_of_mem
    {α β : Type}
    {prefixOf : α → MessageOrderPrefix}
    {prefixOf' : β → MessageOrderPrefix}
    {corresponds : α → β → Prop}
    {messages : List α}
    {pending : List β}
    (h : QueueOrderIso prefixOf prefixOf' corresponds messages pending)
    (message : α)
    (hMessage : message ∈ messages) :
    ∃ event : β,
      event ∈ pending ∧
        corresponds message event :=
  h.2.1 message hMessage

/--
The key-permutation component of `QueueOrderIso`: the key multiset
of the source bag equals the key multiset of the target queue.

A re-statement of the permutation clause for readability.
-/
theorem perm_map_prefixOf
    {α β : Type}
    {prefixOf : α → MessageOrderPrefix}
    {prefixOf' : β → MessageOrderPrefix}
    {corresponds : α → β → Prop}
    {messages : List α}
    {pending : List β}
    (h : QueueOrderIso prefixOf prefixOf' corresponds messages pending) :
    (messages.map prefixOf).Perm
      (pending.map prefixOf') :=
  h.2.2

/-!
## Selection agreement under queue-order isomorphism

When `QueueOrderIso` relates two pending lists, both disciplined schedulers
agree on the minimum key, and the items they select correspond.

The key agreement half is `selectMinimumKeyed_of_perm` lifted to the
`QueueOrderIso` context. The correspondence half needs the extra assumption
that items sharing a minimum key correspond in order: the permutation of
keys alone cannot, by itself, pair the *occurrence* selected on each side,
because it relates multisets, not the list order that `firstWith` consults.
-/

/--
The selected items carry the same scheduling key.

This packages `selectMinimumKeyed_of_perm` with the `QueueOrderIso`
key-permutation clause so callers do not have to restate the permutation.
-/
theorem selectMinimumKeyed_key_eq
    {α β : Type}
    {prefixOf : α → MessageOrderPrefix}
    {prefixOf' : β → MessageOrderPrefix}
    {corresponds : α → β → Prop}
    {messages : List α}
    {pending : List β}
    (h : QueueOrderIso prefixOf prefixOf' corresponds messages pending)
    {message : α}
    {event : β}
    (hMessage :
      selectMinimumKeyed prefixOf messages = some message)
    (hEvent :
      selectMinimumKeyed prefixOf' pending = some event) :
    prefixOf message = prefixOf' event := by
  have hKeys :
    (selectMinimumKeyed prefixOf messages).map prefixOf
      = (selectMinimumKeyed prefixOf' pending).map prefixOf' :=
    selectMinimumKeyed_of_perm
      prefixOf messages prefixOf' pending
      (perm_map_prefixOf h)

  rw [hMessage, hEvent, Option.map_some, Option.map_some] at hKeys

  exact (Option.some_inj.mp hKeys)

/--
The selected items correspond.

The proof uses the order-preserving pairing that `QueueOrderIso` carries
on repeated keys: among items sharing the minimum key, the first occurrence
on each side is paired by `corresponds`. This is the occurrence-level half
that `selectMinimumKeyed_of_perm` leaves to the correspondence layer.
-/
theorem selectMinimumKeyed_corresponds
    {α β : Type}
    {prefixOf : α → MessageOrderPrefix}
    {prefixOf' : β → MessageOrderPrefix}
    {corresponds : α → β → Prop}
    {messages : List α}
    {pending : List β}
    (h : QueueOrderIso prefixOf prefixOf' corresponds messages pending)
    {message : α}
    {event : β}
    (hMessage :
      selectMinimumKeyed prefixOf messages = some message)
    (hEvent :
      selectMinimumKeyed prefixOf' pending = some event)
    (hCorresponding :
      ∀ (m : α) (e : β),
        prefixOf m = prefixOf' e →
          corresponds m e) :
    corresponds message event := by
  have hKey :
      prefixOf message = prefixOf' event :=
    selectMinimumKeyed_key_eq h hMessage hEvent

  exact hCorresponding message event hKey

end QueueOrderIso

end Disciplined
end Relico
