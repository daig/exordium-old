module Traverse0 where
import Map
import FoldMap0 as X
import Pure as X
import Traverse as X
import Sum
import K

class (Traverse t,FoldMap0 t) => Traverse0 t where
  traverse0 :: Pure f => (a -> f b) -> t a -> f (t b)
  traverse0 f t = sequence0 (map f t)
  sequence0 :: Pure f => t (f a) -> f (t a)
  sequence0 = traverse0 (\x -> x)

traverse0_foldMap0 :: (Traverse0 t, Zero m) => (a -> m) -> t a -> m
traverse0_foldMap0 f t = case traverse0 (\x -> K (f x)) t of {K m -> m}

instance Traverse0 ((,) x) where traverse0 f (x,a) = (x,) `map` f a
instance Traverse0 (E x) where
  traverse0 afb = \case
    L x -> pure (L x)
    R a -> map R (afb a)
instance Traverse (E x) where traverse = traverse0
instance FoldMap0 (E x)
instance FoldMap (E x)

