{-# OPTIONS --without-K --rewriting #-}

module Pi.Topology.SymmetricGroup where

open import lib.Basics using
  (Type;
   _==_; idp;
   λ=; cst;
   _,_; fst; pair=;
   is-equiv; _≃_; ide; _⁻¹; _∘e_)
open import lib.types.TLevel using (⟨_⟩)
open import lib.NType using (has-level; prop-has-level-S; prop-has-all-paths)
open import lib.PathOver using (from-transp)
open import lib.types.Group using (Group; group; group-structure)
open import lib.Equivalence2 using (is-equiv-is-prop)
open import lib.types.Sigma using (Σ-level)
open import lib.types.Pi using (Π-level)

module _ {ℓ} {ℓ'} {A : Type ℓ} {B : Type ℓ'} {f g : A ≃ B} where
  equiv= : fst f == fst g → f == g
  equiv= p = pair= p (from-transp _ _ (prop-has-all-paths is-equiv-is-prop _ _))

-- Auto-equivalences form a group under composition, inversion
S : ∀ {ℓ} (A : Type ℓ) → has-level 0 A → Group ℓ
S A h = group (A ≃ A) (Σ-level (Π-level (cst h)) λ _ → prop-has-level-S is-equiv-is-prop)
  (group-structure
    (ide _) (_⁻¹) (_∘e_)
    (λ _       → equiv= idp)
    (λ _ _ _   → equiv= idp)
    (λ{(_ , e) → equiv= (λ= (is-equiv.g-f e))}))
