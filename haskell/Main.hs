{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE DeriveDataTypeable   #-}
{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE ScopedTypeVariables  #-}

module Main where

import           Control.Monad.Trans
import           Data.Aeson                           (ToJSON (..), object,
                                                       (.=))
import qualified Data.Aeson.Types                     as Aeson
import           Data.AesonBson                       (aesonifyValue)
import qualified Data.Bson                            as Bson
import           Database.MongoDB                     (Action, access, close,
                                                       connect, findOne, host,
                                                       master, select)
import qualified Database.MongoDB                     as DB
import           Network.HTTP.Types
import           Network.Wai.Middleware.RequestLogger
import           Web.Scotty                           hiding (body)

runDB :: Action IO a -> IO a
runDB action = do
  pipe  <- connect (host "127.0.0.1")
  a <- access pipe master "quipper_web_development" action
  close pipe
  return a

instance ToJSON Bson.Value where
    toJSON = aesonifyValue

instance ToJSON Bson.Field where
    toJSON field = object [fieldToPair field]

instance ToJSON Bson.Document where
    toJSON []     = object []
    toJSON fields = object $ map fieldToPair fields

fieldToPair :: Bson.Field -> Aeson.Pair
fieldToPair (k Bson.:= v) = k .= aesonifyValue v

app :: ScottyM ()
app = do
    get "/ping" $ do
        result <- liftIO $ runDB $ findOne (select ["username" DB.=: "student1"] "users")
        case result of
          Just user -> json user
          Nothing -> do
            status status404
            text "not found"

main :: IO ()
main = do
    scotty 3000 $ do
      middleware logStdoutDev
      app
