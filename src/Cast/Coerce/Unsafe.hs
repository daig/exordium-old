{-# language MagicHash #-}
module Cast.Coerce.Unsafe where
import Unsafe.Coerce

coerceF# :: forall g f a. f a -> g a
coerceF# = unsafeCoerce

wrap# :: forall f a. a -> f a
wrap# = unsafeCoerce

unwrap# :: forall a f. f a -> a
unwrap# = unsafeCoerce

coerce# :: forall b a. a -> b
coerce# = unsafeCoerce

mapCoerce# :: forall b f a. f a -> f b
mapCoerce# = unsafeCoerce
