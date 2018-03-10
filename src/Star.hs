module Star where
import Map.Pro as X
import Closed as X

newtype Star f a b = Star {runStar :: a -> f b}

{-instance Bind m => Compose (Star m) where Star f > Star g = Star (g <=< f)-}
{-instance Monad m => Category (Star m) where id = Star pure-}
instance Distribute f => Closed (Star f) where
  closed (Star afb) = Star (\xa -> distribute (\x -> afb (xa x)))
instance Map f => Promap (Star f) where promap f g (Star s) = Star (promap f (map g) s)
instance Map f => Map (Star f a) where map f (Star s) = Star (\a -> map f (s a))
instance Map f => MapR (Star f) where rmap yb (Star afy) = Star (\a -> yb `map` afy a)
instance ComapL (Star f) where colmap ax (Star xfb) = Star (\a -> xfb (ax a))
{--- TODO: move to PromapIso class-}
instance MapIso f => MapIso (Star f a) where mapIso f g (Star p) = Star (\a -> mapIso f g (p a))

collectOf :: (Star f a b -> Star f s t) -> (a -> f b) -> s -> f t
collectOf g f = case g (Star f) of Star f' -> f'