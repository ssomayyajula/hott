{-# OPTIONS --without-K #-}

module Pi.Level1 where

open import Type using (Type)

open import Paths using (_==_; refl; _◾_; ap; tpt)

open import DependentSum using (Σ; _,_; p₁; p₂)
open import PathsInSigma using (dpair=; dpair=-e₁; dpair=-η; dpair=-e)

open import NaturalNumbers using (ℕ)

open import Equivalences using (_≃_; path-to-eqv; is-retraction; tpt-id-is-equiv)
open import PropositionalTruncation using (∥_∥; ∣_∣; recTrunc; identify)

open import Functions using (id)
open import Univalence using (ua)

open import EmbeddingsInUniverse using (module UnivalentUniverseOfFiniteTypes)
open UnivalentUniverseOfFiniteTypes using (El; finite-types-is-univ)

open import Pi.Syntax
open import Pi.Level0

⟦_⟧₁ : {X Y : U} → X ⟷ Y → ⟦ X ⟧₀ == ⟦ Y ⟧₀
⟦ c ⟧₁ = p₁ (finite-types-is-univ _ _) #⟦ c ⟧₁

-- A classical result, sort of
-- Robert proved: vectors that has-init-seg = CPerm
postulate
  ==-to-⟷ : {m n : ℕ} → El m == El n → fromSize m ⟷ fromSize n
  perm-equiv : {X Y : U} → is-retraction (#⟦_⟧₁ {X} {Y})

-- This function would translate paths/equivalences in the image of the
-- level 0 translation to a level 1 program (hence "classical result")
#⟦_⟧₁⁻¹ : {X Y : U} → #⟦ X ⟧₀ ≃ #⟦ Y ⟧₀ → X ⟷ Y
#⟦_⟧₁⁻¹ = p₁ perm-equiv

⟦_⟧₁⁻¹ : {X Y : M} → X == Y → ∥ ⟦ X ⟧₀⁻¹ ⟷ ⟦ Y ⟧₀⁻¹ ∥
⟦_⟧₁⁻¹ {_ , _ , c₁} {_ , _ , c₂} p =
  recTrunc _ (λ c₁ →
  recTrunc _ (λ c₂ →
    ∣ ==-to-⟷ (Paths.! c₁ ◾ dpair=-e₁ p ◾ c₂) ∣
  ) identify c₂) identify c₁ 

-- This version observes paths in the image of the level 0 translation.
-- As a result, we may forgo truncation since we know 
⟦_⟧₁⁻¹' : {X Y : U} → ⟦ X ⟧₀ == ⟦ Y ⟧₀ → X ⟷ Y
⟦ p ⟧₁⁻¹' = #⟦ path-to-eqv (dpair=-e₁ p) ⟧₁⁻¹

-- Need a level 2 analogue of normalizeC, which creates a coherence between a
-- isomorphism and its..."normalized" version
⟦⟦_⟧₁⟧₁⁻¹' : {X Y : U} (c : X ⟷ Y) → ⟦ ⟦ c ⟧₁ ⟧₁⁻¹' ⇔ c
⟦⟦_⟧₁⟧₁⁻¹' {ZERO} {ZERO} id⟷ = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ZERO} {ZERO} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ZERO} {ZERO} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ZERO} {ONE} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ZERO} {ONE} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ZERO} {PLUS Y Y₁} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ZERO} {PLUS Y Y₁} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ZERO} {TIMES Y Y₁} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ZERO} {TIMES Y Y₁} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ONE} {ZERO} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ONE} {ZERO} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ONE} {ONE} id⟷ = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ONE} {ONE} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ONE} {ONE} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ONE} {PLUS Y Y₁} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ONE} {PLUS Y Y₁} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ONE} {TIMES Y Y₁} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {ONE} {TIMES Y Y₁} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS .ZERO .ZERO} {ZERO} unite₊l = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS X X₁} {ZERO} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS X X₁} {ZERO} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS .ZERO .ONE} {ONE} unite₊l = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS X X₁} {ONE} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS X X₁} {ONE} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS .ZERO .(PLUS Y Y₁)} {PLUS Y Y₁} unite₊l = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS X X₁} {PLUS .X₁ .X} swap₊ = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS X .(PLUS _ Y)} {PLUS .(PLUS X _) Y} assocl₊ = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS X X₁} {PLUS .X .X₁} id⟷ = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS X X₁} {PLUS Y Y₁} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS X X₁} {PLUS Y Y₁} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS X X₁} {PLUS Y Y₁} (c ⊕ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS .ZERO .(TIMES Y Y₁)} {TIMES Y Y₁} unite₊l = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS X X₁} {TIMES Y Y₁} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {PLUS X X₁} {TIMES Y Y₁} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES .ONE .ZERO} {ZERO} unite⋆l = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES .ZERO X} {ZERO} absorbr = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES X X₁} {ZERO} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES X X₁} {ZERO} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES .ONE .ONE} {ONE} unite⋆l = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES X X₁} {ONE} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES X X₁} {ONE} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES .ONE .(PLUS Y Y₁)} {PLUS Y Y₁} unite⋆l = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES .(PLUS _ _) X} {PLUS .(TIMES _ X) .(TIMES _ X)} dist = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES X X₁} {PLUS Y Y₁} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES X X₁} {PLUS Y Y₁} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES .ONE .(TIMES Y Y₁)} {TIMES Y Y₁} unite⋆l = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES X X₁} {TIMES .X₁ .X} swap⋆ = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES X .(TIMES _ Y)} {TIMES .(TIMES X _) Y} assocl⋆ = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES X X₁} {TIMES .X .X₁} id⟷ = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES X X₁} {TIMES Y Y₁} (! c) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES X X₁} {TIMES Y Y₁} (c ◎ c₁) = {!!}
⟦⟦_⟧₁⟧₁⁻¹' {TIMES X X₁} {TIMES Y Y₁} (c ⊗ c₁) = {!!}

-- TODO: This proof does not seem difficult, just annoying
⟦⟦_⟧₁⁻¹'⟧₁ : {X Y : U} (p : ⟦ X ⟧₀ == ⟦ Y ⟧₀) → ⟦ ⟦ p ⟧₁⁻¹' ⟧₁ == p
⟦⟦_⟧₁⁻¹'⟧₁ {X} {Y} p = {!!} where
  --lem : ua #⟦ #⟦ (tpt id (ap p₁ p) , tpt-id-is-equiv (ap p₁ p)) ⟧₁⁻¹ ⟧₁ == {!!}
  --lem = ap ua (p₂ perm-equiv _) ◾ {!!}

cmpl₁ : {X Y : U} (p : ⟦ X ⟧₀ == ⟦ Y ⟧₀) → Σ (X ⟷ Y) (λ c → ⟦ c ⟧₁ == p)
cmpl₁ p = ⟦ p ⟧₁⁻¹' , ⟦⟦ p ⟧₁⁻¹'⟧₁

sound₁ : {X Y : U} (c : X ⟷ Y) → Σ (⟦ X ⟧₀ == ⟦ Y ⟧₀) (λ p → ⟦ p ⟧₁⁻¹' ⇔ c)
sound₁ c = ⟦ c ⟧₁ , ⟦⟦ c ⟧₁⟧₁⁻¹'

-- Level 2 is here since we can't import level 1 into level 2 due to holes
-- https://github.com/agda/agda/issues/964

-- Easy but tedious
⟦_⟧₂ : {X Y : U} {p q : X ⟷ Y} → p ⇔ q → ⟦ p ⟧₁ == ⟦ q ⟧₁
⟦ c ⟧₂ = {!!}

⟦_⟧₂⁻¹ : {X Y : U} {p q : ⟦ X ⟧₀ == ⟦ Y ⟧₀} → p == q → ⟦ p ⟧₁⁻¹' ⇔ ⟦ q ⟧₁⁻¹'
⟦ refl _ ⟧₂⁻¹ = {!!}

-- TODO: Since #⟦_⟧₁⁻¹ is postulated, the type of `r` and `...` are not the same
--⟦⟦_⟧₂⟧₂⁻¹ : {X Y : U} {p q : X ⟷ Y} (r : p ⇔ q) → r ⇌ ⟦ ⟦ r ⟧₂ ⟧₂⁻¹
--⟦⟦ _ ⟧₂⟧₂⁻¹ = trunc

--cmpl₂ : {X Y : U} {p q : ⟦ X ⟧₀ == ⟦ Y ⟧₀} (r : p == q) → Σ (⟦ p ⟧₁⁻¹' ⇔ ⟦ q ⟧₁⁻¹') (λ c → ⟦ c ⟧₂ == r)
--cmpl₂ p = {!!}

⟦⟦_⟧₂⁻¹⟧₂ : {X Y : U} {p q : ⟦ X ⟧₀ == ⟦ Y ⟧₀} {r : p == q} → r == {!!}
⟦⟦_⟧₂⁻¹⟧₂ = {!!}
