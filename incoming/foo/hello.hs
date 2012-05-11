{-# LANGUAGE OverloadedStrings #-}
import System.Environment
import qualified Data.ByteString.Lazy.Char8 as L8
import Network.Wai
import Network.Wai.Handler.Warp
import Network.HTTP.Types

main :: IO ()
main = do
    [msg] <- getArgs
    portS <- getEnv "PORT"
    let port = read portS
    run port $ const $ return $ responseLBS status200 [("content-type", "text/plain")] $ L8.pack msg