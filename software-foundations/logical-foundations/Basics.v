(** * Basics: Functional Programming in Coq *)

Inductive bool : Type :=
  | true
  | false.

(* Exercise 1.1 nandb *)
Definition not (x: bool) : bool :=
  if x then false
  else true.

Definition nandb (x:bool) (y:bool) : bool :=
  match x with
  | false => true
  | true => (not y)
  end.

Example test_nandb1: (nandb true false) = true.
Proof. simpl. reflexivity. Qed.

Example test_nandb2: (nandb true true) = false.
Proof. simpl. reflexivity. Qed.

(* Exercise 1.2 andb3 *)
Definition andb (x:bool) (y:bool) : bool :=
  if x then y else false.

Definition andb3 (x:bool) (y:bool) (z:bool) : bool :=
  (andb x (andb y z)).

Example test_andb1: (andb3 true true true) = true.
Proof. simpl. reflexivity. Qed.

Example test_andb2: (andb3 true true false) = false.
Proof. simpl. reflexivity. Qed.

(* Exervice 1.3 factorial *)
Fixpoint factorial (n: nat) : nat :=
  match n with
  | O => 1
  | S n' => mult n (factorial n')
  end.

Example test_factorial1: (factorial 3) = 6.
Proof. simpl. reflexivity. Qed.

Example test_factorial2: (factorial 5) = 120.
Proof. simpl. reflexivity. Qed.

(* Exercise 1.4 ltb *)
Fixpoint leb (m n: nat) : bool :=
  match m, n with
  | O, _ => true
  | _, O => false
  | S m', S n' => leb m' n'
  end.

Definition ltb (m n: nat) : bool :=
  if (leb m n) then
    match n with
    | O => false
    | S n' => leb m n'
    end
  else false.

Example test_ltb1: (ltb 1 2) = true.
Proof. simpl. reflexivity. Qed.

Example test_ltb2: (ltb 2 1) = false.
Proof. simpl. reflexivity. Qed.

Example test_ltb3: (ltb 2 2) = false.
Proof. simpl. reflexivity. Qed.
