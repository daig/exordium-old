module Forget (Forget(..),_Forget,module X) where
import PlusZero as X
import Traversed as X
import Map as X
import Traversed as X
import Map.Co.Bi as X
import Map.Co as X
import Prism.Class as X
import K
import E.Utils
import Map.Di

newtype Forget r a b = Forget {runForget :: (a -> r)}
{-_Forget :: Dimap p => p (a -> r) (a' -> r') -> p (Forget r a b) (Forget r' a' b')-}
{-_Forget = dimap runForget Forget-}
_Forget :: Dimap p => p (Forget r a b) (Forget r' a' b') -> p (a -> r) (a' -> r')
_Forget = dimap Forget runForget
instance Traversed_ (Forget r) where
  first (Forget z) = Forget (\(a,_) -> z a)
  traversal_ l (Forget ar) = Forget (\s -> case (l (\a -> K (ar a))) s of {K r -> r})
instance Dimap (Forget r) where
  dimap f _ (Forget z) = Forget (colmap f z)
instance ComapL (Forget r) where colmap f (Forget z) = Forget (colmap f z)
instance MapR (Forget r) where rmap _ (Forget z) = Forget z
instance MapIso (Forget r a) where mapIso = map_mapIso
instance Map (Forget r a) where map = rmap_map
instance BiComap (Forget r) where
  bicomap f _ (Forget z) = Forget (colmap f z)
instance Comap (Forget r a) where comap = cormap
instance ComapR (Forget r) where cormap _ (Forget z) = Forget z

instance Zero r => Prism (Forget r) where
  left (Forget z) = Forget (e'bifoldMap z (\_ -> zero))

instance PlusZero r => Traversed (Forget r) where
  traversal l (Forget ar) = Forget (\s -> case (l (\a -> K (ar a))) s of {K r -> r})
instance Zero r => Traversed0 (Forget r) where
  traversal0 l (Forget ar) = Forget (\s -> case (l (\a -> K (ar a))) s of {K r -> r})
instance Plus r => Traversed1 (Forget r) where
  traversal1 l (Forget ar) = Forget (\s -> case (l (\a -> K (ar a))) s of {K r -> r})

instance Cochoice (Forget r) where
  unleft (Forget r) = Forget (\a -> r (L a))
  unright (Forget r) = Forget (\a -> r (R a))
