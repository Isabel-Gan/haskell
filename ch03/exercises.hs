-- exercise 1.1
data List a 
    = Cons a (List a)
    | Nil
    deriving (Show)

toList :: List a -> [a]
toList (Cons x xs) = x : (toList xs)
toList Nil = []

-- exercise 1.2
data Maybee a
    = Bee a
    | NoBee

data Tree a = Tree a (Maybee (Tree a)) (Maybee (Tree a))