(** Algoritmo de Ordenação por Inserção em listas *)

Require Import List Arith.
Open Scope nat_scope.

(** * Definição de ordenação *)

Inductive ordenada: list nat -> Prop :=
| lista_vazia: ordenada nil
| lista_unit: forall x, ordenada (x :: nil)
| lista_mult: forall x y l, x <= y -> ordenada (y :: l) -> ordenada (x :: y :: l).

(** * Definição da função de inserção *)

Fixpoint insere (n:nat) (l: list nat) :=
  match l with
  | nil => n :: nil
  | h :: tl => if n <=? h then (n :: l)
             else (h :: (insere n tl)) 
                      end.

(** * Definição da função principal do algoritmo. *)

 Fixpoint ord_insercao l :=
  match l with
    | nil => nil
    | h :: tl => insere h (ord_insercao tl)
  end.

(** A função [insert] preserva a ordenação. *)

Lemma insere_preserva_ordem: forall l x, ordenada l -> ordenada (insere x l). 
Proof.
(* Substitua esta linha pela sua prova. Provas completas terminam com Qed. *)  Admitted.

(** O algoritmo ord_insercao ordena. *)

Lemma ord_insercao_ordena: forall l, ordenada (ord_insercao l).
Proof.
(* Substitua esta linha pela sua prova. Provas completas terminam com Qed. *)  Admitted.
  
(** * Permutação *)

Inductive perm: list nat -> list nat -> Prop :=
| perm_refl: forall l, perm l l
| perm_hd: forall x l l', perm l l' -> perm (x::l) (x::l')
| perm_swap: forall x y l l', perm l l' -> perm (x::y::l) (y::x::l')
| perm_trans: forall l l' l'', perm l l' -> perm l' l'' -> perm l l''.

Lemma ord_insercao_perm: forall l, perm l (ord_insercao l).
Proof.
(* Substitua esta linha pela sua prova. Provas completas terminam com Qed. *)  Admitted.


Theorem correcao_ord_insercao: forall l, ordenada (ord_insercao l) /\ perm l (ord_insercao l).
Proof.
  Admitted.
  
(** Extração de código certificado *)

Require Extraction.

Recursive Extraction ord_insercao.
Extraction "ord_insercao.ml" ord_insercao.

