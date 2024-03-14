#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/PIC24_PMP_1602_LI_BME280.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/PIC24_PMP_1602_LI_BME280.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=main.c BME280.c PMP_LCD.c INIT.c SPI.c socket.c wizchip_conf.c w5500.c MQTTClient.c MQTTPacket.c mqtt_interface.c MQTTFormat.c MQTTConnectClient.c MQTTSerializePublish.c MQTTSubscribeClient.c MQTTSubscribeServer.c MQTTUnsubscribeClient.c MQTTUnsubscribeServer.c MQTTDeserializePublish.c MQTTConnectServer.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/BME280.o ${OBJECTDIR}/PMP_LCD.o ${OBJECTDIR}/INIT.o ${OBJECTDIR}/SPI.o ${OBJECTDIR}/socket.o ${OBJECTDIR}/wizchip_conf.o ${OBJECTDIR}/w5500.o ${OBJECTDIR}/MQTTClient.o ${OBJECTDIR}/MQTTPacket.o ${OBJECTDIR}/mqtt_interface.o ${OBJECTDIR}/MQTTFormat.o ${OBJECTDIR}/MQTTConnectClient.o ${OBJECTDIR}/MQTTSerializePublish.o ${OBJECTDIR}/MQTTSubscribeClient.o ${OBJECTDIR}/MQTTSubscribeServer.o ${OBJECTDIR}/MQTTUnsubscribeClient.o ${OBJECTDIR}/MQTTUnsubscribeServer.o ${OBJECTDIR}/MQTTDeserializePublish.o ${OBJECTDIR}/MQTTConnectServer.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/BME280.o.d ${OBJECTDIR}/PMP_LCD.o.d ${OBJECTDIR}/INIT.o.d ${OBJECTDIR}/SPI.o.d ${OBJECTDIR}/socket.o.d ${OBJECTDIR}/wizchip_conf.o.d ${OBJECTDIR}/w5500.o.d ${OBJECTDIR}/MQTTClient.o.d ${OBJECTDIR}/MQTTPacket.o.d ${OBJECTDIR}/mqtt_interface.o.d ${OBJECTDIR}/MQTTFormat.o.d ${OBJECTDIR}/MQTTConnectClient.o.d ${OBJECTDIR}/MQTTSerializePublish.o.d ${OBJECTDIR}/MQTTSubscribeClient.o.d ${OBJECTDIR}/MQTTSubscribeServer.o.d ${OBJECTDIR}/MQTTUnsubscribeClient.o.d ${OBJECTDIR}/MQTTUnsubscribeServer.o.d ${OBJECTDIR}/MQTTDeserializePublish.o.d ${OBJECTDIR}/MQTTConnectServer.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/BME280.o ${OBJECTDIR}/PMP_LCD.o ${OBJECTDIR}/INIT.o ${OBJECTDIR}/SPI.o ${OBJECTDIR}/socket.o ${OBJECTDIR}/wizchip_conf.o ${OBJECTDIR}/w5500.o ${OBJECTDIR}/MQTTClient.o ${OBJECTDIR}/MQTTPacket.o ${OBJECTDIR}/mqtt_interface.o ${OBJECTDIR}/MQTTFormat.o ${OBJECTDIR}/MQTTConnectClient.o ${OBJECTDIR}/MQTTSerializePublish.o ${OBJECTDIR}/MQTTSubscribeClient.o ${OBJECTDIR}/MQTTSubscribeServer.o ${OBJECTDIR}/MQTTUnsubscribeClient.o ${OBJECTDIR}/MQTTUnsubscribeServer.o ${OBJECTDIR}/MQTTDeserializePublish.o ${OBJECTDIR}/MQTTConnectServer.o

# Source Files
SOURCEFILES=main.c BME280.c PMP_LCD.c INIT.c SPI.c socket.c wizchip_conf.c w5500.c MQTTClient.c MQTTPacket.c mqtt_interface.c MQTTFormat.c MQTTConnectClient.c MQTTSerializePublish.c MQTTSubscribeClient.c MQTTSubscribeServer.c MQTTUnsubscribeClient.c MQTTUnsubscribeServer.c MQTTDeserializePublish.c MQTTConnectServer.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/PIC24_PMP_1602_LI_BME280.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GA004
MP_LINKER_FILE_OPTION=,--script=p24FJ64GA004.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/c88874990ff2e0be46db94298ccee04f16e3f79f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/BME280.o: BME280.c  .generated_files/flags/default/d048513a88c5bb348a28c61b27d03131d41f8c38 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BME280.o.d 
	@${RM} ${OBJECTDIR}/BME280.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  BME280.c  -o ${OBJECTDIR}/BME280.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/BME280.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/PMP_LCD.o: PMP_LCD.c  .generated_files/flags/default/f42d16b3d68efad446bc69cfa4df4358a92ed860 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PMP_LCD.o.d 
	@${RM} ${OBJECTDIR}/PMP_LCD.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  PMP_LCD.c  -o ${OBJECTDIR}/PMP_LCD.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/PMP_LCD.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/INIT.o: INIT.c  .generated_files/flags/default/91fe1600eb79ec299721b7e034ebf9d7d586cd15 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/INIT.o.d 
	@${RM} ${OBJECTDIR}/INIT.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  INIT.c  -o ${OBJECTDIR}/INIT.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/INIT.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/SPI.o: SPI.c  .generated_files/flags/default/7e0619c81b442e75ff09a35237fb488393df9c64 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPI.o.d 
	@${RM} ${OBJECTDIR}/SPI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  SPI.c  -o ${OBJECTDIR}/SPI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/SPI.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/socket.o: socket.c  .generated_files/flags/default/a1d25a148ea0b4caa941c0d1dd6107b8f74b2189 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/socket.o.d 
	@${RM} ${OBJECTDIR}/socket.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  socket.c  -o ${OBJECTDIR}/socket.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/socket.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/wizchip_conf.o: wizchip_conf.c  .generated_files/flags/default/534e9a4cd77e5f34c17e89474573637f7ee5ec95 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/wizchip_conf.o.d 
	@${RM} ${OBJECTDIR}/wizchip_conf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  wizchip_conf.c  -o ${OBJECTDIR}/wizchip_conf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/wizchip_conf.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/w5500.o: w5500.c  .generated_files/flags/default/1ed37b9c20e59311750ac3a2aeee6a1975b25102 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/w5500.o.d 
	@${RM} ${OBJECTDIR}/w5500.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  w5500.c  -o ${OBJECTDIR}/w5500.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/w5500.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTClient.o: MQTTClient.c  .generated_files/flags/default/522c664167eef8eae423e60697e02c38350f07ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTClient.o.d 
	@${RM} ${OBJECTDIR}/MQTTClient.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTClient.c  -o ${OBJECTDIR}/MQTTClient.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTClient.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTPacket.o: MQTTPacket.c  .generated_files/flags/default/19c3387b0ec059e82096e33c0dfa105e8314d1b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTPacket.o.d 
	@${RM} ${OBJECTDIR}/MQTTPacket.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTPacket.c  -o ${OBJECTDIR}/MQTTPacket.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTPacket.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/mqtt_interface.o: mqtt_interface.c  .generated_files/flags/default/9cb7eaa7fa59c12a67550a280147c32048d479ae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/mqtt_interface.o.d 
	@${RM} ${OBJECTDIR}/mqtt_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mqtt_interface.c  -o ${OBJECTDIR}/mqtt_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mqtt_interface.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTFormat.o: MQTTFormat.c  .generated_files/flags/default/65df4b3538b3491892bc8d0582d911eb29757539 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTFormat.o.d 
	@${RM} ${OBJECTDIR}/MQTTFormat.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTFormat.c  -o ${OBJECTDIR}/MQTTFormat.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTFormat.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTConnectClient.o: MQTTConnectClient.c  .generated_files/flags/default/417a2d139b048b0927ebe0828115d8eb42bf4b74 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTConnectClient.o.d 
	@${RM} ${OBJECTDIR}/MQTTConnectClient.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTConnectClient.c  -o ${OBJECTDIR}/MQTTConnectClient.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTConnectClient.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTSerializePublish.o: MQTTSerializePublish.c  .generated_files/flags/default/c44e729e6bf485010b4899234514bb97628e59a5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTSerializePublish.o.d 
	@${RM} ${OBJECTDIR}/MQTTSerializePublish.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTSerializePublish.c  -o ${OBJECTDIR}/MQTTSerializePublish.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTSerializePublish.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTSubscribeClient.o: MQTTSubscribeClient.c  .generated_files/flags/default/708ad999055e941fb4c5b2b47a766239c2a279fd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTSubscribeClient.o.d 
	@${RM} ${OBJECTDIR}/MQTTSubscribeClient.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTSubscribeClient.c  -o ${OBJECTDIR}/MQTTSubscribeClient.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTSubscribeClient.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTSubscribeServer.o: MQTTSubscribeServer.c  .generated_files/flags/default/7e89f40743aac068f95442c96c77f52b44f047c2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTSubscribeServer.o.d 
	@${RM} ${OBJECTDIR}/MQTTSubscribeServer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTSubscribeServer.c  -o ${OBJECTDIR}/MQTTSubscribeServer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTSubscribeServer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTUnsubscribeClient.o: MQTTUnsubscribeClient.c  .generated_files/flags/default/4bd335ea282e0f3eb0ff9511a772c70606ae31b1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTUnsubscribeClient.o.d 
	@${RM} ${OBJECTDIR}/MQTTUnsubscribeClient.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTUnsubscribeClient.c  -o ${OBJECTDIR}/MQTTUnsubscribeClient.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTUnsubscribeClient.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTUnsubscribeServer.o: MQTTUnsubscribeServer.c  .generated_files/flags/default/5d184ebcc90d5053de115d6abb72dab75e92df8b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTUnsubscribeServer.o.d 
	@${RM} ${OBJECTDIR}/MQTTUnsubscribeServer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTUnsubscribeServer.c  -o ${OBJECTDIR}/MQTTUnsubscribeServer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTUnsubscribeServer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTDeserializePublish.o: MQTTDeserializePublish.c  .generated_files/flags/default/2d95141a77ccfe127f17dd34d07ae81180c7456e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTDeserializePublish.o.d 
	@${RM} ${OBJECTDIR}/MQTTDeserializePublish.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTDeserializePublish.c  -o ${OBJECTDIR}/MQTTDeserializePublish.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTDeserializePublish.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTConnectServer.o: MQTTConnectServer.c  .generated_files/flags/default/80a9ea640e8c1ea81fe6802d1801ec2dc6c45aa4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTConnectServer.o.d 
	@${RM} ${OBJECTDIR}/MQTTConnectServer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTConnectServer.c  -o ${OBJECTDIR}/MQTTConnectServer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTConnectServer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/c22d52b731c3e108b1f4fa1d07b80d5500a939fa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/BME280.o: BME280.c  .generated_files/flags/default/40d1401de4abfdcd7b93aeef0972854508baf0bf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BME280.o.d 
	@${RM} ${OBJECTDIR}/BME280.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  BME280.c  -o ${OBJECTDIR}/BME280.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/BME280.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/PMP_LCD.o: PMP_LCD.c  .generated_files/flags/default/d87db0d6f02d74167967ed596c6dfb0789541e15 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PMP_LCD.o.d 
	@${RM} ${OBJECTDIR}/PMP_LCD.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  PMP_LCD.c  -o ${OBJECTDIR}/PMP_LCD.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/PMP_LCD.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/INIT.o: INIT.c  .generated_files/flags/default/7fea8a61cd378352e45f8a18c91f6737a22fa653 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/INIT.o.d 
	@${RM} ${OBJECTDIR}/INIT.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  INIT.c  -o ${OBJECTDIR}/INIT.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/INIT.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/SPI.o: SPI.c  .generated_files/flags/default/ab847bc0016429f9a93e1d8176e63fcb57132763 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPI.o.d 
	@${RM} ${OBJECTDIR}/SPI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  SPI.c  -o ${OBJECTDIR}/SPI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/SPI.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/socket.o: socket.c  .generated_files/flags/default/d765a8799475c51b6de511b2364debc3710668e0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/socket.o.d 
	@${RM} ${OBJECTDIR}/socket.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  socket.c  -o ${OBJECTDIR}/socket.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/socket.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/wizchip_conf.o: wizchip_conf.c  .generated_files/flags/default/cdc7817107fb24d3873332244ec03b8fd7c8b8f0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/wizchip_conf.o.d 
	@${RM} ${OBJECTDIR}/wizchip_conf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  wizchip_conf.c  -o ${OBJECTDIR}/wizchip_conf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/wizchip_conf.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/w5500.o: w5500.c  .generated_files/flags/default/3b25fe59b0d741e31a285860a59a0984cd2cf6d6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/w5500.o.d 
	@${RM} ${OBJECTDIR}/w5500.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  w5500.c  -o ${OBJECTDIR}/w5500.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/w5500.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTClient.o: MQTTClient.c  .generated_files/flags/default/48beeee5948866c87afa1b94eed3cd098ceece0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTClient.o.d 
	@${RM} ${OBJECTDIR}/MQTTClient.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTClient.c  -o ${OBJECTDIR}/MQTTClient.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTClient.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTPacket.o: MQTTPacket.c  .generated_files/flags/default/d48012369b5cb9175adc148c2a4b14d9f895ea4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTPacket.o.d 
	@${RM} ${OBJECTDIR}/MQTTPacket.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTPacket.c  -o ${OBJECTDIR}/MQTTPacket.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTPacket.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/mqtt_interface.o: mqtt_interface.c  .generated_files/flags/default/f82077da7dd0e44c40f4419559223137ed91334d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/mqtt_interface.o.d 
	@${RM} ${OBJECTDIR}/mqtt_interface.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mqtt_interface.c  -o ${OBJECTDIR}/mqtt_interface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mqtt_interface.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTFormat.o: MQTTFormat.c  .generated_files/flags/default/1b6a891c7908e683ee290c57ac9f441fd23f5fdf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTFormat.o.d 
	@${RM} ${OBJECTDIR}/MQTTFormat.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTFormat.c  -o ${OBJECTDIR}/MQTTFormat.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTFormat.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTConnectClient.o: MQTTConnectClient.c  .generated_files/flags/default/fb5e773d4f1d8dc76bc9c89880e964c08dd61855 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTConnectClient.o.d 
	@${RM} ${OBJECTDIR}/MQTTConnectClient.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTConnectClient.c  -o ${OBJECTDIR}/MQTTConnectClient.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTConnectClient.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTSerializePublish.o: MQTTSerializePublish.c  .generated_files/flags/default/322ed42d15a248d2c238f6f3511576f10d86df5e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTSerializePublish.o.d 
	@${RM} ${OBJECTDIR}/MQTTSerializePublish.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTSerializePublish.c  -o ${OBJECTDIR}/MQTTSerializePublish.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTSerializePublish.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTSubscribeClient.o: MQTTSubscribeClient.c  .generated_files/flags/default/1e6b862a5f9da4a1650c50b4e470ce93a9a9222f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTSubscribeClient.o.d 
	@${RM} ${OBJECTDIR}/MQTTSubscribeClient.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTSubscribeClient.c  -o ${OBJECTDIR}/MQTTSubscribeClient.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTSubscribeClient.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTSubscribeServer.o: MQTTSubscribeServer.c  .generated_files/flags/default/e33a028964e8c24b07b9912a50c2e6fd7f2bacf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTSubscribeServer.o.d 
	@${RM} ${OBJECTDIR}/MQTTSubscribeServer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTSubscribeServer.c  -o ${OBJECTDIR}/MQTTSubscribeServer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTSubscribeServer.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTUnsubscribeClient.o: MQTTUnsubscribeClient.c  .generated_files/flags/default/d040fd481406279f1e1c58bacd1b2787850f5d72 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTUnsubscribeClient.o.d 
	@${RM} ${OBJECTDIR}/MQTTUnsubscribeClient.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTUnsubscribeClient.c  -o ${OBJECTDIR}/MQTTUnsubscribeClient.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTUnsubscribeClient.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTUnsubscribeServer.o: MQTTUnsubscribeServer.c  .generated_files/flags/default/e9a029f94afec021f35a93835731eca597a82a4e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTUnsubscribeServer.o.d 
	@${RM} ${OBJECTDIR}/MQTTUnsubscribeServer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTUnsubscribeServer.c  -o ${OBJECTDIR}/MQTTUnsubscribeServer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTUnsubscribeServer.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTDeserializePublish.o: MQTTDeserializePublish.c  .generated_files/flags/default/353ec563c7d3fb6a393c03527272bde7568ac699 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTDeserializePublish.o.d 
	@${RM} ${OBJECTDIR}/MQTTDeserializePublish.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTDeserializePublish.c  -o ${OBJECTDIR}/MQTTDeserializePublish.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTDeserializePublish.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/MQTTConnectServer.o: MQTTConnectServer.c  .generated_files/flags/default/3159a036c570c1b69cd45a7d9a7880866c89e5bd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MQTTConnectServer.o.d 
	@${RM} ${OBJECTDIR}/MQTTConnectServer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MQTTConnectServer.c  -o ${OBJECTDIR}/MQTTConnectServer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MQTTConnectServer.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -mconst-in-code -Os -msmart-io=1 -Wall -msfr-warn=off   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/PIC24_PMP_1602_LI_BME280.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/PIC24_PMP_1602_LI_BME280.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  
	
else
${DISTDIR}/PIC24_PMP_1602_LI_BME280.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/PIC24_PMP_1602_LI_BME280.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -specs=cmd.txt -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/PIC24_PMP_1602_LI_BME280.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   
	
	@echo Normalizing hex file
	@"C:/Program Files/Microchip/MPLABX/v6.05/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files/Microchip/MPLABX/v6.05/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" ${DISTDIR}/PIC24_PMP_1602_LI_BME280.X.${IMAGE_TYPE}.hex -o${DISTDIR}/PIC24_PMP_1602_LI_BME280.X.${IMAGE_TYPE}.hex

endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
