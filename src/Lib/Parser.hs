{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE OverloadedStrings #-}
module Lib.Parser
    ( parseAST
    , AST(..)
    ) where

import Text.Parsec

data AST = Cons AST AST
         | Nil
         | Atom String
         deriving (Show, Eq)

parseAST :: String -> Either ParseError AST
parseAST = parse ast ""

ast :: Stream s m Char => ParsecT s u m AST
ast = try cons <|> try nil <|> try atom

cons :: Stream s m Char => ParsecT s u m AST
cons = do
  _ <- char '('
  car <- ast
  spaces
  cdr <- ast
  _ <- char ')'
  return $ Cons car cdr

nil :: Stream s m Char => ParsecT s u m AST
nil = string "nil" >> return Nil

atom :: Stream s m Char => ParsecT s u m AST
atom = many (letter <|> digit) >>= return . Atom
