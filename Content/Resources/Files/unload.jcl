//DBA$UNL JOB (DBAZ,950021),'LIQUI TPOC UNLD',
//        REGION=0M,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//        MSGCLASS=X,
//        CLASS=A
//*
//**********************************************************************
//*
//* DB2 ADMIN GENERATED JOB
//*
//**********************************************************ADB2ALTJ****
//**********************************************************************
//*
//**********************************************************************
//* STEP STRO0001: EXECUTE DB2 COMMAND
//*
//* RESTART JOB STEP NAME IF FAILED IN THIS STEP : STRO0001
//***************************************************ADBDCMD************
//        IF (RC GT 7) THEN
//        ELSE
//STRO0001  EXEC PGM=IKJEFT01,DYNAMNBR=100
//STEPLIB  DD DISP=SHR,DSN=DB2.V12R1M0.SDSNLOAD
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
  DSN SYSTEM(DBC1)
  -STA DB(DB2TSTE) SPACENAM(SBA01010)  ACCESS(RO)
  END
//        ENDIF
//*
//**********************************************************************
//* STEP DELU0001: DELETE OLD DATASETS
//*               ALSO TERMINATE THE UNLOAD UTILITY FOR RESTART IF
//*               PREVIOUS RUN ABNORMAL TERMINATED IN THE FOLLOWING
//*               UNLOAD STEP UNLD0001
//*
//* RESTART JOB STEP NAME IF FAILED IN THIS STEP : DELU0001
//* NOTE:
//* TO TERMINATE THE UTILITY THE FOLLOWING MUST BE DONE:
//*   REMOVE THE //* THAT OCCURS BEFORE DSN, -TERM, AND END.
//**********************************************************************
//DELU0001 EXEC PGM=IEFBR14
//SYSREC1  DD DSN=IBMUSER.DB2T.TPOC.ULD.T0001,
//            UNIT=SYSDA,DISP=(MOD,DELETE,DELETE),SPACE=(TRK,1)
//SYSREC3  DD DSN=IBMUSER.DB2T.TPOC.CNT.T0001,
//            UNIT=SYSDA,DISP=(MOD,DELETE,DELETE),SPACE=(TRK,1)
//        IF (RC GT 7) THEN
//        ELSE
//**********************************************************************
//* STEP UNLD0001: UNLOAD TABLE:
//* DB2TSTE.TPOC_LI_ALT_TAB2
//*
//* RESTART JOB STEP NAME IF FAILED IN THIS STEP : DELU0001
//**********************************************************************
//UNLD0001 EXEC DSNUPROC,SYSTEM=DBC1,
//            LIB='DB2.V12R1M0.SDSNLOAD',
//            UID='TPOCTPOC001'
//UTLPUNCH DD DSN=IBMUSER.DB2T.TPOC.CNT.T0001,
//            DISP=(,CATLG,DELETE),
//            DCB=(LRECL=80,RECFM=FB,BLKSIZE=800,DSORG=PS),
//            SPACE=(TRK,(5,5),RLSE),
//            UNIT=SYSDA
//SYSREC   DD DSN=IBMUSER.DB2T.TPOC.ULD.T0001,
//            DISP=(,CATLG,DELETE),
//            DCB=(BLKSIZE=8192),
//            SPACE=(CYL,(73,7),RLSE),
//            UNIT=SYSDA
//SYSIN  DD  *
UNLOAD TABLESPACE DB2TSTE.SBA01010
  FROM TABLE
"DB2TSTE"."TPOCTAB10"
  PUNCHDDN UTLPUNCH
//        ENDIF
