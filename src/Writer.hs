module Writer (module Writer, module X) where
import Monad as X
import Zero as X

class Monad m => Writer m where
  {-# minimal (writer | tell), pass, listen #-}
  type Writ m :: *
  writer :: (Writ m,a) -> m a
  writer ~(w,a) = a !@ tell w
  pass :: m (a, Writ m -> Writ m) -> m a
  tell :: Writ m -> m ()
  tell w = writer (w,())
  listen :: m a -> m (a,Writ m)