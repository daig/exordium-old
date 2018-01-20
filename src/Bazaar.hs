module Bazaar (module Bazaar, module X) where
import Type.Bazaar as X

-- TODO: clean up instances??
{-instance Map (Bazaar Map a b) where map f (Bazaar t) = Bazaar (\afb -> f $@ t afb)-}
{-instance MapIso (Bazaar Map a b) where mapIso = map_mapIso-}
{-instance Dimap (Bazaar Map a) where dimap f g (Bazaar m) = Bazaar (\k -> g $@ m (\x -> f $@ k x))-}
{-instance Map (Bazaar Pure a b) where map f (Bazaar t) = Bazaar (\afb -> f $@ t afb)-}
{-instance MapIso (Bazaar Pure a b) where mapIso = map_mapIso-}
{-instance Pure (Bazaar Pure a b) where pure a = Bazaar (\_ -> pure a)-}
{-instance Dimap (Bazaar Pure a) where dimap f g (Bazaar m) = Bazaar (\k -> g $@ m (\x -> f $@ k x))-}
{-instance Map (Bazaar Apply a b) where map f (Bazaar t) = Bazaar (\afb -> f $@ t afb)-}
{-instance MapIso (Bazaar Apply a b) where mapIso = map_mapIso-}
{-instance Apply (Bazaar Apply a b) where (Bazaar mf) |$| (Bazaar ma) = Bazaar (\k -> mf k |$| ma k)-}
{-instance Dimap (Bazaar Apply a) where dimap f g (Bazaar m) = Bazaar (\k -> g $@ m (\x -> f  $@ k x))-}
{-instance Map (Bazaar Applicative a b) where map f (Bazaar t) = Bazaar (\afb -> f $@ t afb)-}
{-instance MapIso (Bazaar Applicative a b) where mapIso = map_mapIso-}
{-instance Pure (Bazaar Applicative a b) where pure a = Bazaar (\_ -> pure a)-}
{-instance Apply (Bazaar Applicative a b) where (Bazaar mf) |$| (Bazaar ma) = Bazaar (\k -> mf k |$| ma k)-}
{-instance Applicative (Bazaar Applicative a b)-}
{-instance Dimap (Bazaar Applicative a) where dimap f g (Bazaar m) = Bazaar (\k -> g $@ m (\x -> f $@ k x))-}
sell :: forall c a b. a -> Bazaar c a b b
sell a = Bazaar (\f -> f a)

