{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Lib.Context where

import Control.Applicative
import Control.Monad.Trans.State
import Control.Monad.State.Class

newtype HaslispT m a = HaslispT { unHaslispT :: StateT LispContext m a }
                     deriving (Monad, Applicative, Functor,
                               MonadState LispContext)

data LispContext = LispContext
