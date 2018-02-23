{-# language MagicHash #-}
module Flip where
import Coerce
import {-# source #-} K
import Dimap.Class

newtype Flipped f b a = Flip (f a b) 

instance Dimap (Flipped K) where dimap _ g (Flip (K b)) = Flip (K (g b))
instance MapR (Flipped K) where rmap g (Flip (K b)) = Flip (K (g b))
instance ComapL (Flipped K) where colmap _ (Flip (K b)) = Flip (K b)

type family Flip (f :: k -> k' -> *) :: k' -> k -> * where
  Flip (Flipped f) = f
  Flip f = Flipped f

flip# :: p a b -> Flip p b a
flip# = coerce#

unflip# :: Flip p b a -> p a b
unflip# = coerce#

{-instance Prism (Flip K) where-}
  {-left (Flip (K b)) = Flip (K (L b))-}
  {-right (Flip (K b)) = Flip (K (R b))-}
