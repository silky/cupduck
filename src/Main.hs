{-# LANGUAGE OverloadedStrings #-}
module Main where

-- import           Control.Applicative
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
    -- <|>
    -- route [ ("foo", writeBS "bar")
    --       , ("echo/:echoparam", echoHandler)
    --       ]


homeHandler :: Snap ()
homeHandler = do
    -- Bytestrings 
    --  https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/bytestring-bits-and-pieces
    let url = "https://dl.dropboxusercontent.com/u/28596024/taskwarrior.txt" 
    raw <- liftIO $ simpleHttp url
    let project = B.concat $ L.toChunks raw
    writeBS "<title>what is noon doing</title>"
    writeBS project 


-- echoHandler :: Snap ()
-- echoHandler = do
--     -- liftIO $ simpleHttp "http://www.example.com/foo.txt" >>= L.writeFile "foo.txt"
--     param <- getParam "echoparam"
--     maybe (writeBS "must specify echo/param in URL")
--           writeBS param
