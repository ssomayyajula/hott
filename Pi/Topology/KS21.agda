{-# OPTIONS --without-K --rewriting #-}

module Pi.Topology.KS21 where

open import lib.Basics
open import lib.types.Bool using (Bool; Bool-level)
open import lib.types.Truncation
open import lib.Equivalence2 using (∘e-unit-r)
open import lib.groups.Homomorphism using (group-hom)
open import lib.types.EilenbergMacLane1

open import Pi.Topology.Universe
open import Pi.Topology.BoolUniverse
open import Pi.Topology.Equivalence using (≃-Group; ∘e-unit-l)

K[S₂,1] : Type₀
K[S₂,1] = EM₁ $ ≃-Group Bool-level

U[Bool]≃K[S₂,1] : U[ Bool ] ≃ K[S₂,1]
U[Bool]≃K[S₂,1] = equiv f g ε η where
  f : U[ Bool ] → K[S₂,1]
  -- TODO: EM₁-level not compatible with prop truncation
  f = Trunc-rec {!!} (cst embase) ∘ snd
  
  g : K[S₂,1] → U[ Bool ]
  g = EM₁-rec U[Bool]-level (` Bool) $ group-hom ~
    (Bool-equiv-induction
      (λ e → ap ~ (∘e-unit-l _) ∙ ap (λ x → x ∙ ~ e) (! ~ide=idp))
      (Bool-equiv-induction
        (ap ~ (∘e-unit-r _) ∙ ! (ap (_∙_ (~ not)) ~ide=idp ∙ ∙-unit-r _))
        (ap ~ not∘not=ide ∙ ~ide=idp ∙ ! ~not∙~not=idp)))

  ε : ∀ b → f (g b) == b
  -- EM₁-elim {!!} idp (λ g₁ → {!!}) λ g₁ g₂ → {!!}
  ε = EM₁-elim {!!} {!!} (λ g₁ → {!!}) λ g₁ g₂ → {!!} 

  η : ∀ a → g (f a) == a
  η a@(t , p) = Trunc-rec {!!} lem p where
    -- TODO: this is bad, because the trunc-rec doesn't remember that p is
    -- the second component of a, so p doesn't get eliminated into idp or ua not during Bool-path-induction
    lem : fst a == Bool → g (f a) == a
    lem idp = Trunc-rec {!!} {!!} p
