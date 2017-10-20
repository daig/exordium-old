{-# language MagicHash #-}
module Dimap (Dimap(..), module X) where
import Sum
import ComapL as X
import MapR as X

class (ComapL p, MapR p) => Dimap p where
  {-# minimal dimap | premap,postmap #-}
  dimap :: (a -> x) -> (y -> b) -> p x y -> p a b
  dimap f g h = postmap g (premap f h)
  premap :: (a -> x) -> p x b -> p a b
  premap f = dimap f (\x -> x)
  postmap :: (y -> b) -> p a y -> p a b
  postmap = dimap (\x -> x)

instance Dimap (->) where dimap f g h a = g (h (f a))

