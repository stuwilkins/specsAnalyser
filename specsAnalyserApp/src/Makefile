TOP=../..

include $(TOP)/configure/CONFIG

LIBRARY_IOC_Linux += specs
LIB_SRCS += SpecsAnalyser.cpp

PROD_NAME = specs
PROD_IOC = specs

DBD += specs.dbd
specs_DBD += specs.dbd
specs_DBD += asyn.dbd
specs_DBD += drvAsynIPPort.dbd
DBD += specs.dbd

# The following are compiled and added to the support library
PROD_SRCS += specs_registerRecordDeviceDriver.cpp
PROD_SRCS += specsAnalyserMain.cpp

PROD_LIBS += specs
specs_LIBS += asyn
specs_LIBS += ADBase
specs_LIBS += busy

# We need to link against the EPICS Base libraries
specs_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(AREA_DETECTOR)/ADApp/commonDriverMakefile

include $(TOP)/configure/RULES
