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
      INTEGER  NT_1(3)

! Control Signals
      REAL     RT_1(7), RT_2, RT_3, RT_4, RT_5(7)
      REAL     RT_6(7), RT_7, RT_8, RT_9
      REAL     RT_10(7), RT_11(7), RT_12(7)
      REAL     RT_13, RT_14, RT_15, RT_16, RT_17
      REAL     RT_18, RT_19, RT_20, RT_21, RT_22
      REAL     RT_23, RT_24, RT_25(12), RT_26(7)
      REAL     RT_27, RT_28, RT_29, RT_30(7)
      REAL     RT_31(7), RT_32, RT_33, RT_34
      REAL     RT_35(7), RT_36(7), RT_37(7)
      REAL     Va(3), Ia(3)

! Internal Variables
      REAL     RVD1_1, RVD1_2, RVD1_3, RVD1_4
      REAL     RVD1_5, RVD1_6, RVD1_7

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
      NSTOF     = NSTOF + 126
      NPGB      = NPGB + 12
      INODE     = NNODE + 2
      NNODE     = NNODE + 14
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 27
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Transfers from storage arrays
!---------------------------------------

      RT_2     = STOF(ISTOF + 8)
      RT_3     = STOF(ISTOF + 9)
      RT_4     = STOF(ISTOF + 10)
      RT_7     = STOF(ISTOF + 25)
      RT_8     = STOF(ISTOF + 26)
      RT_9     = STOF(ISTOF + 27)
      RT_13    = STOF(ISTOF + 49)
      RT_14    = STOF(ISTOF + 50)
      RT_15    = STOF(ISTOF + 51)
      RT_16    = STOF(ISTOF + 52)
      RT_17    = STOF(ISTOF + 53)
      RT_18    = STOF(ISTOF + 54)
      RT_19    = STOF(ISTOF + 55)
      RT_20    = STOF(ISTOF + 56)
      RT_21    = STOF(ISTOF + 57)
      RT_22    = STOF(ISTOF + 58)
      RT_23    = STOF(ISTOF + 59)
      RT_24    = STOF(ISTOF + 60)
      RT_27    = STOF(ISTOF + 80)
      RT_28    = STOF(ISTOF + 81)
      RT_29    = STOF(ISTOF + 82)
      RT_32    = STOF(ISTOF + 97)
      RT_33    = STOF(ISTOF + 98)
      RT_34    = STOF(ISTOF + 99)

! Array (1:3) quantities...
      DO IT_0 = 1,3
         Va(IT_0) = STOF(ISTOF + 120 + IT_0)
         Ia(IT_0) = STOF(ISTOF + 123 + IT_0)
      END DO

! Array (1:7) quantities...
      DO IT_0 = 1,7
         RT_1(IT_0) = STOF(ISTOF + 0 + IT_0)
         RT_5(IT_0) = STOF(ISTOF + 10 + IT_0)
         RT_6(IT_0) = STOF(ISTOF + 17 + IT_0)
         RT_10(IT_0) = STOF(ISTOF + 27 + IT_0)
         RT_11(IT_0) = STOF(ISTOF + 34 + IT_0)
         RT_12(IT_0) = STOF(ISTOF + 41 + IT_0)
         RT_26(IT_0) = STOF(ISTOF + 72 + IT_0)
         RT_30(IT_0) = STOF(ISTOF + 82 + IT_0)
         RT_31(IT_0) = STOF(ISTOF + 89 + IT_0)
         RT_35(IT_0) = STOF(ISTOF + 99 + IT_0)
         RT_36(IT_0) = STOF(ISTOF + 106 + IT_0)
         RT_37(IT_0) = STOF(ISTOF + 113 + IT_0)
      END DO

! Array (1:12) quantities...
      DO IT_0 = 1,12
         RT_25(IT_0) = STOF(ISTOF + 60 + IT_0)
      END DO


!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


! Array (1:3) quantities...
      DO IT_0 = 1,3
         NT_1(IT_0) = NODE(INODE + 9 + IT_0)
      END DO

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


! 1:[source3] Three Phase Voltage Source Model 1 'Source1'
!  3-Phase source: Source1
      RVD1_1 = RTCF(NRTCF+12)
      RVD1_2 = RTCF(NRTCF+14)
      RVD1_3 = RTCF(NRTCF+13)
      CALL ESYS651_EXE(SS, (IBRCH+1), (IBRCH+2), (IBRCH+3),0,0,0, SS, NT&
     &_1(1),NT_1(2),NT_1(3), 0, RVD1_2, RVD1_1, 0.05, 1.0, 1.0, 1.0,RVD1&
     &_3, 1.0, 0.02, 0.05, 1.0, 0.02, 0.05, RVD1_4, RVD1_5, RVD1_6, RVD1&
     &_7)

! 1:[fixed_load] Fixed Load 
      CALL LOAD3P1_EXE(SS, (IBRCH+7), (IBRCH+8), (IBRCH+9), (IBRCH+10), &
     &(IBRCH+11), (IBRCH+12))

! 1:[fixed_load] Fixed Load 
      CALL LOAD3P1_EXE(SS, (IBRCH+16), (IBRCH+17), (IBRCH+18), (IBRCH+13&
     &), (IBRCH+14), (IBRCH+15))

!---------------------------------------
! Feedbacks and transfers to storage
!---------------------------------------

      STOF(ISTOF + 8) = RT_2
      STOF(ISTOF + 9) = RT_3
      STOF(ISTOF + 10) = RT_4
      STOF(ISTOF + 25) = RT_7
      STOF(ISTOF + 26) = RT_8
      STOF(ISTOF + 27) = RT_9
      STOF(ISTOF + 49) = RT_13
      STOF(ISTOF + 50) = RT_14
      STOF(ISTOF + 51) = RT_15
      STOF(ISTOF + 52) = RT_16
      STOF(ISTOF + 53) = RT_17
      STOF(ISTOF + 54) = RT_18
      STOF(ISTOF + 55) = RT_19
      STOF(ISTOF + 56) = RT_20
      STOF(ISTOF + 57) = RT_21
      STOF(ISTOF + 58) = RT_22
      STOF(ISTOF + 59) = RT_23
      STOF(ISTOF + 60) = RT_24
      STOF(ISTOF + 80) = RT_27
      STOF(ISTOF + 81) = RT_28
      STOF(ISTOF + 82) = RT_29
      STOF(ISTOF + 97) = RT_32
      STOF(ISTOF + 98) = RT_33
      STOF(ISTOF + 99) = RT_34

! Array (1:3) quantities...
      DO IT_0 = 1,3
         STOF(ISTOF + 120 + IT_0) = Va(IT_0)
         STOF(ISTOF + 123 + IT_0) = Ia(IT_0)
      END DO

! Array (1:7) quantities...
      DO IT_0 = 1,7
         STOF(ISTOF + 0 + IT_0) = RT_1(IT_0)
         STOF(ISTOF + 10 + IT_0) = RT_5(IT_0)
         STOF(ISTOF + 17 + IT_0) = RT_6(IT_0)
         STOF(ISTOF + 27 + IT_0) = RT_10(IT_0)
         STOF(ISTOF + 34 + IT_0) = RT_11(IT_0)
         STOF(ISTOF + 41 + IT_0) = RT_12(IT_0)
         STOF(ISTOF + 72 + IT_0) = RT_26(IT_0)
         STOF(ISTOF + 82 + IT_0) = RT_30(IT_0)
         STOF(ISTOF + 89 + IT_0) = RT_31(IT_0)
         STOF(ISTOF + 99 + IT_0) = RT_35(IT_0)
         STOF(ISTOF + 106 + IT_0) = RT_36(IT_0)
         STOF(ISTOF + 113 + IT_0) = RT_37(IT_0)
      END DO

! Array (1:12) quantities...
      DO IT_0 = 1,12
         STOF(ISTOF + 60 + IT_0) = RT_25(IT_0)
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

!---------------------------------------
! Variable Declarations
!---------------------------------------


! Electrical Node Indices
      INTEGER  NT_1(3)

! Control Signals
      REAL     RT_1(7), RT_2, RT_3, RT_4, RT_5(7)
      REAL     RT_6(7), RT_7, RT_8, RT_9
      REAL     RT_10(7), RT_11(7), RT_12(7)
      REAL     RT_13, RT_14, RT_15, RT_16, RT_17
      REAL     RT_18, RT_19, RT_20, RT_21, RT_22
      REAL     RT_23, RT_24, RT_25(12), RT_26(7)
      REAL     RT_27, RT_28, RT_29, RT_30(7)
      REAL     RT_31(7), RT_32, RT_33, RT_34
      REAL     RT_35(7), RT_36(7), RT_37(7)
      REAL     Va(3), Ia(3)

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
      NPGB      = NPGB + 12
      INODE     = NNODE + 2
      NNODE     = NNODE + 14
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 27
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Transfers from storage arrays
!---------------------------------------

      RT_2     = STOF(ISTOF + 8)
      RT_3     = STOF(ISTOF + 9)
      RT_4     = STOF(ISTOF + 10)
      RT_7     = STOF(ISTOF + 25)
      RT_8     = STOF(ISTOF + 26)
      RT_9     = STOF(ISTOF + 27)
      RT_13    = STOF(ISTOF + 49)
      RT_14    = STOF(ISTOF + 50)
      RT_15    = STOF(ISTOF + 51)
      RT_16    = STOF(ISTOF + 52)
      RT_17    = STOF(ISTOF + 53)
      RT_18    = STOF(ISTOF + 54)
      RT_19    = STOF(ISTOF + 55)
      RT_20    = STOF(ISTOF + 56)
      RT_21    = STOF(ISTOF + 57)
      RT_22    = STOF(ISTOF + 58)
      RT_23    = STOF(ISTOF + 59)
      RT_24    = STOF(ISTOF + 60)
      RT_27    = STOF(ISTOF + 80)
      RT_28    = STOF(ISTOF + 81)
      RT_29    = STOF(ISTOF + 82)
      RT_32    = STOF(ISTOF + 97)
      RT_33    = STOF(ISTOF + 98)
      RT_34    = STOF(ISTOF + 99)

! Array (1:3) quantities...
      DO IT_0 = 1,3
         Va(IT_0) = STOF(ISTOF + 120 + IT_0)
         Ia(IT_0) = STOF(ISTOF + 123 + IT_0)
      END DO

! Array (1:7) quantities...
      DO IT_0 = 1,7
         RT_1(IT_0) = STOF(ISTOF + 0 + IT_0)
         RT_5(IT_0) = STOF(ISTOF + 10 + IT_0)
         RT_6(IT_0) = STOF(ISTOF + 17 + IT_0)
         RT_10(IT_0) = STOF(ISTOF + 27 + IT_0)
         RT_11(IT_0) = STOF(ISTOF + 34 + IT_0)
         RT_12(IT_0) = STOF(ISTOF + 41 + IT_0)
         RT_26(IT_0) = STOF(ISTOF + 72 + IT_0)
         RT_30(IT_0) = STOF(ISTOF + 82 + IT_0)
         RT_31(IT_0) = STOF(ISTOF + 89 + IT_0)
         RT_35(IT_0) = STOF(ISTOF + 99 + IT_0)
         RT_36(IT_0) = STOF(ISTOF + 106 + IT_0)
         RT_37(IT_0) = STOF(ISTOF + 113 + IT_0)
      END DO

! Array (1:12) quantities...
      DO IT_0 = 1,12
         RT_25(IT_0) = STOF(ISTOF + 60 + IT_0)
      END DO


!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


! Array (1:3) quantities...
      DO IT_0 = 1,3
         NT_1(IT_0) = NODE(INODE + 9 + IT_0)
      END DO

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
      Ia(1) = ( CBR((IBRCH+4), SS))
      Ia(2) = ( CBR((IBRCH+5), SS))
      Ia(3) = ( CBR((IBRCH+6), SS))
      Va(1) = EMTDC_VVDC(SS, NT_1(1), 0)
      Va(2) = EMTDC_VVDC(SS, NT_1(2), 0)
      Va(3) = EMTDC_VVDC(SS, NT_1(3), 0)

! 20:[datatap] Scalar/Array Tap 
      RT_2 = Va(1)

! 30:[datatap] Scalar/Array Tap 
      RT_3 = Va(2)

! 40:[datatap] Scalar/Array Tap 
      RT_4 = Va(3)

! 50:[datatap] Scalar/Array Tap 
      RT_27 = Ia(1)

! 60:[datatap] Scalar/Array Tap 
      RT_28 = Ia(2)

! 70:[datatap] Scalar/Array Tap 
      RT_29 = Ia(3)

! 80:[fft] On-Line Frequency Scanner 
      IVD1_1=0
      CALL FTN180(0,1,7,1,60.0,60.0,RT_2,IVD1_1,RT_11,RT_5,RT_7)
      CALL FTN180(0,1,7,1,60.0,60.0,RT_3,IVD1_1,RT_10,RT_1,RT_9)
      CALL FTN180(0,1,7,1,60.0,60.0,RT_4,IVD1_1,RT_12,RT_6,RT_8)
!

! 90:[datatap] Scalar/Array Tap 
      RT_16 = RT_1(1)

! 100:[datatap] Scalar/Array Tap 
      RT_14 = RT_6(1)

! 110:[fft] On-Line Frequency Scanner 
      IVD1_1=0
      CALL FTN180(0,1,7,1,60.0,60.0,RT_27,IVD1_1,RT_36,RT_30,RT_32)
      CALL FTN180(0,1,7,1,60.0,60.0,RT_28,IVD1_1,RT_35,RT_26,RT_34)
      CALL FTN180(0,1,7,1,60.0,60.0,RT_29,IVD1_1,RT_37,RT_31,RT_33)
!

! 120:[datatap] Scalar/Array Tap 
      RT_22 = RT_26(1)

! 130:[datatap] Scalar/Array Tap 
      RT_24 = RT_31(1)

! 140:[datatap] Scalar/Array Tap 
      RT_13 = RT_11(1)

! 150:[datatap] Scalar/Array Tap 
      RT_15 = RT_10(1)

! 160:[datatap] Scalar/Array Tap 
      RT_17 = RT_12(1)

! 170:[datatap] Scalar/Array Tap 
      RT_18 = RT_5(1)

! 180:[datatap] Scalar/Array Tap 
      RT_19 = RT_36(1)

! 190:[datatap] Scalar/Array Tap 
      RT_21 = RT_35(1)

! 200:[datatap] Scalar/Array Tap 
      RT_23 = RT_37(1)

! 210:[datatap] Scalar/Array Tap 
      RT_20 = RT_30(1)

! 220:[datamerge] Merges data signals into an array 
      RT_25(1) = RT_13
      RT_25(2) = RT_14
      RT_25(3) = RT_15
      RT_25(4) = RT_16
      RT_25(5) = RT_17
      RT_25(6) = RT_18
      RT_25(7) = RT_19
      RT_25(8) = RT_20
      RT_25(9) = RT_21
      RT_25(10) = RT_22
      RT_25(11) = RT_23
      RT_25(12) = RT_24

! 230:[pgb] Output Channel 'Fasores'

      DO IVD1_1 = 1, 12
         PGB(IPGB+1+IVD1_1-1) = RT_25(IVD1_1)
      ENDDO

!---------------------------------------
! Feedbacks and transfers to storage
!---------------------------------------

      STOF(ISTOF + 8) = RT_2
      STOF(ISTOF + 9) = RT_3
      STOF(ISTOF + 10) = RT_4
      STOF(ISTOF + 25) = RT_7
      STOF(ISTOF + 26) = RT_8
      STOF(ISTOF + 27) = RT_9
      STOF(ISTOF + 49) = RT_13
      STOF(ISTOF + 50) = RT_14
      STOF(ISTOF + 51) = RT_15
      STOF(ISTOF + 52) = RT_16
      STOF(ISTOF + 53) = RT_17
      STOF(ISTOF + 54) = RT_18
      STOF(ISTOF + 55) = RT_19
      STOF(ISTOF + 56) = RT_20
      STOF(ISTOF + 57) = RT_21
      STOF(ISTOF + 58) = RT_22
      STOF(ISTOF + 59) = RT_23
      STOF(ISTOF + 60) = RT_24
      STOF(ISTOF + 80) = RT_27
      STOF(ISTOF + 81) = RT_28
      STOF(ISTOF + 82) = RT_29
      STOF(ISTOF + 97) = RT_32
      STOF(ISTOF + 98) = RT_33
      STOF(ISTOF + 99) = RT_34

! Array (1:3) quantities...
      DO IT_0 = 1,3
         STOF(ISTOF + 120 + IT_0) = Va(IT_0)
         STOF(ISTOF + 123 + IT_0) = Ia(IT_0)
      END DO

! Array (1:7) quantities...
      DO IT_0 = 1,7
         STOF(ISTOF + 0 + IT_0) = RT_1(IT_0)
         STOF(ISTOF + 10 + IT_0) = RT_5(IT_0)
         STOF(ISTOF + 17 + IT_0) = RT_6(IT_0)
         STOF(ISTOF + 27 + IT_0) = RT_10(IT_0)
         STOF(ISTOF + 34 + IT_0) = RT_11(IT_0)
         STOF(ISTOF + 41 + IT_0) = RT_12(IT_0)
         STOF(ISTOF + 72 + IT_0) = RT_26(IT_0)
         STOF(ISTOF + 82 + IT_0) = RT_30(IT_0)
         STOF(ISTOF + 89 + IT_0) = RT_31(IT_0)
         STOF(ISTOF + 99 + IT_0) = RT_35(IT_0)
         STOF(ISTOF + 106 + IT_0) = RT_36(IT_0)
         STOF(ISTOF + 113 + IT_0) = RT_37(IT_0)
      END DO

! Array (1:12) quantities...
      DO IT_0 = 1,12
         STOF(ISTOF + 60 + IT_0) = RT_25(IT_0)
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
      REAL     RVD1_1, RVD1_2

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
      NNODE     = NNODE + 14
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 27
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 1:[source3] Three Phase Voltage Source Model 1 'Source1'
      CALL COMPONENT_ID(ICALL_NO,1172838013)
      RVD1_1 = 1.0
      RVD1_2 = 0.1
      CALL ESYS651_CFG(3,2,0,0,0,SS, (IBRCH+1), (IBRCH+2), (IBRCH+3),0,0&
     &,0, 60.0,60.0,0.0,230.0,0.0,0.0,100.0,230.0,230.0, 1.0,80.0,2.0,1.&
     &0,1.0,0.15, 1.0,80.0,RVD1_1,RVD1_2)

! 1:[fixed_load] Fixed Load 
      CALL LOAD1P1_CFG(132.790562,60.0,10.0,5.0,2.0,2.0,0.0,0.0)

! 1:[fixed_load] Fixed Load 
      CALL LOAD1P1_CFG(132.790562,60.0,8.0,2.0,2.0,2.0,0.0,0.0)

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
      INTEGER  NT_1(3)

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
      NNODE     = NNODE + 14
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 27
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


! Array (1:3) quantities...
      DO IT_0 = 1,3
         NT_1(IT_0) = NODE(INODE + 9 + IT_0)
      END DO

!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 10:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5

! 20:[datatap] Scalar/Array Tap 

! 30:[datatap] Scalar/Array Tap 

! 40:[datatap] Scalar/Array Tap 

! 50:[datatap] Scalar/Array Tap 

! 60:[datatap] Scalar/Array Tap 

! 70:[datatap] Scalar/Array Tap 

! 80:[fft] On-Line Frequency Scanner 

! 90:[datatap] Scalar/Array Tap 

! 100:[datatap] Scalar/Array Tap 

! 110:[fft] On-Line Frequency Scanner 

! 120:[datatap] Scalar/Array Tap 

! 130:[datatap] Scalar/Array Tap 

! 140:[datatap] Scalar/Array Tap 

! 150:[datatap] Scalar/Array Tap 

! 160:[datatap] Scalar/Array Tap 

! 170:[datatap] Scalar/Array Tap 

! 180:[datatap] Scalar/Array Tap 

! 190:[datatap] Scalar/Array Tap 

! 200:[datatap] Scalar/Array Tap 

! 210:[datatap] Scalar/Array Tap 

! 220:[datamerge] Merges data signals into an array 

! 230:[pgb] Output Channel 'Fasores'

      RETURN
      END
