{-# language MagicHash #-}
module Comap where
import K.Type
import Isos.Re
import Coerce
import Class.Map

class MapIso f => Comap f where comap :: (b -> a) -> f a -> f b

comap_mapIso :: Comap f => (b -> a) -> (a -> b) -> f a -> f b
comap_mapIso f _ = comap f
