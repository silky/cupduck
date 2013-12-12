{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Snap.Core
import           Snap.Http.Server
import           Network.HTTP.Conduit
import qualified Data.ByteString      as B
import qualified Data.ByteString.Lazy as L
import           Control.Monad.IO.Class (liftIO)

main :: IO ()
main = quickHttpServe site

site :: Snap ()
site =
    ifTop homeHandler


homeHandler :: Snap ()
homeHandler = do
    let url = "https://dl.dropboxusercontent.com/u/28596024/taskwarrior.txt" 
    raw <- liftIO $ simpleHttp url
    let stuff = B.concat $ L.toChunks raw
    writeBS "<html>"
    writeBS "<head><title>what is noon doing</title></head>"
    writeBS "<h2>what is noon doing?</h2>"
    writeBS "<pre>"
    writeBS stuff 
    writeBS "</pre>"
    writeBS "<small><a href='http://github.com/silky/cupduck'>source</a></small>"
    writeBS "</html>"
