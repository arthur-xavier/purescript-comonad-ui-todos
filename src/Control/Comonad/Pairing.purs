module Control.Comonad.Pairing where

import Prelude

import Control.Comonad (class Comonad, duplicate)
import Data.Functor.Pairing (class Pairing, pair, pairFlipped)

select :: forall m w a b. Comonad w => Pairing m w => w a -> m b -> b
select = pairFlipped (const id)

move :: forall m w a. Comonad w => Pairing m w => m Unit -> w a -> w a
move m = pair (const id) m <<< duplicate
