module Nonbili.ChildProcess
  ( exec
  ) where

import Prelude

import Control.Promise as Promise
import Effect (Effect)
import Effect.Aff (Aff)

type ExecResult =
  { stdout :: String
  , stderr :: String
  }

foreign import exec_ :: String -> Effect (Promise.Promise ExecResult)
exec :: String -> Aff ExecResult
exec = Promise.toAffE <<< exec_
