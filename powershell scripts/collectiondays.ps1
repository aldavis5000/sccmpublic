#script to change the number of elav days on a collection but not the date and time.

CD $env:SMS_ADMIN_UI_PATH\..\
import-module .\ConfigurationManager.psd1

Function CreateScheduleToken 
{ 
param ($dayspan = 1, $starttime = (WMIDateFormat)) 
$intervalClass = [WMICLASS]("\\SCSCCM01\root\sms\site_SC1:SMS_ST_RecurInterval") 
$interval = $intervalClass.CreateInstance() 
$interval.dayspan = $dayspan 
$interval.starttime = $starttime 
return $interval 
} 
#formats the date/time value to be SCCM friendly 
Function WMIDateFormat 
{ 
param($hour = (get-date -format HH), $min = (get-date -format mm), $sec = (get-date -format ss), $date = (get-date)) 
get-date -hour $hour -minute $min -second $sec -day $date.day -month $date.month -year $date.year -format yyyyMMddHHmmss.000000+*** 
} 
#####variables and function calls##### 
 
##$ErrorActionPreference= 'silentlycontinue' 

#grab collection ID's
$CollectionName = get-content C:\TEMP\Collections.txt 

#cycle through each ID
Foreach ($CollID in $CollectionName) 
 
{ 
$coll = [wmi]"\\SCSCCM01\root\sms\site_SC1:SMS_Collection.CollectionID='$collID'"
#change to sccm site 
cd SC1:
#get refresh token from collection
$date = get-cmcollection -Id $collID | select refreshschedule
#take token and grab current date and time eval from collection
$time = $date.refreshschedule | select -ExpandProperty starttime
$ST = (WMIDateFormat $time.Hour $time.Minute $time.Second $time.AddDays(0))
#edit number to reflect number of days
$coll.RefreshSchedule = CreateScheduleToken 1 $ST 
$coll.psbase 
$coll.Put() 
}