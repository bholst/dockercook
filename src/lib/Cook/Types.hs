{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Cook.Types where

import Data.Hashable
import Data.SafeCopy
import qualified Data.ByteString as BS
import qualified Data.Text as T

data CookConfig
   = CookConfig
   { cc_stateDir :: FilePath
   , cc_dataDir :: FilePath
   , cc_buildFileDir :: FilePath
   , cc_boringFile :: Maybe FilePath
   , cc_buildEntryPoints :: [String]
   } deriving (Show, Eq)

newtype StreamHook =
    StreamHook { unStreamHook :: BS.ByteString -> IO () }

newtype SHA1 =
    SHA1 { unSha1 :: BS.ByteString }
         deriving (Show, Eq)

newtype DockerImage =
    DockerImage { unDockerImage :: T.Text }
    deriving (Show, Eq, Hashable, SafeCopy)
