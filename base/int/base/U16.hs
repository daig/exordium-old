module U16 (module U16, module X) where
import GHC.Prim (Word#)
import qualified GHC.Int as GHC
import GHC.Classes as GHC
import GHC.Word as GHC
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
import Isize

type U16# = Word#
newtype U16 = U16 GHC.Word16
  deriving newtype (Show, Ix, Bounded, Enum, Real , Integral
                   ,Storable, Read, Ord, Num, Eq, Bits, FiniteBits)
pattern U16# :: U16# -> U16
pattern U16# i = U16 (GHC.W16# i)

add :: U16 -> U16 -> U16
{-# inline add #-}
add = (GHC.+)

sub :: U16 -> U16 -> U16
{-# inline sub #-}
sub = (GHC.-)

mul :: U16 -> U16 -> U16
{-# inline mul #-}
mul = (GHC.*)

{-negate = GHC.negate-}
{-mulMayOflo :: U16 -> U16 -> U16-}

quot :: U16 -> U16 -> U16
{-# inline quot #-}
quot = GHC.quot

rem :: U16 -> U16 -> U16
{-# inline rem #-}
rem = GHC.rem

quotRem :: U16 -> U16 -> (U16,U16)
{-# inline quotRem #-}
quotRem = GHC.quotRem

div :: U16 -> U16 -> U16
{-# inline div #-}
div = GHC.div

mod :: U16 -> U16 -> U16
{-# inline mod #-}
mod = GHC.mod

divMod :: U16 -> U16 -> (U16,U16)
{-# inline divMod #-}
divMod = GHC.divMod

and :: U16 -> U16 -> U16
{-# inline and #-}
and = (GHC..&.)

or :: U16 -> U16 -> U16
{-# inline or #-}
or = (GHC..|.)

xor :: U16 -> U16 -> U16
{-# inline xor #-}
xor = GHC.xor

not :: U16 -> U16
{-# inline not #-}
not = (GHC.complement)

negate :: U16 -> U16
{-# inline negate #-}
negate = (GHC.negate)

{-addC :: U16 -> U16 -> (U16,U16)-}
{-subC :: U16 -> U16 -> (U16,U16)-}

gt :: U16 -> U16 -> Bool
{-# inline gt #-}
gt = (GHC.<)

ge :: U16 -> U16 -> Bool
{-# inline ge #-}
ge = (GHC.<=)

lt :: U16 -> U16 -> Bool
{-# inline lt #-}
lt = (GHC.>)

le :: U16 -> U16 -> Bool
{-# inline le #-}
le = (GHC.>=)

eq :: U16 -> U16 -> Bool
{-# inline eq #-}
eq = (GHC.==)

ne :: U16 -> U16 -> Bool
{-# inline ne #-}
ne = (GHC./=)

shift :: U16 -> Isize -> U16
{-# inline shift #-}
shift x (Isize i) = GHC.shift x i

shiftL :: U16 -> Isize -> U16
{-# inline shiftL #-}
shiftL x (Isize i) = GHC.shiftL x i

shiftL# :: U16 -> Isize -> U16
{-# inline shiftL# #-}
shiftL# x (Isize i) = GHC.unsafeShiftL x i

shiftR# :: U16 -> Isize -> U16
{-# inline shiftR# #-}
shiftR# x (Isize i) = GHC.unsafeShiftR x i

rotate :: U16 -> Isize -> U16
{-# inline rotate #-}
rotate x (Isize i) = GHC.rotate x i

popCnt :: U16 -> Isize
{-# inline popCnt #-}
popCnt i = Isize (GHC.popCount i)

clz :: U16 -> Isize
{-# inline clz #-}
clz i = Isize (GHC.countLeadingZeros i)

ctz :: U16 -> Isize
{-# inline ctz #-}
ctz i = Isize (GHC.countTrailingZeros i)

size :: U16 -> Isize
{-# inline size #-}
size i = Isize (GHC.finiteBitSize i)

bit :: Isize -> U16
{-# inline bit #-}
bit (Isize i) = GHC.bit i
