import System.IO.Unsafe


-- METODOS DE RECEBER STRING

-- @return a String received from the input
stringInput :: String 
stringInput = inputStr changeIOStringToString

-- @return a String, that is a result of conversion of IO String to String
-- @params: ioToStringFunction 
inputStr :: (IO(String) -> String) -> String
inputStr ioToStringFunction = (ioToStringFunction getIOString)

-- @returns a String result of conversion of IO String
-- @params: A Io String
changeIOStringToString:: IO(String) -> String
changeIOStringToString ioString = unsafeDupablePerformIO ioString

-- @return: get a input from the user and returns a IO String
getIOString :: IO(String)
getIOString = do
    a <- getLine
    return a
