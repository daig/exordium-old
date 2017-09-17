module Bimap where
import Bool

-- | Independently Map each on both sides
class Bimap p where
  {-# minimal bimap | lmap, rmap #-}
  bimap :: (x -> a) -> (y -> b) -> p x y -> p a b
  bimap f g p = rmap g (lmap f p)
  lmap :: (x -> a) -> p x b -> p a b
  lmap f = bimap f (\x -> x)
  rmap :: (y -> b) -> p a y -> p a b
  rmap = bimap (\x -> x)
bimapId :: (Bimap p, Eq (p a b)) => p a b -> Bool
bimapId p = bimap (\x -> x) (\y -> y) p == p
lrmapBimap :: (Eq (p a b), Bimap p) => (x -> a) -> (y -> b) -> p x y -> Bool
lrmapBimap f g p = lr == rl && lr == bimap f g p
  where
    lr = lmap f (rmap g p)
    rl = rmap g (lmap f p)
distrib :: (Bimap p, Eq (p a b)) => (a' -> a) -> (x -> a') -> (b' -> b) -> (y -> b') -> p x y -> Bool
distrib f g h i a =
  bimap (\x -> f (g x)) (\y -> h (i y)) a
  == bimap f h (bimap g i a)

class Bimap p => Swap p where swap :: p a b -> p b a
swapSwap :: (Eq (p a b),Swap p) => p a b -> Bool
swapSwap a = swap (swap a) == a
swapBimap :: (Swap p, Eq (p b a)) => (x -> a) -> (y -> b) -> p x y -> Bool
swapBimap f g p = swap (bimap f g p) == bimap g f (swap p)

instance Bimap (,) where
  bimap f g (x,y) = (f x, g y)
instance Swap (,) where swap (a,b) = (b,a)
