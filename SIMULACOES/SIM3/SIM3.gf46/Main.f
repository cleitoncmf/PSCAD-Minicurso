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
      REAL     Ia(3), Va(3), Qa, Pa, Pb, Qb
      REAL     Vb(3), Ib(3), Ic(3), Vc(3), Qc, Pc
      REAL     Vrmsa, Irmsa, Phia, Vrmsb, Irmsb
      REAL     phib, Vrmsc, Irmsc, phic

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
      NSTOF     = NSTOF + 33
      NPGB      = NPGB + 24
      INODE     = NNODE + 2
      NNODE     = NNODE + 11
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 18
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Transfers from storage arrays
!---------------------------------------

      Qa       = STOF(ISTOF + 7)
      Pa       = STOF(ISTOF + 8)
      Pb       = STOF(ISTOF + 9)
      Qb       = STOF(ISTOF + 10)
      Qc       = STOF(ISTOF + 23)
      Pc       = STOF(ISTOF + 24)
      Vrmsa    = STOF(ISTOF + 25)
      Irmsa    = STOF(ISTOF + 26)
      Phia     = STOF(ISTOF + 27)
      Vrmsb    = STOF(ISTOF + 28)
      Irmsb    = STOF(ISTOF + 29)
      phib     = STOF(ISTOF + 30)
      Vrmsc    = STOF(ISTOF + 31)
      Irmsc    = STOF(ISTOF + 32)
      phic     = STOF(ISTOF + 33)

! Array (1:3) quantities...
      DO IT_0 = 1,3
         Ia(IT_0) = STOF(ISTOF + 0 + IT_0)
         Va(IT_0) = STOF(ISTOF + 3 + IT_0)
         Vb(IT_0) = STOF(ISTOF + 10 + IT_0)
         Ib(IT_0) = STOF(ISTOF + 13 + IT_0)
         Ic(IT_0) = STOF(ISTOF + 16 + IT_0)
         Vc(IT_0) = STOF(ISTOF + 19 + IT_0)
      END DO


!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


! Array (1:3) quantities...
      DO IT_0 = 1,3
         NT_1(IT_0) = NODE(INODE + 6 + IT_0)
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

!---------------------------------------
! Feedbacks and transfers to storage
!---------------------------------------

      STOF(ISTOF + 7) = Qa
      STOF(ISTOF + 8) = Pa
      STOF(ISTOF + 9) = Pb
      STOF(ISTOF + 10) = Qb
      STOF(ISTOF + 23) = Qc
      STOF(ISTOF + 24) = Pc
      STOF(ISTOF + 25) = Vrmsa
      STOF(ISTOF + 26) = Irmsa
      STOF(ISTOF + 27) = Phia
      STOF(ISTOF + 28) = Vrmsb
      STOF(ISTOF + 29) = Irmsb
      STOF(ISTOF + 30) = phib
      STOF(ISTOF + 31) = Vrmsc
      STOF(ISTOF + 32) = Irmsc
      STOF(ISTOF + 33) = phic

! Array (1:3) quantities...
      DO IT_0 = 1,3
         STOF(ISTOF + 0 + IT_0) = Ia(IT_0)
         STOF(ISTOF + 3 + IT_0) = Va(IT_0)
         STOF(ISTOF + 10 + IT_0) = Vb(IT_0)
         STOF(ISTOF + 13 + IT_0) = Ib(IT_0)
         STOF(ISTOF + 16 + IT_0) = Ic(IT_0)
         STOF(ISTOF + 19 + IT_0) = Vc(IT_0)
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
      REAL    P3PH3         ! 
      REAL    Q3PH3         ! 
      REAL    VM3PH2        ! '3 Phase RMS Voltage Measurement'
      REAL    RMS3PH        ! '3 Phase RMS Measurement'
      REAL    REALPOLE      ! 
!     SUBR    MPHASE3PS     ! Phase Measurement in a 3p signal

!---------------------------------------
! Variable Declarations
!---------------------------------------


! Electrical Node Indices
      INTEGER  Bus1(3), NT_1(3)

! Control Signals
      REAL     Ia(3), Va(3), Qa, Pa, Pb, Qb
      REAL     Vb(3), Ib(3), Ic(3), Vc(3), Qc, Pc
      REAL     Vrmsa, Irmsa, Phia, Vrmsb, Irmsb
      REAL     phib, Vrmsc, Irmsc, phic

! Internal Variables
      INTEGER  IVD1_1
      REAL     RVD1_1, RVD1_2, RVD1_3, RVD1_4

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
      NPGB      = NPGB + 24
      INODE     = NNODE + 2
      NNODE     = NNODE + 11
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 18
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Transfers from storage arrays
!---------------------------------------

      Qa       = STOF(ISTOF + 7)
      Pa       = STOF(ISTOF + 8)
      Pb       = STOF(ISTOF + 9)
      Qb       = STOF(ISTOF + 10)
      Qc       = STOF(ISTOF + 23)
      Pc       = STOF(ISTOF + 24)
      Vrmsa    = STOF(ISTOF + 25)
      Irmsa    = STOF(ISTOF + 26)
      Phia     = STOF(ISTOF + 27)
      Vrmsb    = STOF(ISTOF + 28)
      Irmsb    = STOF(ISTOF + 29)
      phib     = STOF(ISTOF + 30)
      Vrmsc    = STOF(ISTOF + 31)
      Irmsc    = STOF(ISTOF + 32)
      phic     = STOF(ISTOF + 33)

! Array (1:3) quantities...
      DO IT_0 = 1,3
         Ia(IT_0) = STOF(ISTOF + 0 + IT_0)
         Va(IT_0) = STOF(ISTOF + 3 + IT_0)
         Vb(IT_0) = STOF(ISTOF + 10 + IT_0)
         Ib(IT_0) = STOF(ISTOF + 13 + IT_0)
         Ic(IT_0) = STOF(ISTOF + 16 + IT_0)
         Vc(IT_0) = STOF(ISTOF + 19 + IT_0)
      END DO


!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


! Array (1:3) quantities...
      DO IT_0 = 1,3
         Bus1(IT_0) = NODE(INODE + 0 + IT_0)
         NT_1(IT_0) = NODE(INODE + 6 + IT_0)
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
      Ib(1) = ( CBR((IBRCH+4), SS))
      Ib(2) = ( CBR((IBRCH+5), SS))
      Ib(3) = ( CBR((IBRCH+6), SS))
      Vb(1) = EMTDC_VVDC(SS, Bus1(1), 0)
      Vb(2) = EMTDC_VVDC(SS, Bus1(2), 0)
      Vb(3) = EMTDC_VVDC(SS, Bus1(3), 0)
      RVD1_1 = RTCF(IVD1_1) * P3PH3(SS, (IBRCH+4), (IBRCH+5), (IBRCH+6),&
     &RTCF(IVD1_1+2),0)
      Pb = RVD1_1
      RVD1_1 = RTCF(IVD1_1) * Q3PH3(SS, (IBRCH+4), (IBRCH+5), (IBRCH+6),&
     &RTCF(IVD1_1+2),0)
      Qb = RVD1_1
      RVD1_1 = RTCF(IVD1_1+1) * VM3PH2(SS, Bus1(1), Bus1(2), Bus1(3), RT&
     &CF(IVD1_1+2))
      Vrmsb = RVD1_1
      RVD1_1 = RMS3PH(( CBR((IBRCH+4), SS)),( CBR((IBRCH+5), SS)),( CBR(&
     &(IBRCH+6), SS)))
      RVD1_1 = REALPOLE(0,1,0,RTCF(IVD1_1+4),RTCF(IVD1_1+2),RVD1_1,0.0,0&
     &.0,RTCF(IVD1_1+2))
      Irmsb = RVD1_1
      RVD1_2 = EMTDC_VVDC(SS, Bus1(1), 0)
      RVD1_3 = EMTDC_VVDC(SS, Bus1(2), 0)
      RVD1_4 = EMTDC_VVDC(SS, Bus1(3), 0)
      CALL MPHASE3PS(0, 1, RVD1_2, RVD1_3, RVD1_4, RTCF(IVD1_1+2), RTCF(&
     &IVD1_1+3) , RVD1_1)
      phib = RVD1_1

! 20:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      Ia(1) = ( CBR((IBRCH+16), SS))
      Ia(2) = ( CBR((IBRCH+17), SS))
      Ia(3) = ( CBR((IBRCH+18), SS))
      Va(1) = EMTDC_VVDC(SS, NT_1(1), 0)
      Va(2) = EMTDC_VVDC(SS, NT_1(2), 0)
      Va(3) = EMTDC_VVDC(SS, NT_1(3), 0)
      RVD1_1 = RTCF(IVD1_1) * P3PH3(SS, (IBRCH+16), (IBRCH+17), (IBRCH+1&
     &8),RTCF(IVD1_1+2),0)
      Pa = RVD1_1
      RVD1_1 = RTCF(IVD1_1) * Q3PH3(SS, (IBRCH+16), (IBRCH+17), (IBRCH+1&
     &8),RTCF(IVD1_1+2),0)
      Qa = RVD1_1
      RVD1_1 = RTCF(IVD1_1+1) * VM3PH2(SS, NT_1(1), NT_1(2), NT_1(3), RT&
     &CF(IVD1_1+2))
      Vrmsa = RVD1_1
      RVD1_1 = RMS3PH(( CBR((IBRCH+16), SS)),( CBR((IBRCH+17), SS)),( CB&
     &R((IBRCH+18), SS)))
      RVD1_1 = REALPOLE(0,1,0,RTCF(IVD1_1+4),RTCF(IVD1_1+2),RVD1_1,0.0,0&
     &.0,RTCF(IVD1_1+2))
      Irmsa = RVD1_1
      RVD1_2 = EMTDC_VVDC(SS, NT_1(1), 0)
      RVD1_3 = EMTDC_VVDC(SS, NT_1(2), 0)
      RVD1_4 = EMTDC_VVDC(SS, NT_1(3), 0)
      CALL MPHASE3PS(1, 1, RVD1_2, RVD1_3, RVD1_4, RTCF(IVD1_1+2), RTCF(&
     &IVD1_1+3) , RVD1_1)
      Phia = RVD1_1

! 30:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      Ic(1) = ( CBR((IBRCH+13), SS))
      Ic(2) = ( CBR((IBRCH+14), SS))
      Ic(3) = ( CBR((IBRCH+15), SS))
      Vc(1) = EMTDC_VVDC(SS, Bus1(1), 0)
      Vc(2) = EMTDC_VVDC(SS, Bus1(2), 0)
      Vc(3) = EMTDC_VVDC(SS, Bus1(3), 0)
      RVD1_1 = RTCF(IVD1_1) * P3PH3(SS, (IBRCH+13), (IBRCH+14), (IBRCH+1&
     &5),RTCF(IVD1_1+2),0)
      Pc = RVD1_1
      RVD1_1 = RTCF(IVD1_1) * Q3PH3(SS, (IBRCH+13), (IBRCH+14), (IBRCH+1&
     &5),RTCF(IVD1_1+2),0)
      Qc = RVD1_1
      RVD1_1 = RTCF(IVD1_1+1) * VM3PH2(SS, Bus1(1), Bus1(2), Bus1(3), RT&
     &CF(IVD1_1+2))
      Vrmsc = RVD1_1
      RVD1_1 = RMS3PH(( CBR((IBRCH+13), SS)),( CBR((IBRCH+14), SS)),( CB&
     &R((IBRCH+15), SS)))
      RVD1_1 = REALPOLE(0,1,0,RTCF(IVD1_1+4),RTCF(IVD1_1+2),RVD1_1,0.0,0&
     &.0,RTCF(IVD1_1+2))
      Irmsc = RVD1_1
      RVD1_2 = EMTDC_VVDC(SS, Bus1(1), 0)
      RVD1_3 = EMTDC_VVDC(SS, Bus1(2), 0)
      RVD1_4 = EMTDC_VVDC(SS, Bus1(3), 0)
      CALL MPHASE3PS(1, 1, RVD1_2, RVD1_3, RVD1_4, RTCF(IVD1_1+2), RTCF(&
     &IVD1_1+3) , RVD1_1)
      phic = RVD1_1

! 40:[pgb] Output Channel 'Ia'

      DO IVD1_1 = 1, 3
         PGB(IPGB+1+IVD1_1-1) = Ia(IVD1_1)
      ENDDO

! 50:[pgb] Output Channel 'Ib'

      DO IVD1_1 = 1, 3
         PGB(IPGB+4+IVD1_1-1) = Ib(IVD1_1)
      ENDDO

! 60:[pgb] Output Channel 'Ic'

      DO IVD1_1 = 1, 3
         PGB(IPGB+7+IVD1_1-1) = Ic(IVD1_1)
      ENDDO

! 70:[pgb] Output Channel 'Va'

      DO IVD1_1 = 1, 3
         PGB(IPGB+10+IVD1_1-1) = Va(IVD1_1)
      ENDDO

! 80:[pgb] Output Channel 'Vb'

      DO IVD1_1 = 1, 3
         PGB(IPGB+13+IVD1_1-1) = Vb(IVD1_1)
      ENDDO

! 90:[pgb] Output Channel 'Vc'

      DO IVD1_1 = 1, 3
         PGB(IPGB+16+IVD1_1-1) = Vc(IVD1_1)
      ENDDO

! 100:[pgb] Output Channel 'Pa'

      PGB(IPGB+19) = Pa

! 110:[pgb] Output Channel 'Pb'

      PGB(IPGB+20) = Pb

! 120:[pgb] Output Channel 'Pc'

      PGB(IPGB+21) = Pc

! 130:[pgb] Output Channel 'Qa'

      PGB(IPGB+22) = Qa

! 140:[pgb] Output Channel 'Qb'

      PGB(IPGB+23) = Qb

! 150:[pgb] Output Channel 'Qc'

      PGB(IPGB+24) = Qc

!---------------------------------------
! Feedbacks and transfers to storage
!---------------------------------------

      STOF(ISTOF + 7) = Qa
      STOF(ISTOF + 8) = Pa
      STOF(ISTOF + 9) = Pb
      STOF(ISTOF + 10) = Qb
      STOF(ISTOF + 23) = Qc
      STOF(ISTOF + 24) = Pc
      STOF(ISTOF + 25) = Vrmsa
      STOF(ISTOF + 26) = Irmsa
      STOF(ISTOF + 27) = Phia
      STOF(ISTOF + 28) = Vrmsb
      STOF(ISTOF + 29) = Irmsb
      STOF(ISTOF + 30) = phib
      STOF(ISTOF + 31) = Vrmsc
      STOF(ISTOF + 32) = Irmsc
      STOF(ISTOF + 33) = phic

! Array (1:3) quantities...
      DO IT_0 = 1,3
         STOF(ISTOF + 0 + IT_0) = Ia(IT_0)
         STOF(ISTOF + 3 + IT_0) = Va(IT_0)
         STOF(ISTOF + 10 + IT_0) = Vb(IT_0)
         STOF(ISTOF + 13 + IT_0) = Ib(IT_0)
         STOF(ISTOF + 16 + IT_0) = Ic(IT_0)
         STOF(ISTOF + 19 + IT_0) = Vc(IT_0)
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
      NNODE     = NNODE + 11
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 18
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
      INTEGER  Bus1(3), NT_1(3)

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
      NNODE     = NNODE + 11
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 18
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


! Array (1:3) quantities...
      DO IT_0 = 1,3
         Bus1(IT_0) = NODE(INODE + 0 + IT_0)
         NT_1(IT_0) = NODE(INODE + 6 + IT_0)
      END DO

!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 10:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1) = 1.0
      ENDIF
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1+1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1+1) = 1.0
      ENDIF
      RTCF(IVD1_1+2) = 0.02
      RTCF(IVD1_1+3) = 60.0
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1+4) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1+4) = 1.0
      ENDIF

! 20:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1) = 1.0
      ENDIF
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1+1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1+1) = 1.0
      ENDIF
      RTCF(IVD1_1+2) = 0.02
      RTCF(IVD1_1+3) = 60.0
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1+4) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1+4) = 1.0
      ENDIF

! 30:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1) = 1.0
      ENDIF
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1+1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1+1) = 1.0
      ENDIF
      RTCF(IVD1_1+2) = 0.02
      RTCF(IVD1_1+3) = 60.0
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1+4) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1+4) = 1.0
      ENDIF

! 40:[pgb] Output Channel 'Ia'

! 50:[pgb] Output Channel 'Ib'

! 60:[pgb] Output Channel 'Ic'

! 70:[pgb] Output Channel 'Va'

! 80:[pgb] Output Channel 'Vb'

! 90:[pgb] Output Channel 'Vc'

! 100:[pgb] Output Channel 'Pa'

! 110:[pgb] Output Channel 'Pb'

! 120:[pgb] Output Channel 'Pc'

! 130:[pgb] Output Channel 'Qa'

! 140:[pgb] Output Channel 'Qb'

! 150:[pgb] Output Channel 'Qc'

      RETURN
      END

