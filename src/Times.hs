module Times where
import Bool

class Times a where (*) :: a -> a -> a
assoc :: (Eq a, Times a) => a -> a -> a -> Bool
assoc a b c = (a*b)*c == a*(b*c)

class Times a => One a where one :: a
timesOne :: (Eq a, One a) => a -> Bool
timesOne a = (a * one) == a && (one * a) == a

class One a => Recip a where recip :: a -> a
recipRecip :: (Recip a,Eq a) => a -> Bool
recipRecip a = recip (recip a) == a
distrib :: (Eq a, Recip a) => a -> a -> Bool
distrib a b = recip (a * b) == recip a * recip b
recipOne :: (Recip a, Eq a) => a -> Bool
recipOne a = a * recip a == one && recip a * a == one
