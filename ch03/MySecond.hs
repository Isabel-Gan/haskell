-- approach that raises an error
mySecond :: [a] -> a
mySecond (x : y : xs) = y
mySecond _ = error "list too short"

-- a more contrlled approach
safeSecond :: [a] -> Maybe a 
safeSecond (x : y : ys) = Just y 
safeSecond _ = Nothing