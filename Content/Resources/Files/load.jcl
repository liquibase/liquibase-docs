//DBA$LDA JOB (DBAZ,950021),'LIQUI TPOC LDA',
//        REGION=0M,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//        MSGCLASS=X,
//        CLASS=A,TIME=NOLIMIT
//*
//**********************************************************************
//*
//* DB2 ADMIN GENERATED JOB
//*
//**********************************************************ADB2ALTJ****
//**********************************************************************
//*
//**********************************************************************
//**********************************************************************
//* STEP DELU0002: DELETE OLD DATASETS
//*               ALSO TERMINATE THE UNLOAD UTILITY FOR RESTART IF
//*               PREVIOUS RUN ABNORMAL TERMINATED IN THE FOLLOWING
//*               UNLOAD STEP UNLD0001
//*
//* RESTART JOB STEP NAME IF FAILED IN THIS STEP : DELU0001
//* NOTE:
//* TO TERMINATE THE UTILITY THE FOLLOWING MUST BE DONE:
//*   REMOVE THE //* THAT OCCURS BEFORE DSN, -TERM, AND END.
//**********************************************************************
//DELU0002 EXEC PGM=IEFBR14
//SYSREC1  DD DSN=IBMUSER.DB2T.TPOC.SDISC.T0001,
//            UNIT=SYSDA,DISP=(MOD,DELETE,DELETE),SPACE=(TRK,1)
//*
//**********************************************************************
//* STEP LOAD0001: LOAD TABLE :
//* DB2TSTE.TPOC_LI_ALT_TAB2
//* SKPCONV = Y
//*
//* RESTART JOB STEP NAME IF FAILED IN THIS STEP : LOAD0001.DSNUPROC
//*
//* TO RESTART, SPECIFY THE STEPNAME IN THE JOB CARD AND
//* UNCOMMENT THE FOLLOWING JCL STATEMENT BELOW:
//* //*            UTPROC='RESTART(PHASE)',
//**********************************************************************
//        IF (RC GT 7) THEN
//        ELSE
//LOAD0001     EXEC DSNUPROC,SYSTEM=DBC1,
//             LIB='DB2.V12R1M0.SDSNLOAD',
//             UID='TPOCTPOC001'
//DSNUPROC.SYSREC DD DSN=IBMUSER.DB2T.TPOC.ULD.T0001,
//             DISP=SHR
//DSNUPROC.SYSDISC DD DSN=IBMUSER.DB2T.TPOC.SDISC.T0001,
//             DISP=(,CATLG,DELETE),
//             DCB=*.SYSREC,
//             SPACE=(CYL,(73,7),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SYSERR DD DSN=IBMUSER.DB2T.TPOC.ULD.T0001,
//             DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(24,12),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SYSIN DD *
LOAD DATA INDDN SYSREC   RESUME NO
 EBCDIC  CCSID(00037,00000,00000)
 ENFORCE CONSTRAINTS
 INTO TABLE "DB2TSTE"."TPOCTAB10"
 NUMRECS               860021
   (
    STUDENT_ID                            POSITION(    3:    6)
      INTEGER                                      ,
    STUDENT_TYP_C                         POSITION(    7:    8)
      CHAR    (    2)                              ,
    STUDENT_SEQ                           POSITION(    9:   10)
      SMALLINT                                     ,
    STUDENT_MAJOR                         POSITION(   11:   45)
      CHAR    (   35)                              ,
    START_DT                              POSITION(   46:   55)
      DATE     EXTERNAL                            ,
    LAST_MTN_DT                           POSITION(   56:   65)
      DATE     EXTERNAL                            ,
    LAST_MTN_TM                           POSITION(   66:   73)
      TIME     EXTERNAL                            ,
    LAST_MTN_ID                           POSITION(   74:   81)
      CHAR    (    8)
   )
/*
//  DD DATA,DLM='@@'
@@
//DSNUPROC.SYSUT1 DD DSN=IBMUSER.DB2T.TPOC.SUT1.T0001,
//             DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(24,12),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SORTOUT DD DSN=IBMUSER.DB2T.TPOC.SOUT.T0001,
//             DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(24,12),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SORTWK01 DD DSN=IBMUSER.DB2T.TPOC.SW01.T0001,
//             DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(24,12),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SORTWK02 DD DSN=IBMUSER.DB2T.TPOC.SW02.T0001,
//             DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(24,12),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SORTWK03 DD DSN=IBMUSER.DB2T.TPOC.SW03.T0001,
//             DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(24,12),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SORTWK04 DD DSN=IBMUSER.DB2T.TPOC.SW04.T0001,
//             DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(24,12),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SYSMAP DD DSN=IBMUSER.DB2T.TPOC.SMAP.T0001,
//             DISP=(MOD,DELETE,CATLG),
//             SPACE=(CYL,(24,12),RLSE),
//             UNIT=SYSDA
//DSNUPROC.SYSTEMPL DD *
/*
//        ENDIF
//*
//**********************************************************************
//* STEP CHCK0001: RUN CHECK DATA
//*
//* RESTART JOB STEP NAME IF FAILED IN THIS STEP : CHCK0001
//**********************************************************************
//        IF (RC GT 7) THEN
//        ELSE
//**********************************************************************
//* STEP DLC20002: DELETE OLD CONVERTED FILES
//*
//*                RESTART POINT IF PREVIOUS RUN ABNORMAL TERMINATED
//*                IN THE FOLLOWING CONVERT STEP CNV20001
//*
//* RESTART JOB STEP NAME IF FAILED IN THIS STEP : DLC20001
//**********************************************************************
//DLC20002 EXEC PGM=IEFBR14
//DD1      DD DSN=IBMUSER.DB2T.TPOC.CSUT1.T0001,
//            SPACE=(TRK,(0,1)),
//            UNIT=SYSDA,DISP=(MOD,DELETE,DELETE)
//DD2      DD DSN=IBMUSER.DB2T.TPOC.CSOUT.T0001,
//            SPACE=(TRK,(0,1)),
//            UNIT=SYSDA,DISP=(MOD,DELETE,DELETE)
//DD3      DD DSN=IBMUSER.DB2T.TPOC.CSERR.T0001,
//            SPACE=(TRK,(0,1)),
//            UNIT=SYSDA,DISP=(MOD,DELETE,DELETE)
//SYSIN  DD *
CHECK DATA TABLESPACE DB2TSTE.SBA01010
  SORTDEVT SYSDA
  SHRLEVEL REFERENCE
  DELETE YES
/*
//        ENDIF
//        IF (RC GT 7) THEN
//        ELSE
//**********************************************************************
//* STEP RST0001: RUN RUNSTATS
//*
//* RESTART JOB STEP NAME IF FAILED IN THIS STEP : RST0001.DSNUPROC
//*
//* TO RESTART, SPECIFY THE STEPNAME IN THE JOB CARD AND
//* UNCOMMENT THE FOLLOWING JCL STATEMENT BELOW:
//* //*            UTPROC='RESTART(PHASE)',
//**********************************************************************
//RST0001   EXEC DSNUPROC,SYSTEM=DBC1,
//             LIB='DB2.V12R1M0.SDSNLOAD',
//             UID='TPOCTPOC001'
//RNPRIN01 DD DUMMY
//STPRIN01 DD DUMMY
//DSNUPROC.SYSIN  DD  *
RUNSTATS TABLESPACE DB2TSTE.SBA01010
  TABLE(
"DB2TSTE"."TPOCTAB10"
       )
  INDEX(ALL)
  SHRLEVEL(CHANGE)
//        ENDIF
//*
//        IF (RC GT 7) THEN
//        ELSE
//STRW0001  EXEC PGM=IKJEFT01,DYNAMNBR=100
//STEPLIB  DD DISP=SHR,DSN=DB2.V12R1M0.SDSNLOAD
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
  DSN SYSTEM(DBC1)
  -STA DB(DB2TSTE) SPACENAM(SBA01010)  ACCESS(RW)
  END
//        ENDIF

