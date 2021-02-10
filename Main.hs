{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
import Data.Aeson
import qualified Data.ByteString.Lazy as B
import GHC.Generics

data DayHealthItem = DayHealthItem { summary_date :: String,
                                     period_id :: Int,
                                     is_longest :: Int,
                                     timezone :: Int,
                                     bedtime_start :: String,
                                     bedtime_end :: String,
                                     score :: Int,
                                     score_total :: Int,
                                     score_disturbances :: Int,
                                     score_efficiency :: Int,
                                     score_latency :: Int,
                                     score_rem :: Int,
                                     score_deep :: Int,
                                     score_alignment :: Int,
                                     total :: Int,
                                     duration :: Int,
                                     awake :: Int,
                                     light :: Int,
                                     rem :: Int,
                                     deep :: Int,
                                     onset_latency :: Int,
                                     restless :: Int,
                                     efficiency :: Int,
                                     midpoint_time :: Int,
                                     hr_lowest :: Int,
                                     hr_average :: Double,
                                     rmssd :: Int,
                                     breath_average :: Double,
                                     temperature_delta :: Double,
                                     hypnogram_5min :: String,
                                     hr_5min :: [Int],
                                     rmssd_5min :: [Int]
                                   } deriving (Generic, Show)

instance FromJSON DayHealthItem

main = do
  input <- B.readFile "mock/data.json"
  let maybeDecodedJSON = decode input :: Maybe [DayHealthItem]
  case maybeDecodedJSON of
    Nothing -> error "error parsing JSON"
    Just decodedJSON -> (putStrLn.show) decodedJSON
