//
//  CommonDefine.h
//  IntelligentRingKing
//
//  Created by qf on 14-5-11.
//  Copyright (c) 2014年 JAGA. All rights reserved.
//

#ifndef IntelligentRingKing_CommonDefine_h
#define IntelligentRingKing_CommonDefine_h

#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height >= 568)


#define DEMO_APPID @"YMPPUFSMA05Y4BQ"
#define DEMO_SECRET @"L6so3PlcHMFH1VteplSYWT78tTkSjNgakgnSRFiK"
#define DEMO_VID @"000012001001"

//默认为男性 gender is male
#define DEMO_GENDER 1
#define DEMO_HEIGHT 170.0f
#define DEMO_WEIGHT 65.0f
#define DEMO_STRIDE 45.0f
#define DEMO_BLOODTYPE @"O"
#define DEMO_BIRTH @"1980-01-01"
#define DEMO_NICKNAME @"TestSXRSDKUSER"
//默认为公制，demo unit is METRIX
#define DEMO_UNIT 1
#define DEMO_SCREENTIME 10
#define DEMO_SLEEPSTARTHOUR 22
#define DEMO_SLEEPENDHOUR 8
#define DEMO_ALARM_SNOOZE 5
#define DEMO_ALARM_ENABLE 1
#define DEMO_ALARM_SNOOZE_REPEAT 1
#define DEMO_TARGET_STEP 10000

//闹钟周期为每天
#define DEMO_ALARM_WEEKLY 0x7F
#define GEAR_TYPE @"001"


#define TEMP_TYPE_C 1
#define TEMP_TYPE_F 0


#define MAX_MAIN_PAGE_COUNT  5


//notify key
#define notify_key_did_connect_device_err @"NOTIFY_KEY_DID_CONNECT_DEVICE_ERR"
#define notify_key_connect_state_changed @"NOTIFY_KEY_CONNECT_STATE_CHANGED"
#define notify_key_did_ble_characteristic_notify_update @"notify_key_did_ble_characteristic_notify_update"
#define notify_key_bong_to_phone_read_device_data_resp @"notify_key_bong_to_phone_read_device_data_resp"
#define notify_key_did_ble_characteristic_batterylevel_notify_update @"notify_key_did_ble_characteristic_batterylevel_notify_update"
#define notify_key_did_get_current_steps @"notify_key_did_get_current_steps"
#define notify_key_take_photo   @"notify_key_take_photo"
#define notify_key_event_call_disconnected @"notify_key_event_call_disconnected"
#define notify_key_event_call_connected @"notify_key_event_call_connected"
#define notify_key_event_call_incoming @"notify_key_event_call_incoming"

#define notify_key_read_device_time_ok @"notify_key_read_device_time_ok"
#define notify_key_set_device_time @"notify_key_set_device_time"
#define notify_key_has_reminder @"notify_key_has_reminder"
#define notify_band_has_kickoff @"notify_band_has_kickoff"
#define notify_band_has_disconnect @"notify_band_has_disconnect"
#define notify_key_location_update @"notify_key_location_update"
#define notify_key_weather_update @"notify_key_weather_update"
#define notify_key_location_geacoder_update @"geacoder_update"
#define notify_key_did_recv_device_sync_data @"did_recve_device_sync_data"
#define notify_key_did_finish_device_sync @"did_finish_device_sync"
#define notify_key_connect_timeout @"connect_timeout"
#define notify_key_start_sync_history @"start_sync_history"
#define notify_key_start_set_personinfo @"Set_Person"
#define notify_key_start_set_hydration @"Set_Hydration"

#define notify_key_stop_sync @"stop_sync"

#define notify_key_sycn_finish_need_reloaddata @"need_reloadData"
#define notify_key_read_sport_data_finish @"read_sportdata_finish"
#define notify_key_did_finish_modeset @"finish_modeset"
#define notify_key_did_finish_modeset_err @"fail_modset"
#define notify_key_heartbeat @"heartbeat"
#define notify_key_has_Login @"loingnow"
#define notify_key_start_location @"startlocation"
#define notify_key_did_finish_send_cmd_err @"finish_send_cmd_err"
#define notify_key_did_finish_weather_cmd @"weatherfinish"
#define notify_key_did_get_member_info @"get_member_info"
#define notify_key_did_modify_nickname @"modify_nickname"
#define notify_key_did_get_headimage @"get_headimg"
#define notify_key_did_get_mac_id @"getmacid"
#define notify_key_did_update_rssi @"didupdaterssi"

#define notify_key_clear_ok @"clearok"
#define notify_key_clear_err @"clearerr"
#define notify_key_clear_all_data @"clearalldata"
#define notify_key_clear_timeout @"cleartimeout"
#define notify_key_did_finish_send_clock_ok @"clockok"
#define notify_key_did_finish_send_clock_err @"clockerr"
#define notify_key_did_get_activity_report @"activity_report"
#define notify_key_monitor_change @"monitorchange"
#define notify_key_start_running_request @"runreq"
#define notify_key_start_running_location @"runloc"
#define notify_key_pause_running_location @"runpause"
#define notify_key_stop_running_location @"runstop"
#define notify_key_running_did_location @"rundidloc"
#define notify_key_did_click_on_annotation @"onanno"
#define notify_key_ble_ota_resp @"OTAReadValue"
#define notify_key_ble_ota_charater_change @"OTAChchg"
#define notify_key_next_command @"nextcommand"
#define notify_key_check_ota @"checkota"
#define notify_key_start_OTA @"startOTA"
#define notify_key_open_otaview @"openotaview"
#define notify_key_did_get_sensor_report @"sensor_report"
#define notify_key_stop_read_heart_data @"stopheart"


//配置管理
#define CONFIG_KEY_FIRST_RUN @"CONFIG_KEY_FIRST_RUN"
#define CONFIG_KEY_ENABLE_ANTILOST @"CONFIG_KEY_ENABLE_ANTILOST"
#define CONFIG_KEY_ENABLE_BRIGHTSCREEN @"CONFIG_KEY_ENABLE_BRIGHTSCREEN"
#define CONFIG_KEY_ENABLE_TAKEPHOTO @"CONFIG_KEY_ENABLE_TAKEPHOTO"
#define CONFIG_KEY_ENABLE_WHATSAPP @"CONFIG_KEY_ENABLE_WHATSAPP"
#define CONFIG_KEY_ENABLE_QQ @"CONFIG_KEY_ENABLE_QQ"
#define CONFIG_KEY_ENABLE_WECHAT @"CONFIG_KEY_ENABLE_WECHAT"
#define CONFIG_KEY_ENABLE_MAILALERT @"CONFIG_KEY_ENABLE_MAILALERT"
#define CONFIG_KEY_ENABLE_BONGCONTROLMUSIC @"CONFIG_KEY_ENABLE_BONGCONTROLMUSIC"
#define CONFIG_KEY_ENABLE_INCOMING_CALL @"CONFIG_KEY_ENABLE_INCOMING_CALL"
#define CONFIG_KEY_TARGET_STEPS @"CONFIG_KEY_TARGET_STEPS"
#define CONFIG_KEY_TARGET_RUNSTEPS @"CONFIG_KEY_TARGET_RUNSTEPS"
#define CONFIG_KEY_TARGET_DISTANCE @"CONFIG_KEY_TARGET_DISTANCE"
#define CONFIG_KEY_TARGET_CAROLIE @"CONFIG_KEY_TARGET_CAROLIE"
#define CONFIG_KEY_TARGET_SLEEPTIME @"CONFIG_KEY_TARGET_SLEEPTIME"
#define CONFIG_KEY_PERSON_INFO_MALE @"CONFIG_KEY_PERSON_INFO_MALE"
#define CONFIG_KEY_PERSON_INFO_HEIGHT @"CONFIG_KEY_PERSON_INFO_HEIGHT"
#define CONFIG_KEY_PERSON_INFO_WEIGHT @"CONFIG_KEY_PERSON_INFO_WEIGHT"
#define CONFIG_KEY_PERSON_INFO_BIRTHYEAR @"CONFIG_KEY_PERSON_INFO_BIRTHYEAR"
#define CONFIG_KEY_PERSON_INFO_STRIDE @"CONFIG_KEY_PERSON_INFO_STRIDE"
#define CONFIG_KEY_MEASUREUNIT @"CONFIG_KEY_MEASUREUNIT"
#define CONFIG_KEY_NICKNAME @"CONFIG_KEY_NICKNAME"
#define CONFIG_KEY_ENABLE_SMS_NOTIFY @"CONFIG_KEY_ENABLE_SMS_NOTIFY"
#define CONFIG_KEY_ENABLE_DEVICE_CALL @"CONFIG_KEY_ENABLE_DEVICE_CALL"
#define CONFIG_KEY_ENABLE_LOWBATTERY @"Lowbattery"
#define CONFIG_KEY_PERSON_INFO_BLOODTYPE @"BLOODTYPE"
#define CONFIG_KEY_PERSON_INFO_HEADIMGURL @"HEADIMGURL"
#define CONFIG_KEY_GEARSUBTYPE @"gsbt"
#define CONFIG_KEY_SCREENTIME @"sct"
#define CONFIG_KEY_TARGET_ACTIVITY @"activity"
#define CONFIG_KEY_ENABLE_LONGSIT @"LONGSIT"
#define CONFIG_KEY_ENABLE_SHOCK @"ENABLE_SHOCK"


#define MEASURE_UNIT_METRIX 1
#define MEASURE_UNIT_US 2
#define COMMON_CALORIES_RATE 0.0395


#define STEP_MODE_DAILY 0
#define STEP_MODE_SLEEP 1
#define STEP_MODE_SPORT 2

#define SLEEP_MODE_AWAKE 30
#define SLEEP_MODE_EXLIGHT 20
#define SLEEP_MODE_LIGHT 10

//10分钟一个数据
#define DATA_TIME_INTERVAL  60*10
#define MAX_STORE_DATA_TIME  6*24*60*60
#define MAX_STORE_SPORT_DATA_TIME 2*24*60*60

#define ANTILOST_TYPE_PHONE_CALL_DEVICE 0x01
#define ANTILOST_TYPE_PHONE_CALL_DEVICE_END 0xA1
#define ANTILOST_TYPE_OUT_OF_RANGE 0x02
#define ANTILOST_TYPE_OUT_OF_RANGE_END 0xA2

#define ANTILOST_CMD_CALL_PHONE 0x01
#define ANTILOST_CMD_CALL_PHONE_END 0xA1

#define MUSIC_CMD_PLAY 0x01
#define MUSIC_CMD_NEXT 0x03
#define MUSIC_CMD_BACK 0x02



#define IRKDATATYPE_STEP  0
#define IRKDATATYPE_SLEEP 1


#define HJT_C4_TIMEOUT 0.1
#define HJT_C6_TIMEOUT 9


#define SLEEP_STATE_GOOD 0.9
#define SLEEP_STATE_NORMAL 0.7
#define SLEEP_STATE_LACK 0.5

#define RUNMODE_ACTIVE 1
#define RUNMODE_BACKGROUD 2

#define KG2LB 2.2046226
#define M2FEET 3.2808
#define M2INCH 39.3700787
#define KM2MILE 0.6213712
#define CM2INCH 0.3937008
#define CALQUOTE 0.78
#define RUNNINGCALORIEQUOTE 1.036
#define MILE2FEET 5280
#define MILE2INCH 63360
#define MILE2YARD 1760
#define YARD2INCH 36


#define MAX_LOGIN_TIMER 7*24*60*60


#define PERIOD_1 0x01
#define PERIOD_2 0x02
#define PERIOD_3 0x04
#define PERIOD_4 0x08
#define PERIOD_5 0x10
#define PERIOD_6 0x20
#define PERIOD_7 0x40

#define WORKDAY 0x1F
#define ALLDAY 0x7F


#define READ_WEATHER_TIMEOUT 12*60*60


//OTA
#define RUN_STATE_NORMAL 0
#define RUN_STATE_OTA 1


#define OTA_FILE_BEGIN 0x2E00
#define OTA_PIECE_BYTES 16
#define OTA_MAX_PIECE_COUNT 96
#define OTA_MAX_BLOCK_COUNT 10

#define OTA_CMD_CTRL 0xFD
#define OTA_CMD_CTRL_RSP 0xAD
#define OTA_CMD_SEND_DATA 0xFA
#define OTA_CMD_SEND_DATA_RSP 0xAA

#define OTA_SUB_CMD_START 0x12
#define OTA_SUB_CMD_START_RSP 0xED
#define OTA_SUB_CMD_END 0x23
#define OTA_SUB_CMD_END_RSP_OK 0xDC
#define OTA_SUB_CMD_END_RSP_ERR 0xAE

#define OTA_TIMER_INTERVAL 1

#define FIRMWARE_VERSION_SERVER_URL @"http://download.keeprapid.com/apps/smartband/goband/fwupdater/%@/%@/update.json"

#define ALARM_TYPE_TIMER 1
#define ALARM_TYPE_MEDICINE 2
#define ALARM_TYPE_DRINK 3
#define ALARM_TYPE_FIT 4
#define ALARM_TYPE_LONGSIT 5

#define ALARM_ENABLE 1
#define ALARM_DISABLE 0

#define ALARM_REPEAT_SCHEDULE_NO_REPEAT 0
#define ALARM_REPEAT_SCHEDULE_DAILY 1
#define ALARM_REPEAT_SCHEDULE_WEEKLY 2
#define ALARM_REPEAT_SCHEDULE_MONTHLY 3

#define ALARM_HYDRATION_REPEAT_TIMES_MIN 				0
#define ALARM_HYDRATION_REPEAT_TIMES_MAX 				6
#define ALARM_HYDRATION_REPEAT_IN_MINUTES_MAX 			240
#define ALARM_HYDRATION_REPEAT_IN_MINUTES_MIN 			1
#define ALARM_HYDRATION_DEFAULT_REPEAT_HOUR 			30
#define ALARM_HYDRATION_DEFAULT_REPEAT_TIMES 			8

#define ALARM_MAX_COUNT_TIMER 2

#define USER_SOURCE_ORIGIN @"origin"
#define USER_SOURCE_FACEBOOK @"facebook"

#define AUTO_CONNECT_RSSI -65

#define GEAR_SUBTYPE_B108 @"B108"
#define GEAR_SUBTYPE_LEWO @"LEWO"
#define GEAR_SUBTYPE_SMART @"SMART"
#define GEAR_SUBTYPE_SPRINFIT @"SPRINFIT"
#define GEAR_SUBTYPE_FITRIST @"FITRIST"
#define GEAR_SUBTYPE_EIROGA @"EIROGA"
#define GEAR_SUBTYPE_FITBAND @"FITBAND"
#define GEAR_SUBTYPE_BLOX @"smart"

//CZJK
#define GEAR_BLE_NAME_B108 @"B108 LEWO"
#define GEAR_BLE_NAME_LEWO @"LEWO"
#define GEAR_BLE_NAME_SMART @"SMART"
#define GEAR_BLE_NAME_AKTIFITE @"Aktifite" 
#define GEAR_BLE_NAME_FITRIST @"FitRist"
#define GEAR_BLE_NAME_GETFIT @"GetFit"
#define GEAR_BLE_NAME_PUZZLE @"Pulzz"
#define GEAR_BLE_NAME_EIROGA @"EIROGA"
#define GEAR_BLE_NAME_FIT_BAND @"FIT-BAND"
#define GEAR_BLE_NAME_BLOX @"smart"
#define GEAR_BLE_NAME_SPRINFIT @"SMART"
#define GEAR_BLE_NAME_MOVISTAR @"SmartB Movistar"



#define DEF_ENABLE @"1"
#define DEF_DISABLE @"0"


#define SENSOR_HEARTRATE 0x80

#define HEIGHT_MIN_MATRIX 50
#define HEIGHT_MAX_MATRIX 250
#define WEIGHT_MIN_MATRIX 20
#define WEIGHT_MAX_MATRIX 227
#define STRIDE_MIN_MATRIX 30
#define STRIDE_MAX_MATRIX 213

#define HEIGHT_FEET_MIN_US 1
#define HEIGHT_FEET_MAX_US 8
#define HEIGHT_INCH_MIN_US 0
#define HEIGHT_INCH_MAX_US 11
#define HEIGHT_INCH1_MIN_US 8
#define HEIGHT_INCH1_MAX_US 11


#define STRIDE_FEET_MIN_US 1
#define STRIDE_FEET_MAX_US 7
#define STRIDE_INCH_MIN_US 0
#define STRIDE_INCH_MAX_US 11

#define WEIGHT_MIN_US 45
#define WEIGHT_MAX_US 501

#define START_RUN_ACCURACY 25
#define GPS_ACCURACY_VALID 0
#define GPS_ACCURACY_STRONG 25
#define GPS_ACCURACY_WEAK 50
#define GPS_ACCURACY_UNTRUST 100

//czjk
#define PROJECTCODE_CZJK @"CZJK"
#define PRODUCTCODE_B108 @"B108"
#define PRODUCTCODE_FITRIST_TI @"FR_T"
#define PRODUCTCODE_FITRIST_NODIC @"FR_N"
#define PRODUCTCODE_FITRIST_HEART_NODIC @"FRHN"
#define PRODUCTCODE_CZJKHT_TV @"HT_T"
#define PRODUCTCODE_CZJKGB_NV @"GB_N"
#define PRODUCTCODE_CZJKW8_NV @"W8_N"
#define PRODUCTCODE_CZJKVO_TV @"VO_T"
#define PRODUCTCODE_CZJKZX_TV @"ZX_T"
#define PRODUCTCODE_DS_NODIC @"DS_N"
#define PRODUCTCODE_LEWO @"LEWO"
#define PRODUCTCODE_SMART @"SMRT"
#define PRODUCTCODE_FITBAND @"FTBD"
#define PRODUCTCODE_EIROGA @"ERGA"
#define PRODUCTCODE_BLOX @"BLOX"
#define PRODUCTCODE_SPRINFIT @"SPFT"

#define PRODUCTCODE_CZJKHA1NV @"HA1N"

#define PRODUCTCODE_CZJKH81N @"H81N"
#define PRODUCTCODE_CZJKDS_N @"DS_N"

#define FIRMWARE_FILE_DIR @"fwupdate"
#define FIRMWARE_FILE_NAME @"newfirmware.hex"

#define FIRMINFO_DICT_UPDATEINFO @"updateInfo"
#define FIRMINFO_DICT_FWDESC @"fwDescription"
#define FIRMINFO_DICT_FWNAME @"fwName"
#define FIRMINFO_DICT_FORCEUPDATE @"forceUpdate"
#define FIRMINFO_DICT_AUTOUPDATE @"autoUpdate"
#define FIRMINFO_DICT_FWURL @"fwUrl"
#define FIRMINFO_DICT_VERSIONCODE @"versionCode"
#define FIRMINFO_DICT_VERSIONNAME @"versionName"
#define FIRMINFO_DICT_UPDATETIPS @"updateTips"
#define FIRMINFO_DICT_MD5 @"md5"


#define CMD_ServiceID @"fff0"
#define default_Resp_CharID @"FFF1"
#define default_Write_Code_CharID @"FFF2"
#define Write_Code_Resquest_Characteristic_UUID_default @"FFF2"
#define Write_Code_Resquest_Characteristic_Value 0xfc12cc0000
#define End_Write_Code_Resquest_Characteristic_Value @"FC23CC"
#define Resp_Indication_Characteristic_UUID_default @"FFF1"
#define Resp_Indication_Characteristic_Value @"ACEDAC"
#define End_Resp_Indication_Characteristic_Byte0 @"AC"
#define End_Resp_Indication_Characteristic_Byte2 @"AC"
#define Write_Code_Resquest_Characteristic_Byte0 @"FA"
#define Resp_Indication_Characteristic_Byte0 @"AA"
#define Fixed_Tag @"484541445F454E44"
#define OTA_Service @"feba"


#define SEDENTARY_MIN_SNOOZE 5

#define SENSOR_REPORT_INFO_KEY_TYPE @"sensor_type"
#define SENSOR_REPORT_INFO_KEY_VALUE @"sensor_value"

#define SENSOR_REPORT_ONOFF @"sensor_onoff"

#endif
