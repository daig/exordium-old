module Num.Zero' (module Num.Zero', module X) where
import Num.Zero as X
import Bool as X
import GHC.Integer
import Int
import Word
import Eq
import qualified Prelude as P


class Zero a => Zero' a where
  zero' :: a -> Bool
  default zero' :: Eq a => a -> Bool
  zero' = (zero ==)

pattern Zero :: Zero' a => a
pattern Zero <- (zero' -> T) where Zero = zero


instance Zero' Natural
instance Zero' Bool
instance Zero' Int
instance Zero' Integer
instance Zero' Word