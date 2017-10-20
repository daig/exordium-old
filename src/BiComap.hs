module BiComap
  (BiComap(..)
  ,module X) where
import ComapL as X
import ComapR as X

class (ComapL p, ComapR p) => BiComap p where
  {-# minimal bicomap | lcomap, rcomap #-}
  bicomap :: (a -> x) -> (b -> y) -> p x y -> p a b
  bicomap f g p = rcomap g (lcomap f p)
  lcomap :: (a -> x) -> p x b -> p a b
  lcomap f = bicomap f (\b -> b)
  rcomap :: (b -> y) -> p a y -> p a b
  rcomap = bicomap  (\a -> a)
