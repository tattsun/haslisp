{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Lib.Types where

import Control.Applicative
import Control.Monad.Trans.State
import Control.Monad.State.Class

data AST = Cons AST AST
         | Nil
         | Atom String
         deriving (Show, Eq)

newtype HaslispT m a = HaslispT { unHaslispT :: StateT LispContext m a }
                     deriving (Monad, Applicative, Functor,
                               MonadState LispContext)

data LispContext = LispContext
