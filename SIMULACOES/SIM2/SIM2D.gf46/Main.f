!=======================================================================
! Generated by  : PSCAD v4.6.3.0
!
! Warning:  The content of this file is automatically generated.
!           Do not modify, as any changes made here will be lost!
!-----------------------------------------------------------------------
! Component     : Main
! Description   : 
!-----------------------------------------------------------------------


!=======================================================================

      SUBROUTINE MainDyn()

!---------------------------------------
! Standard includes
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 'emtstor.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's2.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'fnames.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'matlab.h'
      INCLUDE 'rtconfig.h'

!---------------------------------------
! Function/Subroutine Declarations
!---------------------------------------


!---------------------------------------
! Variable Declarations
!---------------------------------------


! Subroutine Arguments

! Electrical Node Indices

! Control Signals
      REAL     Va, Vcc, RT_1, RT_2(15), RT_3(15)
      REAL     Ia

! Internal Variables
      REAL     RVD1_1, RVD1_2, RVD1_3, RVD1_4

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER ISTOF, IT_0                         ! Storage Indices
      INTEGER SS, INODE, IBRCH                    ! SS/Node/Branch/Xfmr


!---------------------------------------
! Local Indices
!---------------------------------------

! Dsdyn <-> Dsout transfer index storage

      NTXFR = NTXFR + 1

      TXFR(NTXFR,1) = NSTOL
      TXFR(NTXFR,2) = NSTOI
      TXFR(NTXFR,3) = NSTOF
      TXFR(NTXFR,4) = NSTOC

! Define electric network subsystem number

      SS        = NODE(NNODE+1)

! Increment and assign runtime configuration call indices

      ICALL_NO  = NCALL_NO
      NCALL_NO  = NCALL_NO + 1

! Increment global storage indices

      ISTOF     = NSTOF
      NSTOF     = NSTOF + 34
      NPGB      = NPGB + 18
      INODE     = NNODE + 2
      NNODE     = NNODE + 6
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 11
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Transfers from storage arrays
!---------------------------------------

      Va       = STOF(ISTOF + 1)
      Vcc      = STOF(ISTOF + 2)
      RT_1     = STOF(ISTOF + 3)
      Ia       = STOF(ISTOF + 34)

! Array (1:15) quantities...
      DO IT_0 = 1,15
         RT_2(IT_0) = STOF(ISTOF + 3 + IT_0)
         RT_3(IT_0) = STOF(ISTOF + 18 + IT_0)
      END DO


!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


!---------------------------------------
! Configuration of Models
!---------------------------------------

      IF ( TIMEZERO ) THEN
         FILENAME = 'Main.dta'
         CALL EMTDC_OPENFILE
         SECTION = 'DATADSD:'
         CALL EMTDC_GOTOSECTION
      ENDIF
!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 1:[peswitch] Power electronic switch 
! Power Electronic Switch Model: Diode
      CALL COMPONENT_ID(ICALL_NO,592479034)
      CALL PESWITCH1_EXE(SS, (IBRCH+1), 1, 0.0)

! 1:[peswitch] Power electronic switch 
! Power Electronic Switch Model: Diode
      CALL COMPONENT_ID(ICALL_NO,273089375)
      CALL PESWITCH1_EXE(SS, (IBRCH+7), 1, 0.0)

! 1:[source_1] Single Phase Voltage Source Model 2 'Source1'
!  Single Phase AC source: Type: L
      RVD1_1 = RTCF(NRTCF)
      RVD1_2 = RTCF(NRTCF+1)
      RVD1_3 = RTCF(NRTCF+2)
      RVD1_4 = RTCF(NRTCF+3)
      NRTCF = NRTCF + 4
      CALL EMTDC_1PVSRC(SS, (IBRCH+9),RVD1_4,1,RVD1_1,RVD1_2,RVD1_3)

! 1:[peswitch] Power electronic switch 
! Power Electronic Switch Model: Diode
      CALL COMPONENT_ID(ICALL_NO,692508658)
      CALL PESWITCH1_EXE(SS, (IBRCH+3), 1, 0.0)

! 1:[peswitch] Power electronic switch 
! Power Electronic Switch Model: Diode
      CALL COMPONENT_ID(ICALL_NO,1441157342)
      CALL PESWITCH1_EXE(SS, (IBRCH+5), 1, 0.0)

!---------------------------------------
! Feedbacks and transfers to storage
!---------------------------------------

      STOF(ISTOF + 1) = Va
      STOF(ISTOF + 2) = Vcc
      STOF(ISTOF + 3) = RT_1
      STOF(ISTOF + 34) = Ia

! Array (1:15) quantities...
      DO IT_0 = 1,15
         STOF(ISTOF + 3 + IT_0) = RT_2(IT_0)
         STOF(ISTOF + 18 + IT_0) = RT_3(IT_0)
      END DO


!---------------------------------------
! Transfer to Exports
!---------------------------------------

!---------------------------------------
! Close Model Data read
!---------------------------------------

      IF ( TIMEZERO ) CALL EMTDC_CLOSEFILE
      RETURN
      END

!=======================================================================

      SUBROUTINE MainOut()

!---------------------------------------
! Standard includes
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 'emtstor.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's2.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'fnames.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'matlab.h'
      INCLUDE 'rtconfig.h'

!---------------------------------------
! Function/Subroutine Declarations
!---------------------------------------

      REAL    EMTDC_VVDC    ! 
!     SUBR    FTN180        ! FFT Calculation
      REAL    VBRANCH       ! Voltage across the branch

!---------------------------------------
! Variable Declarations
!---------------------------------------


! Electrical Node Indices
      INTEGER  NT_1, NT_3, NT_4

! Control Signals
      REAL     Va, Vcc, RT_1, RT_2(15), RT_3(15)
      REAL     Ia

! Internal Variables
      INTEGER  IVD1_1

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER ISTOL, ISTOI, ISTOF, ISTOC, IT_0    ! Storage Indices
      INTEGER IPGB                                ! Control/Monitoring
      INTEGER SS, INODE, IBRCH                    ! SS/Node/Branch/Xfmr


!---------------------------------------
! Local Indices
!---------------------------------------

! Dsdyn <-> Dsout transfer index storage

      NTXFR = NTXFR + 1

      ISTOL = TXFR(NTXFR,1)
      ISTOI = TXFR(NTXFR,2)
      ISTOF = TXFR(NTXFR,3)
      ISTOC = TXFR(NTXFR,4)

! Define electric network subsystem number

      SS        = NODE(NNODE+1)

! Increment and assign runtime configuration call indices

      ICALL_NO  = NCALL_NO
      NCALL_NO  = NCALL_NO + 1

! Increment global storage indices

      IPGB      = NPGB
      NPGB      = NPGB + 18
      INODE     = NNODE + 2
      NNODE     = NNODE + 6
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 11
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Transfers from storage arrays
!---------------------------------------

      Va       = STOF(ISTOF + 1)
      Vcc      = STOF(ISTOF + 2)
      RT_1     = STOF(ISTOF + 3)
      Ia       = STOF(ISTOF + 34)

! Array (1:15) quantities...
      DO IT_0 = 1,15
         RT_2(IT_0) = STOF(ISTOF + 3 + IT_0)
         RT_3(IT_0) = STOF(ISTOF + 18 + IT_0)
      END DO


!---------------------------------------
! Electrical Node Lookup
!---------------------------------------

      NT_1  = NODE(INODE + 1)
      NT_3  = NODE(INODE + 3)
      NT_4  = NODE(INODE + 4)

!---------------------------------------
! Configuration of Models
!---------------------------------------

      IF ( TIMEZERO ) THEN
         FILENAME = 'Main.dta'
         CALL EMTDC_OPENFILE
         SECTION = 'DATADSO:'
         CALL EMTDC_GOTOSECTION
      ENDIF
!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 10:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      Ia = ( CBR((IBRCH+10), SS))
      Va = EMTDC_VVDC(SS, NT_4, 0)

! 20:[voltmeter] Voltmeter (Line - Line) 'Vcc'
      Vcc = EMTDC_VVDC(SS, NT_1, NT_3)

! 30:[pgb] Output Channel 'Ia'

      PGB(IPGB+1) = Ia

! 40:[pgb] Output Channel 'Va'

      PGB(IPGB+2) = Va

! 50:[pgb] Output Channel 'Vcc'

      PGB(IPGB+3) = Vcc

! 60:[fft] On-Line Frequency Scanner 
      IVD1_1=0
      CALL FTN180(0,0,15,1,60.0,60.0,Ia,IVD1_1,RT_2,RT_3,RT_1)
!

! 70:[pgb] Output Channel 'FFT'

      DO IVD1_1 = 1, 15
         PGB(IPGB+4+IVD1_1-1) = RT_2(IVD1_1)
      ENDDO

!---------------------------------------
! Feedbacks and transfers to storage
!---------------------------------------

      STOF(ISTOF + 1) = Va
      STOF(ISTOF + 2) = Vcc
      STOF(ISTOF + 3) = RT_1
      STOF(ISTOF + 34) = Ia

! Array (1:15) quantities...
      DO IT_0 = 1,15
         STOF(ISTOF + 3 + IT_0) = RT_2(IT_0)
         STOF(ISTOF + 18 + IT_0) = RT_3(IT_0)
      END DO


!---------------------------------------
! Close Model Data read
!---------------------------------------

      IF ( TIMEZERO ) CALL EMTDC_CLOSEFILE
      RETURN
      END

!=======================================================================

      SUBROUTINE MainDyn_Begin()

!---------------------------------------
! Standard includes
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'rtconfig.h'

!---------------------------------------
! Function/Subroutine Declarations
!---------------------------------------


!---------------------------------------
! Variable Declarations
!---------------------------------------


! Subroutine Arguments

! Electrical Node Indices

! Control Signals

! Internal Variables

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER IT_0                                ! Storage Indices
      INTEGER SS, INODE, IBRCH                    ! SS/Node/Branch/Xfmr


!---------------------------------------
! Local Indices
!---------------------------------------


! Define electric network subsystem number

      SS        = NODE(NNODE+1)

! Increment and assign runtime configuration call indices

      ICALL_NO  = NCALL_NO
      NCALL_NO  = NCALL_NO + 1

! Increment global storage indices

      INODE     = NNODE + 2
      NNODE     = NNODE + 6
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 11
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 1:[peswitch] Power electronic switch 
      CALL PESWITCH1_CFG(0, 0,0.01, 1000000.0, 100000.0, 100000.0, 0.0, &
     &0.0)
      CALL E_BRANCH_CFG( (IBRCH+2),SS,1,0,1,5000.0,0.0,0.05)

! 1:[peswitch] Power electronic switch 
      CALL PESWITCH1_CFG(0, 0,0.01, 1000000.0, 100000.0, 100000.0, 0.0, &
     &0.0)
      CALL E_BRANCH_CFG( (IBRCH+8),SS,1,0,1,5000.0,0.0,0.05)

! 1:[source_1] Single Phase Voltage Source Model 2 'Source1'
      IF (0.002 .LE. 1.0E-38) THEN
        CALL E_BRANCH_CFG( (IBRCH+9),SS,1,0,0,1.0E-38,0.0,0.0)
      ELSE
        CALL E_BRANCH_CFG( (IBRCH+9),SS,0,1,0,0.0,0.002,0.0)
      ENDIF
      CALL E_1PVSRC_CFG(1,0,4,0.127,60.0,0.0,0.0,0.002,0.0,0.0,0.0,0.01)

! 1:[peswitch] Power electronic switch 
      CALL PESWITCH1_CFG(0, 0,0.01, 1000000.0, 100000.0, 100000.0, 0.0, &
     &0.0)
      CALL E_BRANCH_CFG( (IBRCH+4),SS,1,0,1,5000.0,0.0,0.05)

! 1:[peswitch] Power electronic switch 
      CALL PESWITCH1_CFG(0, 0,0.01, 1000000.0, 100000.0, 100000.0, 0.0, &
     &0.0)
      CALL E_BRANCH_CFG( (IBRCH+6),SS,1,0,1,5000.0,0.0,0.05)

      RETURN
      END

!=======================================================================

      SUBROUTINE MainOut_Begin()

!---------------------------------------
! Standard includes
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'rtconfig.h'

!---------------------------------------
! Function/Subroutine Declarations
!---------------------------------------


!---------------------------------------
! Variable Declarations
!---------------------------------------


! Subroutine Arguments

! Electrical Node Indices
      INTEGER  NT_1, NT_3, NT_4

! Control Signals

! Internal Variables
      INTEGER  IVD1_1

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER IT_0                                ! Storage Indices
      INTEGER SS, INODE, IBRCH                    ! SS/Node/Branch/Xfmr


!---------------------------------------
! Local Indices
!---------------------------------------


! Define electric network subsystem number

      SS        = NODE(NNODE+1)

! Increment and assign runtime configuration call indices

      ICALL_NO  = NCALL_NO
      NCALL_NO  = NCALL_NO + 1

! Increment global storage indices

      INODE     = NNODE + 2
      NNODE     = NNODE + 6
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 11
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Electrical Node Lookup
!---------------------------------------

      NT_1  = NODE(INODE + 1)
      NT_3  = NODE(INODE + 3)
      NT_4  = NODE(INODE + 4)

!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 10:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5

! 30:[pgb] Output Channel 'Ia'

! 40:[pgb] Output Channel 'Va'

! 50:[pgb] Output Channel 'Vcc'

! 60:[fft] On-Line Frequency Scanner 

! 70:[pgb] Output Channel 'FFT'

      RETURN
      END

