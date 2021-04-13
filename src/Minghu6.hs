module Minghu6 (
    module Minghu6.SA
) where

import Minghu6.SA

-- | lift constructor of list elem
-- compared with sequenceA_ of Data.Foldable
-- >>> seqA [Just 3, Just 2, Just 1]
-- Just [3,2,1]


seqA :: Applicative f => [f a] -> f [a]
-- 冗余版
-- seqA [] = pure []
-- seqA (x:xs) = (:) <$> x <*> seqA xs

-- 化简版真不是人看的
seqA = foldr (\ x -> (<*>) ((:) <$> x)) (pure [])
