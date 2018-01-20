module Class.TMap (module Class.TMap, module X) where
import NatTrans as X

--  mapt f > mapt g = mapt (f > g)
class TMap t where
  {-# minimal tmap #-}
  tmap :: (f --> g) -> (t f --> t g)
  constTmap :: (forall x. g x) -> t f a -> t g a
  constTmap gx = tmap (\_ -> gx)
