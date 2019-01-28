#!../../bin/linux-x86_64/specs

< envPaths

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST" , "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST"      , "10.23.0.255")

## Register all support components
dbLoadDatabase("../../dbd/specs.dbd",0,0)
specs_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("SPECS_ASYN", "10.23.0.10:9999")
asynSetTraceMask("SPECS_ASYN", 0, 0x9)
asynSetTraceIOMask("P1", 0, 0x2)

# Change into TOP
cd("$(TOP)")

specsAnalyserConfig("SPECS1", "SPECS_ASYN", 0, 0)

< $(AREADETECTOR)/commonPlugins.cmd

iocInit()


