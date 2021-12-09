package device.common.rfid;

import device.common.rfid.ChannelState;
import device.common.rfid.ModeOfInvent;
import device.common.rfid.ParamOfInvent;
import device.common.rfid.ReportFormatOfInvent;
import device.common.rfid.IRFIDCallback;
import device.common.rfid.RecvPacket;
import device.common.rfid.SelConfig;
import device.common.rfid.StatusEvent;
import device.common.rfid.TxCycle;
import device.common.rfid.BattEvent;
import device.common.rfid.BattEvent_ext;
import device.common.rfid.ReportFormatOfInvent_ext;
import device.common.rfid.AntSelect;
import device.common.rfid.AntPower;
import device.common.rfid.CustomIntentConfig;
import device.common.rfid.AccessTag;

interface IRFIDService {
    boolean RegisterRFIDCallback(IRFIDCallback callback);
    boolean UnregisterRFIDCallback(IRFIDCallback callback);
    // functions for the device connection
    void connectBluetooth(String macAddress, String deviceName);
    void disconnectBluetooth();
    int open(int openDevice);
    void close();
    boolean isOpened();
    boolean isTryingConnect();
    int cmdDisconnectDevice();
    int updateFirmware(in byte[] fwData, String fileName, int fileSize);

    // should be called explicitly before using any other APIs
    int cmdOpenInterface1();
    int cmdOpenInterface2();

    int cmdStartInventory();
    int cmdStartInventory_ext(int f_s, int f_m, int t_o);
    int cmdStopOperation();
    int cmdHeartBeat(int value);
    int cmdGetSelectMask(inout SelConfig selConfig);
    int cmdSetSelectMask(in SelConfig selConfig);
    int cmdSetSession(int session);
    int cmdSetQValue(int q);
    int cmdSetInventoryTarget(int m_ab);
    int cmdSetInventParam(in ParamOfInvent paramOfInvent);
    int cmdGetInventParam(out ParamOfInvent paramOfInvent);
    int cmdSetOpMode(in ModeOfInvent moi);
    int cmdGetOpMode(out ModeOfInvent moi);
    int cmdReadTag(inout AccessTag acsTag);
    int cmdWriteTag(inout AccessTag acsTag);
    int cmdLockTag(int lockMask, int lockEnable, inout AccessTag acsTag);
    int cmdKillTag(inout AccessTag acsTag);
    String cmdGetFwVersion();
    int cmdSetDefaultParameter();
    int cmdGetParameter(String cmd, String p);
    int cmdGetTimer();
    int cmdSetTimer(int time);
    int cmdGetTxPower();
    int cmdSetTxPower(int pwr);
    int cmdGetMaxPower();
    int cmdGetTxCycle(out TxCycle txCycle);
    int cmdSetTxCycle(in TxCycle txCycle);
    String cmdGetAllChannel();
    int cmdGetChannelState(inout ChannelState channelState);
    int cmdSetChannelState(in ChannelState channelState);
    int cmdSetCountry(int code);
    int cmdGetCountry();
    int cmdPermLockTag(int lockMask, int lockEnable, inout AccessTag acsTag);
    int cmdPauseTx();
    int cmdGetConnectStateReport();
    int cmdSetConnectStateReport(int f_link);
    int cmdGetInventoryReportFormat(out ReportFormatOfInvent reportFormatOfInvent);
    int cmdSetInventoryReportFormat(in ReportFormatOfInvent reportFormatOfInvent);
    int cmdSetDislink();
    int cmdUploadTagData(int index, int count);
    int cmdClearTagData();
    int cmdGetReaderStateReport(out StatusEvent statusEvent);
    int cmdSetReaderStateReport(in StatusEvent statusEvent);
    int cmdGetStatusWord();
    int cmdGetBuzzerVolume();
    int cmdSetBuzzerVolume(int volume);
    int cmdGetVibration();
    int cmdSetVibration(int on);
    int cmdSetTriggerMode(int mode);
    int cmdGetBatteryLevel();
    int cmdGetBatteryEvent(out BattEvent battEvent);
    int cmdSetBatteryEvent(in BattEvent battEvent);
    int cmdSetReportBatteryState(int f_report);
    int cmdGetBatteryState();
    int cmdGetChargingState();
    int cmdSetBTConfig(int PinCode, String LocalName);
    String cmdGetBTMacAddress();
    void sendTextCommand(String sCmd);
    String cmdGetBTDeviceName();
    int cmdSetClearReport(int enable);
    String cmdGetOemInfo();
    int cmdGetTagFocus();
    int cmdSetTagFocus(int enable);
    int cmdGetFastID();
    int cmdSetFastID(int enable);
    int cmdGetLBTState();
    int cmdSetLBTState(int lbt);
    int cmdGetLinkProfile();
    int cmdSetLinkProfile(int profile);
    int cmdSetSingleTagSearch(int length, String ACS_EPC, int threshold, int step);
    int cmdSetMultiTagSearch();
    int cmdSetMultiTagList(int index, int length, String ACS_EPC);
    int cmdGetMultiTagList();
    int cmdGetMultiTagList_ext(int index);
    int cmdClearMultiTagList(int index, int length);
    int cmdClearAllMultiTagList();
    int cmdWildcardTagSearch(int length, String ACS_EPC);
    int cmdGetDataFormat();
    int cmdSetDataFormat(int index);
    int cmdGetTxDataFormat();
    int cmdSetTxDataFormat(int index);
    String cmdGetPrefix();
    int cmdSetPrefix(String prefix);
    String cmdGetSuffix();
    int cmdSetSuffix(String suffix);
    String cmdGetSuffix1();
    int cmdSetSuffix1(String suffix1);
    String cmdGetSuffix2();
    int cmdSetSuffix2(String suffix2);
    int cmdGetLcdOff();
    int cmdSetLcdOff(int lcdOff);
    int cmdSetDataCase(int datacase);
    int cmdBlockWrite(inout AccessTag acsTag);
    int cmdBlockErase(inout AccessTag acsTag);
    int cmdGetResultType();
    void cmdSetResultType(int resultType);
    int cmdGetTerminatorType();
    void cmdSetTerminatorType(int terminatorType);
    void cmdSetBTDefault();
    int cmdGetInventoryReportFormat_ext(out ReportFormatOfInvent_ext reportFormatOfInvent_ext);
    int cmdSetInventoryReportFormat_ext(in ReportFormatOfInvent_ext reportFormatOfInvent_ext);
    int cmdSetDeviceBaudrate(int baudrate);
    int cmdGetAntSelect(out AntSelect antSelect);
    int cmdSetAntSelect(in AntSelect antSelect);
    int cmdGetAntPower(out AntPower antPower);
    int cmdSetAntPower(in AntPower antPower);
    String cmdGetAvailableRegion();
    int cmdSetRegion(String region);
    void cmdGetCustomIntentConfig(out CustomIntentConfig customIntentConfig);
    void cmdSetCustomIntentConfig(in CustomIntentConfig customIntentConfig);
    String cmdGetBTFwVersion();
    int cmdGetBTPwrClass();
    int cmdSetBTPwrClass(int power);
    String cmdGetOSVersion();
    int cmdSetOSUpdate();
    int cmdGetSuspendTimeout();
    int cmdSetSuspendTimeout(int timeout);
    int cmdGetFilterDuplicateTags();
    void cmdSetFilterDuplicateTags(int enable);
    int cmdGetTriggerMode();
    int cmdBTFWUpdate();
    double cmdGetBatteryTemp();
    int cmdGetBatteryVolt();
    int cmdGetBatteryEvent_ext(out BattEvent_ext battEvent_ext);
    int cmdSetBatteryEvent_ext(in BattEvent_ext battEvent_ext);
    int isDetected();
    int cmdGetHwVersion();
    void cmdDoReboot();
}
