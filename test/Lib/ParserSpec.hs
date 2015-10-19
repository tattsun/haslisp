module Lib.ParserSpec where

import Test.Hspec
import Lib.Parser

spec =
    describe "Lib.Parser" $ do
      describe "parseAST" $ do
        it "parse simple cons" $
           parseAST "(test foobar)" `shouldBe` Right (Cons (Atom "test") (Atom "foobar"))
        it "parse intricate cons" $
           parseAST "((aaa bbb) (xxx (yyy nil)))" `shouldBe`
                    Right (Cons
                           (Cons (Atom "aaa") (Atom "bbb"))
                           (Cons (Atom "xxx") (Cons (Atom "yyy") Nil))
                          )
