module Utils.RMap (module Utils.RMap, module X) where
import Class.RMap as X

rmap_map :: RMap p => (x -> b) -> p a x -> p a b
rmap_map = rmap
