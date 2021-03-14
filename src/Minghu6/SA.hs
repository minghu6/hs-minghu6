module Minghu6.SA
    (   someFunc,
        nativeSuffix,
        sortSuffixNative
    ) where

import Data.List
import Data.Maybe

_nativeSuffix [] _ = []
_nativeSuffix [x] acc = acc
_nativeSuffix (x:xs) acc = _nativeSuffix xs (xs:acc)

-- nativeSuffix "abc" ["abc", "bc", "c"]
nativeSuffix s = reverse (_nativeSuffix s [s])

sortSuffixNative s = (\ss -> [i | x <- sort ss, let i = fromJust $ elemIndex x ss]) $ nativeSuffix s

someFunc :: IO ()
someFunc = putStrLn $ show $ sortSuffixNative "def"
