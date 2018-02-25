{-# language UndecidableSuperClasses #-}
module Indexable.Class (module Indexable.Class, module X) where
import Traversed.Class
import Int
import Category.Class
import Mapped.Class as X
import Star.Type

class (
  {-Mapping p, Mapping (Unindexed p),-}
  Unindexed (Unindexed p) ~ Unindexed p, IndexedP i (Unindexed p)) => IndexedP i p where
  type Unindexed p :: * -> * -> *
  type Unindexed p = p
  indexP :: p a b -> i -> Unindexed p a b

at :: i -> IndexedTraversed i a a b b
at i = (`indexP` i)

instance IndexedP i (->) where indexP = \a _ -> a
instance IndexedP i (Star f) where indexP s _ = s

type IndexedTraversed i s a b t = forall p. (IndexedP i p, Traversed p, Traversed (Unindexed p))
                               => p a b -> Unindexed p s t

newtype IFun f i a b = IFun {runIFun :: i -> a -> f b}
instance (i ~ j) => IndexedP i (IFun f j) where
  type Unindexed (IFun f j) = Star f
  indexP (IFun iafb) i = Star (iafb i)
instance Map f => Dimap (IFun f i) where dimap f g (IFun iafb) = IFun (\i x -> g `map` iafb i (f x))
instance Map f => MapR (IFun f i) where rmap f (IFun iafb) = IFun (\i a -> f `map` iafb i a)
instance ComapL (IFun f i) where colmap f (IFun iafb) = IFun (\i x -> iafb i (f x))
instance Map f => Traversed_ (IFun f i) where traversal_ afbsft (IFun iafb) = IFun (\i s -> afbsft (iafb i) s)
instance Applicative f => Traversed (IFun f i) where traversal afbsft (IFun iafb) = IFun (\i s -> afbsft (iafb i) s)
instance Pure f => Traversed0 (IFun f i) where traversal0 afbsft (IFun iafb) = IFun (\i s -> afbsft (iafb i) s)
instance Apply f => Traversed1 (IFun f i) where traversal1 afbsft (IFun iafb) = IFun (\i s -> afbsft (iafb i) s)
instance Pure f => Prism (IFun f i) where
  prism pat constr (IFun iafb) = IFun (\i s -> case pat s of
     L t -> pure t
     R a -> constr `map` iafb i a)

newtype IndexingP p a b = IndexingP {runIndexingP :: Int -> (Int, p a b)}
instance (IndexedP Int p, Unindexed p ~ p) => IndexedP Int (IndexingP p) where
  type Unindexed (IndexingP p) = p
  indexP (IndexingP iip) i = case iip i of (_,p) -> p

itraversal :: forall (c :: (* -> *) -> Constraint) p a b s t
            . ((forall f. c f => (a -> f b) -> s -> f t) -> p a b -> p s t)
           -> ((forall f. c f => (a -> f b) -> s -> f t) -> IndexingP p a b -> IndexingP p s t)
itraversal t afbsft = liftingP (t afbsft)
liftingP :: (p a b -> p s t) -> IndexingP p a b -> IndexingP p s t
liftingP f (IndexingP iipab) = IndexingP (\(iipab -> (i,pab)) -> (i `plus` 1,f pab))
instance Dimap p => Dimap (IndexingP p) where dimap f g = liftingP (dimap f g)
instance ComapL p => ComapL (IndexingP p) where colmap f = liftingP (colmap f)
instance MapR p => MapR (IndexingP p) where rmap f = liftingP (rmap f)
instance Traversed_ p => Traversed_ (IndexingP p) where traversal_ = itraversal @Map traversal_
instance Prism p => Prism (IndexingP p) where prism pat constr = liftingP (prism pat constr)
instance Traversed1 p => Traversed1 (IndexingP p) where traversal1 = itraversal @Apply traversal1
instance Traversed0 p => Traversed0 (IndexingP p) where traversal0 = itraversal @Pure traversal0
instance Traversed p => Traversed (IndexingP p) where traversal = itraversal @Applicative traversal
{-instance Mapping p => Mapping (IndexedP p) where-}
  {-mapping abst (IndexedP i p) = IndexedP -}
indexing :: (IndexedP Int p, Unindexed p ~ p) => (IndexingP p a b -> IndexingP p s t) -> p a b -> p s t
indexing l ip = indexP (l (IndexingP (\(!i) -> (i `plus` 1,indexP ip i)))) (0::Int)

itraversal' :: Applicative f => ((i -> a -> f b) -> s -> f t) -> IFun f i a b -> Star f s t
itraversal' t (IFun iafb) = Star (\s -> t iafb s)
list'itraverse :: Applicative f => (Int -> a -> f b) -> [a] -> f [b]
list'itraverse f = go 0 where
  go i = \case
    [] -> pure []
    a:as -> (:) `map` f i a `ap` go (i `plus` 1) as


{-foo :: IndexedP Int p => p a b -> Uninedexed p [a] [b]-}
{-foo p = indexP i p-}
