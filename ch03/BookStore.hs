-- datatype declarations
data BookInfo = Book Int String [String]
                deriving (Show)
data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

-- type synonyms
type CustomerID = Int
type ReviewBody = String

-- type can have the same name as its value constructor
data BookReview 
    = BookReview BookInfo CustomerID String
data BetterReview 
    = BetterReview BookInfo CustomerID ReviewBody

type BookRecord = (BookInfo, BookReview)

-- declaring values
myInfo = Book 123 "Hello" ["Me", "Others"]

-- algebraic datatypes have multiple constructors
type CardHolder = String
type CardNumber = String
type Address = [String]

data BillingInfo
    = CreditCard CardNumber CardHolder Address
    | CashOnDelivery
    | Invoice CustomerID
    deriving (Show)

{- | If you try to put a constructor by itself in the interpreter, you'll get 
an error since Haskell can't print functions -}

-- pattern matching
bookID (Book id _ _) = id
bookTitle (Book _ title _) = title
bookAuthors (Book _ _ authors) = authors

-- define datatype and its accessors at the same time

-- the name on the left is the name of the accessor, the right is the type of the field
data Customer = Customer 
    { customerID    :: CustomerID
    , customerName  :: String
    , customerAddress :: Address
    } deriving (Show)

{- | you can still use the normal syntax to create a value of the type, but record 
syntax adds a more verbose notation that can make code more readable -}
customer = Customer
    { customerID = 123
    , customerAddress = ["hello", "there"]
    , customerName = "mark!!!"
    }

-- declaring values this way also changes the way it's printed
