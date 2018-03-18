{-# language UndecidableSuperClasses #-}
module Functor.Adjoint.L (module X) where
import Functor.Monad as X
import Functor.Comonad as X hiding (mapDefault)
import Type.O as X
import Arrow.Promap as X
{-import Star as X-}
import Optic.Grate as X (FZip(..))
import Functor.Indexed as X hiding (mapDefault)
import Cast
import Optic.Review
import Optic.View
import Arrow.Promap

{-class (Monad (f `O` RightAdjunct f)-}
      {-,Comonad (RightAdjunct f `O` f)-}
      {-,RightAdjoint (RightAdjunct f)-}
      {-,LeftAdjunct (RightAdjunct f) ~ f-}
      {-,Comonad f) -- TODO: should this actually be Traverse_ ? Why not?-}
   {-=> LeftAdjoint f where-}
  {-type RightAdjunct f = (g :: * -> *) | g -> f-}
  {-leftAdjunct :: (f a -> b) -> a -> RightAdjunct f b-}

{-class (Monad (LeftAdjunct g `O` g)-}
      {-,Comonad (g `O` LeftAdjunct g)-}
      {-,LeftAdjoint (LeftAdjunct g)-}
      {-,RightAdjunct (LeftAdjunct g) ~ g-}
      {-,Indexed g, Ix g ~ LeftAdjunct g ()) => RightAdjoint (g :: * -> *) where-}
  {-type LeftAdjunct g = (f :: * -> *) | f -> g-}
  {-rightAdjunct :: (a -> g b) -> LeftAdjunct g a -> b-}

{-type f -| g = (LeftAdjoint f, RightAdjunct f ~ g, RightAdjoint g, LeftAdjunct g ~ f)-}

{-instance LeftAdjoint ((,) x) where-}
  {-type RightAdjunct ((,) x) = (->) x-}
  {-{-leftAdjunct xab a = -}-}
{-instance RightAdjoint ((->) x) where-}
  {-type LeftAdjunct ((->) x) = (,) x-}

{-instance Indexed ((->) x) where-}
  {-type Ix ((->) x) = x-}
