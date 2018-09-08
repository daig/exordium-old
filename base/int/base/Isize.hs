module Isize (module Isize, module X) where
import GHC.Prim (Int#)
import qualified GHC.Int as GHC
import GHC.Classes as GHC
import GHC.Num as GHC
import GHC.Real as GHC
import GHC.Enum
import Data.Ix
import Data.Bits as GHC
import GHC.Types as X (Bool)
import GHC.Show
import GHC.Read
import Data.Data
import Foreign.Storable

type Isize# = Int#
newtype Isize = Isize GHC.Int
  deriving newtype (Show, Ix, Bounded, Enum, Real , Integral
                   ,Storable, Read, Ord, Num, Eq, Bits, FiniteBits)
pattern I# :: Isize# -> Isize
pattern I# i = Isize (GHC.I# i)

add :: Isize -> Isize -> Isize
{-# inline add #-}
add = (GHC.+)

sub :: Isize -> Isize -> Isize
{-# inline sub #-}
sub = (GHC.-)

mul :: Isize -> Isize -> Isize
{-# inline mul #-}
mul = (GHC.*)

{-negate = GHC.negate-}
{-mulMayOflo :: Isize -> Isize -> Isize-}

quot :: Isize -> Isize -> Isize
{-# inline quot #-}
quot = GHC.quot

rem :: Isize -> Isize -> Isize
{-# inline rem #-}
rem = GHC.rem

quotRem :: Isize -> Isize -> (Isize,Isize)
{-# inline quotRem #-}
quotRem = GHC.quotRem

div :: Isize -> Isize -> Isize
{-# inline div #-}
div = GHC.div

mod :: Isize -> Isize -> Isize
{-# inline mod #-}
mod = GHC.mod

divMod :: Isize -> Isize -> (Isize,Isize)
{-# inline divMod #-}
divMod = GHC.divMod

and :: Isize -> Isize -> Isize
{-# inline and #-}
and = (GHC..&.)

or :: Isize -> Isize -> Isize
{-# inline or #-}
or = (GHC..|.)

xor :: Isize -> Isize -> Isize
{-# inline xor #-}
xor = GHC.xor

not :: Isize -> Isize
{-# inline not #-}
not = (GHC.complement)

negate :: Isize -> Isize
{-# inline negate #-}
negate = (GHC.negate)

{-addC :: Isize -> Isize -> (Isize,Isize)-}
{-subC :: Isize -> Isize -> (Isize,Isize)-}

gt :: Isize -> Isize -> Bool
{-# inline gt #-}
gt = (GHC.<)

ge :: Isize -> Isize -> Bool
{-# inline ge #-}
ge = (GHC.<=)

lt :: Isize -> Isize -> Bool
{-# inline lt #-}
lt = (GHC.>)

le :: Isize -> Isize -> Bool
{-# inline le #-}
le = (GHC.>=)

eq :: Isize -> Isize -> Bool
{-# inline eq #-}
eq = (GHC.==)

ne :: Isize -> Isize -> Bool
{-# inline ne #-}
ne = (GHC./=)

shift :: Isize -> Isize -> Isize
{-# inline shift #-}
shift x (Isize i) = GHC.shift x i

shiftL :: Isize -> Isize -> Isize
{-# inline shiftL #-}
shiftL x (Isize i) = GHC.shiftL x i

shiftL# :: Isize -> Isize -> Isize
{-# inline shiftL# #-}
shiftL# x (Isize i) = GHC.unsafeShiftL x i

shiftR# :: Isize -> Isize -> Isize
{-# inline shiftR# #-}
shiftR# x (Isize i) = GHC.unsafeShiftR x i

rotate :: Isize -> Isize -> Isize
{-# inline rotate #-}
rotate x (Isize i) = GHC.rotate x i

popCnt :: Isize -> Isize
{-# inline popCnt #-}
popCnt i = Isize (GHC.popCount i)

clz :: Isize -> Isize
{-# inline clz #-}
clz i = Isize (GHC.countLeadingZeros i)

ctz :: Isize -> Isize
{-# inline ctz #-}
ctz i = Isize (GHC.countTrailingZeros i)

size :: Isize -> Isize
{-# inline size #-}
size i = Isize (GHC.finiteBitSize i)

bit :: Isize -> Isize
{-# inline bit #-}
bit (Isize i) = GHC.bit i
