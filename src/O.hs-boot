module O where
newtype O f g a = O (f (g a))
