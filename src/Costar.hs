module Costar (Costar(..),module X) where
import Comonad.Class as X
import Category.Class as X
import Closed.Class as X
import Dimap

newtype Costar f a b = Costar {runCostar :: f a -> b}

instance Map f => Closed (Costar f) where
  closed (Costar fab) = Costar (\fxa x -> fab (map (\f -> f x) fxa))
instance Map f => Dimap (Costar f) where
  dimap f g (Costar fab) = Costar (dimap (map f) g fab)
instance Map f => ComapL (Costar f) where colmap = dimap_colmap
instance MapR (Costar f) where rmap g (Costar fab) = Costar (\fa -> g (fab fa))
instance MapIso (Costar f a) where mapIso = map_mapIso
instance Map (Costar f a) where map = rmap_map
instance Duplicate w => Compose (Costar w) where Costar f > Costar g = Costar (g < extend f)
instance Comonad w => Category (Costar w) where id = Costar fold_
