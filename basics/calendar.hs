import System.Locale
import Data.Time
import Data.Time.Clock
import Data.Time.Clock.POSIX
import System.Locale
import Data.Time.Format

main :: UTCTime -> String
main = formatTime defaultTimeLocale "%FT%T%QZ"

date_ymd year month day = 
	UTCTime(fromGregorian year month day) (timeOfDayToTime $ TimeOfDay 0 0 0)
