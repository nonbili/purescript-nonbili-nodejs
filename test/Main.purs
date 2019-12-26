module Test.Main where

import Prelude

import Data.Either (isLeft, isRight)
import Effect (Effect)
import Effect.Aff as Aff
import Effect.Class.Console (logShow)
import Nonbili.ChildProcess (exec)

main :: Effect Unit
main = do
  Aff.launchAff_ do
    Aff.attempt (exec "ls -l") >>= \res ->
      logShow $ isRight res
    Aff.attempt (exec "ls /root") >>= \res ->
      logShow $ isLeft res
