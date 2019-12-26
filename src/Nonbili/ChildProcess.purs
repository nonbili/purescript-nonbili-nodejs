module Nonbili.ChildProcess
  ( ExecResult
  , exec
  ) where

import Prelude

import Control.Promise as Promise
import Effect (Effect)
import Effect.Aff (Aff)

-- | `error` field is not included, use `Aff.attempt` to catch error.
type ExecResult =
  { stdout :: String
  , stderr :: String
  }

foreign import exec_ :: String -> Effect (Promise.Promise ExecResult)

-- | A simple `exec` that runs in Aff.
-- |
-- | e.g. `exec "ls -l"`.
exec :: String -> Aff ExecResult
exec = Promise.toAffE <<< exec_
