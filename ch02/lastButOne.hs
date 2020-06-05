-- lastButOne :: [a] -> a
-- lastButOne [x] = x
lastButOne [x, y] = x
lastButOne (x : (y : ys)) = lastButOne (y : ys)