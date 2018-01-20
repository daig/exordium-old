module Class.RMap (module Class.RMap, module X) where
import Class.Map as X
import Utils.Tuple
import Utils.K
import Utils.These
import Utils.Where

class RMap p where
  rmap :: (x -> b) -> p a x -> p a b
  {-default rmap :: forall a x b. Map (p a) => (x -> b) -> p a x -> p a b-}
  {-rmap = map-}


instance RMap (->) where rmap g p = \a -> g (p a)
instance RMap (,) where rmap = tuple'map
instance RMap K where rmap = k'map
instance RMap These where rmap = these'map
instance RMap Where where rmap = where'map
