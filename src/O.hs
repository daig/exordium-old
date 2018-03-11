{-# language MagicHash #-}
module O (module O, module X) where
import I as X
import Applicative as X

newtype O f g a = O {unO :: f (g a)}

instance (Pure f,Pure g) => Pure (O f g) where pure a = O (pure (pure a))
instance (Apply f,Apply g) => Apply (O f g) where O fgf `ap`O fga = O (map ap fgf `ap` fga)
instance (Applicative f, Applicative g) => Applicative (O f g)
instance (Map f,Map g) => Map (O f g) where
  map f (O fg) = O (map (map f) fg)
  map# f (O fg) = O ((map## f) fg)
  map## f hofg = map# O (unO (map## f (O (map# unO hofg)))) -- Yikes
instance (MapIso f,MapIso g) => MapIso (O f g) where
  -- TODO: make fast like #
  mapIso f g (O fg) = O (mapIso (mapIso g f) (mapIso f g) fg)
