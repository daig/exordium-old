{-# language UndecidableInstances #-}
module Applicative (Applicative, module X) where
import Pure as X
import Apply as X
import Num.Mul1 as X
import Num.Add0 as X
import {-# source #-} K
import {-# source #-} I

class (Pure f, Apply f) => Applicative f

instance Applicative []
instance Applicative ((->) x)

instance Add0 a => Applicative (K a)

instance Applicative I
