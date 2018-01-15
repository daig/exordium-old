module Isos.AnIso (AnIso(..), module X) where
import Map as X
import Dimap as X

data AnIso a b s t = AnIso (s -> a) (b -> t)

instance Dimap (AnIso a b) where
  dimap f g (AnIso sa bt) = AnIso (\x -> sa (f x)) (\b -> g (bt b))
  premap f (AnIso sa bt) = AnIso (\x -> sa (f x)) bt
  postmap g (AnIso sa bt) = AnIso sa (\b -> g (bt b))
instance Map (AnIso a b s) where map = postmap