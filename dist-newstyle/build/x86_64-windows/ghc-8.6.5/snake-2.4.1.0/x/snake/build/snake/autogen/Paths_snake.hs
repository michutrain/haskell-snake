{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_snake (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [2,4,1,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\ch_mi\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\ch_mi\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5\\snake-2.4.1.0-inplace-snake"
dynlibdir  = "C:\\Users\\ch_mi\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5"
datadir    = "C:\\Users\\ch_mi\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5\\snake-2.4.1.0"
libexecdir = "C:\\Users\\ch_mi\\AppData\\Roaming\\cabal\\snake-2.4.1.0-inplace-snake\\x86_64-windows-ghc-8.6.5\\snake-2.4.1.0"
sysconfdir = "C:\\Users\\ch_mi\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "snake_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "snake_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "snake_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "snake_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "snake_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "snake_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
