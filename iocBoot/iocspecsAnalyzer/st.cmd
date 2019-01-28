#!../../bin/linux-x86_64/specs

< envPaths

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST" , "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST"      , "10.23.0.255")

dbLoadDatabase("../../dbd/specs.dbd",0,0)
specs_registerRecordDeviceDriver(pdbbase) 

epicsEnvSet("PREFIX",	"XF:23ID1-ES{SPECS}")
epicsEnvSet("PORT",     "SPECS")
epicsEnvSet("QSIZE",    "20")
epicsEnvSet("XSIZE",    "2048")
epicsEnvSet("YSIZE",    "2048")
epicsEnvSet("NCHANS",   "2048")

drvAsynIPPortConfigure("SPECS_ASYN", "10.23.0.10:9999")
asynSetTraceMask("SPECS_ASYN", 0, 0x9)
asynSetTraceIOMask("P1", 0, 0x2)

specsAnalyserConfig("$(PORT)", "SPECS_ASYN", 0, 0)

dbLoadRecords("$(TOP)/db/specsAnalyzer.template", "P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")
dbLoadRecords("$(TOP)/db/specsAnalyzerDLD.template", "P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")

< $(AREA_DETECTOR)/iocBoot/commonPlugins.cmd

iocInit()

create_monitor_set("auto_settings.req", 30, "P=$(PREFIX),D=cam1:")
