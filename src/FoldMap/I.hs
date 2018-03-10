module FoldMap.I (module FoldMap.I, module X) where
import PlusZero as X
import List
import Prelude (Enum(..))

class IFoldMap i t where
  {-# minimal ifoldMap | ifoldr #-}
  ifoldMap :: PlusZero m => (i -> a -> m) -> t a -> m
  ifoldMap f t = ifoldr (\i a m -> f i a `plus` m) zero t -- TODO: check the order
  ifoldr :: (i -> a -> b -> b) -> b -> t a -> b
  ifoldr c z t = ifoldMap c t z
  {-foldl :: (b -> a -> b) -> b -> t a -> b-}


class IFoldMap i t => IFoldMap0 i t where
  ifoldMap0 :: Zero m => (i -> a -> m) -> t a -> m

class IFoldMap i t => IFoldMap1 i t where
  ifoldMap1 :: Plus s => (i -> a -> s) -> t a -> s


instance Zero i => IFoldMap0 i ((,) x) where ifoldMap0 f (_,x) = f zero x
instance Zero i => IFoldMap1 i ((,) x) where ifoldMap1 f (_,y) = f zero y
instance Zero i => IFoldMap i ((,) x) where ifoldMap f (_,a) = f zero a
instance Enum i => IFoldMap i [] where
  ifoldMap = go' where
    go' f = go (toEnum 0) where
      go i = \case
	[] -> zero
	a:as -> f i a `plus` go (succ i) as