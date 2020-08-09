import Data.List

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

-- data Tree a = Tree a (Maybee (Tree a)) (Maybee (Tree a))

-- exercise 2.1
getLen :: [a] -> Int
getLen [] = 0
getLen (x : xs) = 1 + (getLen xs)

-- exercise 2.3
calcMean :: Fractional a => a -> Int -> a
calcMean x y = x / (fromIntegral y)

getMeanHelp :: Fractional a => [a] -> a -> Int -> a
getMeanHelp [] sumAcc lenAcc = calcMean sumAcc lenAcc
getMeanHelp (x : xs) sumAcc lenAcc = getMeanHelp xs (x + sumAcc) (1 + lenAcc)

getMean :: Fractional a => [a] -> a 
getMean l = getMeanHelp l 0 0 

-- exercise 2.4
toPalindrome :: [a] -> [a]
toPalindrome l = l ++ (reverse l)

-- exercise 2.5
isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome [x, y] = (x == y)
isPalindrome (x : xs) = 
    (x == lastElem) && isPalindrome middle
    where
        lastElem = last xs 
        middle = init xs

-- exercise 2.6
sortByLen :: [[a]] -> [[a]]
sortByLen l = 
    sortBy cmp l 
    where
        cmp :: [a] -> [a] -> Ordering
        cmp a b = compare (length a) (length b)

-- exercise 2.7
intersperseMe :: a -> [[a]] -> [a]
intersperseMe sep [] = []
intersperseMe sep [x] = x
intersperseMe sep (x : xs) = x ++ [sep] ++ (intersperseMe sep xs)

-- exercise 2.8
data Tree a 
    = Node a (Tree a) (Tree a)
    | Empty
    deriving (Show)

getBigger :: Int -> Int -> Int
getBigger x y
    | x <= y     = y
    | otherwise  = x

treeHeight :: Tree a -> Int
treeHeight Empty = 0
treeHeight (Node _ left right) = 1 + (getBigger (treeHeight left) (treeHeight right))

-- exercise 2.9
data Direction = Left | Right | Straight
type Point = (Int, Int)

-- exercise 2.10
getDirection :: Point -> Point -> Point -> Direction
getDirection _ _ _ = Straight

-- exercise 2.11
getDirections :: [Point] -> [Direction]
getDirections (x : y : z : xs) = (getDirection x y z) : (getDirections (y : z : xs))
getDirections _ = []

-- skipped exercise 2.12 bc im lazy
