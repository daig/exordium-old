module MapIso.Class where
import O.Type
import K.Type
import These.Type
import Where
import List
import K
import E
import Tuple
import Maybe
import I

class MapIso f where mapIso :: (b -> a) -> (a -> b) -> f a -> f b

instance MapIso ((->) x) where mapIso _ f p = \a -> f (p a)
instance MapIso (K a) where mapIso _ _ = k'absurd
instance MapIso [] where mapIso _ = list'map
instance MapIso (Where a) where mapIso _ = where'map
instance (MapIso f,MapIso g) => MapIso (O f g) where
  mapIso f g (O fg) = O (mapIso (mapIso g f) (mapIso f g) fg)
instance MapIso (E a) where mapIso _ = e'map
instance MapIso ((,) x) where mapIso _ = tuple'map
instance MapIso Maybe where mapIso _ = maybe'map
instance MapIso I where mapIso _ = i'map