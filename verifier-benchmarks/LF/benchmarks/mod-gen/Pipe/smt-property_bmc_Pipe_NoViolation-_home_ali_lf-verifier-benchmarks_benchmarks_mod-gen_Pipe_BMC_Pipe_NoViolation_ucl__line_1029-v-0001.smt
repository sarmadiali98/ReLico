(declare-datatypes ((_tuple_4 0)) (((_tuple_4 (__f1 Bool) (__f2 Bool) (__f3 Bool) (__f4 Bool) (__f5 Bool) (__f6 Bool) (__f7 Bool) (__f8 Bool) (__f9 Bool) (__f10 Bool) (__f11 Bool)))))
(declare-datatypes ((_tuple_5 0)) (((_tuple_5 (__f1 Bool) (__f2 Bool)))))
(declare-datatypes ((_tuple_2 0)) (((_tuple_2 (__f1 Int) (__f2 Int)))))
(declare-datatypes ((_tuple_3 0)) (((_tuple_3 (__f1 Int) (__f2 Int) (__f3 Int) (__f4 Int) (__f5 Int) (__f6 Int) (__f7 Int) (__f8 Int) (__f9 Int) (__f10 Int) (__f11 Int) (__f12 Int) (__f13 Int) (__f14 Int) (__f15 Int)))))
(declare-datatypes ((_tuple_0 0)) (((_tuple_0 (__f1 Bool) (__f2 Bool) (__f3 Bool) (__f4 Bool) (__f5 Bool) (__f6 Bool) (__f7 Bool) (__f8 Bool) (__f9 Bool)))))
(declare-datatypes ((_tuple_1 0)) (((_tuple_1 (__f1 _tuple_0) (__f2 _tuple_2) (__f3 _tuple_3) (__f4 _tuple_4) (__f5 _tuple_5) (__f6 _tuple_2)))))
(declare-fun initial_2_start_time () Int)
(declare-fun initial_1_trace () (Array Int _tuple_1))
(assert (let ((a!1 (or (__f5 (__f1 (select initial_1_trace 2)))
               (__f5 (__f1 (select initial_1_trace 3)))
               (__f5 (__f1 (select initial_1_trace 4)))
               (__f5 (__f1 (select initial_1_trace 5)))
               (__f5 (__f1 (select initial_1_trace 6)))
               (__f5 (__f1 (select initial_1_trace 7)))
               (__f5 (__f1 (select initial_1_trace 8)))))
      (a!3 (or (__f5 (__f1 (select initial_1_trace 1)))
               (__f5 (__f1 (select initial_1_trace 3)))
               (__f5 (__f1 (select initial_1_trace 4)))
               (__f5 (__f1 (select initial_1_trace 5)))
               (__f5 (__f1 (select initial_1_trace 6)))
               (__f5 (__f1 (select initial_1_trace 7)))
               (__f5 (__f1 (select initial_1_trace 8)))))
      (a!5 (or (__f5 (__f1 (select initial_1_trace 1)))
               (__f5 (__f1 (select initial_1_trace 2)))
               (__f5 (__f1 (select initial_1_trace 4)))
               (__f5 (__f1 (select initial_1_trace 5)))
               (__f5 (__f1 (select initial_1_trace 6)))
               (__f5 (__f1 (select initial_1_trace 7)))
               (__f5 (__f1 (select initial_1_trace 8)))))
      (a!7 (or (__f5 (__f1 (select initial_1_trace 1)))
               (__f5 (__f1 (select initial_1_trace 2)))
               (__f5 (__f1 (select initial_1_trace 3)))
               (__f5 (__f1 (select initial_1_trace 5)))
               (__f5 (__f1 (select initial_1_trace 6)))
               (__f5 (__f1 (select initial_1_trace 7)))
               (__f5 (__f1 (select initial_1_trace 8)))))
      (a!9 (or (__f5 (__f1 (select initial_1_trace 1)))
               (__f5 (__f1 (select initial_1_trace 2)))
               (__f5 (__f1 (select initial_1_trace 3)))
               (__f5 (__f1 (select initial_1_trace 4)))
               (__f5 (__f1 (select initial_1_trace 6)))
               (__f5 (__f1 (select initial_1_trace 7)))
               (__f5 (__f1 (select initial_1_trace 8)))))
      (a!11 (or (__f5 (__f1 (select initial_1_trace 1)))
                (__f5 (__f1 (select initial_1_trace 2)))
                (__f5 (__f1 (select initial_1_trace 3)))
                (__f5 (__f1 (select initial_1_trace 4)))
                (__f5 (__f1 (select initial_1_trace 5)))
                (__f5 (__f1 (select initial_1_trace 7)))
                (__f5 (__f1 (select initial_1_trace 8)))))
      (a!13 (or (__f5 (__f1 (select initial_1_trace 1)))
                (__f5 (__f1 (select initial_1_trace 2)))
                (__f5 (__f1 (select initial_1_trace 3)))
                (__f5 (__f1 (select initial_1_trace 4)))
                (__f5 (__f1 (select initial_1_trace 5)))
                (__f5 (__f1 (select initial_1_trace 6)))
                (__f5 (__f1 (select initial_1_trace 8)))))
      (a!15 (or (__f5 (__f1 (select initial_1_trace 1)))
                (__f5 (__f1 (select initial_1_trace 2)))
                (__f5 (__f1 (select initial_1_trace 3)))
                (__f5 (__f1 (select initial_1_trace 4)))
                (__f5 (__f1 (select initial_1_trace 5)))
                (__f5 (__f1 (select initial_1_trace 6)))
                (__f5 (__f1 (select initial_1_trace 7))))))
(let ((a!2 (and (__f5 (__f1 (select initial_1_trace 1)))
                (= (__f2 (select initial_1_trace 1)) (_tuple_2 0 0))
                (not a!1)))
      (a!4 (and (__f5 (__f1 (select initial_1_trace 2)))
                (= (__f2 (select initial_1_trace 2)) (_tuple_2 0 0))
                (not a!3)))
      (a!6 (and (__f5 (__f1 (select initial_1_trace 3)))
                (= (__f2 (select initial_1_trace 3)) (_tuple_2 0 0))
                (not a!5)))
      (a!8 (and (__f5 (__f1 (select initial_1_trace 4)))
                (= (__f2 (select initial_1_trace 4)) (_tuple_2 0 0))
                (not a!7)))
      (a!10 (and (__f5 (__f1 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 0 0))
                 (not a!9)))
      (a!12 (and (__f5 (__f1 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 0 0))
                 (not a!11)))
      (a!14 (and (__f5 (__f1 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 0 0))
                 (not a!13)))
      (a!16 (and (__f5 (__f1 (select initial_1_trace 8)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 0 0))
                 (not a!15))))
  (or a!2 a!4 a!6 a!8 a!10 a!12 a!14 a!16 (not (= initial_2_start_time 0))))))
(assert (let ((a!1 (<= (__f1 (__f2 (select initial_1_trace 1))) initial_2_start_time))
      (a!2 (= (__f1 (__f2 (select initial_1_trace 1))) initial_2_start_time))
      (a!3 (<= (__f2 (__f2 (select initial_1_trace 1))) 0))
      (a!4 (<= 0 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!6 (<= (__f1 (__f2 (select initial_1_trace 2))) initial_2_start_time))
      (a!7 (= (__f1 (__f2 (select initial_1_trace 2))) initial_2_start_time))
      (a!8 (<= (__f2 (__f2 (select initial_1_trace 2))) 0))
      (a!9 (<= 0 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!11 (<= (__f1 (__f2 (select initial_1_trace 3))) initial_2_start_time))
      (a!12 (= (__f1 (__f2 (select initial_1_trace 3))) initial_2_start_time))
      (a!13 (<= (__f2 (__f2 (select initial_1_trace 3))) 0))
      (a!14 (<= 0 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!16 (<= (__f1 (__f2 (select initial_1_trace 4))) initial_2_start_time))
      (a!17 (= (__f1 (__f2 (select initial_1_trace 4))) initial_2_start_time))
      (a!18 (<= (__f2 (__f2 (select initial_1_trace 4))) 0))
      (a!19 (<= 0 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!21 (<= (__f1 (__f2 (select initial_1_trace 5))) initial_2_start_time))
      (a!22 (= (__f1 (__f2 (select initial_1_trace 5))) initial_2_start_time))
      (a!23 (<= (__f2 (__f2 (select initial_1_trace 5))) 0))
      (a!24 (<= 0 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!26 (<= (__f1 (__f2 (select initial_1_trace 6))) initial_2_start_time))
      (a!27 (= (__f1 (__f2 (select initial_1_trace 6))) initial_2_start_time))
      (a!28 (<= (__f2 (__f2 (select initial_1_trace 6))) 0))
      (a!29 (<= 0 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!31 (<= (__f1 (__f2 (select initial_1_trace 7))) initial_2_start_time))
      (a!32 (= (__f1 (__f2 (select initial_1_trace 7))) initial_2_start_time))
      (a!33 (<= (__f2 (__f2 (select initial_1_trace 7))) 0))
      (a!34 (<= 0 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!36 (<= (__f1 (__f2 (select initial_1_trace 8))) initial_2_start_time))
      (a!37 (= (__f1 (__f2 (select initial_1_trace 8))) initial_2_start_time))
      (a!38 (<= (__f2 (__f2 (select initial_1_trace 8))) 0))
      (a!39 (<= 0 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!41 (<= (__f1 (__f2 (select initial_1_trace 9))) initial_2_start_time))
      (a!42 (= (__f1 (__f2 (select initial_1_trace 9))) initial_2_start_time))
      (a!43 (<= (__f2 (__f2 (select initial_1_trace 9))) 0))
      (a!44 (<= 0 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!46 (<= (__f1 (__f2 (select initial_1_trace 10))) initial_2_start_time))
      (a!47 (= (__f1 (__f2 (select initial_1_trace 10))) initial_2_start_time))
      (a!48 (<= (__f2 (__f2 (select initial_1_trace 10))) 0))
      (a!49 (<= 0 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!51 (<= (__f1 (__f2 (select initial_1_trace 11))) initial_2_start_time))
      (a!52 (= (__f1 (__f2 (select initial_1_trace 11))) initial_2_start_time))
      (a!53 (<= (__f2 (__f2 (select initial_1_trace 11))) 0))
      (a!54 (<= 0 (__f1 (__f2 (select initial_1_trace 11)))))
      (a!56 (<= (__f1 (__f2 (select initial_1_trace 12))) initial_2_start_time))
      (a!57 (= (__f1 (__f2 (select initial_1_trace 12))) initial_2_start_time))
      (a!58 (<= (__f2 (__f2 (select initial_1_trace 12))) 0))
      (a!59 (<= 0 (__f1 (__f2 (select initial_1_trace 12)))))
      (a!61 (<= (__f1 (__f2 (select initial_1_trace 13))) initial_2_start_time))
      (a!62 (= (__f1 (__f2 (select initial_1_trace 13))) initial_2_start_time))
      (a!63 (<= (__f2 (__f2 (select initial_1_trace 13))) 0))
      (a!64 (<= 0 (__f1 (__f2 (select initial_1_trace 13)))))
      (a!66 (<= (__f1 (__f2 (select initial_1_trace 14))) initial_2_start_time))
      (a!67 (= (__f1 (__f2 (select initial_1_trace 14))) initial_2_start_time))
      (a!68 (<= (__f2 (__f2 (select initial_1_trace 14))) 0))
      (a!69 (<= 0 (__f1 (__f2 (select initial_1_trace 14)))))
      (a!71 (<= (__f1 (__f2 (select initial_1_trace 15))) initial_2_start_time))
      (a!72 (= (__f1 (__f2 (select initial_1_trace 15))) initial_2_start_time))
      (a!73 (<= (__f2 (__f2 (select initial_1_trace 15))) 0))
      (a!74 (<= 0 (__f1 (__f2 (select initial_1_trace 15)))))
      (a!76 (<= (__f1 (__f2 (select initial_1_trace 16))) initial_2_start_time))
      (a!77 (= (__f1 (__f2 (select initial_1_trace 16))) initial_2_start_time))
      (a!78 (<= (__f2 (__f2 (select initial_1_trace 16))) 0))
      (a!79 (<= 0 (__f1 (__f2 (select initial_1_trace 16)))))
      (a!81 (<= (__f1 (__f2 (select initial_1_trace 17))) initial_2_start_time))
      (a!82 (= (__f1 (__f2 (select initial_1_trace 17))) initial_2_start_time))
      (a!83 (<= (__f2 (__f2 (select initial_1_trace 17))) 0))
      (a!84 (<= 0 (__f1 (__f2 (select initial_1_trace 17))))))
(let ((a!5 (or (= (__f2 (select initial_1_trace 1))
                  (_tuple_2 initial_2_start_time 0))
               (not a!1)
               (and a!2 (not a!3))
               (and (not a!4) (<= 0 initial_2_start_time))))
      (a!10 (or (= (__f2 (select initial_1_trace 2))
                   (_tuple_2 initial_2_start_time 0))
                (not a!6)
                (and a!7 (not a!8))
                (and (not a!9) (<= 0 initial_2_start_time))))
      (a!15 (or (= (__f2 (select initial_1_trace 3))
                   (_tuple_2 initial_2_start_time 0))
                (not a!11)
                (and a!12 (not a!13))
                (and (not a!14) (<= 0 initial_2_start_time))))
      (a!20 (or (= (__f2 (select initial_1_trace 4))
                   (_tuple_2 initial_2_start_time 0))
                (not a!16)
                (and a!17 (not a!18))
                (and (not a!19) (<= 0 initial_2_start_time))))
      (a!25 (or (= (__f2 (select initial_1_trace 5))
                   (_tuple_2 initial_2_start_time 0))
                (not a!21)
                (and a!22 (not a!23))
                (and (not a!24) (<= 0 initial_2_start_time))))
      (a!30 (or (= (__f2 (select initial_1_trace 6))
                   (_tuple_2 initial_2_start_time 0))
                (not a!26)
                (and a!27 (not a!28))
                (and (not a!29) (<= 0 initial_2_start_time))))
      (a!35 (or (= (__f2 (select initial_1_trace 7))
                   (_tuple_2 initial_2_start_time 0))
                (not a!31)
                (and a!32 (not a!33))
                (and (not a!34) (<= 0 initial_2_start_time))))
      (a!40 (or (= (__f2 (select initial_1_trace 8))
                   (_tuple_2 initial_2_start_time 0))
                (not a!36)
                (and a!37 (not a!38))
                (and (not a!39) (<= 0 initial_2_start_time))))
      (a!45 (or (= (__f2 (select initial_1_trace 9))
                   (_tuple_2 initial_2_start_time 0))
                (not a!41)
                (and a!42 (not a!43))
                (and (not a!44) (<= 0 initial_2_start_time))))
      (a!50 (or (= (__f2 (select initial_1_trace 10))
                   (_tuple_2 initial_2_start_time 0))
                (not a!46)
                (and a!47 (not a!48))
                (and (not a!49) (<= 0 initial_2_start_time))))
      (a!55 (or (= (__f2 (select initial_1_trace 11))
                   (_tuple_2 initial_2_start_time 0))
                (not a!51)
                (and a!52 (not a!53))
                (and (not a!54) (<= 0 initial_2_start_time))))
      (a!60 (or (= (__f2 (select initial_1_trace 12))
                   (_tuple_2 initial_2_start_time 0))
                (not a!56)
                (and a!57 (not a!58))
                (and (not a!59) (<= 0 initial_2_start_time))))
      (a!65 (or (= (__f2 (select initial_1_trace 13))
                   (_tuple_2 initial_2_start_time 0))
                (not a!61)
                (and a!62 (not a!63))
                (and (not a!64) (<= 0 initial_2_start_time))))
      (a!70 (or (= (__f2 (select initial_1_trace 14))
                   (_tuple_2 initial_2_start_time 0))
                (not a!66)
                (and a!67 (not a!68))
                (and (not a!69) (<= 0 initial_2_start_time))))
      (a!75 (or (= (__f2 (select initial_1_trace 15))
                   (_tuple_2 initial_2_start_time 0))
                (not a!71)
                (and a!72 (not a!73))
                (and (not a!74) (<= 0 initial_2_start_time))))
      (a!80 (or (= (__f2 (select initial_1_trace 16))
                   (_tuple_2 initial_2_start_time 0))
                (not a!76)
                (and a!77 (not a!78))
                (and (not a!79) (<= 0 initial_2_start_time))))
      (a!85 (or (= (__f2 (select initial_1_trace 17))
                   (_tuple_2 initial_2_start_time 0))
                (not a!81)
                (and a!82 (not a!83))
                (and (not a!84) (<= 0 initial_2_start_time)))))
  (and a!5
       a!10
       a!15
       a!20
       a!25
       a!30
       a!35
       a!40
       a!45
       a!50
       a!55
       a!60
       a!65
       a!70
       a!75
       a!80
       a!85))))
(assert (let ((a!1 (+ 10000000 (__f1 (__f2 (select initial_1_trace 0)))))
      (a!2 (= (__f5 (__f3 (select initial_1_trace 1)))
              (__f1 (__f6 (select initial_1_trace 0)))))
      (a!4 (not (__f1 (__f4 (select initial_1_trace 1)))))
      (a!5 (= (__f5 (__f3 (select initial_1_trace 2)))
              (__f1 (__f6 (select initial_1_trace 0)))))
      (a!7 (+ 10000000 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!8 (= (__f5 (__f3 (select initial_1_trace 2)))
              (__f1 (__f6 (select initial_1_trace 1)))))
      (a!10 (not (__f1 (__f4 (select initial_1_trace 2)))))
      (a!11 (= (__f5 (__f3 (select initial_1_trace 3)))
               (__f1 (__f6 (select initial_1_trace 0)))))
      (a!13 (= (__f5 (__f3 (select initial_1_trace 3)))
               (__f1 (__f6 (select initial_1_trace 1)))))
      (a!15 (+ 10000000 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!16 (= (__f5 (__f3 (select initial_1_trace 3)))
               (__f1 (__f6 (select initial_1_trace 2)))))
      (a!18 (not (__f1 (__f4 (select initial_1_trace 3)))))
      (a!19 (= (__f5 (__f3 (select initial_1_trace 4)))
               (__f1 (__f6 (select initial_1_trace 0)))))
      (a!21 (= (__f5 (__f3 (select initial_1_trace 4)))
               (__f1 (__f6 (select initial_1_trace 1)))))
      (a!23 (= (__f5 (__f3 (select initial_1_trace 4)))
               (__f1 (__f6 (select initial_1_trace 2)))))
      (a!25 (+ 10000000 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!26 (= (__f5 (__f3 (select initial_1_trace 4)))
               (__f1 (__f6 (select initial_1_trace 3)))))
      (a!28 (not (__f1 (__f4 (select initial_1_trace 4)))))
      (a!29 (= (__f5 (__f3 (select initial_1_trace 5)))
               (__f1 (__f6 (select initial_1_trace 0)))))
      (a!31 (= (__f5 (__f3 (select initial_1_trace 5)))
               (__f1 (__f6 (select initial_1_trace 1)))))
      (a!33 (= (__f5 (__f3 (select initial_1_trace 5)))
               (__f1 (__f6 (select initial_1_trace 2)))))
      (a!35 (= (__f5 (__f3 (select initial_1_trace 5)))
               (__f1 (__f6 (select initial_1_trace 3)))))
      (a!37 (+ 10000000 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!38 (= (__f5 (__f3 (select initial_1_trace 5)))
               (__f1 (__f6 (select initial_1_trace 4)))))
      (a!40 (not (__f1 (__f4 (select initial_1_trace 5)))))
      (a!41 (= (__f5 (__f3 (select initial_1_trace 6)))
               (__f1 (__f6 (select initial_1_trace 0)))))
      (a!43 (= (__f5 (__f3 (select initial_1_trace 6)))
               (__f1 (__f6 (select initial_1_trace 1)))))
      (a!45 (= (__f5 (__f3 (select initial_1_trace 6)))
               (__f1 (__f6 (select initial_1_trace 2)))))
      (a!47 (= (__f5 (__f3 (select initial_1_trace 6)))
               (__f1 (__f6 (select initial_1_trace 3)))))
      (a!49 (= (__f5 (__f3 (select initial_1_trace 6)))
               (__f1 (__f6 (select initial_1_trace 4)))))
      (a!51 (+ 10000000 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!52 (= (__f5 (__f3 (select initial_1_trace 6)))
               (__f1 (__f6 (select initial_1_trace 5)))))
      (a!54 (not (__f1 (__f4 (select initial_1_trace 6)))))
      (a!55 (= (__f5 (__f3 (select initial_1_trace 7)))
               (__f1 (__f6 (select initial_1_trace 0)))))
      (a!57 (= (__f5 (__f3 (select initial_1_trace 7)))
               (__f1 (__f6 (select initial_1_trace 1)))))
      (a!59 (= (__f5 (__f3 (select initial_1_trace 7)))
               (__f1 (__f6 (select initial_1_trace 2)))))
      (a!61 (= (__f5 (__f3 (select initial_1_trace 7)))
               (__f1 (__f6 (select initial_1_trace 3)))))
      (a!63 (= (__f5 (__f3 (select initial_1_trace 7)))
               (__f1 (__f6 (select initial_1_trace 4)))))
      (a!65 (= (__f5 (__f3 (select initial_1_trace 7)))
               (__f1 (__f6 (select initial_1_trace 5)))))
      (a!67 (+ 10000000 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!68 (= (__f5 (__f3 (select initial_1_trace 7)))
               (__f1 (__f6 (select initial_1_trace 6)))))
      (a!70 (not (__f1 (__f4 (select initial_1_trace 7)))))
      (a!71 (= (__f5 (__f3 (select initial_1_trace 8)))
               (__f1 (__f6 (select initial_1_trace 0)))))
      (a!73 (= (__f5 (__f3 (select initial_1_trace 8)))
               (__f1 (__f6 (select initial_1_trace 1)))))
      (a!75 (= (__f5 (__f3 (select initial_1_trace 8)))
               (__f1 (__f6 (select initial_1_trace 2)))))
      (a!77 (= (__f5 (__f3 (select initial_1_trace 8)))
               (__f1 (__f6 (select initial_1_trace 3)))))
      (a!79 (= (__f5 (__f3 (select initial_1_trace 8)))
               (__f1 (__f6 (select initial_1_trace 4)))))
      (a!81 (= (__f5 (__f3 (select initial_1_trace 8)))
               (__f1 (__f6 (select initial_1_trace 5)))))
      (a!83 (= (__f5 (__f3 (select initial_1_trace 8)))
               (__f1 (__f6 (select initial_1_trace 6)))))
      (a!85 (+ 10000000 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!86 (= (__f5 (__f3 (select initial_1_trace 8)))
               (__f1 (__f6 (select initial_1_trace 7)))))
      (a!88 (not (__f1 (__f4 (select initial_1_trace 8)))))
      (a!89 (= (__f5 (__f3 (select initial_1_trace 9)))
               (__f1 (__f6 (select initial_1_trace 0)))))
      (a!91 (= (__f5 (__f3 (select initial_1_trace 9)))
               (__f1 (__f6 (select initial_1_trace 1)))))
      (a!93 (= (__f5 (__f3 (select initial_1_trace 9)))
               (__f1 (__f6 (select initial_1_trace 2)))))
      (a!95 (= (__f5 (__f3 (select initial_1_trace 9)))
               (__f1 (__f6 (select initial_1_trace 3)))))
      (a!97 (= (__f5 (__f3 (select initial_1_trace 9)))
               (__f1 (__f6 (select initial_1_trace 4)))))
      (a!99 (= (__f5 (__f3 (select initial_1_trace 9)))
               (__f1 (__f6 (select initial_1_trace 5)))))
      (a!101 (= (__f5 (__f3 (select initial_1_trace 9)))
                (__f1 (__f6 (select initial_1_trace 6)))))
      (a!103 (= (__f5 (__f3 (select initial_1_trace 9)))
                (__f1 (__f6 (select initial_1_trace 7)))))
      (a!105 (+ 10000000 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!106 (= (__f5 (__f3 (select initial_1_trace 9)))
                (__f1 (__f6 (select initial_1_trace 8)))))
      (a!108 (not (__f1 (__f4 (select initial_1_trace 9)))))
      (a!109 (= (__f5 (__f3 (select initial_1_trace 10)))
                (__f1 (__f6 (select initial_1_trace 0)))))
      (a!111 (= (__f5 (__f3 (select initial_1_trace 10)))
                (__f1 (__f6 (select initial_1_trace 1)))))
      (a!113 (= (__f5 (__f3 (select initial_1_trace 10)))
                (__f1 (__f6 (select initial_1_trace 2)))))
      (a!115 (= (__f5 (__f3 (select initial_1_trace 10)))
                (__f1 (__f6 (select initial_1_trace 3)))))
      (a!117 (= (__f5 (__f3 (select initial_1_trace 10)))
                (__f1 (__f6 (select initial_1_trace 4)))))
      (a!119 (= (__f5 (__f3 (select initial_1_trace 10)))
                (__f1 (__f6 (select initial_1_trace 5)))))
      (a!121 (= (__f5 (__f3 (select initial_1_trace 10)))
                (__f1 (__f6 (select initial_1_trace 6)))))
      (a!123 (= (__f5 (__f3 (select initial_1_trace 10)))
                (__f1 (__f6 (select initial_1_trace 7)))))
      (a!125 (= (__f5 (__f3 (select initial_1_trace 10)))
                (__f1 (__f6 (select initial_1_trace 8)))))
      (a!127 (+ 10000000 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!128 (= (__f5 (__f3 (select initial_1_trace 10)))
                (__f1 (__f6 (select initial_1_trace 9)))))
      (a!130 (not (__f1 (__f4 (select initial_1_trace 10)))))
      (a!131 (= (__f5 (__f3 (select initial_1_trace 11)))
                (__f1 (__f6 (select initial_1_trace 0)))))
      (a!133 (= (__f5 (__f3 (select initial_1_trace 11)))
                (__f1 (__f6 (select initial_1_trace 1)))))
      (a!135 (= (__f5 (__f3 (select initial_1_trace 11)))
                (__f1 (__f6 (select initial_1_trace 2)))))
      (a!137 (= (__f5 (__f3 (select initial_1_trace 11)))
                (__f1 (__f6 (select initial_1_trace 3)))))
      (a!139 (= (__f5 (__f3 (select initial_1_trace 11)))
                (__f1 (__f6 (select initial_1_trace 4)))))
      (a!141 (= (__f5 (__f3 (select initial_1_trace 11)))
                (__f1 (__f6 (select initial_1_trace 5)))))
      (a!143 (= (__f5 (__f3 (select initial_1_trace 11)))
                (__f1 (__f6 (select initial_1_trace 6)))))
      (a!145 (= (__f5 (__f3 (select initial_1_trace 11)))
                (__f1 (__f6 (select initial_1_trace 7)))))
      (a!147 (= (__f5 (__f3 (select initial_1_trace 11)))
                (__f1 (__f6 (select initial_1_trace 8)))))
      (a!149 (= (__f5 (__f3 (select initial_1_trace 11)))
                (__f1 (__f6 (select initial_1_trace 9)))))
      (a!151 (+ 10000000 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!152 (= (__f5 (__f3 (select initial_1_trace 11)))
                (__f1 (__f6 (select initial_1_trace 10)))))
      (a!154 (not (__f1 (__f4 (select initial_1_trace 11)))))
      (a!155 (= (__f5 (__f3 (select initial_1_trace 12)))
                (__f1 (__f6 (select initial_1_trace 0)))))
      (a!157 (= (__f5 (__f3 (select initial_1_trace 12)))
                (__f1 (__f6 (select initial_1_trace 1)))))
      (a!159 (= (__f5 (__f3 (select initial_1_trace 12)))
                (__f1 (__f6 (select initial_1_trace 2)))))
      (a!161 (= (__f5 (__f3 (select initial_1_trace 12)))
                (__f1 (__f6 (select initial_1_trace 3)))))
      (a!163 (= (__f5 (__f3 (select initial_1_trace 12)))
                (__f1 (__f6 (select initial_1_trace 4)))))
      (a!165 (= (__f5 (__f3 (select initial_1_trace 12)))
                (__f1 (__f6 (select initial_1_trace 5)))))
      (a!167 (= (__f5 (__f3 (select initial_1_trace 12)))
                (__f1 (__f6 (select initial_1_trace 6)))))
      (a!169 (= (__f5 (__f3 (select initial_1_trace 12)))
                (__f1 (__f6 (select initial_1_trace 7)))))
      (a!171 (= (__f5 (__f3 (select initial_1_trace 12)))
                (__f1 (__f6 (select initial_1_trace 8)))))
      (a!173 (= (__f5 (__f3 (select initial_1_trace 12)))
                (__f1 (__f6 (select initial_1_trace 9)))))
      (a!175 (= (__f5 (__f3 (select initial_1_trace 12)))
                (__f1 (__f6 (select initial_1_trace 10)))))
      (a!177 (+ 10000000 (__f1 (__f2 (select initial_1_trace 11)))))
      (a!178 (= (__f5 (__f3 (select initial_1_trace 12)))
                (__f1 (__f6 (select initial_1_trace 11)))))
      (a!180 (not (__f1 (__f4 (select initial_1_trace 12)))))
      (a!181 (= (__f5 (__f3 (select initial_1_trace 13)))
                (__f1 (__f6 (select initial_1_trace 0)))))
      (a!183 (= (__f5 (__f3 (select initial_1_trace 13)))
                (__f1 (__f6 (select initial_1_trace 1)))))
      (a!185 (= (__f5 (__f3 (select initial_1_trace 13)))
                (__f1 (__f6 (select initial_1_trace 2)))))
      (a!187 (= (__f5 (__f3 (select initial_1_trace 13)))
                (__f1 (__f6 (select initial_1_trace 3)))))
      (a!189 (= (__f5 (__f3 (select initial_1_trace 13)))
                (__f1 (__f6 (select initial_1_trace 4)))))
      (a!191 (= (__f5 (__f3 (select initial_1_trace 13)))
                (__f1 (__f6 (select initial_1_trace 5)))))
      (a!193 (= (__f5 (__f3 (select initial_1_trace 13)))
                (__f1 (__f6 (select initial_1_trace 6)))))
      (a!195 (= (__f5 (__f3 (select initial_1_trace 13)))
                (__f1 (__f6 (select initial_1_trace 7)))))
      (a!197 (= (__f5 (__f3 (select initial_1_trace 13)))
                (__f1 (__f6 (select initial_1_trace 8)))))
      (a!199 (= (__f5 (__f3 (select initial_1_trace 13)))
                (__f1 (__f6 (select initial_1_trace 9)))))
      (a!201 (= (__f5 (__f3 (select initial_1_trace 13)))
                (__f1 (__f6 (select initial_1_trace 10)))))
      (a!203 (= (__f5 (__f3 (select initial_1_trace 13)))
                (__f1 (__f6 (select initial_1_trace 11)))))
      (a!205 (+ 10000000 (__f1 (__f2 (select initial_1_trace 12)))))
      (a!206 (= (__f5 (__f3 (select initial_1_trace 13)))
                (__f1 (__f6 (select initial_1_trace 12)))))
      (a!208 (not (__f1 (__f4 (select initial_1_trace 13)))))
      (a!209 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 0)))))
      (a!211 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 1)))))
      (a!213 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 2)))))
      (a!215 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 3)))))
      (a!217 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 4)))))
      (a!219 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 5)))))
      (a!221 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 6)))))
      (a!223 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 7)))))
      (a!225 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 8)))))
      (a!227 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 9)))))
      (a!229 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 10)))))
      (a!231 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 11)))))
      (a!233 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 12)))))
      (a!235 (+ 10000000 (__f1 (__f2 (select initial_1_trace 13)))))
      (a!236 (= (__f5 (__f3 (select initial_1_trace 14)))
                (__f1 (__f6 (select initial_1_trace 13)))))
      (a!238 (not (__f1 (__f4 (select initial_1_trace 14)))))
      (a!239 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 0)))))
      (a!241 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 1)))))
      (a!243 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 2)))))
      (a!245 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 3)))))
      (a!247 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 4)))))
      (a!249 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 5)))))
      (a!251 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 6)))))
      (a!253 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 7)))))
      (a!255 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 8)))))
      (a!257 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 9)))))
      (a!259 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 10)))))
      (a!261 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 11)))))
      (a!263 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 12)))))
      (a!265 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 13)))))
      (a!267 (+ 10000000 (__f1 (__f2 (select initial_1_trace 14)))))
      (a!268 (= (__f5 (__f3 (select initial_1_trace 15)))
                (__f1 (__f6 (select initial_1_trace 14)))))
      (a!270 (not (__f1 (__f4 (select initial_1_trace 15)))))
      (a!271 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 0)))))
      (a!273 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 1)))))
      (a!275 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 2)))))
      (a!277 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 3)))))
      (a!279 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 4)))))
      (a!281 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 5)))))
      (a!283 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 6)))))
      (a!285 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 7)))))
      (a!287 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 8)))))
      (a!289 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 9)))))
      (a!291 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 10)))))
      (a!293 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 11)))))
      (a!295 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 12)))))
      (a!297 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 13)))))
      (a!299 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 14)))))
      (a!301 (+ 10000000 (__f1 (__f2 (select initial_1_trace 15)))))
      (a!302 (= (__f5 (__f3 (select initial_1_trace 16)))
                (__f1 (__f6 (select initial_1_trace 15)))))
      (a!304 (not (__f1 (__f4 (select initial_1_trace 16)))))
      (a!305 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 0)))))
      (a!307 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 1)))))
      (a!309 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 2)))))
      (a!311 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 3)))))
      (a!313 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 4)))))
      (a!315 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 5)))))
      (a!317 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 6)))))
      (a!319 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 7)))))
      (a!321 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 8)))))
      (a!323 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 9)))))
      (a!325 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 10)))))
      (a!327 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 11)))))
      (a!329 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 12)))))
      (a!331 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 13)))))
      (a!333 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 14)))))
      (a!335 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 15)))))
      (a!337 (+ 10000000 (__f1 (__f2 (select initial_1_trace 16)))))
      (a!338 (= (__f5 (__f3 (select initial_1_trace 17)))
                (__f1 (__f6 (select initial_1_trace 16)))))
      (a!340 (not (__f1 (__f4 (select initial_1_trace 17))))))
(let ((a!3 (and (__f2 (__f1 (select initial_1_trace 0)))
                (= (__f2 (select initial_1_trace 1)) (_tuple_2 a!1 0))
                (__f1 (__f5 (select initial_1_trace 0)))
                a!2))
      (a!6 (and (__f2 (__f1 (select initial_1_trace 0)))
                (= (__f2 (select initial_1_trace 2)) (_tuple_2 a!1 0))
                (__f1 (__f5 (select initial_1_trace 0)))
                a!5))
      (a!9 (and (__f2 (__f1 (select initial_1_trace 1)))
                (= (__f2 (select initial_1_trace 2)) (_tuple_2 a!7 0))
                (__f1 (__f5 (select initial_1_trace 1)))
                a!8))
      (a!12 (and (__f2 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 3)) (_tuple_2 a!1 0))
                 (__f1 (__f5 (select initial_1_trace 0)))
                 a!11))
      (a!14 (and (__f2 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 3)) (_tuple_2 a!7 0))
                 (__f1 (__f5 (select initial_1_trace 1)))
                 a!13))
      (a!17 (and (__f2 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 3)) (_tuple_2 a!15 0))
                 (__f1 (__f5 (select initial_1_trace 2)))
                 a!16))
      (a!20 (and (__f2 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!1 0))
                 (__f1 (__f5 (select initial_1_trace 0)))
                 a!19))
      (a!22 (and (__f2 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!7 0))
                 (__f1 (__f5 (select initial_1_trace 1)))
                 a!21))
      (a!24 (and (__f2 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!15 0))
                 (__f1 (__f5 (select initial_1_trace 2)))
                 a!23))
      (a!27 (and (__f2 (__f1 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!25 0))
                 (__f1 (__f5 (select initial_1_trace 3)))
                 a!26))
      (a!30 (and (__f2 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!1 0))
                 (__f1 (__f5 (select initial_1_trace 0)))
                 a!29))
      (a!32 (and (__f2 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!7 0))
                 (__f1 (__f5 (select initial_1_trace 1)))
                 a!31))
      (a!34 (and (__f2 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!15 0))
                 (__f1 (__f5 (select initial_1_trace 2)))
                 a!33))
      (a!36 (and (__f2 (__f1 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!25 0))
                 (__f1 (__f5 (select initial_1_trace 3)))
                 a!35))
      (a!39 (and (__f2 (__f1 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!37 0))
                 (__f1 (__f5 (select initial_1_trace 4)))
                 a!38))
      (a!42 (and (__f2 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!1 0))
                 (__f1 (__f5 (select initial_1_trace 0)))
                 a!41))
      (a!44 (and (__f2 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!7 0))
                 (__f1 (__f5 (select initial_1_trace 1)))
                 a!43))
      (a!46 (and (__f2 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!15 0))
                 (__f1 (__f5 (select initial_1_trace 2)))
                 a!45))
      (a!48 (and (__f2 (__f1 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!25 0))
                 (__f1 (__f5 (select initial_1_trace 3)))
                 a!47))
      (a!50 (and (__f2 (__f1 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!37 0))
                 (__f1 (__f5 (select initial_1_trace 4)))
                 a!49))
      (a!53 (and (__f2 (__f1 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!51 0))
                 (__f1 (__f5 (select initial_1_trace 5)))
                 a!52))
      (a!56 (and (__f2 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!1 0))
                 (__f1 (__f5 (select initial_1_trace 0)))
                 a!55))
      (a!58 (and (__f2 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!7 0))
                 (__f1 (__f5 (select initial_1_trace 1)))
                 a!57))
      (a!60 (and (__f2 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!15 0))
                 (__f1 (__f5 (select initial_1_trace 2)))
                 a!59))
      (a!62 (and (__f2 (__f1 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!25 0))
                 (__f1 (__f5 (select initial_1_trace 3)))
                 a!61))
      (a!64 (and (__f2 (__f1 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!37 0))
                 (__f1 (__f5 (select initial_1_trace 4)))
                 a!63))
      (a!66 (and (__f2 (__f1 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!51 0))
                 (__f1 (__f5 (select initial_1_trace 5)))
                 a!65))
      (a!69 (and (__f2 (__f1 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!67 0))
                 (__f1 (__f5 (select initial_1_trace 6)))
                 a!68))
      (a!72 (and (__f2 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!1 0))
                 (__f1 (__f5 (select initial_1_trace 0)))
                 a!71))
      (a!74 (and (__f2 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!7 0))
                 (__f1 (__f5 (select initial_1_trace 1)))
                 a!73))
      (a!76 (and (__f2 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!15 0))
                 (__f1 (__f5 (select initial_1_trace 2)))
                 a!75))
      (a!78 (and (__f2 (__f1 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!25 0))
                 (__f1 (__f5 (select initial_1_trace 3)))
                 a!77))
      (a!80 (and (__f2 (__f1 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!37 0))
                 (__f1 (__f5 (select initial_1_trace 4)))
                 a!79))
      (a!82 (and (__f2 (__f1 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!51 0))
                 (__f1 (__f5 (select initial_1_trace 5)))
                 a!81))
      (a!84 (and (__f2 (__f1 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!67 0))
                 (__f1 (__f5 (select initial_1_trace 6)))
                 a!83))
      (a!87 (and (__f2 (__f1 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!85 0))
                 (__f1 (__f5 (select initial_1_trace 7)))
                 a!86))
      (a!90 (and (__f2 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!1 0))
                 (__f1 (__f5 (select initial_1_trace 0)))
                 a!89))
      (a!92 (and (__f2 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!7 0))
                 (__f1 (__f5 (select initial_1_trace 1)))
                 a!91))
      (a!94 (and (__f2 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!15 0))
                 (__f1 (__f5 (select initial_1_trace 2)))
                 a!93))
      (a!96 (and (__f2 (__f1 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!25 0))
                 (__f1 (__f5 (select initial_1_trace 3)))
                 a!95))
      (a!98 (and (__f2 (__f1 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!37 0))
                 (__f1 (__f5 (select initial_1_trace 4)))
                 a!97))
      (a!100 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!51 0))
                  (__f1 (__f5 (select initial_1_trace 5)))
                  a!99))
      (a!102 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!67 0))
                  (__f1 (__f5 (select initial_1_trace 6)))
                  a!101))
      (a!104 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!85 0))
                  (__f1 (__f5 (select initial_1_trace 7)))
                  a!103))
      (a!107 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!105 0))
                  (__f1 (__f5 (select initial_1_trace 8)))
                  a!106))
      (a!110 (and (__f2 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!1 0))
                  (__f1 (__f5 (select initial_1_trace 0)))
                  a!109))
      (a!112 (and (__f2 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!7 0))
                  (__f1 (__f5 (select initial_1_trace 1)))
                  a!111))
      (a!114 (and (__f2 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!15 0))
                  (__f1 (__f5 (select initial_1_trace 2)))
                  a!113))
      (a!116 (and (__f2 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!25 0))
                  (__f1 (__f5 (select initial_1_trace 3)))
                  a!115))
      (a!118 (and (__f2 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!37 0))
                  (__f1 (__f5 (select initial_1_trace 4)))
                  a!117))
      (a!120 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!51 0))
                  (__f1 (__f5 (select initial_1_trace 5)))
                  a!119))
      (a!122 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!67 0))
                  (__f1 (__f5 (select initial_1_trace 6)))
                  a!121))
      (a!124 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!85 0))
                  (__f1 (__f5 (select initial_1_trace 7)))
                  a!123))
      (a!126 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!105 0))
                  (__f1 (__f5 (select initial_1_trace 8)))
                  a!125))
      (a!129 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!127 0))
                  (__f1 (__f5 (select initial_1_trace 9)))
                  a!128))
      (a!132 (and (__f2 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!1 0))
                  (__f1 (__f5 (select initial_1_trace 0)))
                  a!131))
      (a!134 (and (__f2 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!7 0))
                  (__f1 (__f5 (select initial_1_trace 1)))
                  a!133))
      (a!136 (and (__f2 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!15 0))
                  (__f1 (__f5 (select initial_1_trace 2)))
                  a!135))
      (a!138 (and (__f2 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!25 0))
                  (__f1 (__f5 (select initial_1_trace 3)))
                  a!137))
      (a!140 (and (__f2 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!37 0))
                  (__f1 (__f5 (select initial_1_trace 4)))
                  a!139))
      (a!142 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!51 0))
                  (__f1 (__f5 (select initial_1_trace 5)))
                  a!141))
      (a!144 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!67 0))
                  (__f1 (__f5 (select initial_1_trace 6)))
                  a!143))
      (a!146 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!85 0))
                  (__f1 (__f5 (select initial_1_trace 7)))
                  a!145))
      (a!148 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!105 0))
                  (__f1 (__f5 (select initial_1_trace 8)))
                  a!147))
      (a!150 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!127 0))
                  (__f1 (__f5 (select initial_1_trace 9)))
                  a!149))
      (a!153 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!151 0))
                  (__f1 (__f5 (select initial_1_trace 10)))
                  a!152))
      (a!156 (and (__f2 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!1 0))
                  (__f1 (__f5 (select initial_1_trace 0)))
                  a!155))
      (a!158 (and (__f2 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!7 0))
                  (__f1 (__f5 (select initial_1_trace 1)))
                  a!157))
      (a!160 (and (__f2 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!15 0))
                  (__f1 (__f5 (select initial_1_trace 2)))
                  a!159))
      (a!162 (and (__f2 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!25 0))
                  (__f1 (__f5 (select initial_1_trace 3)))
                  a!161))
      (a!164 (and (__f2 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!37 0))
                  (__f1 (__f5 (select initial_1_trace 4)))
                  a!163))
      (a!166 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!51 0))
                  (__f1 (__f5 (select initial_1_trace 5)))
                  a!165))
      (a!168 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!67 0))
                  (__f1 (__f5 (select initial_1_trace 6)))
                  a!167))
      (a!170 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!85 0))
                  (__f1 (__f5 (select initial_1_trace 7)))
                  a!169))
      (a!172 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!105 0))
                  (__f1 (__f5 (select initial_1_trace 8)))
                  a!171))
      (a!174 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!127 0))
                  (__f1 (__f5 (select initial_1_trace 9)))
                  a!173))
      (a!176 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!151 0))
                  (__f1 (__f5 (select initial_1_trace 10)))
                  a!175))
      (a!179 (and (__f2 (__f1 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!177 0))
                  (__f1 (__f5 (select initial_1_trace 11)))
                  a!178))
      (a!182 (and (__f2 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!1 0))
                  (__f1 (__f5 (select initial_1_trace 0)))
                  a!181))
      (a!184 (and (__f2 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!7 0))
                  (__f1 (__f5 (select initial_1_trace 1)))
                  a!183))
      (a!186 (and (__f2 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!15 0))
                  (__f1 (__f5 (select initial_1_trace 2)))
                  a!185))
      (a!188 (and (__f2 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!25 0))
                  (__f1 (__f5 (select initial_1_trace 3)))
                  a!187))
      (a!190 (and (__f2 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!37 0))
                  (__f1 (__f5 (select initial_1_trace 4)))
                  a!189))
      (a!192 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!51 0))
                  (__f1 (__f5 (select initial_1_trace 5)))
                  a!191))
      (a!194 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!67 0))
                  (__f1 (__f5 (select initial_1_trace 6)))
                  a!193))
      (a!196 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!85 0))
                  (__f1 (__f5 (select initial_1_trace 7)))
                  a!195))
      (a!198 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!105 0))
                  (__f1 (__f5 (select initial_1_trace 8)))
                  a!197))
      (a!200 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!127 0))
                  (__f1 (__f5 (select initial_1_trace 9)))
                  a!199))
      (a!202 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!151 0))
                  (__f1 (__f5 (select initial_1_trace 10)))
                  a!201))
      (a!204 (and (__f2 (__f1 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!177 0))
                  (__f1 (__f5 (select initial_1_trace 11)))
                  a!203))
      (a!207 (and (__f2 (__f1 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!205 0))
                  (__f1 (__f5 (select initial_1_trace 12)))
                  a!206))
      (a!210 (and (__f2 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!1 0))
                  (__f1 (__f5 (select initial_1_trace 0)))
                  a!209))
      (a!212 (and (__f2 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!7 0))
                  (__f1 (__f5 (select initial_1_trace 1)))
                  a!211))
      (a!214 (and (__f2 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!15 0))
                  (__f1 (__f5 (select initial_1_trace 2)))
                  a!213))
      (a!216 (and (__f2 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!25 0))
                  (__f1 (__f5 (select initial_1_trace 3)))
                  a!215))
      (a!218 (and (__f2 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!37 0))
                  (__f1 (__f5 (select initial_1_trace 4)))
                  a!217))
      (a!220 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!51 0))
                  (__f1 (__f5 (select initial_1_trace 5)))
                  a!219))
      (a!222 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!67 0))
                  (__f1 (__f5 (select initial_1_trace 6)))
                  a!221))
      (a!224 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!85 0))
                  (__f1 (__f5 (select initial_1_trace 7)))
                  a!223))
      (a!226 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!105 0))
                  (__f1 (__f5 (select initial_1_trace 8)))
                  a!225))
      (a!228 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!127 0))
                  (__f1 (__f5 (select initial_1_trace 9)))
                  a!227))
      (a!230 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!151 0))
                  (__f1 (__f5 (select initial_1_trace 10)))
                  a!229))
      (a!232 (and (__f2 (__f1 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!177 0))
                  (__f1 (__f5 (select initial_1_trace 11)))
                  a!231))
      (a!234 (and (__f2 (__f1 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!205 0))
                  (__f1 (__f5 (select initial_1_trace 12)))
                  a!233))
      (a!237 (and (__f2 (__f1 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!235 0))
                  (__f1 (__f5 (select initial_1_trace 13)))
                  a!236))
      (a!240 (and (__f2 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!1 0))
                  (__f1 (__f5 (select initial_1_trace 0)))
                  a!239))
      (a!242 (and (__f2 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!7 0))
                  (__f1 (__f5 (select initial_1_trace 1)))
                  a!241))
      (a!244 (and (__f2 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!15 0))
                  (__f1 (__f5 (select initial_1_trace 2)))
                  a!243))
      (a!246 (and (__f2 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!25 0))
                  (__f1 (__f5 (select initial_1_trace 3)))
                  a!245))
      (a!248 (and (__f2 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!37 0))
                  (__f1 (__f5 (select initial_1_trace 4)))
                  a!247))
      (a!250 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!51 0))
                  (__f1 (__f5 (select initial_1_trace 5)))
                  a!249))
      (a!252 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!67 0))
                  (__f1 (__f5 (select initial_1_trace 6)))
                  a!251))
      (a!254 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!85 0))
                  (__f1 (__f5 (select initial_1_trace 7)))
                  a!253))
      (a!256 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!105 0))
                  (__f1 (__f5 (select initial_1_trace 8)))
                  a!255))
      (a!258 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!127 0))
                  (__f1 (__f5 (select initial_1_trace 9)))
                  a!257))
      (a!260 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!151 0))
                  (__f1 (__f5 (select initial_1_trace 10)))
                  a!259))
      (a!262 (and (__f2 (__f1 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!177 0))
                  (__f1 (__f5 (select initial_1_trace 11)))
                  a!261))
      (a!264 (and (__f2 (__f1 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!205 0))
                  (__f1 (__f5 (select initial_1_trace 12)))
                  a!263))
      (a!266 (and (__f2 (__f1 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!235 0))
                  (__f1 (__f5 (select initial_1_trace 13)))
                  a!265))
      (a!269 (and (__f2 (__f1 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!267 0))
                  (__f1 (__f5 (select initial_1_trace 14)))
                  a!268))
      (a!272 (and (__f2 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!1 0))
                  (__f1 (__f5 (select initial_1_trace 0)))
                  a!271))
      (a!274 (and (__f2 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!7 0))
                  (__f1 (__f5 (select initial_1_trace 1)))
                  a!273))
      (a!276 (and (__f2 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!15 0))
                  (__f1 (__f5 (select initial_1_trace 2)))
                  a!275))
      (a!278 (and (__f2 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!25 0))
                  (__f1 (__f5 (select initial_1_trace 3)))
                  a!277))
      (a!280 (and (__f2 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!37 0))
                  (__f1 (__f5 (select initial_1_trace 4)))
                  a!279))
      (a!282 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!51 0))
                  (__f1 (__f5 (select initial_1_trace 5)))
                  a!281))
      (a!284 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!67 0))
                  (__f1 (__f5 (select initial_1_trace 6)))
                  a!283))
      (a!286 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!85 0))
                  (__f1 (__f5 (select initial_1_trace 7)))
                  a!285))
      (a!288 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!105 0))
                  (__f1 (__f5 (select initial_1_trace 8)))
                  a!287))
      (a!290 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!127 0))
                  (__f1 (__f5 (select initial_1_trace 9)))
                  a!289))
      (a!292 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!151 0))
                  (__f1 (__f5 (select initial_1_trace 10)))
                  a!291))
      (a!294 (and (__f2 (__f1 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!177 0))
                  (__f1 (__f5 (select initial_1_trace 11)))
                  a!293))
      (a!296 (and (__f2 (__f1 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!205 0))
                  (__f1 (__f5 (select initial_1_trace 12)))
                  a!295))
      (a!298 (and (__f2 (__f1 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!235 0))
                  (__f1 (__f5 (select initial_1_trace 13)))
                  a!297))
      (a!300 (and (__f2 (__f1 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!267 0))
                  (__f1 (__f5 (select initial_1_trace 14)))
                  a!299))
      (a!303 (and (__f2 (__f1 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!301 0))
                  (__f1 (__f5 (select initial_1_trace 15)))
                  a!302))
      (a!306 (and (__f2 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!1 0))
                  (__f1 (__f5 (select initial_1_trace 0)))
                  a!305))
      (a!308 (and (__f2 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!7 0))
                  (__f1 (__f5 (select initial_1_trace 1)))
                  a!307))
      (a!310 (and (__f2 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!15 0))
                  (__f1 (__f5 (select initial_1_trace 2)))
                  a!309))
      (a!312 (and (__f2 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!25 0))
                  (__f1 (__f5 (select initial_1_trace 3)))
                  a!311))
      (a!314 (and (__f2 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!37 0))
                  (__f1 (__f5 (select initial_1_trace 4)))
                  a!313))
      (a!316 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!51 0))
                  (__f1 (__f5 (select initial_1_trace 5)))
                  a!315))
      (a!318 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!67 0))
                  (__f1 (__f5 (select initial_1_trace 6)))
                  a!317))
      (a!320 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!85 0))
                  (__f1 (__f5 (select initial_1_trace 7)))
                  a!319))
      (a!322 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!105 0))
                  (__f1 (__f5 (select initial_1_trace 8)))
                  a!321))
      (a!324 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!127 0))
                  (__f1 (__f5 (select initial_1_trace 9)))
                  a!323))
      (a!326 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!151 0))
                  (__f1 (__f5 (select initial_1_trace 10)))
                  a!325))
      (a!328 (and (__f2 (__f1 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!177 0))
                  (__f1 (__f5 (select initial_1_trace 11)))
                  a!327))
      (a!330 (and (__f2 (__f1 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!205 0))
                  (__f1 (__f5 (select initial_1_trace 12)))
                  a!329))
      (a!332 (and (__f2 (__f1 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!235 0))
                  (__f1 (__f5 (select initial_1_trace 13)))
                  a!331))
      (a!334 (and (__f2 (__f1 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!267 0))
                  (__f1 (__f5 (select initial_1_trace 14)))
                  a!333))
      (a!336 (and (__f2 (__f1 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!301 0))
                  (__f1 (__f5 (select initial_1_trace 15)))
                  a!335))
      (a!339 (and (__f2 (__f1 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!337 0))
                  (__f1 (__f5 (select initial_1_trace 16)))
                  a!338)))
  (and (or a!3 a!4)
       (or a!6 a!9 a!10)
       (or a!12 a!14 a!17 a!18)
       (or a!20 a!22 a!24 a!27 a!28)
       (or a!30 a!32 a!34 a!36 a!39 a!40)
       (or a!42 a!44 a!46 a!48 a!50 a!53 a!54)
       (or a!56 a!58 a!60 a!62 a!64 a!66 a!69 a!70)
       (or a!72 a!74 a!76 a!78 a!80 a!82 a!84 a!87 a!88)
       (or a!90 a!92 a!94 a!96 a!98 a!100 a!102 a!104 a!107 a!108)
       (or a!110 a!112 a!114 a!116 a!118 a!120 a!122 a!124 a!126 a!129 a!130)
       (or a!132
           a!134
           a!136
           a!138
           a!140
           a!142
           a!144
           a!146
           a!148
           a!150
           a!153
           a!154)
       (or a!156
           a!158
           a!160
           a!162
           a!164
           a!166
           a!168
           a!170
           a!172
           a!174
           a!176
           a!179
           a!180)
       (or a!182
           a!184
           a!186
           a!188
           a!190
           a!192
           a!194
           a!196
           a!198
           a!200
           a!202
           a!204
           a!207
           a!208)
       (or a!210
           a!212
           a!214
           a!216
           a!218
           a!220
           a!222
           a!224
           a!226
           a!228
           a!230
           a!232
           a!234
           a!237
           a!238)
       (or a!240
           a!242
           a!244
           a!246
           a!248
           a!250
           a!252
           a!254
           a!256
           a!258
           a!260
           a!262
           a!264
           a!266
           a!269
           a!270)
       (or a!272
           a!274
           a!276
           a!278
           a!280
           a!282
           a!284
           a!286
           a!288
           a!290
           a!292
           a!294
           a!296
           a!298
           a!300
           a!303
           a!304)
       (or a!306
           a!308
           a!310
           a!312
           a!314
           a!316
           a!318
           a!320
           a!322
           a!324
           a!326
           a!328
           a!330
           a!332
           a!334
           a!336
           a!339
           a!340)))))
(assert (let ((a!1 (and (__f1 (__f1 (select initial_1_trace 0)))
                (__f2 (__f1 (select initial_1_trace 0)))))
      (a!2 (and (__f3 (__f1 (select initial_1_trace 0)))
                (__f4 (__f1 (select initial_1_trace 0)))))
      (a!3 (and (__f4 (__f1 (select initial_1_trace 0)))
                (__f6 (__f1 (select initial_1_trace 0)))))
      (a!4 (and (__f4 (__f1 (select initial_1_trace 0)))
                (__f7 (__f1 (select initial_1_trace 0)))))
      (a!5 (and (__f2 (__f1 (select initial_1_trace 0)))
                (__f3 (__f1 (select initial_1_trace 0)))))
      (a!6 (and (__f5 (__f1 (select initial_1_trace 0)))
                (__f6 (__f1 (select initial_1_trace 0)))))
      (a!7 (and (__f5 (__f1 (select initial_1_trace 0)))
                (__f7 (__f1 (select initial_1_trace 0)))))
      (a!8 (and (__f5 (__f1 (select initial_1_trace 0)))
                (__f8 (__f1 (select initial_1_trace 0)))))
      (a!9 (and (__f6 (__f1 (select initial_1_trace 0)))
                (__f7 (__f1 (select initial_1_trace 0)))))
      (a!10 (and (__f6 (__f1 (select initial_1_trace 0)))
                 (__f8 (__f1 (select initial_1_trace 0)))))
      (a!11 (and (__f7 (__f1 (select initial_1_trace 0)))
                 (__f8 (__f1 (select initial_1_trace 0)))))
      (a!12 (<= (__f1 (__f2 (select initial_1_trace 0)))
                (__f1 (__f2 (select initial_1_trace 1)))))
      (a!13 (= (__f1 (__f2 (select initial_1_trace 1)))
               (__f1 (__f2 (select initial_1_trace 0)))))
      (a!14 (<= (__f2 (__f2 (select initial_1_trace 0)))
                (__f2 (__f2 (select initial_1_trace 1)))))
      (a!15 (<= 0 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!16 (<= 0 (__f1 (__f2 (select initial_1_trace 0)))))
      (a!17 (and (__f1 (__f1 (select initial_1_trace 1)))
                 (__f2 (__f1 (select initial_1_trace 0)))))
      (a!18 (and (__f3 (__f1 (select initial_1_trace 1)))
                 (__f4 (__f1 (select initial_1_trace 0)))))
      (a!19 (and (__f4 (__f1 (select initial_1_trace 1)))
                 (__f6 (__f1 (select initial_1_trace 0)))))
      (a!20 (and (__f4 (__f1 (select initial_1_trace 1)))
                 (__f7 (__f1 (select initial_1_trace 0)))))
      (a!21 (and (__f2 (__f1 (select initial_1_trace 1)))
                 (__f3 (__f1 (select initial_1_trace 0)))))
      (a!22 (and (__f5 (__f1 (select initial_1_trace 1)))
                 (__f6 (__f1 (select initial_1_trace 0)))))
      (a!23 (and (__f5 (__f1 (select initial_1_trace 1)))
                 (__f7 (__f1 (select initial_1_trace 0)))))
      (a!24 (and (__f5 (__f1 (select initial_1_trace 1)))
                 (__f8 (__f1 (select initial_1_trace 0)))))
      (a!25 (and (__f6 (__f1 (select initial_1_trace 1)))
                 (__f7 (__f1 (select initial_1_trace 0)))))
      (a!26 (and (__f6 (__f1 (select initial_1_trace 1)))
                 (__f8 (__f1 (select initial_1_trace 0)))))
      (a!27 (and (__f7 (__f1 (select initial_1_trace 1)))
                 (__f8 (__f1 (select initial_1_trace 0)))))
      (a!30 (and (__f1 (__f1 (select initial_1_trace 1)))
                 (__f2 (__f1 (select initial_1_trace 1)))))
      (a!31 (and (__f3 (__f1 (select initial_1_trace 1)))
                 (__f4 (__f1 (select initial_1_trace 1)))))
      (a!32 (and (__f4 (__f1 (select initial_1_trace 1)))
                 (__f6 (__f1 (select initial_1_trace 1)))))
      (a!33 (and (__f4 (__f1 (select initial_1_trace 1)))
                 (__f7 (__f1 (select initial_1_trace 1)))))
      (a!34 (and (__f2 (__f1 (select initial_1_trace 1)))
                 (__f3 (__f1 (select initial_1_trace 1)))))
      (a!35 (and (__f5 (__f1 (select initial_1_trace 1)))
                 (__f6 (__f1 (select initial_1_trace 1)))))
      (a!36 (and (__f5 (__f1 (select initial_1_trace 1)))
                 (__f7 (__f1 (select initial_1_trace 1)))))
      (a!37 (and (__f5 (__f1 (select initial_1_trace 1)))
                 (__f8 (__f1 (select initial_1_trace 1)))))
      (a!38 (and (__f6 (__f1 (select initial_1_trace 1)))
                 (__f7 (__f1 (select initial_1_trace 1)))))
      (a!39 (and (__f6 (__f1 (select initial_1_trace 1)))
                 (__f8 (__f1 (select initial_1_trace 1)))))
      (a!40 (and (__f7 (__f1 (select initial_1_trace 1)))
                 (__f8 (__f1 (select initial_1_trace 1)))))
      (a!41 (<= (__f1 (__f2 (select initial_1_trace 0)))
                (__f1 (__f2 (select initial_1_trace 2)))))
      (a!42 (= (__f1 (__f2 (select initial_1_trace 2)))
               (__f1 (__f2 (select initial_1_trace 0)))))
      (a!43 (<= (__f2 (__f2 (select initial_1_trace 0)))
                (__f2 (__f2 (select initial_1_trace 2)))))
      (a!44 (<= 0 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!45 (and (__f1 (__f1 (select initial_1_trace 2)))
                 (__f2 (__f1 (select initial_1_trace 0)))))
      (a!46 (and (__f3 (__f1 (select initial_1_trace 2)))
                 (__f4 (__f1 (select initial_1_trace 0)))))
      (a!47 (and (__f4 (__f1 (select initial_1_trace 2)))
                 (__f6 (__f1 (select initial_1_trace 0)))))
      (a!48 (and (__f4 (__f1 (select initial_1_trace 2)))
                 (__f7 (__f1 (select initial_1_trace 0)))))
      (a!49 (and (__f2 (__f1 (select initial_1_trace 2)))
                 (__f3 (__f1 (select initial_1_trace 0)))))
      (a!50 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (__f6 (__f1 (select initial_1_trace 0)))))
      (a!51 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (__f7 (__f1 (select initial_1_trace 0)))))
      (a!52 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (__f8 (__f1 (select initial_1_trace 0)))))
      (a!53 (and (__f6 (__f1 (select initial_1_trace 2)))
                 (__f7 (__f1 (select initial_1_trace 0)))))
      (a!54 (and (__f6 (__f1 (select initial_1_trace 2)))
                 (__f8 (__f1 (select initial_1_trace 0)))))
      (a!55 (and (__f7 (__f1 (select initial_1_trace 2)))
                 (__f8 (__f1 (select initial_1_trace 0)))))
      (a!58 (<= (__f1 (__f2 (select initial_1_trace 1)))
                (__f1 (__f2 (select initial_1_trace 2)))))
      (a!59 (= (__f1 (__f2 (select initial_1_trace 2)))
               (__f1 (__f2 (select initial_1_trace 1)))))
      (a!60 (<= (__f2 (__f2 (select initial_1_trace 1)))
                (__f2 (__f2 (select initial_1_trace 2)))))
      (a!61 (and (__f1 (__f1 (select initial_1_trace 2)))
                 (__f2 (__f1 (select initial_1_trace 1)))))
      (a!62 (and (__f3 (__f1 (select initial_1_trace 2)))
                 (__f4 (__f1 (select initial_1_trace 1)))))
      (a!63 (and (__f4 (__f1 (select initial_1_trace 2)))
                 (__f6 (__f1 (select initial_1_trace 1)))))
      (a!64 (and (__f4 (__f1 (select initial_1_trace 2)))
                 (__f7 (__f1 (select initial_1_trace 1)))))
      (a!65 (and (__f2 (__f1 (select initial_1_trace 2)))
                 (__f3 (__f1 (select initial_1_trace 1)))))
      (a!66 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (__f6 (__f1 (select initial_1_trace 1)))))
      (a!67 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (__f7 (__f1 (select initial_1_trace 1)))))
      (a!68 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (__f8 (__f1 (select initial_1_trace 1)))))
      (a!69 (and (__f6 (__f1 (select initial_1_trace 2)))
                 (__f7 (__f1 (select initial_1_trace 1)))))
      (a!70 (and (__f6 (__f1 (select initial_1_trace 2)))
                 (__f8 (__f1 (select initial_1_trace 1)))))
      (a!71 (and (__f7 (__f1 (select initial_1_trace 2)))
                 (__f8 (__f1 (select initial_1_trace 1)))))
      (a!74 (and (__f1 (__f1 (select initial_1_trace 2)))
                 (__f2 (__f1 (select initial_1_trace 2)))))
      (a!75 (and (__f3 (__f1 (select initial_1_trace 2)))
                 (__f4 (__f1 (select initial_1_trace 2)))))
      (a!76 (and (__f4 (__f1 (select initial_1_trace 2)))
                 (__f6 (__f1 (select initial_1_trace 2)))))
      (a!77 (and (__f4 (__f1 (select initial_1_trace 2)))
                 (__f7 (__f1 (select initial_1_trace 2)))))
      (a!78 (and (__f2 (__f1 (select initial_1_trace 2)))
                 (__f3 (__f1 (select initial_1_trace 2)))))
      (a!79 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (__f6 (__f1 (select initial_1_trace 2)))))
      (a!80 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (__f7 (__f1 (select initial_1_trace 2)))))
      (a!81 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (__f8 (__f1 (select initial_1_trace 2)))))
      (a!82 (and (__f6 (__f1 (select initial_1_trace 2)))
                 (__f7 (__f1 (select initial_1_trace 2)))))
      (a!83 (and (__f6 (__f1 (select initial_1_trace 2)))
                 (__f8 (__f1 (select initial_1_trace 2)))))
      (a!84 (and (__f7 (__f1 (select initial_1_trace 2)))
                 (__f8 (__f1 (select initial_1_trace 2)))))
      (a!85 (<= (__f1 (__f2 (select initial_1_trace 0)))
                (__f1 (__f2 (select initial_1_trace 3)))))
      (a!86 (= (__f1 (__f2 (select initial_1_trace 3)))
               (__f1 (__f2 (select initial_1_trace 0)))))
      (a!87 (<= (__f2 (__f2 (select initial_1_trace 0)))
                (__f2 (__f2 (select initial_1_trace 3)))))
      (a!88 (<= 0 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!89 (and (__f1 (__f1 (select initial_1_trace 3)))
                 (__f2 (__f1 (select initial_1_trace 0)))))
      (a!90 (and (__f3 (__f1 (select initial_1_trace 3)))
                 (__f4 (__f1 (select initial_1_trace 0)))))
      (a!91 (and (__f4 (__f1 (select initial_1_trace 3)))
                 (__f6 (__f1 (select initial_1_trace 0)))))
      (a!92 (and (__f4 (__f1 (select initial_1_trace 3)))
                 (__f7 (__f1 (select initial_1_trace 0)))))
      (a!93 (and (__f2 (__f1 (select initial_1_trace 3)))
                 (__f3 (__f1 (select initial_1_trace 0)))))
      (a!94 (and (__f5 (__f1 (select initial_1_trace 3)))
                 (__f6 (__f1 (select initial_1_trace 0)))))
      (a!95 (and (__f5 (__f1 (select initial_1_trace 3)))
                 (__f7 (__f1 (select initial_1_trace 0)))))
      (a!96 (and (__f5 (__f1 (select initial_1_trace 3)))
                 (__f8 (__f1 (select initial_1_trace 0)))))
      (a!97 (and (__f6 (__f1 (select initial_1_trace 3)))
                 (__f7 (__f1 (select initial_1_trace 0)))))
      (a!98 (and (__f6 (__f1 (select initial_1_trace 3)))
                 (__f8 (__f1 (select initial_1_trace 0)))))
      (a!99 (and (__f7 (__f1 (select initial_1_trace 3)))
                 (__f8 (__f1 (select initial_1_trace 0)))))
      (a!102 (<= (__f1 (__f2 (select initial_1_trace 1)))
                 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!103 (= (__f1 (__f2 (select initial_1_trace 3)))
                (__f1 (__f2 (select initial_1_trace 1)))))
      (a!104 (<= (__f2 (__f2 (select initial_1_trace 1)))
                 (__f2 (__f2 (select initial_1_trace 3)))))
      (a!105 (and (__f1 (__f1 (select initial_1_trace 3)))
                  (__f2 (__f1 (select initial_1_trace 1)))))
      (a!106 (and (__f3 (__f1 (select initial_1_trace 3)))
                  (__f4 (__f1 (select initial_1_trace 1)))))
      (a!107 (and (__f4 (__f1 (select initial_1_trace 3)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!108 (and (__f4 (__f1 (select initial_1_trace 3)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!109 (and (__f2 (__f1 (select initial_1_trace 3)))
                  (__f3 (__f1 (select initial_1_trace 1)))))
      (a!110 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!111 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!112 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!113 (and (__f6 (__f1 (select initial_1_trace 3)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!114 (and (__f6 (__f1 (select initial_1_trace 3)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!115 (and (__f7 (__f1 (select initial_1_trace 3)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!118 (<= (__f1 (__f2 (select initial_1_trace 2)))
                 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!119 (= (__f1 (__f2 (select initial_1_trace 3)))
                (__f1 (__f2 (select initial_1_trace 2)))))
      (a!120 (<= (__f2 (__f2 (select initial_1_trace 2)))
                 (__f2 (__f2 (select initial_1_trace 3)))))
      (a!121 (and (__f1 (__f1 (select initial_1_trace 3)))
                  (__f2 (__f1 (select initial_1_trace 2)))))
      (a!122 (and (__f3 (__f1 (select initial_1_trace 3)))
                  (__f4 (__f1 (select initial_1_trace 2)))))
      (a!123 (and (__f4 (__f1 (select initial_1_trace 3)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!124 (and (__f4 (__f1 (select initial_1_trace 3)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!125 (and (__f2 (__f1 (select initial_1_trace 3)))
                  (__f3 (__f1 (select initial_1_trace 2)))))
      (a!126 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!127 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!128 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!129 (and (__f6 (__f1 (select initial_1_trace 3)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!130 (and (__f6 (__f1 (select initial_1_trace 3)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!131 (and (__f7 (__f1 (select initial_1_trace 3)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!134 (and (__f1 (__f1 (select initial_1_trace 3)))
                  (__f2 (__f1 (select initial_1_trace 3)))))
      (a!135 (and (__f3 (__f1 (select initial_1_trace 3)))
                  (__f4 (__f1 (select initial_1_trace 3)))))
      (a!136 (and (__f4 (__f1 (select initial_1_trace 3)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!137 (and (__f4 (__f1 (select initial_1_trace 3)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!138 (and (__f2 (__f1 (select initial_1_trace 3)))
                  (__f3 (__f1 (select initial_1_trace 3)))))
      (a!139 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!140 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!141 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!142 (and (__f6 (__f1 (select initial_1_trace 3)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!143 (and (__f6 (__f1 (select initial_1_trace 3)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!144 (and (__f7 (__f1 (select initial_1_trace 3)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!145 (<= (__f1 (__f2 (select initial_1_trace 0)))
                 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!146 (= (__f1 (__f2 (select initial_1_trace 4)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!147 (<= (__f2 (__f2 (select initial_1_trace 0)))
                 (__f2 (__f2 (select initial_1_trace 4)))))
      (a!148 (<= 0 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!149 (and (__f1 (__f1 (select initial_1_trace 4)))
                  (__f2 (__f1 (select initial_1_trace 0)))))
      (a!150 (and (__f3 (__f1 (select initial_1_trace 4)))
                  (__f4 (__f1 (select initial_1_trace 0)))))
      (a!151 (and (__f4 (__f1 (select initial_1_trace 4)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!152 (and (__f4 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!153 (and (__f2 (__f1 (select initial_1_trace 4)))
                  (__f3 (__f1 (select initial_1_trace 0)))))
      (a!154 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!155 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!156 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!157 (and (__f6 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!158 (and (__f6 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!159 (and (__f7 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!162 (<= (__f1 (__f2 (select initial_1_trace 1)))
                 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!163 (= (__f1 (__f2 (select initial_1_trace 4)))
                (__f1 (__f2 (select initial_1_trace 1)))))
      (a!164 (<= (__f2 (__f2 (select initial_1_trace 1)))
                 (__f2 (__f2 (select initial_1_trace 4)))))
      (a!165 (and (__f1 (__f1 (select initial_1_trace 4)))
                  (__f2 (__f1 (select initial_1_trace 1)))))
      (a!166 (and (__f3 (__f1 (select initial_1_trace 4)))
                  (__f4 (__f1 (select initial_1_trace 1)))))
      (a!167 (and (__f4 (__f1 (select initial_1_trace 4)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!168 (and (__f4 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!169 (and (__f2 (__f1 (select initial_1_trace 4)))
                  (__f3 (__f1 (select initial_1_trace 1)))))
      (a!170 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!171 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!172 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!173 (and (__f6 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!174 (and (__f6 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!175 (and (__f7 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!178 (<= (__f1 (__f2 (select initial_1_trace 2)))
                 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!179 (= (__f1 (__f2 (select initial_1_trace 4)))
                (__f1 (__f2 (select initial_1_trace 2)))))
      (a!180 (<= (__f2 (__f2 (select initial_1_trace 2)))
                 (__f2 (__f2 (select initial_1_trace 4)))))
      (a!181 (and (__f1 (__f1 (select initial_1_trace 4)))
                  (__f2 (__f1 (select initial_1_trace 2)))))
      (a!182 (and (__f3 (__f1 (select initial_1_trace 4)))
                  (__f4 (__f1 (select initial_1_trace 2)))))
      (a!183 (and (__f4 (__f1 (select initial_1_trace 4)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!184 (and (__f4 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!185 (and (__f2 (__f1 (select initial_1_trace 4)))
                  (__f3 (__f1 (select initial_1_trace 2)))))
      (a!186 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!187 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!188 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!189 (and (__f6 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!190 (and (__f6 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!191 (and (__f7 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!194 (<= (__f1 (__f2 (select initial_1_trace 3)))
                 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!195 (= (__f1 (__f2 (select initial_1_trace 4)))
                (__f1 (__f2 (select initial_1_trace 3)))))
      (a!196 (<= (__f2 (__f2 (select initial_1_trace 3)))
                 (__f2 (__f2 (select initial_1_trace 4)))))
      (a!197 (and (__f1 (__f1 (select initial_1_trace 4)))
                  (__f2 (__f1 (select initial_1_trace 3)))))
      (a!198 (and (__f3 (__f1 (select initial_1_trace 4)))
                  (__f4 (__f1 (select initial_1_trace 3)))))
      (a!199 (and (__f4 (__f1 (select initial_1_trace 4)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!200 (and (__f4 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!201 (and (__f2 (__f1 (select initial_1_trace 4)))
                  (__f3 (__f1 (select initial_1_trace 3)))))
      (a!202 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!203 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!204 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!205 (and (__f6 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!206 (and (__f6 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!207 (and (__f7 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!210 (and (__f1 (__f1 (select initial_1_trace 4)))
                  (__f2 (__f1 (select initial_1_trace 4)))))
      (a!211 (and (__f3 (__f1 (select initial_1_trace 4)))
                  (__f4 (__f1 (select initial_1_trace 4)))))
      (a!212 (and (__f4 (__f1 (select initial_1_trace 4)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!213 (and (__f4 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!214 (and (__f2 (__f1 (select initial_1_trace 4)))
                  (__f3 (__f1 (select initial_1_trace 4)))))
      (a!215 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!216 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!217 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!218 (and (__f6 (__f1 (select initial_1_trace 4)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!219 (and (__f6 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!220 (and (__f7 (__f1 (select initial_1_trace 4)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!221 (<= (__f1 (__f2 (select initial_1_trace 0)))
                 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!222 (= (__f1 (__f2 (select initial_1_trace 5)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!223 (<= (__f2 (__f2 (select initial_1_trace 0)))
                 (__f2 (__f2 (select initial_1_trace 5)))))
      (a!224 (<= 0 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!225 (and (__f1 (__f1 (select initial_1_trace 5)))
                  (__f2 (__f1 (select initial_1_trace 0)))))
      (a!226 (and (__f3 (__f1 (select initial_1_trace 5)))
                  (__f4 (__f1 (select initial_1_trace 0)))))
      (a!227 (and (__f4 (__f1 (select initial_1_trace 5)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!228 (and (__f4 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!229 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (__f3 (__f1 (select initial_1_trace 0)))))
      (a!230 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!231 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!232 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!233 (and (__f6 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!234 (and (__f6 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!235 (and (__f7 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!238 (<= (__f1 (__f2 (select initial_1_trace 1)))
                 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!239 (= (__f1 (__f2 (select initial_1_trace 5)))
                (__f1 (__f2 (select initial_1_trace 1)))))
      (a!240 (<= (__f2 (__f2 (select initial_1_trace 1)))
                 (__f2 (__f2 (select initial_1_trace 5)))))
      (a!241 (and (__f1 (__f1 (select initial_1_trace 5)))
                  (__f2 (__f1 (select initial_1_trace 1)))))
      (a!242 (and (__f3 (__f1 (select initial_1_trace 5)))
                  (__f4 (__f1 (select initial_1_trace 1)))))
      (a!243 (and (__f4 (__f1 (select initial_1_trace 5)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!244 (and (__f4 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!245 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (__f3 (__f1 (select initial_1_trace 1)))))
      (a!246 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!247 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!248 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!249 (and (__f6 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!250 (and (__f6 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!251 (and (__f7 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!254 (<= (__f1 (__f2 (select initial_1_trace 2)))
                 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!255 (= (__f1 (__f2 (select initial_1_trace 5)))
                (__f1 (__f2 (select initial_1_trace 2)))))
      (a!256 (<= (__f2 (__f2 (select initial_1_trace 2)))
                 (__f2 (__f2 (select initial_1_trace 5)))))
      (a!257 (and (__f1 (__f1 (select initial_1_trace 5)))
                  (__f2 (__f1 (select initial_1_trace 2)))))
      (a!258 (and (__f3 (__f1 (select initial_1_trace 5)))
                  (__f4 (__f1 (select initial_1_trace 2)))))
      (a!259 (and (__f4 (__f1 (select initial_1_trace 5)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!260 (and (__f4 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!261 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (__f3 (__f1 (select initial_1_trace 2)))))
      (a!262 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!263 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!264 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!265 (and (__f6 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!266 (and (__f6 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!267 (and (__f7 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!270 (<= (__f1 (__f2 (select initial_1_trace 3)))
                 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!271 (= (__f1 (__f2 (select initial_1_trace 5)))
                (__f1 (__f2 (select initial_1_trace 3)))))
      (a!272 (<= (__f2 (__f2 (select initial_1_trace 3)))
                 (__f2 (__f2 (select initial_1_trace 5)))))
      (a!273 (and (__f1 (__f1 (select initial_1_trace 5)))
                  (__f2 (__f1 (select initial_1_trace 3)))))
      (a!274 (and (__f3 (__f1 (select initial_1_trace 5)))
                  (__f4 (__f1 (select initial_1_trace 3)))))
      (a!275 (and (__f4 (__f1 (select initial_1_trace 5)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!276 (and (__f4 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!277 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (__f3 (__f1 (select initial_1_trace 3)))))
      (a!278 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!279 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!280 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!281 (and (__f6 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!282 (and (__f6 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!283 (and (__f7 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!286 (<= (__f1 (__f2 (select initial_1_trace 4)))
                 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!287 (= (__f1 (__f2 (select initial_1_trace 5)))
                (__f1 (__f2 (select initial_1_trace 4)))))
      (a!288 (<= (__f2 (__f2 (select initial_1_trace 4)))
                 (__f2 (__f2 (select initial_1_trace 5)))))
      (a!289 (and (__f1 (__f1 (select initial_1_trace 5)))
                  (__f2 (__f1 (select initial_1_trace 4)))))
      (a!290 (and (__f3 (__f1 (select initial_1_trace 5)))
                  (__f4 (__f1 (select initial_1_trace 4)))))
      (a!291 (and (__f4 (__f1 (select initial_1_trace 5)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!292 (and (__f4 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!293 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (__f3 (__f1 (select initial_1_trace 4)))))
      (a!294 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!295 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!296 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!297 (and (__f6 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!298 (and (__f6 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!299 (and (__f7 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!302 (and (__f1 (__f1 (select initial_1_trace 5)))
                  (__f2 (__f1 (select initial_1_trace 5)))))
      (a!303 (and (__f3 (__f1 (select initial_1_trace 5)))
                  (__f4 (__f1 (select initial_1_trace 5)))))
      (a!304 (and (__f4 (__f1 (select initial_1_trace 5)))
                  (__f6 (__f1 (select initial_1_trace 5)))))
      (a!305 (and (__f4 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!306 (and (__f2 (__f1 (select initial_1_trace 5)))
                  (__f3 (__f1 (select initial_1_trace 5)))))
      (a!307 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f6 (__f1 (select initial_1_trace 5)))))
      (a!308 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!309 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!310 (and (__f6 (__f1 (select initial_1_trace 5)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!311 (and (__f6 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!312 (and (__f7 (__f1 (select initial_1_trace 5)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!313 (<= (__f1 (__f2 (select initial_1_trace 0)))
                 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!314 (= (__f1 (__f2 (select initial_1_trace 6)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!315 (<= (__f2 (__f2 (select initial_1_trace 0)))
                 (__f2 (__f2 (select initial_1_trace 6)))))
      (a!316 (<= 0 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!317 (and (__f1 (__f1 (select initial_1_trace 6)))
                  (__f2 (__f1 (select initial_1_trace 0)))))
      (a!318 (and (__f3 (__f1 (select initial_1_trace 6)))
                  (__f4 (__f1 (select initial_1_trace 0)))))
      (a!319 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!320 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!321 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (__f3 (__f1 (select initial_1_trace 0)))))
      (a!322 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!323 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!324 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!325 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!326 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!327 (and (__f7 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!330 (<= (__f1 (__f2 (select initial_1_trace 1)))
                 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!331 (= (__f1 (__f2 (select initial_1_trace 6)))
                (__f1 (__f2 (select initial_1_trace 1)))))
      (a!332 (<= (__f2 (__f2 (select initial_1_trace 1)))
                 (__f2 (__f2 (select initial_1_trace 6)))))
      (a!333 (and (__f1 (__f1 (select initial_1_trace 6)))
                  (__f2 (__f1 (select initial_1_trace 1)))))
      (a!334 (and (__f3 (__f1 (select initial_1_trace 6)))
                  (__f4 (__f1 (select initial_1_trace 1)))))
      (a!335 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!336 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!337 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (__f3 (__f1 (select initial_1_trace 1)))))
      (a!338 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!339 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!340 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!341 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!342 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!343 (and (__f7 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!346 (<= (__f1 (__f2 (select initial_1_trace 2)))
                 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!347 (= (__f1 (__f2 (select initial_1_trace 6)))
                (__f1 (__f2 (select initial_1_trace 2)))))
      (a!348 (<= (__f2 (__f2 (select initial_1_trace 2)))
                 (__f2 (__f2 (select initial_1_trace 6)))))
      (a!349 (and (__f1 (__f1 (select initial_1_trace 6)))
                  (__f2 (__f1 (select initial_1_trace 2)))))
      (a!350 (and (__f3 (__f1 (select initial_1_trace 6)))
                  (__f4 (__f1 (select initial_1_trace 2)))))
      (a!351 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!352 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!353 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (__f3 (__f1 (select initial_1_trace 2)))))
      (a!354 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!355 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!356 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!357 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!358 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!359 (and (__f7 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!362 (<= (__f1 (__f2 (select initial_1_trace 3)))
                 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!363 (= (__f1 (__f2 (select initial_1_trace 6)))
                (__f1 (__f2 (select initial_1_trace 3)))))
      (a!364 (<= (__f2 (__f2 (select initial_1_trace 3)))
                 (__f2 (__f2 (select initial_1_trace 6)))))
      (a!365 (and (__f1 (__f1 (select initial_1_trace 6)))
                  (__f2 (__f1 (select initial_1_trace 3)))))
      (a!366 (and (__f3 (__f1 (select initial_1_trace 6)))
                  (__f4 (__f1 (select initial_1_trace 3)))))
      (a!367 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!368 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!369 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (__f3 (__f1 (select initial_1_trace 3)))))
      (a!370 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!371 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!372 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!373 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!374 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!375 (and (__f7 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!378 (<= (__f1 (__f2 (select initial_1_trace 4)))
                 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!379 (= (__f1 (__f2 (select initial_1_trace 6)))
                (__f1 (__f2 (select initial_1_trace 4)))))
      (a!380 (<= (__f2 (__f2 (select initial_1_trace 4)))
                 (__f2 (__f2 (select initial_1_trace 6)))))
      (a!381 (and (__f1 (__f1 (select initial_1_trace 6)))
                  (__f2 (__f1 (select initial_1_trace 4)))))
      (a!382 (and (__f3 (__f1 (select initial_1_trace 6)))
                  (__f4 (__f1 (select initial_1_trace 4)))))
      (a!383 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!384 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!385 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (__f3 (__f1 (select initial_1_trace 4)))))
      (a!386 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!387 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!388 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!389 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!390 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!391 (and (__f7 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!394 (<= (__f1 (__f2 (select initial_1_trace 5)))
                 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!395 (= (__f1 (__f2 (select initial_1_trace 6)))
                (__f1 (__f2 (select initial_1_trace 5)))))
      (a!396 (<= (__f2 (__f2 (select initial_1_trace 5)))
                 (__f2 (__f2 (select initial_1_trace 6)))))
      (a!397 (and (__f1 (__f1 (select initial_1_trace 6)))
                  (__f2 (__f1 (select initial_1_trace 5)))))
      (a!398 (and (__f3 (__f1 (select initial_1_trace 6)))
                  (__f4 (__f1 (select initial_1_trace 5)))))
      (a!399 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 5)))))
      (a!400 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!401 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (__f3 (__f1 (select initial_1_trace 5)))))
      (a!402 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 5)))))
      (a!403 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!404 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!405 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!406 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!407 (and (__f7 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!410 (and (__f1 (__f1 (select initial_1_trace 6)))
                  (__f2 (__f1 (select initial_1_trace 6)))))
      (a!411 (and (__f3 (__f1 (select initial_1_trace 6)))
                  (__f4 (__f1 (select initial_1_trace 6)))))
      (a!412 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 6)))))
      (a!413 (and (__f4 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!414 (and (__f2 (__f1 (select initial_1_trace 6)))
                  (__f3 (__f1 (select initial_1_trace 6)))))
      (a!415 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f6 (__f1 (select initial_1_trace 6)))))
      (a!416 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!417 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!418 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!419 (and (__f6 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!420 (and (__f7 (__f1 (select initial_1_trace 6)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!421 (<= (__f1 (__f2 (select initial_1_trace 0)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!422 (= (__f1 (__f2 (select initial_1_trace 7)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!423 (<= (__f2 (__f2 (select initial_1_trace 0)))
                 (__f2 (__f2 (select initial_1_trace 7)))))
      (a!424 (<= 0 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!425 (and (__f1 (__f1 (select initial_1_trace 7)))
                  (__f2 (__f1 (select initial_1_trace 0)))))
      (a!426 (and (__f3 (__f1 (select initial_1_trace 7)))
                  (__f4 (__f1 (select initial_1_trace 0)))))
      (a!427 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!428 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!429 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (__f3 (__f1 (select initial_1_trace 0)))))
      (a!430 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!431 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!432 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!433 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!434 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!435 (and (__f7 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!438 (<= (__f1 (__f2 (select initial_1_trace 1)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!439 (= (__f1 (__f2 (select initial_1_trace 7)))
                (__f1 (__f2 (select initial_1_trace 1)))))
      (a!440 (<= (__f2 (__f2 (select initial_1_trace 1)))
                 (__f2 (__f2 (select initial_1_trace 7)))))
      (a!441 (and (__f1 (__f1 (select initial_1_trace 7)))
                  (__f2 (__f1 (select initial_1_trace 1)))))
      (a!442 (and (__f3 (__f1 (select initial_1_trace 7)))
                  (__f4 (__f1 (select initial_1_trace 1)))))
      (a!443 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!444 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!445 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (__f3 (__f1 (select initial_1_trace 1)))))
      (a!446 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!447 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!448 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!449 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!450 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!451 (and (__f7 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!454 (<= (__f1 (__f2 (select initial_1_trace 2)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!455 (= (__f1 (__f2 (select initial_1_trace 7)))
                (__f1 (__f2 (select initial_1_trace 2)))))
      (a!456 (<= (__f2 (__f2 (select initial_1_trace 2)))
                 (__f2 (__f2 (select initial_1_trace 7)))))
      (a!457 (and (__f1 (__f1 (select initial_1_trace 7)))
                  (__f2 (__f1 (select initial_1_trace 2)))))
      (a!458 (and (__f3 (__f1 (select initial_1_trace 7)))
                  (__f4 (__f1 (select initial_1_trace 2)))))
      (a!459 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!460 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!461 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (__f3 (__f1 (select initial_1_trace 2)))))
      (a!462 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!463 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!464 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!465 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!466 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!467 (and (__f7 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!470 (<= (__f1 (__f2 (select initial_1_trace 3)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!471 (= (__f1 (__f2 (select initial_1_trace 7)))
                (__f1 (__f2 (select initial_1_trace 3)))))
      (a!472 (<= (__f2 (__f2 (select initial_1_trace 3)))
                 (__f2 (__f2 (select initial_1_trace 7)))))
      (a!473 (and (__f1 (__f1 (select initial_1_trace 7)))
                  (__f2 (__f1 (select initial_1_trace 3)))))
      (a!474 (and (__f3 (__f1 (select initial_1_trace 7)))
                  (__f4 (__f1 (select initial_1_trace 3)))))
      (a!475 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!476 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!477 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (__f3 (__f1 (select initial_1_trace 3)))))
      (a!478 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!479 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!480 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!481 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!482 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!483 (and (__f7 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!486 (<= (__f1 (__f2 (select initial_1_trace 4)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!487 (= (__f1 (__f2 (select initial_1_trace 7)))
                (__f1 (__f2 (select initial_1_trace 4)))))
      (a!488 (<= (__f2 (__f2 (select initial_1_trace 4)))
                 (__f2 (__f2 (select initial_1_trace 7)))))
      (a!489 (and (__f1 (__f1 (select initial_1_trace 7)))
                  (__f2 (__f1 (select initial_1_trace 4)))))
      (a!490 (and (__f3 (__f1 (select initial_1_trace 7)))
                  (__f4 (__f1 (select initial_1_trace 4)))))
      (a!491 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!492 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!493 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (__f3 (__f1 (select initial_1_trace 4)))))
      (a!494 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!495 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!496 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!497 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!498 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!499 (and (__f7 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!502 (<= (__f1 (__f2 (select initial_1_trace 5)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!503 (= (__f1 (__f2 (select initial_1_trace 7)))
                (__f1 (__f2 (select initial_1_trace 5)))))
      (a!504 (<= (__f2 (__f2 (select initial_1_trace 5)))
                 (__f2 (__f2 (select initial_1_trace 7)))))
      (a!505 (and (__f1 (__f1 (select initial_1_trace 7)))
                  (__f2 (__f1 (select initial_1_trace 5)))))
      (a!506 (and (__f3 (__f1 (select initial_1_trace 7)))
                  (__f4 (__f1 (select initial_1_trace 5)))))
      (a!507 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 5)))))
      (a!508 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!509 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (__f3 (__f1 (select initial_1_trace 5)))))
      (a!510 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 5)))))
      (a!511 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!512 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!513 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!514 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!515 (and (__f7 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!518 (<= (__f1 (__f2 (select initial_1_trace 6)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!519 (= (__f1 (__f2 (select initial_1_trace 7)))
                (__f1 (__f2 (select initial_1_trace 6)))))
      (a!520 (<= (__f2 (__f2 (select initial_1_trace 6)))
                 (__f2 (__f2 (select initial_1_trace 7)))))
      (a!521 (and (__f1 (__f1 (select initial_1_trace 7)))
                  (__f2 (__f1 (select initial_1_trace 6)))))
      (a!522 (and (__f3 (__f1 (select initial_1_trace 7)))
                  (__f4 (__f1 (select initial_1_trace 6)))))
      (a!523 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 6)))))
      (a!524 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!525 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (__f3 (__f1 (select initial_1_trace 6)))))
      (a!526 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 6)))))
      (a!527 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!528 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!529 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!530 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!531 (and (__f7 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!534 (and (__f1 (__f1 (select initial_1_trace 7)))
                  (__f2 (__f1 (select initial_1_trace 7)))))
      (a!535 (and (__f3 (__f1 (select initial_1_trace 7)))
                  (__f4 (__f1 (select initial_1_trace 7)))))
      (a!536 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 7)))))
      (a!537 (and (__f4 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 7)))))
      (a!538 (and (__f2 (__f1 (select initial_1_trace 7)))
                  (__f3 (__f1 (select initial_1_trace 7)))))
      (a!539 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f6 (__f1 (select initial_1_trace 7)))))
      (a!540 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 7)))))
      (a!541 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 7)))))
      (a!542 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f7 (__f1 (select initial_1_trace 7)))))
      (a!543 (and (__f6 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 7)))))
      (a!544 (and (__f7 (__f1 (select initial_1_trace 7)))
                  (__f8 (__f1 (select initial_1_trace 7)))))
      (a!545 (<= (__f1 (__f2 (select initial_1_trace 0)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!546 (= (__f1 (__f2 (select initial_1_trace 8)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!547 (<= (__f2 (__f2 (select initial_1_trace 0)))
                 (__f2 (__f2 (select initial_1_trace 8)))))
      (a!548 (<= 0 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!549 (and (__f1 (__f1 (select initial_1_trace 8)))
                  (__f2 (__f1 (select initial_1_trace 0)))))
      (a!550 (and (__f3 (__f1 (select initial_1_trace 8)))
                  (__f4 (__f1 (select initial_1_trace 0)))))
      (a!551 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!552 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!553 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (__f3 (__f1 (select initial_1_trace 0)))))
      (a!554 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!555 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!556 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!557 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!558 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!559 (and (__f7 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!562 (<= (__f1 (__f2 (select initial_1_trace 1)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!563 (= (__f1 (__f2 (select initial_1_trace 8)))
                (__f1 (__f2 (select initial_1_trace 1)))))
      (a!564 (<= (__f2 (__f2 (select initial_1_trace 1)))
                 (__f2 (__f2 (select initial_1_trace 8)))))
      (a!565 (and (__f1 (__f1 (select initial_1_trace 8)))
                  (__f2 (__f1 (select initial_1_trace 1)))))
      (a!566 (and (__f3 (__f1 (select initial_1_trace 8)))
                  (__f4 (__f1 (select initial_1_trace 1)))))
      (a!567 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!568 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!569 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (__f3 (__f1 (select initial_1_trace 1)))))
      (a!570 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!571 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!572 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!573 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!574 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!575 (and (__f7 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!578 (<= (__f1 (__f2 (select initial_1_trace 2)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!579 (= (__f1 (__f2 (select initial_1_trace 8)))
                (__f1 (__f2 (select initial_1_trace 2)))))
      (a!580 (<= (__f2 (__f2 (select initial_1_trace 2)))
                 (__f2 (__f2 (select initial_1_trace 8)))))
      (a!581 (and (__f1 (__f1 (select initial_1_trace 8)))
                  (__f2 (__f1 (select initial_1_trace 2)))))
      (a!582 (and (__f3 (__f1 (select initial_1_trace 8)))
                  (__f4 (__f1 (select initial_1_trace 2)))))
      (a!583 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!584 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!585 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (__f3 (__f1 (select initial_1_trace 2)))))
      (a!586 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!587 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!588 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!589 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!590 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!591 (and (__f7 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!594 (<= (__f1 (__f2 (select initial_1_trace 3)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!595 (= (__f1 (__f2 (select initial_1_trace 8)))
                (__f1 (__f2 (select initial_1_trace 3)))))
      (a!596 (<= (__f2 (__f2 (select initial_1_trace 3)))
                 (__f2 (__f2 (select initial_1_trace 8)))))
      (a!597 (and (__f1 (__f1 (select initial_1_trace 8)))
                  (__f2 (__f1 (select initial_1_trace 3)))))
      (a!598 (and (__f3 (__f1 (select initial_1_trace 8)))
                  (__f4 (__f1 (select initial_1_trace 3)))))
      (a!599 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!600 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!601 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (__f3 (__f1 (select initial_1_trace 3)))))
      (a!602 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!603 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!604 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!605 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!606 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!607 (and (__f7 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!610 (<= (__f1 (__f2 (select initial_1_trace 4)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!611 (= (__f1 (__f2 (select initial_1_trace 8)))
                (__f1 (__f2 (select initial_1_trace 4)))))
      (a!612 (<= (__f2 (__f2 (select initial_1_trace 4)))
                 (__f2 (__f2 (select initial_1_trace 8)))))
      (a!613 (and (__f1 (__f1 (select initial_1_trace 8)))
                  (__f2 (__f1 (select initial_1_trace 4)))))
      (a!614 (and (__f3 (__f1 (select initial_1_trace 8)))
                  (__f4 (__f1 (select initial_1_trace 4)))))
      (a!615 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!616 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!617 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (__f3 (__f1 (select initial_1_trace 4)))))
      (a!618 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!619 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!620 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!621 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!622 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!623 (and (__f7 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!626 (<= (__f1 (__f2 (select initial_1_trace 5)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!627 (= (__f1 (__f2 (select initial_1_trace 8)))
                (__f1 (__f2 (select initial_1_trace 5)))))
      (a!628 (<= (__f2 (__f2 (select initial_1_trace 5)))
                 (__f2 (__f2 (select initial_1_trace 8)))))
      (a!629 (and (__f1 (__f1 (select initial_1_trace 8)))
                  (__f2 (__f1 (select initial_1_trace 5)))))
      (a!630 (and (__f3 (__f1 (select initial_1_trace 8)))
                  (__f4 (__f1 (select initial_1_trace 5)))))
      (a!631 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 5)))))
      (a!632 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!633 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (__f3 (__f1 (select initial_1_trace 5)))))
      (a!634 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 5)))))
      (a!635 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!636 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!637 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!638 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!639 (and (__f7 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!642 (<= (__f1 (__f2 (select initial_1_trace 6)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!643 (= (__f1 (__f2 (select initial_1_trace 8)))
                (__f1 (__f2 (select initial_1_trace 6)))))
      (a!644 (<= (__f2 (__f2 (select initial_1_trace 6)))
                 (__f2 (__f2 (select initial_1_trace 8)))))
      (a!645 (and (__f1 (__f1 (select initial_1_trace 8)))
                  (__f2 (__f1 (select initial_1_trace 6)))))
      (a!646 (and (__f3 (__f1 (select initial_1_trace 8)))
                  (__f4 (__f1 (select initial_1_trace 6)))))
      (a!647 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 6)))))
      (a!648 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!649 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (__f3 (__f1 (select initial_1_trace 6)))))
      (a!650 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 6)))))
      (a!651 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!652 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!653 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!654 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!655 (and (__f7 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!658 (<= (__f1 (__f2 (select initial_1_trace 7)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!659 (= (__f1 (__f2 (select initial_1_trace 8)))
                (__f1 (__f2 (select initial_1_trace 7)))))
      (a!660 (<= (__f2 (__f2 (select initial_1_trace 7)))
                 (__f2 (__f2 (select initial_1_trace 8)))))
      (a!661 (and (__f1 (__f1 (select initial_1_trace 8)))
                  (__f2 (__f1 (select initial_1_trace 7)))))
      (a!662 (and (__f3 (__f1 (select initial_1_trace 8)))
                  (__f4 (__f1 (select initial_1_trace 7)))))
      (a!663 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 7)))))
      (a!664 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 7)))))
      (a!665 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (__f3 (__f1 (select initial_1_trace 7)))))
      (a!666 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 7)))))
      (a!667 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 7)))))
      (a!668 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 7)))))
      (a!669 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 7)))))
      (a!670 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 7)))))
      (a!671 (and (__f7 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 7)))))
      (a!674 (and (__f1 (__f1 (select initial_1_trace 8)))
                  (__f2 (__f1 (select initial_1_trace 8)))))
      (a!675 (and (__f3 (__f1 (select initial_1_trace 8)))
                  (__f4 (__f1 (select initial_1_trace 8)))))
      (a!676 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 8)))))
      (a!677 (and (__f4 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 8)))))
      (a!678 (and (__f2 (__f1 (select initial_1_trace 8)))
                  (__f3 (__f1 (select initial_1_trace 8)))))
      (a!679 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f6 (__f1 (select initial_1_trace 8)))))
      (a!680 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 8)))))
      (a!681 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 8)))))
      (a!682 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f7 (__f1 (select initial_1_trace 8)))))
      (a!683 (and (__f6 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 8)))))
      (a!684 (and (__f7 (__f1 (select initial_1_trace 8)))
                  (__f8 (__f1 (select initial_1_trace 8)))))
      (a!685 (<= (__f1 (__f2 (select initial_1_trace 0)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!686 (= (__f1 (__f2 (select initial_1_trace 9)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!687 (<= (__f2 (__f2 (select initial_1_trace 0)))
                 (__f2 (__f2 (select initial_1_trace 9)))))
      (a!688 (<= 0 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!689 (and (__f1 (__f1 (select initial_1_trace 9)))
                  (__f2 (__f1 (select initial_1_trace 0)))))
      (a!690 (and (__f3 (__f1 (select initial_1_trace 9)))
                  (__f4 (__f1 (select initial_1_trace 0)))))
      (a!691 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!692 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!693 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (__f3 (__f1 (select initial_1_trace 0)))))
      (a!694 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!695 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!696 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!697 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!698 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!699 (and (__f7 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!702 (<= (__f1 (__f2 (select initial_1_trace 1)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!703 (= (__f1 (__f2 (select initial_1_trace 9)))
                (__f1 (__f2 (select initial_1_trace 1)))))
      (a!704 (<= (__f2 (__f2 (select initial_1_trace 1)))
                 (__f2 (__f2 (select initial_1_trace 9)))))
      (a!705 (and (__f1 (__f1 (select initial_1_trace 9)))
                  (__f2 (__f1 (select initial_1_trace 1)))))
      (a!706 (and (__f3 (__f1 (select initial_1_trace 9)))
                  (__f4 (__f1 (select initial_1_trace 1)))))
      (a!707 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!708 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!709 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (__f3 (__f1 (select initial_1_trace 1)))))
      (a!710 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!711 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!712 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!713 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!714 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!715 (and (__f7 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!718 (<= (__f1 (__f2 (select initial_1_trace 2)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!719 (= (__f1 (__f2 (select initial_1_trace 9)))
                (__f1 (__f2 (select initial_1_trace 2)))))
      (a!720 (<= (__f2 (__f2 (select initial_1_trace 2)))
                 (__f2 (__f2 (select initial_1_trace 9)))))
      (a!721 (and (__f1 (__f1 (select initial_1_trace 9)))
                  (__f2 (__f1 (select initial_1_trace 2)))))
      (a!722 (and (__f3 (__f1 (select initial_1_trace 9)))
                  (__f4 (__f1 (select initial_1_trace 2)))))
      (a!723 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!724 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!725 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (__f3 (__f1 (select initial_1_trace 2)))))
      (a!726 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!727 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!728 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!729 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!730 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!731 (and (__f7 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!734 (<= (__f1 (__f2 (select initial_1_trace 3)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!735 (= (__f1 (__f2 (select initial_1_trace 9)))
                (__f1 (__f2 (select initial_1_trace 3)))))
      (a!736 (<= (__f2 (__f2 (select initial_1_trace 3)))
                 (__f2 (__f2 (select initial_1_trace 9)))))
      (a!737 (and (__f1 (__f1 (select initial_1_trace 9)))
                  (__f2 (__f1 (select initial_1_trace 3)))))
      (a!738 (and (__f3 (__f1 (select initial_1_trace 9)))
                  (__f4 (__f1 (select initial_1_trace 3)))))
      (a!739 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!740 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!741 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (__f3 (__f1 (select initial_1_trace 3)))))
      (a!742 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!743 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!744 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!745 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!746 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!747 (and (__f7 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!750 (<= (__f1 (__f2 (select initial_1_trace 4)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!751 (= (__f1 (__f2 (select initial_1_trace 9)))
                (__f1 (__f2 (select initial_1_trace 4)))))
      (a!752 (<= (__f2 (__f2 (select initial_1_trace 4)))
                 (__f2 (__f2 (select initial_1_trace 9)))))
      (a!753 (and (__f1 (__f1 (select initial_1_trace 9)))
                  (__f2 (__f1 (select initial_1_trace 4)))))
      (a!754 (and (__f3 (__f1 (select initial_1_trace 9)))
                  (__f4 (__f1 (select initial_1_trace 4)))))
      (a!755 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!756 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!757 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (__f3 (__f1 (select initial_1_trace 4)))))
      (a!758 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!759 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!760 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!761 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!762 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!763 (and (__f7 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!766 (<= (__f1 (__f2 (select initial_1_trace 5)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!767 (= (__f1 (__f2 (select initial_1_trace 9)))
                (__f1 (__f2 (select initial_1_trace 5)))))
      (a!768 (<= (__f2 (__f2 (select initial_1_trace 5)))
                 (__f2 (__f2 (select initial_1_trace 9)))))
      (a!769 (and (__f1 (__f1 (select initial_1_trace 9)))
                  (__f2 (__f1 (select initial_1_trace 5)))))
      (a!770 (and (__f3 (__f1 (select initial_1_trace 9)))
                  (__f4 (__f1 (select initial_1_trace 5)))))
      (a!771 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 5)))))
      (a!772 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!773 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (__f3 (__f1 (select initial_1_trace 5)))))
      (a!774 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 5)))))
      (a!775 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!776 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!777 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!778 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!779 (and (__f7 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!782 (<= (__f1 (__f2 (select initial_1_trace 6)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!783 (= (__f1 (__f2 (select initial_1_trace 9)))
                (__f1 (__f2 (select initial_1_trace 6)))))
      (a!784 (<= (__f2 (__f2 (select initial_1_trace 6)))
                 (__f2 (__f2 (select initial_1_trace 9)))))
      (a!785 (and (__f1 (__f1 (select initial_1_trace 9)))
                  (__f2 (__f1 (select initial_1_trace 6)))))
      (a!786 (and (__f3 (__f1 (select initial_1_trace 9)))
                  (__f4 (__f1 (select initial_1_trace 6)))))
      (a!787 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 6)))))
      (a!788 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!789 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (__f3 (__f1 (select initial_1_trace 6)))))
      (a!790 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 6)))))
      (a!791 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!792 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!793 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!794 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!795 (and (__f7 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!798 (<= (__f1 (__f2 (select initial_1_trace 7)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!799 (= (__f1 (__f2 (select initial_1_trace 9)))
                (__f1 (__f2 (select initial_1_trace 7)))))
      (a!800 (<= (__f2 (__f2 (select initial_1_trace 7)))
                 (__f2 (__f2 (select initial_1_trace 9)))))
      (a!801 (and (__f1 (__f1 (select initial_1_trace 9)))
                  (__f2 (__f1 (select initial_1_trace 7)))))
      (a!802 (and (__f3 (__f1 (select initial_1_trace 9)))
                  (__f4 (__f1 (select initial_1_trace 7)))))
      (a!803 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 7)))))
      (a!804 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 7)))))
      (a!805 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (__f3 (__f1 (select initial_1_trace 7)))))
      (a!806 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 7)))))
      (a!807 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 7)))))
      (a!808 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 7)))))
      (a!809 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 7)))))
      (a!810 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 7)))))
      (a!811 (and (__f7 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 7)))))
      (a!814 (<= (__f1 (__f2 (select initial_1_trace 8)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!815 (= (__f1 (__f2 (select initial_1_trace 9)))
                (__f1 (__f2 (select initial_1_trace 8)))))
      (a!816 (<= (__f2 (__f2 (select initial_1_trace 8)))
                 (__f2 (__f2 (select initial_1_trace 9)))))
      (a!817 (and (__f1 (__f1 (select initial_1_trace 9)))
                  (__f2 (__f1 (select initial_1_trace 8)))))
      (a!818 (and (__f3 (__f1 (select initial_1_trace 9)))
                  (__f4 (__f1 (select initial_1_trace 8)))))
      (a!819 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 8)))))
      (a!820 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 8)))))
      (a!821 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (__f3 (__f1 (select initial_1_trace 8)))))
      (a!822 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 8)))))
      (a!823 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 8)))))
      (a!824 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 8)))))
      (a!825 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 8)))))
      (a!826 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 8)))))
      (a!827 (and (__f7 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 8)))))
      (a!830 (and (__f1 (__f1 (select initial_1_trace 9)))
                  (__f2 (__f1 (select initial_1_trace 9)))))
      (a!831 (and (__f3 (__f1 (select initial_1_trace 9)))
                  (__f4 (__f1 (select initial_1_trace 9)))))
      (a!832 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 9)))))
      (a!833 (and (__f4 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 9)))))
      (a!834 (and (__f2 (__f1 (select initial_1_trace 9)))
                  (__f3 (__f1 (select initial_1_trace 9)))))
      (a!835 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f6 (__f1 (select initial_1_trace 9)))))
      (a!836 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 9)))))
      (a!837 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 9)))))
      (a!838 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f7 (__f1 (select initial_1_trace 9)))))
      (a!839 (and (__f6 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 9)))))
      (a!840 (and (__f7 (__f1 (select initial_1_trace 9)))
                  (__f8 (__f1 (select initial_1_trace 9)))))
      (a!841 (<= (__f1 (__f2 (select initial_1_trace 0)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!842 (= (__f1 (__f2 (select initial_1_trace 10)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!843 (<= (__f2 (__f2 (select initial_1_trace 0)))
                 (__f2 (__f2 (select initial_1_trace 10)))))
      (a!844 (<= 0 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!845 (and (__f1 (__f1 (select initial_1_trace 10)))
                  (__f2 (__f1 (select initial_1_trace 0)))))
      (a!846 (and (__f3 (__f1 (select initial_1_trace 10)))
                  (__f4 (__f1 (select initial_1_trace 0)))))
      (a!847 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!848 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!849 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (__f3 (__f1 (select initial_1_trace 0)))))
      (a!850 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 0)))))
      (a!851 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!852 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!853 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 0)))))
      (a!854 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!855 (and (__f7 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 0)))))
      (a!858 (<= (__f1 (__f2 (select initial_1_trace 1)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!859 (= (__f1 (__f2 (select initial_1_trace 10)))
                (__f1 (__f2 (select initial_1_trace 1)))))
      (a!860 (<= (__f2 (__f2 (select initial_1_trace 1)))
                 (__f2 (__f2 (select initial_1_trace 10)))))
      (a!861 (and (__f1 (__f1 (select initial_1_trace 10)))
                  (__f2 (__f1 (select initial_1_trace 1)))))
      (a!862 (and (__f3 (__f1 (select initial_1_trace 10)))
                  (__f4 (__f1 (select initial_1_trace 1)))))
      (a!863 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!864 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!865 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (__f3 (__f1 (select initial_1_trace 1)))))
      (a!866 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 1)))))
      (a!867 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!868 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!869 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 1)))))
      (a!870 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!871 (and (__f7 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 1)))))
      (a!874 (<= (__f1 (__f2 (select initial_1_trace 2)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!875 (= (__f1 (__f2 (select initial_1_trace 10)))
                (__f1 (__f2 (select initial_1_trace 2)))))
      (a!876 (<= (__f2 (__f2 (select initial_1_trace 2)))
                 (__f2 (__f2 (select initial_1_trace 10)))))
      (a!877 (and (__f1 (__f1 (select initial_1_trace 10)))
                  (__f2 (__f1 (select initial_1_trace 2)))))
      (a!878 (and (__f3 (__f1 (select initial_1_trace 10)))
                  (__f4 (__f1 (select initial_1_trace 2)))))
      (a!879 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!880 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!881 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (__f3 (__f1 (select initial_1_trace 2)))))
      (a!882 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 2)))))
      (a!883 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!884 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!885 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 2)))))
      (a!886 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!887 (and (__f7 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 2)))))
      (a!890 (<= (__f1 (__f2 (select initial_1_trace 3)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!891 (= (__f1 (__f2 (select initial_1_trace 10)))
                (__f1 (__f2 (select initial_1_trace 3)))))
      (a!892 (<= (__f2 (__f2 (select initial_1_trace 3)))
                 (__f2 (__f2 (select initial_1_trace 10)))))
      (a!893 (and (__f1 (__f1 (select initial_1_trace 10)))
                  (__f2 (__f1 (select initial_1_trace 3)))))
      (a!894 (and (__f3 (__f1 (select initial_1_trace 10)))
                  (__f4 (__f1 (select initial_1_trace 3)))))
      (a!895 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!896 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!897 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (__f3 (__f1 (select initial_1_trace 3)))))
      (a!898 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 3)))))
      (a!899 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!900 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!901 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 3)))))
      (a!902 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!903 (and (__f7 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 3)))))
      (a!906 (<= (__f1 (__f2 (select initial_1_trace 4)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!907 (= (__f1 (__f2 (select initial_1_trace 10)))
                (__f1 (__f2 (select initial_1_trace 4)))))
      (a!908 (<= (__f2 (__f2 (select initial_1_trace 4)))
                 (__f2 (__f2 (select initial_1_trace 10)))))
      (a!909 (and (__f1 (__f1 (select initial_1_trace 10)))
                  (__f2 (__f1 (select initial_1_trace 4)))))
      (a!910 (and (__f3 (__f1 (select initial_1_trace 10)))
                  (__f4 (__f1 (select initial_1_trace 4)))))
      (a!911 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!912 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!913 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (__f3 (__f1 (select initial_1_trace 4)))))
      (a!914 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 4)))))
      (a!915 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!916 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!917 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 4)))))
      (a!918 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!919 (and (__f7 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 4)))))
      (a!922 (<= (__f1 (__f2 (select initial_1_trace 5)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!923 (= (__f1 (__f2 (select initial_1_trace 10)))
                (__f1 (__f2 (select initial_1_trace 5)))))
      (a!924 (<= (__f2 (__f2 (select initial_1_trace 5)))
                 (__f2 (__f2 (select initial_1_trace 10)))))
      (a!925 (and (__f1 (__f1 (select initial_1_trace 10)))
                  (__f2 (__f1 (select initial_1_trace 5)))))
      (a!926 (and (__f3 (__f1 (select initial_1_trace 10)))
                  (__f4 (__f1 (select initial_1_trace 5)))))
      (a!927 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 5)))))
      (a!928 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!929 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (__f3 (__f1 (select initial_1_trace 5)))))
      (a!930 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 5)))))
      (a!931 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!932 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!933 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 5)))))
      (a!934 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!935 (and (__f7 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 5)))))
      (a!938 (<= (__f1 (__f2 (select initial_1_trace 6)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!939 (= (__f1 (__f2 (select initial_1_trace 10)))
                (__f1 (__f2 (select initial_1_trace 6)))))
      (a!940 (<= (__f2 (__f2 (select initial_1_trace 6)))
                 (__f2 (__f2 (select initial_1_trace 10)))))
      (a!941 (and (__f1 (__f1 (select initial_1_trace 10)))
                  (__f2 (__f1 (select initial_1_trace 6)))))
      (a!942 (and (__f3 (__f1 (select initial_1_trace 10)))
                  (__f4 (__f1 (select initial_1_trace 6)))))
      (a!943 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 6)))))
      (a!944 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!945 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (__f3 (__f1 (select initial_1_trace 6)))))
      (a!946 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 6)))))
      (a!947 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!948 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!949 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 6)))))
      (a!950 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!951 (and (__f7 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 6)))))
      (a!954 (<= (__f1 (__f2 (select initial_1_trace 7)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!955 (= (__f1 (__f2 (select initial_1_trace 10)))
                (__f1 (__f2 (select initial_1_trace 7)))))
      (a!956 (<= (__f2 (__f2 (select initial_1_trace 7)))
                 (__f2 (__f2 (select initial_1_trace 10)))))
      (a!957 (and (__f1 (__f1 (select initial_1_trace 10)))
                  (__f2 (__f1 (select initial_1_trace 7)))))
      (a!958 (and (__f3 (__f1 (select initial_1_trace 10)))
                  (__f4 (__f1 (select initial_1_trace 7)))))
      (a!959 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 7)))))
      (a!960 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 7)))))
      (a!961 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (__f3 (__f1 (select initial_1_trace 7)))))
      (a!962 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 7)))))
      (a!963 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 7)))))
      (a!964 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 7)))))
      (a!965 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 7)))))
      (a!966 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 7)))))
      (a!967 (and (__f7 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 7)))))
      (a!970 (<= (__f1 (__f2 (select initial_1_trace 8)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!971 (= (__f1 (__f2 (select initial_1_trace 10)))
                (__f1 (__f2 (select initial_1_trace 8)))))
      (a!972 (<= (__f2 (__f2 (select initial_1_trace 8)))
                 (__f2 (__f2 (select initial_1_trace 10)))))
      (a!973 (and (__f1 (__f1 (select initial_1_trace 10)))
                  (__f2 (__f1 (select initial_1_trace 8)))))
      (a!974 (and (__f3 (__f1 (select initial_1_trace 10)))
                  (__f4 (__f1 (select initial_1_trace 8)))))
      (a!975 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 8)))))
      (a!976 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 8)))))
      (a!977 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (__f3 (__f1 (select initial_1_trace 8)))))
      (a!978 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 8)))))
      (a!979 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 8)))))
      (a!980 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 8)))))
      (a!981 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 8)))))
      (a!982 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 8)))))
      (a!983 (and (__f7 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 8)))))
      (a!986 (<= (__f1 (__f2 (select initial_1_trace 9)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!987 (= (__f1 (__f2 (select initial_1_trace 10)))
                (__f1 (__f2 (select initial_1_trace 9)))))
      (a!988 (<= (__f2 (__f2 (select initial_1_trace 9)))
                 (__f2 (__f2 (select initial_1_trace 10)))))
      (a!989 (and (__f1 (__f1 (select initial_1_trace 10)))
                  (__f2 (__f1 (select initial_1_trace 9)))))
      (a!990 (and (__f3 (__f1 (select initial_1_trace 10)))
                  (__f4 (__f1 (select initial_1_trace 9)))))
      (a!991 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 9)))))
      (a!992 (and (__f4 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 9)))))
      (a!993 (and (__f2 (__f1 (select initial_1_trace 10)))
                  (__f3 (__f1 (select initial_1_trace 9)))))
      (a!994 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f6 (__f1 (select initial_1_trace 9)))))
      (a!995 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 9)))))
      (a!996 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 9)))))
      (a!997 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f7 (__f1 (select initial_1_trace 9)))))
      (a!998 (and (__f6 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 9)))))
      (a!999 (and (__f7 (__f1 (select initial_1_trace 10)))
                  (__f8 (__f1 (select initial_1_trace 9)))))
      (a!1002 (and (__f1 (__f1 (select initial_1_trace 10)))
                   (__f2 (__f1 (select initial_1_trace 10)))))
      (a!1003 (and (__f3 (__f1 (select initial_1_trace 10)))
                   (__f4 (__f1 (select initial_1_trace 10)))))
      (a!1004 (and (__f4 (__f1 (select initial_1_trace 10)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!1005 (and (__f4 (__f1 (select initial_1_trace 10)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1006 (and (__f2 (__f1 (select initial_1_trace 10)))
                   (__f3 (__f1 (select initial_1_trace 10)))))
      (a!1007 (and (__f5 (__f1 (select initial_1_trace 10)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!1008 (and (__f5 (__f1 (select initial_1_trace 10)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1009 (and (__f5 (__f1 (select initial_1_trace 10)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1010 (and (__f6 (__f1 (select initial_1_trace 10)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1011 (and (__f6 (__f1 (select initial_1_trace 10)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1012 (and (__f7 (__f1 (select initial_1_trace 10)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1013 (<= (__f1 (__f2 (select initial_1_trace 0)))
                  (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1014 (= (__f1 (__f2 (select initial_1_trace 11)))
                 (__f1 (__f2 (select initial_1_trace 0)))))
      (a!1015 (<= (__f2 (__f2 (select initial_1_trace 0)))
                  (__f2 (__f2 (select initial_1_trace 11)))))
      (a!1016 (<= 0 (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1017 (and (__f1 (__f1 (select initial_1_trace 11)))
                   (__f2 (__f1 (select initial_1_trace 0)))))
      (a!1018 (and (__f3 (__f1 (select initial_1_trace 11)))
                   (__f4 (__f1 (select initial_1_trace 0)))))
      (a!1019 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!1020 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1021 (and (__f2 (__f1 (select initial_1_trace 11)))
                   (__f3 (__f1 (select initial_1_trace 0)))))
      (a!1022 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!1023 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1024 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1025 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1026 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1027 (and (__f7 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1030 (<= (__f1 (__f2 (select initial_1_trace 1)))
                  (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1031 (= (__f1 (__f2 (select initial_1_trace 11)))
                 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!1032 (<= (__f2 (__f2 (select initial_1_trace 1)))
                  (__f2 (__f2 (select initial_1_trace 11)))))
      (a!1033 (and (__f1 (__f1 (select initial_1_trace 11)))
                   (__f2 (__f1 (select initial_1_trace 1)))))
      (a!1034 (and (__f3 (__f1 (select initial_1_trace 11)))
                   (__f4 (__f1 (select initial_1_trace 1)))))
      (a!1035 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!1036 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1037 (and (__f2 (__f1 (select initial_1_trace 11)))
                   (__f3 (__f1 (select initial_1_trace 1)))))
      (a!1038 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!1039 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1040 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1041 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1042 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1043 (and (__f7 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1046 (<= (__f1 (__f2 (select initial_1_trace 2)))
                  (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1047 (= (__f1 (__f2 (select initial_1_trace 11)))
                 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!1048 (<= (__f2 (__f2 (select initial_1_trace 2)))
                  (__f2 (__f2 (select initial_1_trace 11)))))
      (a!1049 (and (__f1 (__f1 (select initial_1_trace 11)))
                   (__f2 (__f1 (select initial_1_trace 2)))))
      (a!1050 (and (__f3 (__f1 (select initial_1_trace 11)))
                   (__f4 (__f1 (select initial_1_trace 2)))))
      (a!1051 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!1052 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1053 (and (__f2 (__f1 (select initial_1_trace 11)))
                   (__f3 (__f1 (select initial_1_trace 2)))))
      (a!1054 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!1055 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1056 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1057 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1058 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1059 (and (__f7 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1062 (<= (__f1 (__f2 (select initial_1_trace 3)))
                  (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1063 (= (__f1 (__f2 (select initial_1_trace 11)))
                 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!1064 (<= (__f2 (__f2 (select initial_1_trace 3)))
                  (__f2 (__f2 (select initial_1_trace 11)))))
      (a!1065 (and (__f1 (__f1 (select initial_1_trace 11)))
                   (__f2 (__f1 (select initial_1_trace 3)))))
      (a!1066 (and (__f3 (__f1 (select initial_1_trace 11)))
                   (__f4 (__f1 (select initial_1_trace 3)))))
      (a!1067 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!1068 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1069 (and (__f2 (__f1 (select initial_1_trace 11)))
                   (__f3 (__f1 (select initial_1_trace 3)))))
      (a!1070 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!1071 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1072 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1073 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1074 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1075 (and (__f7 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1078 (<= (__f1 (__f2 (select initial_1_trace 4)))
                  (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1079 (= (__f1 (__f2 (select initial_1_trace 11)))
                 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!1080 (<= (__f2 (__f2 (select initial_1_trace 4)))
                  (__f2 (__f2 (select initial_1_trace 11)))))
      (a!1081 (and (__f1 (__f1 (select initial_1_trace 11)))
                   (__f2 (__f1 (select initial_1_trace 4)))))
      (a!1082 (and (__f3 (__f1 (select initial_1_trace 11)))
                   (__f4 (__f1 (select initial_1_trace 4)))))
      (a!1083 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!1084 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1085 (and (__f2 (__f1 (select initial_1_trace 11)))
                   (__f3 (__f1 (select initial_1_trace 4)))))
      (a!1086 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!1087 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1088 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1089 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1090 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1091 (and (__f7 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1094 (<= (__f1 (__f2 (select initial_1_trace 5)))
                  (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1095 (= (__f1 (__f2 (select initial_1_trace 11)))
                 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!1096 (<= (__f2 (__f2 (select initial_1_trace 5)))
                  (__f2 (__f2 (select initial_1_trace 11)))))
      (a!1097 (and (__f1 (__f1 (select initial_1_trace 11)))
                   (__f2 (__f1 (select initial_1_trace 5)))))
      (a!1098 (and (__f3 (__f1 (select initial_1_trace 11)))
                   (__f4 (__f1 (select initial_1_trace 5)))))
      (a!1099 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!1100 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1101 (and (__f2 (__f1 (select initial_1_trace 11)))
                   (__f3 (__f1 (select initial_1_trace 5)))))
      (a!1102 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!1103 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1104 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1105 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1106 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1107 (and (__f7 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1110 (<= (__f1 (__f2 (select initial_1_trace 6)))
                  (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1111 (= (__f1 (__f2 (select initial_1_trace 11)))
                 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!1112 (<= (__f2 (__f2 (select initial_1_trace 6)))
                  (__f2 (__f2 (select initial_1_trace 11)))))
      (a!1113 (and (__f1 (__f1 (select initial_1_trace 11)))
                   (__f2 (__f1 (select initial_1_trace 6)))))
      (a!1114 (and (__f3 (__f1 (select initial_1_trace 11)))
                   (__f4 (__f1 (select initial_1_trace 6)))))
      (a!1115 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!1116 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1117 (and (__f2 (__f1 (select initial_1_trace 11)))
                   (__f3 (__f1 (select initial_1_trace 6)))))
      (a!1118 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!1119 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1120 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1121 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1122 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1123 (and (__f7 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1126 (<= (__f1 (__f2 (select initial_1_trace 7)))
                  (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1127 (= (__f1 (__f2 (select initial_1_trace 11)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!1128 (<= (__f2 (__f2 (select initial_1_trace 7)))
                  (__f2 (__f2 (select initial_1_trace 11)))))
      (a!1129 (and (__f1 (__f1 (select initial_1_trace 11)))
                   (__f2 (__f1 (select initial_1_trace 7)))))
      (a!1130 (and (__f3 (__f1 (select initial_1_trace 11)))
                   (__f4 (__f1 (select initial_1_trace 7)))))
      (a!1131 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!1132 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1133 (and (__f2 (__f1 (select initial_1_trace 11)))
                   (__f3 (__f1 (select initial_1_trace 7)))))
      (a!1134 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!1135 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1136 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1137 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1138 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1139 (and (__f7 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1142 (<= (__f1 (__f2 (select initial_1_trace 8)))
                  (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1143 (= (__f1 (__f2 (select initial_1_trace 11)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!1144 (<= (__f2 (__f2 (select initial_1_trace 8)))
                  (__f2 (__f2 (select initial_1_trace 11)))))
      (a!1145 (and (__f1 (__f1 (select initial_1_trace 11)))
                   (__f2 (__f1 (select initial_1_trace 8)))))
      (a!1146 (and (__f3 (__f1 (select initial_1_trace 11)))
                   (__f4 (__f1 (select initial_1_trace 8)))))
      (a!1147 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!1148 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!1149 (and (__f2 (__f1 (select initial_1_trace 11)))
                   (__f3 (__f1 (select initial_1_trace 8)))))
      (a!1150 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!1151 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!1152 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!1153 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!1154 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!1155 (and (__f7 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!1158 (<= (__f1 (__f2 (select initial_1_trace 9)))
                  (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1159 (= (__f1 (__f2 (select initial_1_trace 11)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!1160 (<= (__f2 (__f2 (select initial_1_trace 9)))
                  (__f2 (__f2 (select initial_1_trace 11)))))
      (a!1161 (and (__f1 (__f1 (select initial_1_trace 11)))
                   (__f2 (__f1 (select initial_1_trace 9)))))
      (a!1162 (and (__f3 (__f1 (select initial_1_trace 11)))
                   (__f4 (__f1 (select initial_1_trace 9)))))
      (a!1163 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!1164 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!1165 (and (__f2 (__f1 (select initial_1_trace 11)))
                   (__f3 (__f1 (select initial_1_trace 9)))))
      (a!1166 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!1167 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!1168 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!1169 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!1170 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!1171 (and (__f7 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!1174 (<= (__f1 (__f2 (select initial_1_trace 10)))
                  (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1175 (= (__f1 (__f2 (select initial_1_trace 11)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!1176 (<= (__f2 (__f2 (select initial_1_trace 10)))
                  (__f2 (__f2 (select initial_1_trace 11)))))
      (a!1177 (and (__f1 (__f1 (select initial_1_trace 11)))
                   (__f2 (__f1 (select initial_1_trace 10)))))
      (a!1178 (and (__f3 (__f1 (select initial_1_trace 11)))
                   (__f4 (__f1 (select initial_1_trace 10)))))
      (a!1179 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!1180 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1181 (and (__f2 (__f1 (select initial_1_trace 11)))
                   (__f3 (__f1 (select initial_1_trace 10)))))
      (a!1182 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!1183 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1184 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1185 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1186 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1187 (and (__f7 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1190 (and (__f1 (__f1 (select initial_1_trace 11)))
                   (__f2 (__f1 (select initial_1_trace 11)))))
      (a!1191 (and (__f3 (__f1 (select initial_1_trace 11)))
                   (__f4 (__f1 (select initial_1_trace 11)))))
      (a!1192 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!1193 (and (__f4 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!1194 (and (__f2 (__f1 (select initial_1_trace 11)))
                   (__f3 (__f1 (select initial_1_trace 11)))))
      (a!1195 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!1196 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!1197 (and (__f5 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!1198 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!1199 (and (__f6 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!1200 (and (__f7 (__f1 (select initial_1_trace 11)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!1201 (<= (__f1 (__f2 (select initial_1_trace 0)))
                  (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1202 (= (__f1 (__f2 (select initial_1_trace 12)))
                 (__f1 (__f2 (select initial_1_trace 0)))))
      (a!1203 (<= (__f2 (__f2 (select initial_1_trace 0)))
                  (__f2 (__f2 (select initial_1_trace 12)))))
      (a!1204 (<= 0 (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1205 (and (__f1 (__f1 (select initial_1_trace 12)))
                   (__f2 (__f1 (select initial_1_trace 0)))))
      (a!1206 (and (__f3 (__f1 (select initial_1_trace 12)))
                   (__f4 (__f1 (select initial_1_trace 0)))))
      (a!1207 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!1208 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1209 (and (__f2 (__f1 (select initial_1_trace 12)))
                   (__f3 (__f1 (select initial_1_trace 0)))))
      (a!1210 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!1211 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1212 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1213 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1214 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1215 (and (__f7 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1218 (<= (__f1 (__f2 (select initial_1_trace 1)))
                  (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1219 (= (__f1 (__f2 (select initial_1_trace 12)))
                 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!1220 (<= (__f2 (__f2 (select initial_1_trace 1)))
                  (__f2 (__f2 (select initial_1_trace 12)))))
      (a!1221 (and (__f1 (__f1 (select initial_1_trace 12)))
                   (__f2 (__f1 (select initial_1_trace 1)))))
      (a!1222 (and (__f3 (__f1 (select initial_1_trace 12)))
                   (__f4 (__f1 (select initial_1_trace 1)))))
      (a!1223 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!1224 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1225 (and (__f2 (__f1 (select initial_1_trace 12)))
                   (__f3 (__f1 (select initial_1_trace 1)))))
      (a!1226 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!1227 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1228 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1229 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1230 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1231 (and (__f7 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1234 (<= (__f1 (__f2 (select initial_1_trace 2)))
                  (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1235 (= (__f1 (__f2 (select initial_1_trace 12)))
                 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!1236 (<= (__f2 (__f2 (select initial_1_trace 2)))
                  (__f2 (__f2 (select initial_1_trace 12)))))
      (a!1237 (and (__f1 (__f1 (select initial_1_trace 12)))
                   (__f2 (__f1 (select initial_1_trace 2)))))
      (a!1238 (and (__f3 (__f1 (select initial_1_trace 12)))
                   (__f4 (__f1 (select initial_1_trace 2)))))
      (a!1239 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!1240 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1241 (and (__f2 (__f1 (select initial_1_trace 12)))
                   (__f3 (__f1 (select initial_1_trace 2)))))
      (a!1242 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!1243 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1244 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1245 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1246 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1247 (and (__f7 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1250 (<= (__f1 (__f2 (select initial_1_trace 3)))
                  (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1251 (= (__f1 (__f2 (select initial_1_trace 12)))
                 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!1252 (<= (__f2 (__f2 (select initial_1_trace 3)))
                  (__f2 (__f2 (select initial_1_trace 12)))))
      (a!1253 (and (__f1 (__f1 (select initial_1_trace 12)))
                   (__f2 (__f1 (select initial_1_trace 3)))))
      (a!1254 (and (__f3 (__f1 (select initial_1_trace 12)))
                   (__f4 (__f1 (select initial_1_trace 3)))))
      (a!1255 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!1256 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1257 (and (__f2 (__f1 (select initial_1_trace 12)))
                   (__f3 (__f1 (select initial_1_trace 3)))))
      (a!1258 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!1259 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1260 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1261 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1262 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1263 (and (__f7 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1266 (<= (__f1 (__f2 (select initial_1_trace 4)))
                  (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1267 (= (__f1 (__f2 (select initial_1_trace 12)))
                 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!1268 (<= (__f2 (__f2 (select initial_1_trace 4)))
                  (__f2 (__f2 (select initial_1_trace 12)))))
      (a!1269 (and (__f1 (__f1 (select initial_1_trace 12)))
                   (__f2 (__f1 (select initial_1_trace 4)))))
      (a!1270 (and (__f3 (__f1 (select initial_1_trace 12)))
                   (__f4 (__f1 (select initial_1_trace 4)))))
      (a!1271 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!1272 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1273 (and (__f2 (__f1 (select initial_1_trace 12)))
                   (__f3 (__f1 (select initial_1_trace 4)))))
      (a!1274 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!1275 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1276 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1277 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1278 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1279 (and (__f7 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1282 (<= (__f1 (__f2 (select initial_1_trace 5)))
                  (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1283 (= (__f1 (__f2 (select initial_1_trace 12)))
                 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!1284 (<= (__f2 (__f2 (select initial_1_trace 5)))
                  (__f2 (__f2 (select initial_1_trace 12)))))
      (a!1285 (and (__f1 (__f1 (select initial_1_trace 12)))
                   (__f2 (__f1 (select initial_1_trace 5)))))
      (a!1286 (and (__f3 (__f1 (select initial_1_trace 12)))
                   (__f4 (__f1 (select initial_1_trace 5)))))
      (a!1287 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!1288 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1289 (and (__f2 (__f1 (select initial_1_trace 12)))
                   (__f3 (__f1 (select initial_1_trace 5)))))
      (a!1290 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!1291 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1292 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1293 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1294 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1295 (and (__f7 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1298 (<= (__f1 (__f2 (select initial_1_trace 6)))
                  (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1299 (= (__f1 (__f2 (select initial_1_trace 12)))
                 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!1300 (<= (__f2 (__f2 (select initial_1_trace 6)))
                  (__f2 (__f2 (select initial_1_trace 12)))))
      (a!1301 (and (__f1 (__f1 (select initial_1_trace 12)))
                   (__f2 (__f1 (select initial_1_trace 6)))))
      (a!1302 (and (__f3 (__f1 (select initial_1_trace 12)))
                   (__f4 (__f1 (select initial_1_trace 6)))))
      (a!1303 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!1304 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1305 (and (__f2 (__f1 (select initial_1_trace 12)))
                   (__f3 (__f1 (select initial_1_trace 6)))))
      (a!1306 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!1307 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1308 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1309 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1310 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1311 (and (__f7 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1314 (<= (__f1 (__f2 (select initial_1_trace 7)))
                  (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1315 (= (__f1 (__f2 (select initial_1_trace 12)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!1316 (<= (__f2 (__f2 (select initial_1_trace 7)))
                  (__f2 (__f2 (select initial_1_trace 12)))))
      (a!1317 (and (__f1 (__f1 (select initial_1_trace 12)))
                   (__f2 (__f1 (select initial_1_trace 7)))))
      (a!1318 (and (__f3 (__f1 (select initial_1_trace 12)))
                   (__f4 (__f1 (select initial_1_trace 7)))))
      (a!1319 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!1320 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1321 (and (__f2 (__f1 (select initial_1_trace 12)))
                   (__f3 (__f1 (select initial_1_trace 7)))))
      (a!1322 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!1323 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1324 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1325 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1326 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1327 (and (__f7 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1330 (<= (__f1 (__f2 (select initial_1_trace 8)))
                  (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1331 (= (__f1 (__f2 (select initial_1_trace 12)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!1332 (<= (__f2 (__f2 (select initial_1_trace 8)))
                  (__f2 (__f2 (select initial_1_trace 12)))))
      (a!1333 (and (__f1 (__f1 (select initial_1_trace 12)))
                   (__f2 (__f1 (select initial_1_trace 8)))))
      (a!1334 (and (__f3 (__f1 (select initial_1_trace 12)))
                   (__f4 (__f1 (select initial_1_trace 8)))))
      (a!1335 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!1336 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!1337 (and (__f2 (__f1 (select initial_1_trace 12)))
                   (__f3 (__f1 (select initial_1_trace 8)))))
      (a!1338 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!1339 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!1340 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!1341 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!1342 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!1343 (and (__f7 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!1346 (<= (__f1 (__f2 (select initial_1_trace 9)))
                  (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1347 (= (__f1 (__f2 (select initial_1_trace 12)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!1348 (<= (__f2 (__f2 (select initial_1_trace 9)))
                  (__f2 (__f2 (select initial_1_trace 12)))))
      (a!1349 (and (__f1 (__f1 (select initial_1_trace 12)))
                   (__f2 (__f1 (select initial_1_trace 9)))))
      (a!1350 (and (__f3 (__f1 (select initial_1_trace 12)))
                   (__f4 (__f1 (select initial_1_trace 9)))))
      (a!1351 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!1352 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!1353 (and (__f2 (__f1 (select initial_1_trace 12)))
                   (__f3 (__f1 (select initial_1_trace 9)))))
      (a!1354 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!1355 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!1356 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!1357 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!1358 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!1359 (and (__f7 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!1362 (<= (__f1 (__f2 (select initial_1_trace 10)))
                  (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1363 (= (__f1 (__f2 (select initial_1_trace 12)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!1364 (<= (__f2 (__f2 (select initial_1_trace 10)))
                  (__f2 (__f2 (select initial_1_trace 12)))))
      (a!1365 (and (__f1 (__f1 (select initial_1_trace 12)))
                   (__f2 (__f1 (select initial_1_trace 10)))))
      (a!1366 (and (__f3 (__f1 (select initial_1_trace 12)))
                   (__f4 (__f1 (select initial_1_trace 10)))))
      (a!1367 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!1368 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1369 (and (__f2 (__f1 (select initial_1_trace 12)))
                   (__f3 (__f1 (select initial_1_trace 10)))))
      (a!1370 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!1371 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1372 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1373 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1374 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1375 (and (__f7 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1378 (<= (__f1 (__f2 (select initial_1_trace 11)))
                  (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1379 (= (__f1 (__f2 (select initial_1_trace 12)))
                 (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1380 (<= (__f2 (__f2 (select initial_1_trace 11)))
                  (__f2 (__f2 (select initial_1_trace 12)))))
      (a!1381 (and (__f1 (__f1 (select initial_1_trace 12)))
                   (__f2 (__f1 (select initial_1_trace 11)))))
      (a!1382 (and (__f3 (__f1 (select initial_1_trace 12)))
                   (__f4 (__f1 (select initial_1_trace 11)))))
      (a!1383 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!1384 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!1385 (and (__f2 (__f1 (select initial_1_trace 12)))
                   (__f3 (__f1 (select initial_1_trace 11)))))
      (a!1386 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!1387 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!1388 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!1389 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!1390 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!1391 (and (__f7 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!1394 (and (__f1 (__f1 (select initial_1_trace 12)))
                   (__f2 (__f1 (select initial_1_trace 12)))))
      (a!1395 (and (__f3 (__f1 (select initial_1_trace 12)))
                   (__f4 (__f1 (select initial_1_trace 12)))))
      (a!1396 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 12)))))
      (a!1397 (and (__f4 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!1398 (and (__f2 (__f1 (select initial_1_trace 12)))
                   (__f3 (__f1 (select initial_1_trace 12)))))
      (a!1399 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f6 (__f1 (select initial_1_trace 12)))))
      (a!1400 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!1401 (and (__f5 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!1402 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!1403 (and (__f6 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!1404 (and (__f7 (__f1 (select initial_1_trace 12)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!1405 (<= (__f1 (__f2 (select initial_1_trace 0)))
                  (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1406 (= (__f1 (__f2 (select initial_1_trace 13)))
                 (__f1 (__f2 (select initial_1_trace 0)))))
      (a!1407 (<= (__f2 (__f2 (select initial_1_trace 0)))
                  (__f2 (__f2 (select initial_1_trace 13)))))
      (a!1408 (<= 0 (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1409 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 0)))))
      (a!1410 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 0)))))
      (a!1411 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!1412 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1413 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 0)))))
      (a!1414 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!1415 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1416 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1417 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1418 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1419 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1422 (<= (__f1 (__f2 (select initial_1_trace 1)))
                  (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1423 (= (__f1 (__f2 (select initial_1_trace 13)))
                 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!1424 (<= (__f2 (__f2 (select initial_1_trace 1)))
                  (__f2 (__f2 (select initial_1_trace 13)))))
      (a!1425 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 1)))))
      (a!1426 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 1)))))
      (a!1427 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!1428 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1429 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 1)))))
      (a!1430 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!1431 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1432 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1433 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1434 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1435 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1438 (<= (__f1 (__f2 (select initial_1_trace 2)))
                  (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1439 (= (__f1 (__f2 (select initial_1_trace 13)))
                 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!1440 (<= (__f2 (__f2 (select initial_1_trace 2)))
                  (__f2 (__f2 (select initial_1_trace 13)))))
      (a!1441 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 2)))))
      (a!1442 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 2)))))
      (a!1443 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!1444 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1445 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 2)))))
      (a!1446 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!1447 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1448 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1449 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1450 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1451 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1454 (<= (__f1 (__f2 (select initial_1_trace 3)))
                  (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1455 (= (__f1 (__f2 (select initial_1_trace 13)))
                 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!1456 (<= (__f2 (__f2 (select initial_1_trace 3)))
                  (__f2 (__f2 (select initial_1_trace 13)))))
      (a!1457 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 3)))))
      (a!1458 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 3)))))
      (a!1459 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!1460 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1461 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 3)))))
      (a!1462 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!1463 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1464 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1465 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1466 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1467 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1470 (<= (__f1 (__f2 (select initial_1_trace 4)))
                  (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1471 (= (__f1 (__f2 (select initial_1_trace 13)))
                 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!1472 (<= (__f2 (__f2 (select initial_1_trace 4)))
                  (__f2 (__f2 (select initial_1_trace 13)))))
      (a!1473 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 4)))))
      (a!1474 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 4)))))
      (a!1475 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!1476 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1477 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 4)))))
      (a!1478 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!1479 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1480 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1481 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1482 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1483 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1486 (<= (__f1 (__f2 (select initial_1_trace 5)))
                  (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1487 (= (__f1 (__f2 (select initial_1_trace 13)))
                 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!1488 (<= (__f2 (__f2 (select initial_1_trace 5)))
                  (__f2 (__f2 (select initial_1_trace 13)))))
      (a!1489 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 5)))))
      (a!1490 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 5)))))
      (a!1491 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!1492 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1493 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 5)))))
      (a!1494 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!1495 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1496 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1497 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1498 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1499 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1502 (<= (__f1 (__f2 (select initial_1_trace 6)))
                  (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1503 (= (__f1 (__f2 (select initial_1_trace 13)))
                 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!1504 (<= (__f2 (__f2 (select initial_1_trace 6)))
                  (__f2 (__f2 (select initial_1_trace 13)))))
      (a!1505 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 6)))))
      (a!1506 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 6)))))
      (a!1507 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!1508 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1509 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 6)))))
      (a!1510 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!1511 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1512 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1513 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1514 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1515 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1518 (<= (__f1 (__f2 (select initial_1_trace 7)))
                  (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1519 (= (__f1 (__f2 (select initial_1_trace 13)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!1520 (<= (__f2 (__f2 (select initial_1_trace 7)))
                  (__f2 (__f2 (select initial_1_trace 13)))))
      (a!1521 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 7)))))
      (a!1522 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 7)))))
      (a!1523 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!1524 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1525 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 7)))))
      (a!1526 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!1527 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1528 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1529 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1530 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1531 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1534 (<= (__f1 (__f2 (select initial_1_trace 8)))
                  (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1535 (= (__f1 (__f2 (select initial_1_trace 13)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!1536 (<= (__f2 (__f2 (select initial_1_trace 8)))
                  (__f2 (__f2 (select initial_1_trace 13)))))
      (a!1537 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 8)))))
      (a!1538 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 8)))))
      (a!1539 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!1540 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!1541 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 8)))))
      (a!1542 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!1543 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!1544 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!1545 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!1546 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!1547 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!1550 (<= (__f1 (__f2 (select initial_1_trace 9)))
                  (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1551 (= (__f1 (__f2 (select initial_1_trace 13)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!1552 (<= (__f2 (__f2 (select initial_1_trace 9)))
                  (__f2 (__f2 (select initial_1_trace 13)))))
      (a!1553 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 9)))))
      (a!1554 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 9)))))
      (a!1555 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!1556 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!1557 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 9)))))
      (a!1558 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!1559 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!1560 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!1561 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!1562 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!1563 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!1566 (<= (__f1 (__f2 (select initial_1_trace 10)))
                  (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1567 (= (__f1 (__f2 (select initial_1_trace 13)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!1568 (<= (__f2 (__f2 (select initial_1_trace 10)))
                  (__f2 (__f2 (select initial_1_trace 13)))))
      (a!1569 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 10)))))
      (a!1570 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 10)))))
      (a!1571 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!1572 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1573 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 10)))))
      (a!1574 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!1575 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1576 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1577 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1578 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1579 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1582 (<= (__f1 (__f2 (select initial_1_trace 11)))
                  (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1583 (= (__f1 (__f2 (select initial_1_trace 13)))
                 (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1584 (<= (__f2 (__f2 (select initial_1_trace 11)))
                  (__f2 (__f2 (select initial_1_trace 13)))))
      (a!1585 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 11)))))
      (a!1586 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 11)))))
      (a!1587 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!1588 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!1589 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 11)))))
      (a!1590 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!1591 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!1592 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!1593 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!1594 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!1595 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!1598 (<= (__f1 (__f2 (select initial_1_trace 12)))
                  (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1599 (= (__f1 (__f2 (select initial_1_trace 13)))
                 (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1600 (<= (__f2 (__f2 (select initial_1_trace 12)))
                  (__f2 (__f2 (select initial_1_trace 13)))))
      (a!1601 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 12)))))
      (a!1602 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 12)))))
      (a!1603 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 12)))))
      (a!1604 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!1605 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 12)))))
      (a!1606 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 12)))))
      (a!1607 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!1608 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!1609 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!1610 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!1611 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!1614 (and (__f1 (__f1 (select initial_1_trace 13)))
                   (__f2 (__f1 (select initial_1_trace 13)))))
      (a!1615 (and (__f3 (__f1 (select initial_1_trace 13)))
                   (__f4 (__f1 (select initial_1_trace 13)))))
      (a!1616 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 13)))))
      (a!1617 (and (__f4 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!1618 (and (__f2 (__f1 (select initial_1_trace 13)))
                   (__f3 (__f1 (select initial_1_trace 13)))))
      (a!1619 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f6 (__f1 (select initial_1_trace 13)))))
      (a!1620 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!1621 (and (__f5 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!1622 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!1623 (and (__f6 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!1624 (and (__f7 (__f1 (select initial_1_trace 13)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!1625 (<= (__f1 (__f2 (select initial_1_trace 0)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1626 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 0)))))
      (a!1627 (<= (__f2 (__f2 (select initial_1_trace 0)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1628 (<= 0 (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1629 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 0)))))
      (a!1630 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 0)))))
      (a!1631 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!1632 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1633 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 0)))))
      (a!1634 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!1635 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1636 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1637 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1638 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1639 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1642 (<= (__f1 (__f2 (select initial_1_trace 1)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1643 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!1644 (<= (__f2 (__f2 (select initial_1_trace 1)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1645 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 1)))))
      (a!1646 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 1)))))
      (a!1647 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!1648 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1649 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 1)))))
      (a!1650 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!1651 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1652 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1653 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1654 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1655 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1658 (<= (__f1 (__f2 (select initial_1_trace 2)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1659 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!1660 (<= (__f2 (__f2 (select initial_1_trace 2)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1661 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 2)))))
      (a!1662 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 2)))))
      (a!1663 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!1664 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1665 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 2)))))
      (a!1666 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!1667 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1668 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1669 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1670 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1671 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1674 (<= (__f1 (__f2 (select initial_1_trace 3)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1675 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!1676 (<= (__f2 (__f2 (select initial_1_trace 3)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1677 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 3)))))
      (a!1678 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 3)))))
      (a!1679 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!1680 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1681 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 3)))))
      (a!1682 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!1683 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1684 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1685 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1686 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1687 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1690 (<= (__f1 (__f2 (select initial_1_trace 4)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1691 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!1692 (<= (__f2 (__f2 (select initial_1_trace 4)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1693 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 4)))))
      (a!1694 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 4)))))
      (a!1695 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!1696 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1697 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 4)))))
      (a!1698 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!1699 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1700 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1701 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1702 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1703 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1706 (<= (__f1 (__f2 (select initial_1_trace 5)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1707 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!1708 (<= (__f2 (__f2 (select initial_1_trace 5)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1709 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 5)))))
      (a!1710 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 5)))))
      (a!1711 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!1712 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1713 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 5)))))
      (a!1714 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!1715 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1716 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1717 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1718 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1719 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1722 (<= (__f1 (__f2 (select initial_1_trace 6)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1723 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!1724 (<= (__f2 (__f2 (select initial_1_trace 6)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1725 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 6)))))
      (a!1726 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 6)))))
      (a!1727 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!1728 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1729 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 6)))))
      (a!1730 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!1731 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1732 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1733 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1734 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1735 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1738 (<= (__f1 (__f2 (select initial_1_trace 7)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1739 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!1740 (<= (__f2 (__f2 (select initial_1_trace 7)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1741 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 7)))))
      (a!1742 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 7)))))
      (a!1743 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!1744 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1745 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 7)))))
      (a!1746 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!1747 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1748 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1749 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1750 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1751 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1754 (<= (__f1 (__f2 (select initial_1_trace 8)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1755 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!1756 (<= (__f2 (__f2 (select initial_1_trace 8)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1757 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 8)))))
      (a!1758 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 8)))))
      (a!1759 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!1760 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!1761 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 8)))))
      (a!1762 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!1763 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!1764 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!1765 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!1766 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!1767 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!1770 (<= (__f1 (__f2 (select initial_1_trace 9)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1771 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!1772 (<= (__f2 (__f2 (select initial_1_trace 9)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1773 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 9)))))
      (a!1774 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 9)))))
      (a!1775 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!1776 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!1777 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 9)))))
      (a!1778 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!1779 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!1780 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!1781 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!1782 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!1783 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!1786 (<= (__f1 (__f2 (select initial_1_trace 10)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1787 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!1788 (<= (__f2 (__f2 (select initial_1_trace 10)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1789 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 10)))))
      (a!1790 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 10)))))
      (a!1791 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!1792 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1793 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 10)))))
      (a!1794 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!1795 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1796 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1797 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!1798 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1799 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!1802 (<= (__f1 (__f2 (select initial_1_trace 11)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1803 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 11)))))
      (a!1804 (<= (__f2 (__f2 (select initial_1_trace 11)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1805 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 11)))))
      (a!1806 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 11)))))
      (a!1807 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!1808 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!1809 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 11)))))
      (a!1810 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!1811 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!1812 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!1813 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!1814 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!1815 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!1818 (<= (__f1 (__f2 (select initial_1_trace 12)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1819 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 12)))))
      (a!1820 (<= (__f2 (__f2 (select initial_1_trace 12)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1821 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 12)))))
      (a!1822 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 12)))))
      (a!1823 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 12)))))
      (a!1824 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!1825 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 12)))))
      (a!1826 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 12)))))
      (a!1827 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!1828 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!1829 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!1830 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!1831 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!1834 (<= (__f1 (__f2 (select initial_1_trace 13)))
                  (__f1 (__f2 (select initial_1_trace 14)))))
      (a!1835 (= (__f1 (__f2 (select initial_1_trace 14)))
                 (__f1 (__f2 (select initial_1_trace 13)))))
      (a!1836 (<= (__f2 (__f2 (select initial_1_trace 13)))
                  (__f2 (__f2 (select initial_1_trace 14)))))
      (a!1837 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 13)))))
      (a!1838 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 13)))))
      (a!1839 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 13)))))
      (a!1840 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!1841 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 13)))))
      (a!1842 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 13)))))
      (a!1843 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!1844 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!1845 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!1846 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!1847 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!1850 (and (__f1 (__f1 (select initial_1_trace 14)))
                   (__f2 (__f1 (select initial_1_trace 14)))))
      (a!1851 (and (__f3 (__f1 (select initial_1_trace 14)))
                   (__f4 (__f1 (select initial_1_trace 14)))))
      (a!1852 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 14)))))
      (a!1853 (and (__f4 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 14)))))
      (a!1854 (and (__f2 (__f1 (select initial_1_trace 14)))
                   (__f3 (__f1 (select initial_1_trace 14)))))
      (a!1855 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f6 (__f1 (select initial_1_trace 14)))))
      (a!1856 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 14)))))
      (a!1857 (and (__f5 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 14)))))
      (a!1858 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f7 (__f1 (select initial_1_trace 14)))))
      (a!1859 (and (__f6 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 14)))))
      (a!1860 (and (__f7 (__f1 (select initial_1_trace 14)))
                   (__f8 (__f1 (select initial_1_trace 14)))))
      (a!1861 (<= (__f1 (__f2 (select initial_1_trace 0)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!1862 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 0)))))
      (a!1863 (<= (__f2 (__f2 (select initial_1_trace 0)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!1864 (<= 0 (__f1 (__f2 (select initial_1_trace 15)))))
      (a!1865 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 0)))))
      (a!1866 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 0)))))
      (a!1867 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!1868 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1869 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 0)))))
      (a!1870 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!1871 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1872 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1873 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!1874 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1875 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!1878 (<= (__f1 (__f2 (select initial_1_trace 1)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!1879 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!1880 (<= (__f2 (__f2 (select initial_1_trace 1)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!1881 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 1)))))
      (a!1882 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 1)))))
      (a!1883 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!1884 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1885 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 1)))))
      (a!1886 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!1887 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1888 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1889 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!1890 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1891 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!1894 (<= (__f1 (__f2 (select initial_1_trace 2)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!1895 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!1896 (<= (__f2 (__f2 (select initial_1_trace 2)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!1897 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 2)))))
      (a!1898 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 2)))))
      (a!1899 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!1900 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1901 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 2)))))
      (a!1902 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!1903 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1904 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1905 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!1906 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1907 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!1910 (<= (__f1 (__f2 (select initial_1_trace 3)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!1911 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!1912 (<= (__f2 (__f2 (select initial_1_trace 3)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!1913 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 3)))))
      (a!1914 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 3)))))
      (a!1915 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!1916 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1917 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 3)))))
      (a!1918 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!1919 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1920 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1921 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!1922 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1923 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!1926 (<= (__f1 (__f2 (select initial_1_trace 4)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!1927 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!1928 (<= (__f2 (__f2 (select initial_1_trace 4)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!1929 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 4)))))
      (a!1930 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 4)))))
      (a!1931 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!1932 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1933 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 4)))))
      (a!1934 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!1935 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1936 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1937 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!1938 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1939 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!1942 (<= (__f1 (__f2 (select initial_1_trace 5)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!1943 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!1944 (<= (__f2 (__f2 (select initial_1_trace 5)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!1945 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 5)))))
      (a!1946 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 5)))))
      (a!1947 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!1948 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1949 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 5)))))
      (a!1950 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!1951 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1952 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1953 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!1954 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1955 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!1958 (<= (__f1 (__f2 (select initial_1_trace 6)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!1959 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!1960 (<= (__f2 (__f2 (select initial_1_trace 6)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!1961 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 6)))))
      (a!1962 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 6)))))
      (a!1963 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!1964 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1965 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 6)))))
      (a!1966 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!1967 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1968 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1969 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!1970 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1971 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!1974 (<= (__f1 (__f2 (select initial_1_trace 7)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!1975 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!1976 (<= (__f2 (__f2 (select initial_1_trace 7)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!1977 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 7)))))
      (a!1978 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 7)))))
      (a!1979 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!1980 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1981 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 7)))))
      (a!1982 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!1983 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1984 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1985 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!1986 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1987 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!1990 (<= (__f1 (__f2 (select initial_1_trace 8)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!1991 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!1992 (<= (__f2 (__f2 (select initial_1_trace 8)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!1993 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 8)))))
      (a!1994 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 8)))))
      (a!1995 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!1996 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!1997 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 8)))))
      (a!1998 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!1999 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!2000 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!2001 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!2002 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!2003 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!2006 (<= (__f1 (__f2 (select initial_1_trace 9)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!2007 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!2008 (<= (__f2 (__f2 (select initial_1_trace 9)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!2009 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 9)))))
      (a!2010 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 9)))))
      (a!2011 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!2012 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!2013 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 9)))))
      (a!2014 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!2015 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!2016 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!2017 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!2018 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!2019 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!2022 (<= (__f1 (__f2 (select initial_1_trace 10)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!2023 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!2024 (<= (__f2 (__f2 (select initial_1_trace 10)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!2025 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 10)))))
      (a!2026 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 10)))))
      (a!2027 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!2028 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!2029 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 10)))))
      (a!2030 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!2031 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!2032 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!2033 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!2034 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!2035 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!2038 (<= (__f1 (__f2 (select initial_1_trace 11)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!2039 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 11)))))
      (a!2040 (<= (__f2 (__f2 (select initial_1_trace 11)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!2041 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 11)))))
      (a!2042 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 11)))))
      (a!2043 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!2044 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!2045 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 11)))))
      (a!2046 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!2047 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!2048 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!2049 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!2050 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!2051 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!2054 (<= (__f1 (__f2 (select initial_1_trace 12)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!2055 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 12)))))
      (a!2056 (<= (__f2 (__f2 (select initial_1_trace 12)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!2057 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 12)))))
      (a!2058 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 12)))))
      (a!2059 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 12)))))
      (a!2060 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!2061 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 12)))))
      (a!2062 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 12)))))
      (a!2063 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!2064 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!2065 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!2066 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!2067 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!2070 (<= (__f1 (__f2 (select initial_1_trace 13)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!2071 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 13)))))
      (a!2072 (<= (__f2 (__f2 (select initial_1_trace 13)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!2073 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 13)))))
      (a!2074 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 13)))))
      (a!2075 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 13)))))
      (a!2076 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!2077 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 13)))))
      (a!2078 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 13)))))
      (a!2079 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!2080 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!2081 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!2082 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!2083 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!2086 (<= (__f1 (__f2 (select initial_1_trace 14)))
                  (__f1 (__f2 (select initial_1_trace 15)))))
      (a!2087 (= (__f1 (__f2 (select initial_1_trace 15)))
                 (__f1 (__f2 (select initial_1_trace 14)))))
      (a!2088 (<= (__f2 (__f2 (select initial_1_trace 14)))
                  (__f2 (__f2 (select initial_1_trace 15)))))
      (a!2089 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 14)))))
      (a!2090 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 14)))))
      (a!2091 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 14)))))
      (a!2092 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 14)))))
      (a!2093 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 14)))))
      (a!2094 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 14)))))
      (a!2095 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 14)))))
      (a!2096 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 14)))))
      (a!2097 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 14)))))
      (a!2098 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 14)))))
      (a!2099 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 14)))))
      (a!2102 (and (__f1 (__f1 (select initial_1_trace 15)))
                   (__f2 (__f1 (select initial_1_trace 15)))))
      (a!2103 (and (__f3 (__f1 (select initial_1_trace 15)))
                   (__f4 (__f1 (select initial_1_trace 15)))))
      (a!2104 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 15)))))
      (a!2105 (and (__f4 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 15)))))
      (a!2106 (and (__f2 (__f1 (select initial_1_trace 15)))
                   (__f3 (__f1 (select initial_1_trace 15)))))
      (a!2107 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f6 (__f1 (select initial_1_trace 15)))))
      (a!2108 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 15)))))
      (a!2109 (and (__f5 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 15)))))
      (a!2110 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f7 (__f1 (select initial_1_trace 15)))))
      (a!2111 (and (__f6 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 15)))))
      (a!2112 (and (__f7 (__f1 (select initial_1_trace 15)))
                   (__f8 (__f1 (select initial_1_trace 15)))))
      (a!2113 (<= (__f1 (__f2 (select initial_1_trace 0)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2114 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 0)))))
      (a!2115 (<= (__f2 (__f2 (select initial_1_trace 0)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2116 (<= 0 (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2117 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 0)))))
      (a!2118 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 0)))))
      (a!2119 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!2120 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!2121 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 0)))))
      (a!2122 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!2123 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!2124 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!2125 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!2126 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!2127 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!2130 (<= (__f1 (__f2 (select initial_1_trace 1)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2131 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!2132 (<= (__f2 (__f2 (select initial_1_trace 1)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2133 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 1)))))
      (a!2134 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 1)))))
      (a!2135 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!2136 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!2137 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 1)))))
      (a!2138 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!2139 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!2140 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!2141 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!2142 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!2143 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!2146 (<= (__f1 (__f2 (select initial_1_trace 2)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2147 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!2148 (<= (__f2 (__f2 (select initial_1_trace 2)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2149 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 2)))))
      (a!2150 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 2)))))
      (a!2151 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!2152 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!2153 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 2)))))
      (a!2154 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!2155 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!2156 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!2157 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!2158 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!2159 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!2162 (<= (__f1 (__f2 (select initial_1_trace 3)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2163 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!2164 (<= (__f2 (__f2 (select initial_1_trace 3)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2165 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 3)))))
      (a!2166 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 3)))))
      (a!2167 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!2168 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!2169 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 3)))))
      (a!2170 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!2171 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!2172 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!2173 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!2174 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!2175 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!2178 (<= (__f1 (__f2 (select initial_1_trace 4)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2179 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!2180 (<= (__f2 (__f2 (select initial_1_trace 4)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2181 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 4)))))
      (a!2182 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 4)))))
      (a!2183 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!2184 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!2185 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 4)))))
      (a!2186 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!2187 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!2188 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!2189 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!2190 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!2191 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!2194 (<= (__f1 (__f2 (select initial_1_trace 5)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2195 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!2196 (<= (__f2 (__f2 (select initial_1_trace 5)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2197 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 5)))))
      (a!2198 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 5)))))
      (a!2199 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!2200 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!2201 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 5)))))
      (a!2202 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!2203 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!2204 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!2205 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!2206 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!2207 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!2210 (<= (__f1 (__f2 (select initial_1_trace 6)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2211 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!2212 (<= (__f2 (__f2 (select initial_1_trace 6)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2213 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 6)))))
      (a!2214 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 6)))))
      (a!2215 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!2216 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!2217 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 6)))))
      (a!2218 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!2219 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!2220 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!2221 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!2222 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!2223 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!2226 (<= (__f1 (__f2 (select initial_1_trace 7)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2227 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!2228 (<= (__f2 (__f2 (select initial_1_trace 7)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2229 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 7)))))
      (a!2230 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 7)))))
      (a!2231 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!2232 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!2233 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 7)))))
      (a!2234 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!2235 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!2236 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!2237 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!2238 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!2239 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!2242 (<= (__f1 (__f2 (select initial_1_trace 8)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2243 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!2244 (<= (__f2 (__f2 (select initial_1_trace 8)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2245 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 8)))))
      (a!2246 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 8)))))
      (a!2247 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!2248 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!2249 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 8)))))
      (a!2250 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!2251 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!2252 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!2253 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!2254 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!2255 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!2258 (<= (__f1 (__f2 (select initial_1_trace 9)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2259 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!2260 (<= (__f2 (__f2 (select initial_1_trace 9)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2261 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 9)))))
      (a!2262 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 9)))))
      (a!2263 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!2264 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!2265 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 9)))))
      (a!2266 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!2267 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!2268 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!2269 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!2270 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!2271 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!2274 (<= (__f1 (__f2 (select initial_1_trace 10)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2275 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!2276 (<= (__f2 (__f2 (select initial_1_trace 10)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2277 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 10)))))
      (a!2278 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 10)))))
      (a!2279 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!2280 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!2281 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 10)))))
      (a!2282 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!2283 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!2284 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!2285 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!2286 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!2287 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!2290 (<= (__f1 (__f2 (select initial_1_trace 11)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2291 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 11)))))
      (a!2292 (<= (__f2 (__f2 (select initial_1_trace 11)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2293 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 11)))))
      (a!2294 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 11)))))
      (a!2295 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!2296 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!2297 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 11)))))
      (a!2298 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!2299 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!2300 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!2301 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!2302 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!2303 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!2306 (<= (__f1 (__f2 (select initial_1_trace 12)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2307 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 12)))))
      (a!2308 (<= (__f2 (__f2 (select initial_1_trace 12)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2309 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 12)))))
      (a!2310 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 12)))))
      (a!2311 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 12)))))
      (a!2312 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!2313 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 12)))))
      (a!2314 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 12)))))
      (a!2315 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!2316 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!2317 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!2318 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!2319 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!2322 (<= (__f1 (__f2 (select initial_1_trace 13)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2323 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 13)))))
      (a!2324 (<= (__f2 (__f2 (select initial_1_trace 13)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2325 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 13)))))
      (a!2326 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 13)))))
      (a!2327 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 13)))))
      (a!2328 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!2329 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 13)))))
      (a!2330 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 13)))))
      (a!2331 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!2332 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!2333 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!2334 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!2335 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!2338 (<= (__f1 (__f2 (select initial_1_trace 14)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2339 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 14)))))
      (a!2340 (<= (__f2 (__f2 (select initial_1_trace 14)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2341 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 14)))))
      (a!2342 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 14)))))
      (a!2343 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 14)))))
      (a!2344 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 14)))))
      (a!2345 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 14)))))
      (a!2346 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 14)))))
      (a!2347 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 14)))))
      (a!2348 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 14)))))
      (a!2349 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 14)))))
      (a!2350 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 14)))))
      (a!2351 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 14)))))
      (a!2354 (<= (__f1 (__f2 (select initial_1_trace 15)))
                  (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2355 (= (__f1 (__f2 (select initial_1_trace 16)))
                 (__f1 (__f2 (select initial_1_trace 15)))))
      (a!2356 (<= (__f2 (__f2 (select initial_1_trace 15)))
                  (__f2 (__f2 (select initial_1_trace 16)))))
      (a!2357 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 15)))))
      (a!2358 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 15)))))
      (a!2359 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 15)))))
      (a!2360 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 15)))))
      (a!2361 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 15)))))
      (a!2362 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 15)))))
      (a!2363 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 15)))))
      (a!2364 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 15)))))
      (a!2365 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 15)))))
      (a!2366 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 15)))))
      (a!2367 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 15)))))
      (a!2370 (and (__f1 (__f1 (select initial_1_trace 16)))
                   (__f2 (__f1 (select initial_1_trace 16)))))
      (a!2371 (and (__f3 (__f1 (select initial_1_trace 16)))
                   (__f4 (__f1 (select initial_1_trace 16)))))
      (a!2372 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 16)))))
      (a!2373 (and (__f4 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 16)))))
      (a!2374 (and (__f2 (__f1 (select initial_1_trace 16)))
                   (__f3 (__f1 (select initial_1_trace 16)))))
      (a!2375 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f6 (__f1 (select initial_1_trace 16)))))
      (a!2376 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 16)))))
      (a!2377 (and (__f5 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 16)))))
      (a!2378 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f7 (__f1 (select initial_1_trace 16)))))
      (a!2379 (and (__f6 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 16)))))
      (a!2380 (and (__f7 (__f1 (select initial_1_trace 16)))
                   (__f8 (__f1 (select initial_1_trace 16)))))
      (a!2381 (<= (__f1 (__f2 (select initial_1_trace 0)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2382 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 0)))))
      (a!2383 (<= (__f2 (__f2 (select initial_1_trace 0)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2384 (<= 0 (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2385 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 0)))))
      (a!2386 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 0)))))
      (a!2387 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!2388 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!2389 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 0)))))
      (a!2390 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 0)))))
      (a!2391 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!2392 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!2393 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 0)))))
      (a!2394 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!2395 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 0)))))
      (a!2398 (<= (__f1 (__f2 (select initial_1_trace 1)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2399 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!2400 (<= (__f2 (__f2 (select initial_1_trace 1)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2401 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 1)))))
      (a!2402 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 1)))))
      (a!2403 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!2404 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!2405 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 1)))))
      (a!2406 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 1)))))
      (a!2407 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!2408 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!2409 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 1)))))
      (a!2410 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!2411 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 1)))))
      (a!2414 (<= (__f1 (__f2 (select initial_1_trace 2)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2415 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!2416 (<= (__f2 (__f2 (select initial_1_trace 2)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2417 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 2)))))
      (a!2418 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 2)))))
      (a!2419 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!2420 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!2421 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 2)))))
      (a!2422 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 2)))))
      (a!2423 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!2424 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!2425 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 2)))))
      (a!2426 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!2427 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 2)))))
      (a!2430 (<= (__f1 (__f2 (select initial_1_trace 3)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2431 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!2432 (<= (__f2 (__f2 (select initial_1_trace 3)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2433 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 3)))))
      (a!2434 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 3)))))
      (a!2435 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!2436 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!2437 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 3)))))
      (a!2438 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 3)))))
      (a!2439 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!2440 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!2441 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 3)))))
      (a!2442 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!2443 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 3)))))
      (a!2446 (<= (__f1 (__f2 (select initial_1_trace 4)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2447 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!2448 (<= (__f2 (__f2 (select initial_1_trace 4)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2449 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 4)))))
      (a!2450 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 4)))))
      (a!2451 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!2452 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!2453 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 4)))))
      (a!2454 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 4)))))
      (a!2455 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!2456 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!2457 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 4)))))
      (a!2458 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!2459 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 4)))))
      (a!2462 (<= (__f1 (__f2 (select initial_1_trace 5)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2463 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!2464 (<= (__f2 (__f2 (select initial_1_trace 5)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2465 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 5)))))
      (a!2466 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 5)))))
      (a!2467 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!2468 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!2469 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 5)))))
      (a!2470 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 5)))))
      (a!2471 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!2472 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!2473 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 5)))))
      (a!2474 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!2475 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 5)))))
      (a!2478 (<= (__f1 (__f2 (select initial_1_trace 6)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2479 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!2480 (<= (__f2 (__f2 (select initial_1_trace 6)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2481 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 6)))))
      (a!2482 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 6)))))
      (a!2483 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!2484 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!2485 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 6)))))
      (a!2486 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 6)))))
      (a!2487 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!2488 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!2489 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 6)))))
      (a!2490 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!2491 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 6)))))
      (a!2494 (<= (__f1 (__f2 (select initial_1_trace 7)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2495 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!2496 (<= (__f2 (__f2 (select initial_1_trace 7)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2497 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 7)))))
      (a!2498 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 7)))))
      (a!2499 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!2500 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!2501 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 7)))))
      (a!2502 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 7)))))
      (a!2503 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!2504 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!2505 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 7)))))
      (a!2506 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!2507 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 7)))))
      (a!2510 (<= (__f1 (__f2 (select initial_1_trace 8)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2511 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!2512 (<= (__f2 (__f2 (select initial_1_trace 8)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2513 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 8)))))
      (a!2514 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 8)))))
      (a!2515 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!2516 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!2517 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 8)))))
      (a!2518 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 8)))))
      (a!2519 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!2520 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!2521 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 8)))))
      (a!2522 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!2523 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 8)))))
      (a!2526 (<= (__f1 (__f2 (select initial_1_trace 9)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2527 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!2528 (<= (__f2 (__f2 (select initial_1_trace 9)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2529 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 9)))))
      (a!2530 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 9)))))
      (a!2531 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!2532 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!2533 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 9)))))
      (a!2534 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 9)))))
      (a!2535 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!2536 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!2537 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 9)))))
      (a!2538 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!2539 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 9)))))
      (a!2542 (<= (__f1 (__f2 (select initial_1_trace 10)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2543 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!2544 (<= (__f2 (__f2 (select initial_1_trace 10)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2545 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 10)))))
      (a!2546 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 10)))))
      (a!2547 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!2548 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!2549 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 10)))))
      (a!2550 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 10)))))
      (a!2551 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!2552 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!2553 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 10)))))
      (a!2554 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!2555 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 10)))))
      (a!2558 (<= (__f1 (__f2 (select initial_1_trace 11)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2559 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 11)))))
      (a!2560 (<= (__f2 (__f2 (select initial_1_trace 11)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2561 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 11)))))
      (a!2562 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 11)))))
      (a!2563 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!2564 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!2565 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 11)))))
      (a!2566 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 11)))))
      (a!2567 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!2568 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!2569 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 11)))))
      (a!2570 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!2571 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 11)))))
      (a!2574 (<= (__f1 (__f2 (select initial_1_trace 12)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2575 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 12)))))
      (a!2576 (<= (__f2 (__f2 (select initial_1_trace 12)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2577 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 12)))))
      (a!2578 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 12)))))
      (a!2579 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 12)))))
      (a!2580 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!2581 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 12)))))
      (a!2582 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 12)))))
      (a!2583 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!2584 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!2585 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 12)))))
      (a!2586 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!2587 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 12)))))
      (a!2590 (<= (__f1 (__f2 (select initial_1_trace 13)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2591 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 13)))))
      (a!2592 (<= (__f2 (__f2 (select initial_1_trace 13)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2593 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 13)))))
      (a!2594 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 13)))))
      (a!2595 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 13)))))
      (a!2596 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!2597 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 13)))))
      (a!2598 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 13)))))
      (a!2599 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!2600 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!2601 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 13)))))
      (a!2602 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!2603 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 13)))))
      (a!2606 (<= (__f1 (__f2 (select initial_1_trace 14)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2607 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 14)))))
      (a!2608 (<= (__f2 (__f2 (select initial_1_trace 14)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2609 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 14)))))
      (a!2610 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 14)))))
      (a!2611 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 14)))))
      (a!2612 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 14)))))
      (a!2613 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 14)))))
      (a!2614 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 14)))))
      (a!2615 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 14)))))
      (a!2616 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 14)))))
      (a!2617 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 14)))))
      (a!2618 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 14)))))
      (a!2619 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 14)))))
      (a!2622 (<= (__f1 (__f2 (select initial_1_trace 15)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2623 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 15)))))
      (a!2624 (<= (__f2 (__f2 (select initial_1_trace 15)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2625 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 15)))))
      (a!2626 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 15)))))
      (a!2627 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 15)))))
      (a!2628 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 15)))))
      (a!2629 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 15)))))
      (a!2630 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 15)))))
      (a!2631 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 15)))))
      (a!2632 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 15)))))
      (a!2633 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 15)))))
      (a!2634 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 15)))))
      (a!2635 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 15)))))
      (a!2638 (<= (__f1 (__f2 (select initial_1_trace 16)))
                  (__f1 (__f2 (select initial_1_trace 17)))))
      (a!2639 (= (__f1 (__f2 (select initial_1_trace 17)))
                 (__f1 (__f2 (select initial_1_trace 16)))))
      (a!2640 (<= (__f2 (__f2 (select initial_1_trace 16)))
                  (__f2 (__f2 (select initial_1_trace 17)))))
      (a!2641 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 16)))))
      (a!2642 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 16)))))
      (a!2643 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 16)))))
      (a!2644 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 16)))))
      (a!2645 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 16)))))
      (a!2646 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 16)))))
      (a!2647 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 16)))))
      (a!2648 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 16)))))
      (a!2649 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 16)))))
      (a!2650 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 16)))))
      (a!2651 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 16)))))
      (a!2654 (and (__f1 (__f1 (select initial_1_trace 17)))
                   (__f2 (__f1 (select initial_1_trace 17)))))
      (a!2655 (and (__f3 (__f1 (select initial_1_trace 17)))
                   (__f4 (__f1 (select initial_1_trace 17)))))
      (a!2656 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 17)))))
      (a!2657 (and (__f4 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 17)))))
      (a!2658 (and (__f2 (__f1 (select initial_1_trace 17)))
                   (__f3 (__f1 (select initial_1_trace 17)))))
      (a!2659 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f6 (__f1 (select initial_1_trace 17)))))
      (a!2660 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 17)))))
      (a!2661 (and (__f5 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 17)))))
      (a!2662 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f7 (__f1 (select initial_1_trace 17)))))
      (a!2663 (and (__f6 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 17)))))
      (a!2664 (and (__f7 (__f1 (select initial_1_trace 17)))
                   (__f8 (__f1 (select initial_1_trace 17))))))
(let ((a!28 (and (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 0)))
                 (or a!17 a!18 a!19 a!20 a!21 a!22 a!23 a!24 a!25 a!26 a!27)))
      (a!56 (and (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 0)))
                 (or a!45 a!46 a!47 a!48 a!49 a!50 a!51 a!52 a!53 a!54 a!55)))
      (a!72 (and (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 1)))
                 (or a!61 a!62 a!63 a!64 a!65 a!66 a!67 a!68 a!69 a!70 a!71)))
      (a!100 (and (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 0)))
                  (or a!89 a!90 a!91 a!92 a!93 a!94 a!95 a!96 a!97 a!98 a!99)))
      (a!116 (and (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 1)))
                  (or a!105
                      a!106
                      a!107
                      a!108
                      a!109
                      a!110
                      a!111
                      a!112
                      a!113
                      a!114
                      a!115)))
      (a!132 (and (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 2)))
                  (or a!121
                      a!122
                      a!123
                      a!124
                      a!125
                      a!126
                      a!127
                      a!128
                      a!129
                      a!130
                      a!131)))
      (a!160 (and (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 0)))
                  (or a!149
                      a!150
                      a!151
                      a!152
                      a!153
                      a!154
                      a!155
                      a!156
                      a!157
                      a!158
                      a!159)))
      (a!176 (and (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 1)))
                  (or a!165
                      a!166
                      a!167
                      a!168
                      a!169
                      a!170
                      a!171
                      a!172
                      a!173
                      a!174
                      a!175)))
      (a!192 (and (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 2)))
                  (or a!181
                      a!182
                      a!183
                      a!184
                      a!185
                      a!186
                      a!187
                      a!188
                      a!189
                      a!190
                      a!191)))
      (a!208 (and (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 3)))
                  (or a!197
                      a!198
                      a!199
                      a!200
                      a!201
                      a!202
                      a!203
                      a!204
                      a!205
                      a!206
                      a!207)))
      (a!236 (and (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 0)))
                  (or a!225
                      a!226
                      a!227
                      a!228
                      a!229
                      a!230
                      a!231
                      a!232
                      a!233
                      a!234
                      a!235)))
      (a!252 (and (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 1)))
                  (or a!241
                      a!242
                      a!243
                      a!244
                      a!245
                      a!246
                      a!247
                      a!248
                      a!249
                      a!250
                      a!251)))
      (a!268 (and (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 2)))
                  (or a!257
                      a!258
                      a!259
                      a!260
                      a!261
                      a!262
                      a!263
                      a!264
                      a!265
                      a!266
                      a!267)))
      (a!284 (and (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 3)))
                  (or a!273
                      a!274
                      a!275
                      a!276
                      a!277
                      a!278
                      a!279
                      a!280
                      a!281
                      a!282
                      a!283)))
      (a!300 (and (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 4)))
                  (or a!289
                      a!290
                      a!291
                      a!292
                      a!293
                      a!294
                      a!295
                      a!296
                      a!297
                      a!298
                      a!299)))
      (a!328 (and (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 0)))
                  (or a!317
                      a!318
                      a!319
                      a!320
                      a!321
                      a!322
                      a!323
                      a!324
                      a!325
                      a!326
                      a!327)))
      (a!344 (and (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 1)))
                  (or a!333
                      a!334
                      a!335
                      a!336
                      a!337
                      a!338
                      a!339
                      a!340
                      a!341
                      a!342
                      a!343)))
      (a!360 (and (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 2)))
                  (or a!349
                      a!350
                      a!351
                      a!352
                      a!353
                      a!354
                      a!355
                      a!356
                      a!357
                      a!358
                      a!359)))
      (a!376 (and (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 3)))
                  (or a!365
                      a!366
                      a!367
                      a!368
                      a!369
                      a!370
                      a!371
                      a!372
                      a!373
                      a!374
                      a!375)))
      (a!392 (and (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 4)))
                  (or a!381
                      a!382
                      a!383
                      a!384
                      a!385
                      a!386
                      a!387
                      a!388
                      a!389
                      a!390
                      a!391)))
      (a!408 (and (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 5)))
                  (or a!397
                      a!398
                      a!399
                      a!400
                      a!401
                      a!402
                      a!403
                      a!404
                      a!405
                      a!406
                      a!407)))
      (a!436 (and (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 0)))
                  (or a!425
                      a!426
                      a!427
                      a!428
                      a!429
                      a!430
                      a!431
                      a!432
                      a!433
                      a!434
                      a!435)))
      (a!452 (and (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 1)))
                  (or a!441
                      a!442
                      a!443
                      a!444
                      a!445
                      a!446
                      a!447
                      a!448
                      a!449
                      a!450
                      a!451)))
      (a!468 (and (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 2)))
                  (or a!457
                      a!458
                      a!459
                      a!460
                      a!461
                      a!462
                      a!463
                      a!464
                      a!465
                      a!466
                      a!467)))
      (a!484 (and (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 3)))
                  (or a!473
                      a!474
                      a!475
                      a!476
                      a!477
                      a!478
                      a!479
                      a!480
                      a!481
                      a!482
                      a!483)))
      (a!500 (and (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 4)))
                  (or a!489
                      a!490
                      a!491
                      a!492
                      a!493
                      a!494
                      a!495
                      a!496
                      a!497
                      a!498
                      a!499)))
      (a!516 (and (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 5)))
                  (or a!505
                      a!506
                      a!507
                      a!508
                      a!509
                      a!510
                      a!511
                      a!512
                      a!513
                      a!514
                      a!515)))
      (a!532 (and (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 6)))
                  (or a!521
                      a!522
                      a!523
                      a!524
                      a!525
                      a!526
                      a!527
                      a!528
                      a!529
                      a!530
                      a!531)))
      (a!560 (and (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 0)))
                  (or a!549
                      a!550
                      a!551
                      a!552
                      a!553
                      a!554
                      a!555
                      a!556
                      a!557
                      a!558
                      a!559)))
      (a!576 (and (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 1)))
                  (or a!565
                      a!566
                      a!567
                      a!568
                      a!569
                      a!570
                      a!571
                      a!572
                      a!573
                      a!574
                      a!575)))
      (a!592 (and (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 2)))
                  (or a!581
                      a!582
                      a!583
                      a!584
                      a!585
                      a!586
                      a!587
                      a!588
                      a!589
                      a!590
                      a!591)))
      (a!608 (and (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 3)))
                  (or a!597
                      a!598
                      a!599
                      a!600
                      a!601
                      a!602
                      a!603
                      a!604
                      a!605
                      a!606
                      a!607)))
      (a!624 (and (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 4)))
                  (or a!613
                      a!614
                      a!615
                      a!616
                      a!617
                      a!618
                      a!619
                      a!620
                      a!621
                      a!622
                      a!623)))
      (a!640 (and (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 5)))
                  (or a!629
                      a!630
                      a!631
                      a!632
                      a!633
                      a!634
                      a!635
                      a!636
                      a!637
                      a!638
                      a!639)))
      (a!656 (and (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 6)))
                  (or a!645
                      a!646
                      a!647
                      a!648
                      a!649
                      a!650
                      a!651
                      a!652
                      a!653
                      a!654
                      a!655)))
      (a!672 (and (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 7)))
                  (or a!661
                      a!662
                      a!663
                      a!664
                      a!665
                      a!666
                      a!667
                      a!668
                      a!669
                      a!670
                      a!671)))
      (a!700 (and (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 0)))
                  (or a!689
                      a!690
                      a!691
                      a!692
                      a!693
                      a!694
                      a!695
                      a!696
                      a!697
                      a!698
                      a!699)))
      (a!716 (and (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 1)))
                  (or a!705
                      a!706
                      a!707
                      a!708
                      a!709
                      a!710
                      a!711
                      a!712
                      a!713
                      a!714
                      a!715)))
      (a!732 (and (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 2)))
                  (or a!721
                      a!722
                      a!723
                      a!724
                      a!725
                      a!726
                      a!727
                      a!728
                      a!729
                      a!730
                      a!731)))
      (a!748 (and (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 3)))
                  (or a!737
                      a!738
                      a!739
                      a!740
                      a!741
                      a!742
                      a!743
                      a!744
                      a!745
                      a!746
                      a!747)))
      (a!764 (and (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 4)))
                  (or a!753
                      a!754
                      a!755
                      a!756
                      a!757
                      a!758
                      a!759
                      a!760
                      a!761
                      a!762
                      a!763)))
      (a!780 (and (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 5)))
                  (or a!769
                      a!770
                      a!771
                      a!772
                      a!773
                      a!774
                      a!775
                      a!776
                      a!777
                      a!778
                      a!779)))
      (a!796 (and (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 6)))
                  (or a!785
                      a!786
                      a!787
                      a!788
                      a!789
                      a!790
                      a!791
                      a!792
                      a!793
                      a!794
                      a!795)))
      (a!812 (and (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 7)))
                  (or a!801
                      a!802
                      a!803
                      a!804
                      a!805
                      a!806
                      a!807
                      a!808
                      a!809
                      a!810
                      a!811)))
      (a!828 (and (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 8)))
                  (or a!817
                      a!818
                      a!819
                      a!820
                      a!821
                      a!822
                      a!823
                      a!824
                      a!825
                      a!826
                      a!827)))
      (a!856 (and (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 0)))
                  (or a!845
                      a!846
                      a!847
                      a!848
                      a!849
                      a!850
                      a!851
                      a!852
                      a!853
                      a!854
                      a!855)))
      (a!872 (and (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 1)))
                  (or a!861
                      a!862
                      a!863
                      a!864
                      a!865
                      a!866
                      a!867
                      a!868
                      a!869
                      a!870
                      a!871)))
      (a!888 (and (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 2)))
                  (or a!877
                      a!878
                      a!879
                      a!880
                      a!881
                      a!882
                      a!883
                      a!884
                      a!885
                      a!886
                      a!887)))
      (a!904 (and (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 3)))
                  (or a!893
                      a!894
                      a!895
                      a!896
                      a!897
                      a!898
                      a!899
                      a!900
                      a!901
                      a!902
                      a!903)))
      (a!920 (and (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 4)))
                  (or a!909
                      a!910
                      a!911
                      a!912
                      a!913
                      a!914
                      a!915
                      a!916
                      a!917
                      a!918
                      a!919)))
      (a!936 (and (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 5)))
                  (or a!925
                      a!926
                      a!927
                      a!928
                      a!929
                      a!930
                      a!931
                      a!932
                      a!933
                      a!934
                      a!935)))
      (a!952 (and (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 6)))
                  (or a!941
                      a!942
                      a!943
                      a!944
                      a!945
                      a!946
                      a!947
                      a!948
                      a!949
                      a!950
                      a!951)))
      (a!968 (and (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 7)))
                  (or a!957
                      a!958
                      a!959
                      a!960
                      a!961
                      a!962
                      a!963
                      a!964
                      a!965
                      a!966
                      a!967)))
      (a!984 (and (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 8)))
                  (or a!973
                      a!974
                      a!975
                      a!976
                      a!977
                      a!978
                      a!979
                      a!980
                      a!981
                      a!982
                      a!983)))
      (a!1000 (and (= (__f2 (select initial_1_trace 10))
                      (__f2 (select initial_1_trace 9)))
                   (or a!989
                       a!990
                       a!991
                       a!992
                       a!993
                       a!994
                       a!995
                       a!996
                       a!997
                       a!998
                       a!999)))
      (a!1028 (and (= (__f2 (select initial_1_trace 11))
                      (__f2 (select initial_1_trace 0)))
                   (or a!1017
                       a!1018
                       a!1019
                       a!1020
                       a!1021
                       a!1022
                       a!1023
                       a!1024
                       a!1025
                       a!1026
                       a!1027)))
      (a!1044 (and (= (__f2 (select initial_1_trace 11))
                      (__f2 (select initial_1_trace 1)))
                   (or a!1033
                       a!1034
                       a!1035
                       a!1036
                       a!1037
                       a!1038
                       a!1039
                       a!1040
                       a!1041
                       a!1042
                       a!1043)))
      (a!1060 (and (= (__f2 (select initial_1_trace 11))
                      (__f2 (select initial_1_trace 2)))
                   (or a!1049
                       a!1050
                       a!1051
                       a!1052
                       a!1053
                       a!1054
                       a!1055
                       a!1056
                       a!1057
                       a!1058
                       a!1059)))
      (a!1076 (and (= (__f2 (select initial_1_trace 11))
                      (__f2 (select initial_1_trace 3)))
                   (or a!1065
                       a!1066
                       a!1067
                       a!1068
                       a!1069
                       a!1070
                       a!1071
                       a!1072
                       a!1073
                       a!1074
                       a!1075)))
      (a!1092 (and (= (__f2 (select initial_1_trace 11))
                      (__f2 (select initial_1_trace 4)))
                   (or a!1081
                       a!1082
                       a!1083
                       a!1084
                       a!1085
                       a!1086
                       a!1087
                       a!1088
                       a!1089
                       a!1090
                       a!1091)))
      (a!1108 (and (= (__f2 (select initial_1_trace 11))
                      (__f2 (select initial_1_trace 5)))
                   (or a!1097
                       a!1098
                       a!1099
                       a!1100
                       a!1101
                       a!1102
                       a!1103
                       a!1104
                       a!1105
                       a!1106
                       a!1107)))
      (a!1124 (and (= (__f2 (select initial_1_trace 11))
                      (__f2 (select initial_1_trace 6)))
                   (or a!1113
                       a!1114
                       a!1115
                       a!1116
                       a!1117
                       a!1118
                       a!1119
                       a!1120
                       a!1121
                       a!1122
                       a!1123)))
      (a!1140 (and (= (__f2 (select initial_1_trace 11))
                      (__f2 (select initial_1_trace 7)))
                   (or a!1129
                       a!1130
                       a!1131
                       a!1132
                       a!1133
                       a!1134
                       a!1135
                       a!1136
                       a!1137
                       a!1138
                       a!1139)))
      (a!1156 (and (= (__f2 (select initial_1_trace 11))
                      (__f2 (select initial_1_trace 8)))
                   (or a!1145
                       a!1146
                       a!1147
                       a!1148
                       a!1149
                       a!1150
                       a!1151
                       a!1152
                       a!1153
                       a!1154
                       a!1155)))
      (a!1172 (and (= (__f2 (select initial_1_trace 11))
                      (__f2 (select initial_1_trace 9)))
                   (or a!1161
                       a!1162
                       a!1163
                       a!1164
                       a!1165
                       a!1166
                       a!1167
                       a!1168
                       a!1169
                       a!1170
                       a!1171)))
      (a!1188 (and (= (__f2 (select initial_1_trace 11))
                      (__f2 (select initial_1_trace 10)))
                   (or a!1177
                       a!1178
                       a!1179
                       a!1180
                       a!1181
                       a!1182
                       a!1183
                       a!1184
                       a!1185
                       a!1186
                       a!1187)))
      (a!1216 (and (= (__f2 (select initial_1_trace 12))
                      (__f2 (select initial_1_trace 0)))
                   (or a!1205
                       a!1206
                       a!1207
                       a!1208
                       a!1209
                       a!1210
                       a!1211
                       a!1212
                       a!1213
                       a!1214
                       a!1215)))
      (a!1232 (and (= (__f2 (select initial_1_trace 12))
                      (__f2 (select initial_1_trace 1)))
                   (or a!1221
                       a!1222
                       a!1223
                       a!1224
                       a!1225
                       a!1226
                       a!1227
                       a!1228
                       a!1229
                       a!1230
                       a!1231)))
      (a!1248 (and (= (__f2 (select initial_1_trace 12))
                      (__f2 (select initial_1_trace 2)))
                   (or a!1237
                       a!1238
                       a!1239
                       a!1240
                       a!1241
                       a!1242
                       a!1243
                       a!1244
                       a!1245
                       a!1246
                       a!1247)))
      (a!1264 (and (= (__f2 (select initial_1_trace 12))
                      (__f2 (select initial_1_trace 3)))
                   (or a!1253
                       a!1254
                       a!1255
                       a!1256
                       a!1257
                       a!1258
                       a!1259
                       a!1260
                       a!1261
                       a!1262
                       a!1263)))
      (a!1280 (and (= (__f2 (select initial_1_trace 12))
                      (__f2 (select initial_1_trace 4)))
                   (or a!1269
                       a!1270
                       a!1271
                       a!1272
                       a!1273
                       a!1274
                       a!1275
                       a!1276
                       a!1277
                       a!1278
                       a!1279)))
      (a!1296 (and (= (__f2 (select initial_1_trace 12))
                      (__f2 (select initial_1_trace 5)))
                   (or a!1285
                       a!1286
                       a!1287
                       a!1288
                       a!1289
                       a!1290
                       a!1291
                       a!1292
                       a!1293
                       a!1294
                       a!1295)))
      (a!1312 (and (= (__f2 (select initial_1_trace 12))
                      (__f2 (select initial_1_trace 6)))
                   (or a!1301
                       a!1302
                       a!1303
                       a!1304
                       a!1305
                       a!1306
                       a!1307
                       a!1308
                       a!1309
                       a!1310
                       a!1311)))
      (a!1328 (and (= (__f2 (select initial_1_trace 12))
                      (__f2 (select initial_1_trace 7)))
                   (or a!1317
                       a!1318
                       a!1319
                       a!1320
                       a!1321
                       a!1322
                       a!1323
                       a!1324
                       a!1325
                       a!1326
                       a!1327)))
      (a!1344 (and (= (__f2 (select initial_1_trace 12))
                      (__f2 (select initial_1_trace 8)))
                   (or a!1333
                       a!1334
                       a!1335
                       a!1336
                       a!1337
                       a!1338
                       a!1339
                       a!1340
                       a!1341
                       a!1342
                       a!1343)))
      (a!1360 (and (= (__f2 (select initial_1_trace 12))
                      (__f2 (select initial_1_trace 9)))
                   (or a!1349
                       a!1350
                       a!1351
                       a!1352
                       a!1353
                       a!1354
                       a!1355
                       a!1356
                       a!1357
                       a!1358
                       a!1359)))
      (a!1376 (and (= (__f2 (select initial_1_trace 12))
                      (__f2 (select initial_1_trace 10)))
                   (or a!1365
                       a!1366
                       a!1367
                       a!1368
                       a!1369
                       a!1370
                       a!1371
                       a!1372
                       a!1373
                       a!1374
                       a!1375)))
      (a!1392 (and (= (__f2 (select initial_1_trace 12))
                      (__f2 (select initial_1_trace 11)))
                   (or a!1381
                       a!1382
                       a!1383
                       a!1384
                       a!1385
                       a!1386
                       a!1387
                       a!1388
                       a!1389
                       a!1390
                       a!1391)))
      (a!1420 (and (= (__f2 (select initial_1_trace 13))
                      (__f2 (select initial_1_trace 0)))
                   (or a!1409
                       a!1410
                       a!1411
                       a!1412
                       a!1413
                       a!1414
                       a!1415
                       a!1416
                       a!1417
                       a!1418
                       a!1419)))
      (a!1436 (and (= (__f2 (select initial_1_trace 13))
                      (__f2 (select initial_1_trace 1)))
                   (or a!1425
                       a!1426
                       a!1427
                       a!1428
                       a!1429
                       a!1430
                       a!1431
                       a!1432
                       a!1433
                       a!1434
                       a!1435)))
      (a!1452 (and (= (__f2 (select initial_1_trace 13))
                      (__f2 (select initial_1_trace 2)))
                   (or a!1441
                       a!1442
                       a!1443
                       a!1444
                       a!1445
                       a!1446
                       a!1447
                       a!1448
                       a!1449
                       a!1450
                       a!1451)))
      (a!1468 (and (= (__f2 (select initial_1_trace 13))
                      (__f2 (select initial_1_trace 3)))
                   (or a!1457
                       a!1458
                       a!1459
                       a!1460
                       a!1461
                       a!1462
                       a!1463
                       a!1464
                       a!1465
                       a!1466
                       a!1467)))
      (a!1484 (and (= (__f2 (select initial_1_trace 13))
                      (__f2 (select initial_1_trace 4)))
                   (or a!1473
                       a!1474
                       a!1475
                       a!1476
                       a!1477
                       a!1478
                       a!1479
                       a!1480
                       a!1481
                       a!1482
                       a!1483)))
      (a!1500 (and (= (__f2 (select initial_1_trace 13))
                      (__f2 (select initial_1_trace 5)))
                   (or a!1489
                       a!1490
                       a!1491
                       a!1492
                       a!1493
                       a!1494
                       a!1495
                       a!1496
                       a!1497
                       a!1498
                       a!1499)))
      (a!1516 (and (= (__f2 (select initial_1_trace 13))
                      (__f2 (select initial_1_trace 6)))
                   (or a!1505
                       a!1506
                       a!1507
                       a!1508
                       a!1509
                       a!1510
                       a!1511
                       a!1512
                       a!1513
                       a!1514
                       a!1515)))
      (a!1532 (and (= (__f2 (select initial_1_trace 13))
                      (__f2 (select initial_1_trace 7)))
                   (or a!1521
                       a!1522
                       a!1523
                       a!1524
                       a!1525
                       a!1526
                       a!1527
                       a!1528
                       a!1529
                       a!1530
                       a!1531)))
      (a!1548 (and (= (__f2 (select initial_1_trace 13))
                      (__f2 (select initial_1_trace 8)))
                   (or a!1537
                       a!1538
                       a!1539
                       a!1540
                       a!1541
                       a!1542
                       a!1543
                       a!1544
                       a!1545
                       a!1546
                       a!1547)))
      (a!1564 (and (= (__f2 (select initial_1_trace 13))
                      (__f2 (select initial_1_trace 9)))
                   (or a!1553
                       a!1554
                       a!1555
                       a!1556
                       a!1557
                       a!1558
                       a!1559
                       a!1560
                       a!1561
                       a!1562
                       a!1563)))
      (a!1580 (and (= (__f2 (select initial_1_trace 13))
                      (__f2 (select initial_1_trace 10)))
                   (or a!1569
                       a!1570
                       a!1571
                       a!1572
                       a!1573
                       a!1574
                       a!1575
                       a!1576
                       a!1577
                       a!1578
                       a!1579)))
      (a!1596 (and (= (__f2 (select initial_1_trace 13))
                      (__f2 (select initial_1_trace 11)))
                   (or a!1585
                       a!1586
                       a!1587
                       a!1588
                       a!1589
                       a!1590
                       a!1591
                       a!1592
                       a!1593
                       a!1594
                       a!1595)))
      (a!1612 (and (= (__f2 (select initial_1_trace 13))
                      (__f2 (select initial_1_trace 12)))
                   (or a!1601
                       a!1602
                       a!1603
                       a!1604
                       a!1605
                       a!1606
                       a!1607
                       a!1608
                       a!1609
                       a!1610
                       a!1611)))
      (a!1640 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 0)))
                   (or a!1629
                       a!1630
                       a!1631
                       a!1632
                       a!1633
                       a!1634
                       a!1635
                       a!1636
                       a!1637
                       a!1638
                       a!1639)))
      (a!1656 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 1)))
                   (or a!1645
                       a!1646
                       a!1647
                       a!1648
                       a!1649
                       a!1650
                       a!1651
                       a!1652
                       a!1653
                       a!1654
                       a!1655)))
      (a!1672 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 2)))
                   (or a!1661
                       a!1662
                       a!1663
                       a!1664
                       a!1665
                       a!1666
                       a!1667
                       a!1668
                       a!1669
                       a!1670
                       a!1671)))
      (a!1688 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 3)))
                   (or a!1677
                       a!1678
                       a!1679
                       a!1680
                       a!1681
                       a!1682
                       a!1683
                       a!1684
                       a!1685
                       a!1686
                       a!1687)))
      (a!1704 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 4)))
                   (or a!1693
                       a!1694
                       a!1695
                       a!1696
                       a!1697
                       a!1698
                       a!1699
                       a!1700
                       a!1701
                       a!1702
                       a!1703)))
      (a!1720 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 5)))
                   (or a!1709
                       a!1710
                       a!1711
                       a!1712
                       a!1713
                       a!1714
                       a!1715
                       a!1716
                       a!1717
                       a!1718
                       a!1719)))
      (a!1736 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 6)))
                   (or a!1725
                       a!1726
                       a!1727
                       a!1728
                       a!1729
                       a!1730
                       a!1731
                       a!1732
                       a!1733
                       a!1734
                       a!1735)))
      (a!1752 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 7)))
                   (or a!1741
                       a!1742
                       a!1743
                       a!1744
                       a!1745
                       a!1746
                       a!1747
                       a!1748
                       a!1749
                       a!1750
                       a!1751)))
      (a!1768 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 8)))
                   (or a!1757
                       a!1758
                       a!1759
                       a!1760
                       a!1761
                       a!1762
                       a!1763
                       a!1764
                       a!1765
                       a!1766
                       a!1767)))
      (a!1784 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 9)))
                   (or a!1773
                       a!1774
                       a!1775
                       a!1776
                       a!1777
                       a!1778
                       a!1779
                       a!1780
                       a!1781
                       a!1782
                       a!1783)))
      (a!1800 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 10)))
                   (or a!1789
                       a!1790
                       a!1791
                       a!1792
                       a!1793
                       a!1794
                       a!1795
                       a!1796
                       a!1797
                       a!1798
                       a!1799)))
      (a!1816 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 11)))
                   (or a!1805
                       a!1806
                       a!1807
                       a!1808
                       a!1809
                       a!1810
                       a!1811
                       a!1812
                       a!1813
                       a!1814
                       a!1815)))
      (a!1832 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 12)))
                   (or a!1821
                       a!1822
                       a!1823
                       a!1824
                       a!1825
                       a!1826
                       a!1827
                       a!1828
                       a!1829
                       a!1830
                       a!1831)))
      (a!1848 (and (= (__f2 (select initial_1_trace 14))
                      (__f2 (select initial_1_trace 13)))
                   (or a!1837
                       a!1838
                       a!1839
                       a!1840
                       a!1841
                       a!1842
                       a!1843
                       a!1844
                       a!1845
                       a!1846
                       a!1847)))
      (a!1876 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 0)))
                   (or a!1865
                       a!1866
                       a!1867
                       a!1868
                       a!1869
                       a!1870
                       a!1871
                       a!1872
                       a!1873
                       a!1874
                       a!1875)))
      (a!1892 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 1)))
                   (or a!1881
                       a!1882
                       a!1883
                       a!1884
                       a!1885
                       a!1886
                       a!1887
                       a!1888
                       a!1889
                       a!1890
                       a!1891)))
      (a!1908 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 2)))
                   (or a!1897
                       a!1898
                       a!1899
                       a!1900
                       a!1901
                       a!1902
                       a!1903
                       a!1904
                       a!1905
                       a!1906
                       a!1907)))
      (a!1924 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 3)))
                   (or a!1913
                       a!1914
                       a!1915
                       a!1916
                       a!1917
                       a!1918
                       a!1919
                       a!1920
                       a!1921
                       a!1922
                       a!1923)))
      (a!1940 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 4)))
                   (or a!1929
                       a!1930
                       a!1931
                       a!1932
                       a!1933
                       a!1934
                       a!1935
                       a!1936
                       a!1937
                       a!1938
                       a!1939)))
      (a!1956 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 5)))
                   (or a!1945
                       a!1946
                       a!1947
                       a!1948
                       a!1949
                       a!1950
                       a!1951
                       a!1952
                       a!1953
                       a!1954
                       a!1955)))
      (a!1972 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 6)))
                   (or a!1961
                       a!1962
                       a!1963
                       a!1964
                       a!1965
                       a!1966
                       a!1967
                       a!1968
                       a!1969
                       a!1970
                       a!1971)))
      (a!1988 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 7)))
                   (or a!1977
                       a!1978
                       a!1979
                       a!1980
                       a!1981
                       a!1982
                       a!1983
                       a!1984
                       a!1985
                       a!1986
                       a!1987)))
      (a!2004 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 8)))
                   (or a!1993
                       a!1994
                       a!1995
                       a!1996
                       a!1997
                       a!1998
                       a!1999
                       a!2000
                       a!2001
                       a!2002
                       a!2003)))
      (a!2020 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 9)))
                   (or a!2009
                       a!2010
                       a!2011
                       a!2012
                       a!2013
                       a!2014
                       a!2015
                       a!2016
                       a!2017
                       a!2018
                       a!2019)))
      (a!2036 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 10)))
                   (or a!2025
                       a!2026
                       a!2027
                       a!2028
                       a!2029
                       a!2030
                       a!2031
                       a!2032
                       a!2033
                       a!2034
                       a!2035)))
      (a!2052 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 11)))
                   (or a!2041
                       a!2042
                       a!2043
                       a!2044
                       a!2045
                       a!2046
                       a!2047
                       a!2048
                       a!2049
                       a!2050
                       a!2051)))
      (a!2068 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 12)))
                   (or a!2057
                       a!2058
                       a!2059
                       a!2060
                       a!2061
                       a!2062
                       a!2063
                       a!2064
                       a!2065
                       a!2066
                       a!2067)))
      (a!2084 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 13)))
                   (or a!2073
                       a!2074
                       a!2075
                       a!2076
                       a!2077
                       a!2078
                       a!2079
                       a!2080
                       a!2081
                       a!2082
                       a!2083)))
      (a!2100 (and (= (__f2 (select initial_1_trace 15))
                      (__f2 (select initial_1_trace 14)))
                   (or a!2089
                       a!2090
                       a!2091
                       a!2092
                       a!2093
                       a!2094
                       a!2095
                       a!2096
                       a!2097
                       a!2098
                       a!2099)))
      (a!2128 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 0)))
                   (or a!2117
                       a!2118
                       a!2119
                       a!2120
                       a!2121
                       a!2122
                       a!2123
                       a!2124
                       a!2125
                       a!2126
                       a!2127)))
      (a!2144 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 1)))
                   (or a!2133
                       a!2134
                       a!2135
                       a!2136
                       a!2137
                       a!2138
                       a!2139
                       a!2140
                       a!2141
                       a!2142
                       a!2143)))
      (a!2160 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 2)))
                   (or a!2149
                       a!2150
                       a!2151
                       a!2152
                       a!2153
                       a!2154
                       a!2155
                       a!2156
                       a!2157
                       a!2158
                       a!2159)))
      (a!2176 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 3)))
                   (or a!2165
                       a!2166
                       a!2167
                       a!2168
                       a!2169
                       a!2170
                       a!2171
                       a!2172
                       a!2173
                       a!2174
                       a!2175)))
      (a!2192 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 4)))
                   (or a!2181
                       a!2182
                       a!2183
                       a!2184
                       a!2185
                       a!2186
                       a!2187
                       a!2188
                       a!2189
                       a!2190
                       a!2191)))
      (a!2208 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 5)))
                   (or a!2197
                       a!2198
                       a!2199
                       a!2200
                       a!2201
                       a!2202
                       a!2203
                       a!2204
                       a!2205
                       a!2206
                       a!2207)))
      (a!2224 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 6)))
                   (or a!2213
                       a!2214
                       a!2215
                       a!2216
                       a!2217
                       a!2218
                       a!2219
                       a!2220
                       a!2221
                       a!2222
                       a!2223)))
      (a!2240 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 7)))
                   (or a!2229
                       a!2230
                       a!2231
                       a!2232
                       a!2233
                       a!2234
                       a!2235
                       a!2236
                       a!2237
                       a!2238
                       a!2239)))
      (a!2256 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 8)))
                   (or a!2245
                       a!2246
                       a!2247
                       a!2248
                       a!2249
                       a!2250
                       a!2251
                       a!2252
                       a!2253
                       a!2254
                       a!2255)))
      (a!2272 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 9)))
                   (or a!2261
                       a!2262
                       a!2263
                       a!2264
                       a!2265
                       a!2266
                       a!2267
                       a!2268
                       a!2269
                       a!2270
                       a!2271)))
      (a!2288 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 10)))
                   (or a!2277
                       a!2278
                       a!2279
                       a!2280
                       a!2281
                       a!2282
                       a!2283
                       a!2284
                       a!2285
                       a!2286
                       a!2287)))
      (a!2304 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 11)))
                   (or a!2293
                       a!2294
                       a!2295
                       a!2296
                       a!2297
                       a!2298
                       a!2299
                       a!2300
                       a!2301
                       a!2302
                       a!2303)))
      (a!2320 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 12)))
                   (or a!2309
                       a!2310
                       a!2311
                       a!2312
                       a!2313
                       a!2314
                       a!2315
                       a!2316
                       a!2317
                       a!2318
                       a!2319)))
      (a!2336 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 13)))
                   (or a!2325
                       a!2326
                       a!2327
                       a!2328
                       a!2329
                       a!2330
                       a!2331
                       a!2332
                       a!2333
                       a!2334
                       a!2335)))
      (a!2352 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 14)))
                   (or a!2341
                       a!2342
                       a!2343
                       a!2344
                       a!2345
                       a!2346
                       a!2347
                       a!2348
                       a!2349
                       a!2350
                       a!2351)))
      (a!2368 (and (= (__f2 (select initial_1_trace 16))
                      (__f2 (select initial_1_trace 15)))
                   (or a!2357
                       a!2358
                       a!2359
                       a!2360
                       a!2361
                       a!2362
                       a!2363
                       a!2364
                       a!2365
                       a!2366
                       a!2367)))
      (a!2396 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 0)))
                   (or a!2385
                       a!2386
                       a!2387
                       a!2388
                       a!2389
                       a!2390
                       a!2391
                       a!2392
                       a!2393
                       a!2394
                       a!2395)))
      (a!2412 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 1)))
                   (or a!2401
                       a!2402
                       a!2403
                       a!2404
                       a!2405
                       a!2406
                       a!2407
                       a!2408
                       a!2409
                       a!2410
                       a!2411)))
      (a!2428 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 2)))
                   (or a!2417
                       a!2418
                       a!2419
                       a!2420
                       a!2421
                       a!2422
                       a!2423
                       a!2424
                       a!2425
                       a!2426
                       a!2427)))
      (a!2444 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 3)))
                   (or a!2433
                       a!2434
                       a!2435
                       a!2436
                       a!2437
                       a!2438
                       a!2439
                       a!2440
                       a!2441
                       a!2442
                       a!2443)))
      (a!2460 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 4)))
                   (or a!2449
                       a!2450
                       a!2451
                       a!2452
                       a!2453
                       a!2454
                       a!2455
                       a!2456
                       a!2457
                       a!2458
                       a!2459)))
      (a!2476 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 5)))
                   (or a!2465
                       a!2466
                       a!2467
                       a!2468
                       a!2469
                       a!2470
                       a!2471
                       a!2472
                       a!2473
                       a!2474
                       a!2475)))
      (a!2492 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 6)))
                   (or a!2481
                       a!2482
                       a!2483
                       a!2484
                       a!2485
                       a!2486
                       a!2487
                       a!2488
                       a!2489
                       a!2490
                       a!2491)))
      (a!2508 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 7)))
                   (or a!2497
                       a!2498
                       a!2499
                       a!2500
                       a!2501
                       a!2502
                       a!2503
                       a!2504
                       a!2505
                       a!2506
                       a!2507)))
      (a!2524 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 8)))
                   (or a!2513
                       a!2514
                       a!2515
                       a!2516
                       a!2517
                       a!2518
                       a!2519
                       a!2520
                       a!2521
                       a!2522
                       a!2523)))
      (a!2540 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 9)))
                   (or a!2529
                       a!2530
                       a!2531
                       a!2532
                       a!2533
                       a!2534
                       a!2535
                       a!2536
                       a!2537
                       a!2538
                       a!2539)))
      (a!2556 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 10)))
                   (or a!2545
                       a!2546
                       a!2547
                       a!2548
                       a!2549
                       a!2550
                       a!2551
                       a!2552
                       a!2553
                       a!2554
                       a!2555)))
      (a!2572 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 11)))
                   (or a!2561
                       a!2562
                       a!2563
                       a!2564
                       a!2565
                       a!2566
                       a!2567
                       a!2568
                       a!2569
                       a!2570
                       a!2571)))
      (a!2588 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 12)))
                   (or a!2577
                       a!2578
                       a!2579
                       a!2580
                       a!2581
                       a!2582
                       a!2583
                       a!2584
                       a!2585
                       a!2586
                       a!2587)))
      (a!2604 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 13)))
                   (or a!2593
                       a!2594
                       a!2595
                       a!2596
                       a!2597
                       a!2598
                       a!2599
                       a!2600
                       a!2601
                       a!2602
                       a!2603)))
      (a!2620 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 14)))
                   (or a!2609
                       a!2610
                       a!2611
                       a!2612
                       a!2613
                       a!2614
                       a!2615
                       a!2616
                       a!2617
                       a!2618
                       a!2619)))
      (a!2636 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 15)))
                   (or a!2625
                       a!2626
                       a!2627
                       a!2628
                       a!2629
                       a!2630
                       a!2631
                       a!2632
                       a!2633
                       a!2634
                       a!2635)))
      (a!2652 (and (= (__f2 (select initial_1_trace 17))
                      (__f2 (select initial_1_trace 16)))
                   (or a!2641
                       a!2642
                       a!2643
                       a!2644
                       a!2645
                       a!2646
                       a!2647
                       a!2648
                       a!2649
                       a!2650
                       a!2651))))
(let ((a!29 (not (or (not a!12)
                     (and a!13 (not a!14))
                     (and a!15 (not a!16))
                     a!28)))
      (a!57 (not (or (not a!41)
                     (and a!42 (not a!43))
                     (and a!44 (not a!16))
                     a!56)))
      (a!73 (not (or (not a!58)
                     (and a!59 (not a!60))
                     (and a!44 (not a!15))
                     a!72)))
      (a!101 (not (or (not a!85)
                      (and a!86 (not a!87))
                      (and a!88 (not a!16))
                      a!100)))
      (a!117 (not (or (not a!102)
                      (and a!103 (not a!104))
                      (and a!88 (not a!15))
                      a!116)))
      (a!133 (not (or (not a!118)
                      (and a!119 (not a!120))
                      (and a!88 (not a!44))
                      a!132)))
      (a!161 (not (or (not a!145)
                      (and a!146 (not a!147))
                      (and a!148 (not a!16))
                      a!160)))
      (a!177 (not (or (not a!162)
                      (and a!163 (not a!164))
                      (and a!148 (not a!15))
                      a!176)))
      (a!193 (not (or (not a!178)
                      (and a!179 (not a!180))
                      (and a!148 (not a!44))
                      a!192)))
      (a!209 (not (or (not a!194)
                      (and a!195 (not a!196))
                      (and a!148 (not a!88))
                      a!208)))
      (a!237 (not (or (not a!221)
                      (and a!222 (not a!223))
                      (and a!224 (not a!16))
                      a!236)))
      (a!253 (not (or (not a!238)
                      (and a!239 (not a!240))
                      (and a!224 (not a!15))
                      a!252)))
      (a!269 (not (or (not a!254)
                      (and a!255 (not a!256))
                      (and a!224 (not a!44))
                      a!268)))
      (a!285 (not (or (not a!270)
                      (and a!271 (not a!272))
                      (and a!224 (not a!88))
                      a!284)))
      (a!301 (not (or (not a!286)
                      (and a!287 (not a!288))
                      (and a!224 (not a!148))
                      a!300)))
      (a!329 (not (or (not a!313)
                      (and a!314 (not a!315))
                      (and a!316 (not a!16))
                      a!328)))
      (a!345 (not (or (not a!330)
                      (and a!331 (not a!332))
                      (and a!316 (not a!15))
                      a!344)))
      (a!361 (not (or (not a!346)
                      (and a!347 (not a!348))
                      (and a!316 (not a!44))
                      a!360)))
      (a!377 (not (or (not a!362)
                      (and a!363 (not a!364))
                      (and a!316 (not a!88))
                      a!376)))
      (a!393 (not (or (not a!378)
                      (and a!379 (not a!380))
                      (and a!316 (not a!148))
                      a!392)))
      (a!409 (not (or (not a!394)
                      (and a!395 (not a!396))
                      (and a!316 (not a!224))
                      a!408)))
      (a!437 (not (or (not a!421)
                      (and a!422 (not a!423))
                      (and a!424 (not a!16))
                      a!436)))
      (a!453 (not (or (not a!438)
                      (and a!439 (not a!440))
                      (and a!424 (not a!15))
                      a!452)))
      (a!469 (not (or (not a!454)
                      (and a!455 (not a!456))
                      (and a!424 (not a!44))
                      a!468)))
      (a!485 (not (or (not a!470)
                      (and a!471 (not a!472))
                      (and a!424 (not a!88))
                      a!484)))
      (a!501 (not (or (not a!486)
                      (and a!487 (not a!488))
                      (and a!424 (not a!148))
                      a!500)))
      (a!517 (not (or (not a!502)
                      (and a!503 (not a!504))
                      (and a!424 (not a!224))
                      a!516)))
      (a!533 (not (or (not a!518)
                      (and a!519 (not a!520))
                      (and a!424 (not a!316))
                      a!532)))
      (a!561 (not (or (not a!545)
                      (and a!546 (not a!547))
                      (and a!548 (not a!16))
                      a!560)))
      (a!577 (not (or (not a!562)
                      (and a!563 (not a!564))
                      (and a!548 (not a!15))
                      a!576)))
      (a!593 (not (or (not a!578)
                      (and a!579 (not a!580))
                      (and a!548 (not a!44))
                      a!592)))
      (a!609 (not (or (not a!594)
                      (and a!595 (not a!596))
                      (and a!548 (not a!88))
                      a!608)))
      (a!625 (not (or (not a!610)
                      (and a!611 (not a!612))
                      (and a!548 (not a!148))
                      a!624)))
      (a!641 (not (or (not a!626)
                      (and a!627 (not a!628))
                      (and a!548 (not a!224))
                      a!640)))
      (a!657 (not (or (not a!642)
                      (and a!643 (not a!644))
                      (and a!548 (not a!316))
                      a!656)))
      (a!673 (not (or (not a!658)
                      (and a!659 (not a!660))
                      (and a!548 (not a!424))
                      a!672)))
      (a!701 (not (or (not a!685)
                      (and a!686 (not a!687))
                      (and a!688 (not a!16))
                      a!700)))
      (a!717 (not (or (not a!702)
                      (and a!703 (not a!704))
                      (and a!688 (not a!15))
                      a!716)))
      (a!733 (not (or (not a!718)
                      (and a!719 (not a!720))
                      (and a!688 (not a!44))
                      a!732)))
      (a!749 (not (or (not a!734)
                      (and a!735 (not a!736))
                      (and a!688 (not a!88))
                      a!748)))
      (a!765 (not (or (not a!750)
                      (and a!751 (not a!752))
                      (and a!688 (not a!148))
                      a!764)))
      (a!781 (not (or (not a!766)
                      (and a!767 (not a!768))
                      (and a!688 (not a!224))
                      a!780)))
      (a!797 (not (or (not a!782)
                      (and a!783 (not a!784))
                      (and a!688 (not a!316))
                      a!796)))
      (a!813 (not (or (not a!798)
                      (and a!799 (not a!800))
                      (and a!688 (not a!424))
                      a!812)))
      (a!829 (not (or (not a!814)
                      (and a!815 (not a!816))
                      (and a!688 (not a!548))
                      a!828)))
      (a!857 (not (or (not a!841)
                      (and a!842 (not a!843))
                      (and a!844 (not a!16))
                      a!856)))
      (a!873 (not (or (not a!858)
                      (and a!859 (not a!860))
                      (and a!844 (not a!15))
                      a!872)))
      (a!889 (not (or (not a!874)
                      (and a!875 (not a!876))
                      (and a!844 (not a!44))
                      a!888)))
      (a!905 (not (or (not a!890)
                      (and a!891 (not a!892))
                      (and a!844 (not a!88))
                      a!904)))
      (a!921 (not (or (not a!906)
                      (and a!907 (not a!908))
                      (and a!844 (not a!148))
                      a!920)))
      (a!937 (not (or (not a!922)
                      (and a!923 (not a!924))
                      (and a!844 (not a!224))
                      a!936)))
      (a!953 (not (or (not a!938)
                      (and a!939 (not a!940))
                      (and a!844 (not a!316))
                      a!952)))
      (a!969 (not (or (not a!954)
                      (and a!955 (not a!956))
                      (and a!844 (not a!424))
                      a!968)))
      (a!985 (not (or (not a!970)
                      (and a!971 (not a!972))
                      (and a!844 (not a!548))
                      a!984)))
      (a!1001 (not (or (not a!986)
                       (and a!987 (not a!988))
                       (and a!844 (not a!688))
                       a!1000)))
      (a!1029 (not (or (not a!1013)
                       (and a!1014 (not a!1015))
                       (and a!1016 (not a!16))
                       a!1028)))
      (a!1045 (not (or (not a!1030)
                       (and a!1031 (not a!1032))
                       (and a!1016 (not a!15))
                       a!1044)))
      (a!1061 (not (or (not a!1046)
                       (and a!1047 (not a!1048))
                       (and a!1016 (not a!44))
                       a!1060)))
      (a!1077 (not (or (not a!1062)
                       (and a!1063 (not a!1064))
                       (and a!1016 (not a!88))
                       a!1076)))
      (a!1093 (not (or (not a!1078)
                       (and a!1079 (not a!1080))
                       (and a!1016 (not a!148))
                       a!1092)))
      (a!1109 (not (or (not a!1094)
                       (and a!1095 (not a!1096))
                       (and a!1016 (not a!224))
                       a!1108)))
      (a!1125 (not (or (not a!1110)
                       (and a!1111 (not a!1112))
                       (and a!1016 (not a!316))
                       a!1124)))
      (a!1141 (not (or (not a!1126)
                       (and a!1127 (not a!1128))
                       (and a!1016 (not a!424))
                       a!1140)))
      (a!1157 (not (or (not a!1142)
                       (and a!1143 (not a!1144))
                       (and a!1016 (not a!548))
                       a!1156)))
      (a!1173 (not (or (not a!1158)
                       (and a!1159 (not a!1160))
                       (and a!1016 (not a!688))
                       a!1172)))
      (a!1189 (not (or (not a!1174)
                       (and a!1175 (not a!1176))
                       (and a!1016 (not a!844))
                       a!1188)))
      (a!1217 (not (or (not a!1201)
                       (and a!1202 (not a!1203))
                       (and a!1204 (not a!16))
                       a!1216)))
      (a!1233 (not (or (not a!1218)
                       (and a!1219 (not a!1220))
                       (and a!1204 (not a!15))
                       a!1232)))
      (a!1249 (not (or (not a!1234)
                       (and a!1235 (not a!1236))
                       (and a!1204 (not a!44))
                       a!1248)))
      (a!1265 (not (or (not a!1250)
                       (and a!1251 (not a!1252))
                       (and a!1204 (not a!88))
                       a!1264)))
      (a!1281 (not (or (not a!1266)
                       (and a!1267 (not a!1268))
                       (and a!1204 (not a!148))
                       a!1280)))
      (a!1297 (not (or (not a!1282)
                       (and a!1283 (not a!1284))
                       (and a!1204 (not a!224))
                       a!1296)))
      (a!1313 (not (or (not a!1298)
                       (and a!1299 (not a!1300))
                       (and a!1204 (not a!316))
                       a!1312)))
      (a!1329 (not (or (not a!1314)
                       (and a!1315 (not a!1316))
                       (and a!1204 (not a!424))
                       a!1328)))
      (a!1345 (not (or (not a!1330)
                       (and a!1331 (not a!1332))
                       (and a!1204 (not a!548))
                       a!1344)))
      (a!1361 (not (or (not a!1346)
                       (and a!1347 (not a!1348))
                       (and a!1204 (not a!688))
                       a!1360)))
      (a!1377 (not (or (not a!1362)
                       (and a!1363 (not a!1364))
                       (and a!1204 (not a!844))
                       a!1376)))
      (a!1393 (not (or (not a!1378)
                       (and a!1379 (not a!1380))
                       (and a!1204 (not a!1016))
                       a!1392)))
      (a!1421 (not (or (not a!1405)
                       (and a!1406 (not a!1407))
                       (and a!1408 (not a!16))
                       a!1420)))
      (a!1437 (not (or (not a!1422)
                       (and a!1423 (not a!1424))
                       (and a!1408 (not a!15))
                       a!1436)))
      (a!1453 (not (or (not a!1438)
                       (and a!1439 (not a!1440))
                       (and a!1408 (not a!44))
                       a!1452)))
      (a!1469 (not (or (not a!1454)
                       (and a!1455 (not a!1456))
                       (and a!1408 (not a!88))
                       a!1468)))
      (a!1485 (not (or (not a!1470)
                       (and a!1471 (not a!1472))
                       (and a!1408 (not a!148))
                       a!1484)))
      (a!1501 (not (or (not a!1486)
                       (and a!1487 (not a!1488))
                       (and a!1408 (not a!224))
                       a!1500)))
      (a!1517 (not (or (not a!1502)
                       (and a!1503 (not a!1504))
                       (and a!1408 (not a!316))
                       a!1516)))
      (a!1533 (not (or (not a!1518)
                       (and a!1519 (not a!1520))
                       (and a!1408 (not a!424))
                       a!1532)))
      (a!1549 (not (or (not a!1534)
                       (and a!1535 (not a!1536))
                       (and a!1408 (not a!548))
                       a!1548)))
      (a!1565 (not (or (not a!1550)
                       (and a!1551 (not a!1552))
                       (and a!1408 (not a!688))
                       a!1564)))
      (a!1581 (not (or (not a!1566)
                       (and a!1567 (not a!1568))
                       (and a!1408 (not a!844))
                       a!1580)))
      (a!1597 (not (or (not a!1582)
                       (and a!1583 (not a!1584))
                       (and a!1408 (not a!1016))
                       a!1596)))
      (a!1613 (not (or (not a!1598)
                       (and a!1599 (not a!1600))
                       (and a!1408 (not a!1204))
                       a!1612)))
      (a!1641 (not (or (not a!1625)
                       (and a!1626 (not a!1627))
                       (and a!1628 (not a!16))
                       a!1640)))
      (a!1657 (not (or (not a!1642)
                       (and a!1643 (not a!1644))
                       (and a!1628 (not a!15))
                       a!1656)))
      (a!1673 (not (or (not a!1658)
                       (and a!1659 (not a!1660))
                       (and a!1628 (not a!44))
                       a!1672)))
      (a!1689 (not (or (not a!1674)
                       (and a!1675 (not a!1676))
                       (and a!1628 (not a!88))
                       a!1688)))
      (a!1705 (not (or (not a!1690)
                       (and a!1691 (not a!1692))
                       (and a!1628 (not a!148))
                       a!1704)))
      (a!1721 (not (or (not a!1706)
                       (and a!1707 (not a!1708))
                       (and a!1628 (not a!224))
                       a!1720)))
      (a!1737 (not (or (not a!1722)
                       (and a!1723 (not a!1724))
                       (and a!1628 (not a!316))
                       a!1736)))
      (a!1753 (not (or (not a!1738)
                       (and a!1739 (not a!1740))
                       (and a!1628 (not a!424))
                       a!1752)))
      (a!1769 (not (or (not a!1754)
                       (and a!1755 (not a!1756))
                       (and a!1628 (not a!548))
                       a!1768)))
      (a!1785 (not (or (not a!1770)
                       (and a!1771 (not a!1772))
                       (and a!1628 (not a!688))
                       a!1784)))
      (a!1801 (not (or (not a!1786)
                       (and a!1787 (not a!1788))
                       (and a!1628 (not a!844))
                       a!1800)))
      (a!1817 (not (or (not a!1802)
                       (and a!1803 (not a!1804))
                       (and a!1628 (not a!1016))
                       a!1816)))
      (a!1833 (not (or (not a!1818)
                       (and a!1819 (not a!1820))
                       (and a!1628 (not a!1204))
                       a!1832)))
      (a!1849 (not (or (not a!1834)
                       (and a!1835 (not a!1836))
                       (and a!1628 (not a!1408))
                       a!1848)))
      (a!1877 (not (or (not a!1861)
                       (and a!1862 (not a!1863))
                       (and a!1864 (not a!16))
                       a!1876)))
      (a!1893 (not (or (not a!1878)
                       (and a!1879 (not a!1880))
                       (and a!1864 (not a!15))
                       a!1892)))
      (a!1909 (not (or (not a!1894)
                       (and a!1895 (not a!1896))
                       (and a!1864 (not a!44))
                       a!1908)))
      (a!1925 (not (or (not a!1910)
                       (and a!1911 (not a!1912))
                       (and a!1864 (not a!88))
                       a!1924)))
      (a!1941 (not (or (not a!1926)
                       (and a!1927 (not a!1928))
                       (and a!1864 (not a!148))
                       a!1940)))
      (a!1957 (not (or (not a!1942)
                       (and a!1943 (not a!1944))
                       (and a!1864 (not a!224))
                       a!1956)))
      (a!1973 (not (or (not a!1958)
                       (and a!1959 (not a!1960))
                       (and a!1864 (not a!316))
                       a!1972)))
      (a!1989 (not (or (not a!1974)
                       (and a!1975 (not a!1976))
                       (and a!1864 (not a!424))
                       a!1988)))
      (a!2005 (not (or (not a!1990)
                       (and a!1991 (not a!1992))
                       (and a!1864 (not a!548))
                       a!2004)))
      (a!2021 (not (or (not a!2006)
                       (and a!2007 (not a!2008))
                       (and a!1864 (not a!688))
                       a!2020)))
      (a!2037 (not (or (not a!2022)
                       (and a!2023 (not a!2024))
                       (and a!1864 (not a!844))
                       a!2036)))
      (a!2053 (not (or (not a!2038)
                       (and a!2039 (not a!2040))
                       (and a!1864 (not a!1016))
                       a!2052)))
      (a!2069 (not (or (not a!2054)
                       (and a!2055 (not a!2056))
                       (and a!1864 (not a!1204))
                       a!2068)))
      (a!2085 (not (or (not a!2070)
                       (and a!2071 (not a!2072))
                       (and a!1864 (not a!1408))
                       a!2084)))
      (a!2101 (not (or (not a!2086)
                       (and a!2087 (not a!2088))
                       (and a!1864 (not a!1628))
                       a!2100)))
      (a!2129 (not (or (not a!2113)
                       (and a!2114 (not a!2115))
                       (and a!2116 (not a!16))
                       a!2128)))
      (a!2145 (not (or (not a!2130)
                       (and a!2131 (not a!2132))
                       (and a!2116 (not a!15))
                       a!2144)))
      (a!2161 (not (or (not a!2146)
                       (and a!2147 (not a!2148))
                       (and a!2116 (not a!44))
                       a!2160)))
      (a!2177 (not (or (not a!2162)
                       (and a!2163 (not a!2164))
                       (and a!2116 (not a!88))
                       a!2176)))
      (a!2193 (not (or (not a!2178)
                       (and a!2179 (not a!2180))
                       (and a!2116 (not a!148))
                       a!2192)))
      (a!2209 (not (or (not a!2194)
                       (and a!2195 (not a!2196))
                       (and a!2116 (not a!224))
                       a!2208)))
      (a!2225 (not (or (not a!2210)
                       (and a!2211 (not a!2212))
                       (and a!2116 (not a!316))
                       a!2224)))
      (a!2241 (not (or (not a!2226)
                       (and a!2227 (not a!2228))
                       (and a!2116 (not a!424))
                       a!2240)))
      (a!2257 (not (or (not a!2242)
                       (and a!2243 (not a!2244))
                       (and a!2116 (not a!548))
                       a!2256)))
      (a!2273 (not (or (not a!2258)
                       (and a!2259 (not a!2260))
                       (and a!2116 (not a!688))
                       a!2272)))
      (a!2289 (not (or (not a!2274)
                       (and a!2275 (not a!2276))
                       (and a!2116 (not a!844))
                       a!2288)))
      (a!2305 (not (or (not a!2290)
                       (and a!2291 (not a!2292))
                       (and a!2116 (not a!1016))
                       a!2304)))
      (a!2321 (not (or (not a!2306)
                       (and a!2307 (not a!2308))
                       (and a!2116 (not a!1204))
                       a!2320)))
      (a!2337 (not (or (not a!2322)
                       (and a!2323 (not a!2324))
                       (and a!2116 (not a!1408))
                       a!2336)))
      (a!2353 (not (or (not a!2338)
                       (and a!2339 (not a!2340))
                       (and a!2116 (not a!1628))
                       a!2352)))
      (a!2369 (not (or (not a!2354)
                       (and a!2355 (not a!2356))
                       (and a!2116 (not a!1864))
                       a!2368)))
      (a!2397 (not (or (not a!2381)
                       (and a!2382 (not a!2383))
                       (and a!2384 (not a!16))
                       a!2396)))
      (a!2413 (not (or (not a!2398)
                       (and a!2399 (not a!2400))
                       (and a!2384 (not a!15))
                       a!2412)))
      (a!2429 (not (or (not a!2414)
                       (and a!2415 (not a!2416))
                       (and a!2384 (not a!44))
                       a!2428)))
      (a!2445 (not (or (not a!2430)
                       (and a!2431 (not a!2432))
                       (and a!2384 (not a!88))
                       a!2444)))
      (a!2461 (not (or (not a!2446)
                       (and a!2447 (not a!2448))
                       (and a!2384 (not a!148))
                       a!2460)))
      (a!2477 (not (or (not a!2462)
                       (and a!2463 (not a!2464))
                       (and a!2384 (not a!224))
                       a!2476)))
      (a!2493 (not (or (not a!2478)
                       (and a!2479 (not a!2480))
                       (and a!2384 (not a!316))
                       a!2492)))
      (a!2509 (not (or (not a!2494)
                       (and a!2495 (not a!2496))
                       (and a!2384 (not a!424))
                       a!2508)))
      (a!2525 (not (or (not a!2510)
                       (and a!2511 (not a!2512))
                       (and a!2384 (not a!548))
                       a!2524)))
      (a!2541 (not (or (not a!2526)
                       (and a!2527 (not a!2528))
                       (and a!2384 (not a!688))
                       a!2540)))
      (a!2557 (not (or (not a!2542)
                       (and a!2543 (not a!2544))
                       (and a!2384 (not a!844))
                       a!2556)))
      (a!2573 (not (or (not a!2558)
                       (and a!2559 (not a!2560))
                       (and a!2384 (not a!1016))
                       a!2572)))
      (a!2589 (not (or (not a!2574)
                       (and a!2575 (not a!2576))
                       (and a!2384 (not a!1204))
                       a!2588)))
      (a!2605 (not (or (not a!2590)
                       (and a!2591 (not a!2592))
                       (and a!2384 (not a!1408))
                       a!2604)))
      (a!2621 (not (or (not a!2606)
                       (and a!2607 (not a!2608))
                       (and a!2384 (not a!1628))
                       a!2620)))
      (a!2637 (not (or (not a!2622)
                       (and a!2623 (not a!2624))
                       (and a!2384 (not a!1864))
                       a!2636)))
      (a!2653 (not (or (not a!2638)
                       (and a!2639 (not a!2640))
                       (and a!2384 (not a!2116))
                       a!2652))))
  (and (not (or a!1 a!2 a!3 a!4 a!5 a!6 a!7 a!8 a!9 a!10 a!11))
       a!29
       (not (or a!30 a!31 a!32 a!33 a!34 a!35 a!36 a!37 a!38 a!39 a!40))
       a!57
       a!73
       (not (or a!74 a!75 a!76 a!77 a!78 a!79 a!80 a!81 a!82 a!83 a!84))
       a!101
       a!117
       a!133
       (not (or a!134
                a!135
                a!136
                a!137
                a!138
                a!139
                a!140
                a!141
                a!142
                a!143
                a!144))
       a!161
       a!177
       a!193
       a!209
       (not (or a!210
                a!211
                a!212
                a!213
                a!214
                a!215
                a!216
                a!217
                a!218
                a!219
                a!220))
       a!237
       a!253
       a!269
       a!285
       a!301
       (not (or a!302
                a!303
                a!304
                a!305
                a!306
                a!307
                a!308
                a!309
                a!310
                a!311
                a!312))
       a!329
       a!345
       a!361
       a!377
       a!393
       a!409
       (not (or a!410
                a!411
                a!412
                a!413
                a!414
                a!415
                a!416
                a!417
                a!418
                a!419
                a!420))
       a!437
       a!453
       a!469
       a!485
       a!501
       a!517
       a!533
       (not (or a!534
                a!535
                a!536
                a!537
                a!538
                a!539
                a!540
                a!541
                a!542
                a!543
                a!544))
       a!561
       a!577
       a!593
       a!609
       a!625
       a!641
       a!657
       a!673
       (not (or a!674
                a!675
                a!676
                a!677
                a!678
                a!679
                a!680
                a!681
                a!682
                a!683
                a!684))
       a!701
       a!717
       a!733
       a!749
       a!765
       a!781
       a!797
       a!813
       a!829
       (not (or a!830
                a!831
                a!832
                a!833
                a!834
                a!835
                a!836
                a!837
                a!838
                a!839
                a!840))
       a!857
       a!873
       a!889
       a!905
       a!921
       a!937
       a!953
       a!969
       a!985
       a!1001
       (not (or a!1002
                a!1003
                a!1004
                a!1005
                a!1006
                a!1007
                a!1008
                a!1009
                a!1010
                a!1011
                a!1012))
       a!1029
       a!1045
       a!1061
       a!1077
       a!1093
       a!1109
       a!1125
       a!1141
       a!1157
       a!1173
       a!1189
       (not (or a!1190
                a!1191
                a!1192
                a!1193
                a!1194
                a!1195
                a!1196
                a!1197
                a!1198
                a!1199
                a!1200))
       a!1217
       a!1233
       a!1249
       a!1265
       a!1281
       a!1297
       a!1313
       a!1329
       a!1345
       a!1361
       a!1377
       a!1393
       (not (or a!1394
                a!1395
                a!1396
                a!1397
                a!1398
                a!1399
                a!1400
                a!1401
                a!1402
                a!1403
                a!1404))
       a!1421
       a!1437
       a!1453
       a!1469
       a!1485
       a!1501
       a!1517
       a!1533
       a!1549
       a!1565
       a!1581
       a!1597
       a!1613
       (not (or a!1614
                a!1615
                a!1616
                a!1617
                a!1618
                a!1619
                a!1620
                a!1621
                a!1622
                a!1623
                a!1624))
       a!1641
       a!1657
       a!1673
       a!1689
       a!1705
       a!1721
       a!1737
       a!1753
       a!1769
       a!1785
       a!1801
       a!1817
       a!1833
       a!1849
       (not (or a!1850
                a!1851
                a!1852
                a!1853
                a!1854
                a!1855
                a!1856
                a!1857
                a!1858
                a!1859
                a!1860))
       a!1877
       a!1893
       a!1909
       a!1925
       a!1941
       a!1957
       a!1973
       a!1989
       a!2005
       a!2021
       a!2037
       a!2053
       a!2069
       a!2085
       a!2101
       (not (or a!2102
                a!2103
                a!2104
                a!2105
                a!2106
                a!2107
                a!2108
                a!2109
                a!2110
                a!2111
                a!2112))
       a!2129
       a!2145
       a!2161
       a!2177
       a!2193
       a!2209
       a!2225
       a!2241
       a!2257
       a!2273
       a!2289
       a!2305
       a!2321
       a!2337
       a!2353
       a!2369
       (not (or a!2370
                a!2371
                a!2372
                a!2373
                a!2374
                a!2375
                a!2376
                a!2377
                a!2378
                a!2379
                a!2380))
       a!2397
       a!2413
       a!2429
       a!2445
       a!2461
       a!2477
       a!2493
       a!2509
       a!2525
       a!2541
       a!2557
       a!2573
       a!2589
       a!2605
       a!2621
       a!2637
       a!2653
       (not (or a!2654
                a!2655
                a!2656
                a!2657
                a!2658
                a!2659
                a!2660
                a!2661
                a!2662
                a!2663
                a!2664)))))))
(assert (let ((a!1 (>= (__f2 (__f2 (select initial_1_trace 1))) 0))
      (a!2 (>= (__f2 (__f2 (select initial_1_trace 2))) 0))
      (a!3 (>= (__f2 (__f2 (select initial_1_trace 3))) 0))
      (a!4 (>= (__f2 (__f2 (select initial_1_trace 4))) 0))
      (a!5 (>= (__f2 (__f2 (select initial_1_trace 5))) 0))
      (a!6 (>= (__f2 (__f2 (select initial_1_trace 6))) 0))
      (a!7 (>= (__f2 (__f2 (select initial_1_trace 7))) 0))
      (a!8 (>= (__f2 (__f2 (select initial_1_trace 8))) 0))
      (a!9 (>= (__f2 (__f2 (select initial_1_trace 9))) 0))
      (a!10 (>= (__f2 (__f2 (select initial_1_trace 10))) 0))
      (a!11 (>= (__f2 (__f2 (select initial_1_trace 11))) 0))
      (a!12 (>= (__f2 (__f2 (select initial_1_trace 12))) 0))
      (a!13 (>= (__f2 (__f2 (select initial_1_trace 13))) 0))
      (a!14 (>= (__f2 (__f2 (select initial_1_trace 14))) 0))
      (a!15 (>= (__f2 (__f2 (select initial_1_trace 15))) 0))
      (a!16 (>= (__f2 (__f2 (select initial_1_trace 16))) 0))
      (a!17 (>= (__f2 (__f2 (select initial_1_trace 17))) 0)))
  (and a!1
       a!2
       a!3
       a!4
       a!5
       a!6
       a!7
       a!8
       a!9
       a!10
       a!11
       a!12
       a!13
       a!14
       a!15
       a!16
       a!17)))
(assert (let ((a!1 (+ 11000000 (__f1 (__f2 (select initial_1_trace 0)))))
      (a!2 (= (__f6 (__f3 (select initial_1_trace 1)))
              (__f2 (__f6 (select initial_1_trace 0)))))
      (a!4 (not (__f2 (__f4 (select initial_1_trace 1)))))
      (a!5 (= (__f6 (__f3 (select initial_1_trace 2)))
              (__f2 (__f6 (select initial_1_trace 0)))))
      (a!7 (+ 11000000 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!8 (= (__f6 (__f3 (select initial_1_trace 2)))
              (__f2 (__f6 (select initial_1_trace 1)))))
      (a!10 (not (__f2 (__f4 (select initial_1_trace 2)))))
      (a!11 (= (__f6 (__f3 (select initial_1_trace 3)))
               (__f2 (__f6 (select initial_1_trace 0)))))
      (a!13 (= (__f6 (__f3 (select initial_1_trace 3)))
               (__f2 (__f6 (select initial_1_trace 1)))))
      (a!15 (+ 11000000 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!16 (= (__f6 (__f3 (select initial_1_trace 3)))
               (__f2 (__f6 (select initial_1_trace 2)))))
      (a!18 (not (__f2 (__f4 (select initial_1_trace 3)))))
      (a!19 (= (__f6 (__f3 (select initial_1_trace 4)))
               (__f2 (__f6 (select initial_1_trace 0)))))
      (a!21 (= (__f6 (__f3 (select initial_1_trace 4)))
               (__f2 (__f6 (select initial_1_trace 1)))))
      (a!23 (= (__f6 (__f3 (select initial_1_trace 4)))
               (__f2 (__f6 (select initial_1_trace 2)))))
      (a!25 (+ 11000000 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!26 (= (__f6 (__f3 (select initial_1_trace 4)))
               (__f2 (__f6 (select initial_1_trace 3)))))
      (a!28 (not (__f2 (__f4 (select initial_1_trace 4)))))
      (a!29 (= (__f6 (__f3 (select initial_1_trace 5)))
               (__f2 (__f6 (select initial_1_trace 0)))))
      (a!31 (= (__f6 (__f3 (select initial_1_trace 5)))
               (__f2 (__f6 (select initial_1_trace 1)))))
      (a!33 (= (__f6 (__f3 (select initial_1_trace 5)))
               (__f2 (__f6 (select initial_1_trace 2)))))
      (a!35 (= (__f6 (__f3 (select initial_1_trace 5)))
               (__f2 (__f6 (select initial_1_trace 3)))))
      (a!37 (+ 11000000 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!38 (= (__f6 (__f3 (select initial_1_trace 5)))
               (__f2 (__f6 (select initial_1_trace 4)))))
      (a!40 (not (__f2 (__f4 (select initial_1_trace 5)))))
      (a!41 (= (__f6 (__f3 (select initial_1_trace 6)))
               (__f2 (__f6 (select initial_1_trace 0)))))
      (a!43 (= (__f6 (__f3 (select initial_1_trace 6)))
               (__f2 (__f6 (select initial_1_trace 1)))))
      (a!45 (= (__f6 (__f3 (select initial_1_trace 6)))
               (__f2 (__f6 (select initial_1_trace 2)))))
      (a!47 (= (__f6 (__f3 (select initial_1_trace 6)))
               (__f2 (__f6 (select initial_1_trace 3)))))
      (a!49 (= (__f6 (__f3 (select initial_1_trace 6)))
               (__f2 (__f6 (select initial_1_trace 4)))))
      (a!51 (+ 11000000 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!52 (= (__f6 (__f3 (select initial_1_trace 6)))
               (__f2 (__f6 (select initial_1_trace 5)))))
      (a!54 (not (__f2 (__f4 (select initial_1_trace 6)))))
      (a!55 (= (__f6 (__f3 (select initial_1_trace 7)))
               (__f2 (__f6 (select initial_1_trace 0)))))
      (a!57 (= (__f6 (__f3 (select initial_1_trace 7)))
               (__f2 (__f6 (select initial_1_trace 1)))))
      (a!59 (= (__f6 (__f3 (select initial_1_trace 7)))
               (__f2 (__f6 (select initial_1_trace 2)))))
      (a!61 (= (__f6 (__f3 (select initial_1_trace 7)))
               (__f2 (__f6 (select initial_1_trace 3)))))
      (a!63 (= (__f6 (__f3 (select initial_1_trace 7)))
               (__f2 (__f6 (select initial_1_trace 4)))))
      (a!65 (= (__f6 (__f3 (select initial_1_trace 7)))
               (__f2 (__f6 (select initial_1_trace 5)))))
      (a!67 (+ 11000000 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!68 (= (__f6 (__f3 (select initial_1_trace 7)))
               (__f2 (__f6 (select initial_1_trace 6)))))
      (a!70 (not (__f2 (__f4 (select initial_1_trace 7)))))
      (a!71 (= (__f6 (__f3 (select initial_1_trace 8)))
               (__f2 (__f6 (select initial_1_trace 0)))))
      (a!73 (= (__f6 (__f3 (select initial_1_trace 8)))
               (__f2 (__f6 (select initial_1_trace 1)))))
      (a!75 (= (__f6 (__f3 (select initial_1_trace 8)))
               (__f2 (__f6 (select initial_1_trace 2)))))
      (a!77 (= (__f6 (__f3 (select initial_1_trace 8)))
               (__f2 (__f6 (select initial_1_trace 3)))))
      (a!79 (= (__f6 (__f3 (select initial_1_trace 8)))
               (__f2 (__f6 (select initial_1_trace 4)))))
      (a!81 (= (__f6 (__f3 (select initial_1_trace 8)))
               (__f2 (__f6 (select initial_1_trace 5)))))
      (a!83 (= (__f6 (__f3 (select initial_1_trace 8)))
               (__f2 (__f6 (select initial_1_trace 6)))))
      (a!85 (+ 11000000 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!86 (= (__f6 (__f3 (select initial_1_trace 8)))
               (__f2 (__f6 (select initial_1_trace 7)))))
      (a!88 (not (__f2 (__f4 (select initial_1_trace 8)))))
      (a!89 (= (__f6 (__f3 (select initial_1_trace 9)))
               (__f2 (__f6 (select initial_1_trace 0)))))
      (a!91 (= (__f6 (__f3 (select initial_1_trace 9)))
               (__f2 (__f6 (select initial_1_trace 1)))))
      (a!93 (= (__f6 (__f3 (select initial_1_trace 9)))
               (__f2 (__f6 (select initial_1_trace 2)))))
      (a!95 (= (__f6 (__f3 (select initial_1_trace 9)))
               (__f2 (__f6 (select initial_1_trace 3)))))
      (a!97 (= (__f6 (__f3 (select initial_1_trace 9)))
               (__f2 (__f6 (select initial_1_trace 4)))))
      (a!99 (= (__f6 (__f3 (select initial_1_trace 9)))
               (__f2 (__f6 (select initial_1_trace 5)))))
      (a!101 (= (__f6 (__f3 (select initial_1_trace 9)))
                (__f2 (__f6 (select initial_1_trace 6)))))
      (a!103 (= (__f6 (__f3 (select initial_1_trace 9)))
                (__f2 (__f6 (select initial_1_trace 7)))))
      (a!105 (+ 11000000 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!106 (= (__f6 (__f3 (select initial_1_trace 9)))
                (__f2 (__f6 (select initial_1_trace 8)))))
      (a!108 (not (__f2 (__f4 (select initial_1_trace 9)))))
      (a!109 (= (__f6 (__f3 (select initial_1_trace 10)))
                (__f2 (__f6 (select initial_1_trace 0)))))
      (a!111 (= (__f6 (__f3 (select initial_1_trace 10)))
                (__f2 (__f6 (select initial_1_trace 1)))))
      (a!113 (= (__f6 (__f3 (select initial_1_trace 10)))
                (__f2 (__f6 (select initial_1_trace 2)))))
      (a!115 (= (__f6 (__f3 (select initial_1_trace 10)))
                (__f2 (__f6 (select initial_1_trace 3)))))
      (a!117 (= (__f6 (__f3 (select initial_1_trace 10)))
                (__f2 (__f6 (select initial_1_trace 4)))))
      (a!119 (= (__f6 (__f3 (select initial_1_trace 10)))
                (__f2 (__f6 (select initial_1_trace 5)))))
      (a!121 (= (__f6 (__f3 (select initial_1_trace 10)))
                (__f2 (__f6 (select initial_1_trace 6)))))
      (a!123 (= (__f6 (__f3 (select initial_1_trace 10)))
                (__f2 (__f6 (select initial_1_trace 7)))))
      (a!125 (= (__f6 (__f3 (select initial_1_trace 10)))
                (__f2 (__f6 (select initial_1_trace 8)))))
      (a!127 (+ 11000000 (__f1 (__f2 (select initial_1_trace 9)))))
      (a!128 (= (__f6 (__f3 (select initial_1_trace 10)))
                (__f2 (__f6 (select initial_1_trace 9)))))
      (a!130 (not (__f2 (__f4 (select initial_1_trace 10)))))
      (a!131 (= (__f6 (__f3 (select initial_1_trace 11)))
                (__f2 (__f6 (select initial_1_trace 0)))))
      (a!133 (= (__f6 (__f3 (select initial_1_trace 11)))
                (__f2 (__f6 (select initial_1_trace 1)))))
      (a!135 (= (__f6 (__f3 (select initial_1_trace 11)))
                (__f2 (__f6 (select initial_1_trace 2)))))
      (a!137 (= (__f6 (__f3 (select initial_1_trace 11)))
                (__f2 (__f6 (select initial_1_trace 3)))))
      (a!139 (= (__f6 (__f3 (select initial_1_trace 11)))
                (__f2 (__f6 (select initial_1_trace 4)))))
      (a!141 (= (__f6 (__f3 (select initial_1_trace 11)))
                (__f2 (__f6 (select initial_1_trace 5)))))
      (a!143 (= (__f6 (__f3 (select initial_1_trace 11)))
                (__f2 (__f6 (select initial_1_trace 6)))))
      (a!145 (= (__f6 (__f3 (select initial_1_trace 11)))
                (__f2 (__f6 (select initial_1_trace 7)))))
      (a!147 (= (__f6 (__f3 (select initial_1_trace 11)))
                (__f2 (__f6 (select initial_1_trace 8)))))
      (a!149 (= (__f6 (__f3 (select initial_1_trace 11)))
                (__f2 (__f6 (select initial_1_trace 9)))))
      (a!151 (+ 11000000 (__f1 (__f2 (select initial_1_trace 10)))))
      (a!152 (= (__f6 (__f3 (select initial_1_trace 11)))
                (__f2 (__f6 (select initial_1_trace 10)))))
      (a!154 (not (__f2 (__f4 (select initial_1_trace 11)))))
      (a!155 (= (__f6 (__f3 (select initial_1_trace 12)))
                (__f2 (__f6 (select initial_1_trace 0)))))
      (a!157 (= (__f6 (__f3 (select initial_1_trace 12)))
                (__f2 (__f6 (select initial_1_trace 1)))))
      (a!159 (= (__f6 (__f3 (select initial_1_trace 12)))
                (__f2 (__f6 (select initial_1_trace 2)))))
      (a!161 (= (__f6 (__f3 (select initial_1_trace 12)))
                (__f2 (__f6 (select initial_1_trace 3)))))
      (a!163 (= (__f6 (__f3 (select initial_1_trace 12)))
                (__f2 (__f6 (select initial_1_trace 4)))))
      (a!165 (= (__f6 (__f3 (select initial_1_trace 12)))
                (__f2 (__f6 (select initial_1_trace 5)))))
      (a!167 (= (__f6 (__f3 (select initial_1_trace 12)))
                (__f2 (__f6 (select initial_1_trace 6)))))
      (a!169 (= (__f6 (__f3 (select initial_1_trace 12)))
                (__f2 (__f6 (select initial_1_trace 7)))))
      (a!171 (= (__f6 (__f3 (select initial_1_trace 12)))
                (__f2 (__f6 (select initial_1_trace 8)))))
      (a!173 (= (__f6 (__f3 (select initial_1_trace 12)))
                (__f2 (__f6 (select initial_1_trace 9)))))
      (a!175 (= (__f6 (__f3 (select initial_1_trace 12)))
                (__f2 (__f6 (select initial_1_trace 10)))))
      (a!177 (+ 11000000 (__f1 (__f2 (select initial_1_trace 11)))))
      (a!178 (= (__f6 (__f3 (select initial_1_trace 12)))
                (__f2 (__f6 (select initial_1_trace 11)))))
      (a!180 (not (__f2 (__f4 (select initial_1_trace 12)))))
      (a!181 (= (__f6 (__f3 (select initial_1_trace 13)))
                (__f2 (__f6 (select initial_1_trace 0)))))
      (a!183 (= (__f6 (__f3 (select initial_1_trace 13)))
                (__f2 (__f6 (select initial_1_trace 1)))))
      (a!185 (= (__f6 (__f3 (select initial_1_trace 13)))
                (__f2 (__f6 (select initial_1_trace 2)))))
      (a!187 (= (__f6 (__f3 (select initial_1_trace 13)))
                (__f2 (__f6 (select initial_1_trace 3)))))
      (a!189 (= (__f6 (__f3 (select initial_1_trace 13)))
                (__f2 (__f6 (select initial_1_trace 4)))))
      (a!191 (= (__f6 (__f3 (select initial_1_trace 13)))
                (__f2 (__f6 (select initial_1_trace 5)))))
      (a!193 (= (__f6 (__f3 (select initial_1_trace 13)))
                (__f2 (__f6 (select initial_1_trace 6)))))
      (a!195 (= (__f6 (__f3 (select initial_1_trace 13)))
                (__f2 (__f6 (select initial_1_trace 7)))))
      (a!197 (= (__f6 (__f3 (select initial_1_trace 13)))
                (__f2 (__f6 (select initial_1_trace 8)))))
      (a!199 (= (__f6 (__f3 (select initial_1_trace 13)))
                (__f2 (__f6 (select initial_1_trace 9)))))
      (a!201 (= (__f6 (__f3 (select initial_1_trace 13)))
                (__f2 (__f6 (select initial_1_trace 10)))))
      (a!203 (= (__f6 (__f3 (select initial_1_trace 13)))
                (__f2 (__f6 (select initial_1_trace 11)))))
      (a!205 (+ 11000000 (__f1 (__f2 (select initial_1_trace 12)))))
      (a!206 (= (__f6 (__f3 (select initial_1_trace 13)))
                (__f2 (__f6 (select initial_1_trace 12)))))
      (a!208 (not (__f2 (__f4 (select initial_1_trace 13)))))
      (a!209 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 0)))))
      (a!211 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 1)))))
      (a!213 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 2)))))
      (a!215 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 3)))))
      (a!217 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 4)))))
      (a!219 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 5)))))
      (a!221 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 6)))))
      (a!223 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 7)))))
      (a!225 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 8)))))
      (a!227 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 9)))))
      (a!229 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 10)))))
      (a!231 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 11)))))
      (a!233 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 12)))))
      (a!235 (+ 11000000 (__f1 (__f2 (select initial_1_trace 13)))))
      (a!236 (= (__f6 (__f3 (select initial_1_trace 14)))
                (__f2 (__f6 (select initial_1_trace 13)))))
      (a!238 (not (__f2 (__f4 (select initial_1_trace 14)))))
      (a!239 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 0)))))
      (a!241 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 1)))))
      (a!243 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 2)))))
      (a!245 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 3)))))
      (a!247 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 4)))))
      (a!249 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 5)))))
      (a!251 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 6)))))
      (a!253 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 7)))))
      (a!255 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 8)))))
      (a!257 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 9)))))
      (a!259 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 10)))))
      (a!261 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 11)))))
      (a!263 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 12)))))
      (a!265 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 13)))))
      (a!267 (+ 11000000 (__f1 (__f2 (select initial_1_trace 14)))))
      (a!268 (= (__f6 (__f3 (select initial_1_trace 15)))
                (__f2 (__f6 (select initial_1_trace 14)))))
      (a!270 (not (__f2 (__f4 (select initial_1_trace 15)))))
      (a!271 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 0)))))
      (a!273 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 1)))))
      (a!275 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 2)))))
      (a!277 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 3)))))
      (a!279 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 4)))))
      (a!281 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 5)))))
      (a!283 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 6)))))
      (a!285 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 7)))))
      (a!287 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 8)))))
      (a!289 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 9)))))
      (a!291 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 10)))))
      (a!293 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 11)))))
      (a!295 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 12)))))
      (a!297 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 13)))))
      (a!299 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 14)))))
      (a!301 (+ 11000000 (__f1 (__f2 (select initial_1_trace 15)))))
      (a!302 (= (__f6 (__f3 (select initial_1_trace 16)))
                (__f2 (__f6 (select initial_1_trace 15)))))
      (a!304 (not (__f2 (__f4 (select initial_1_trace 16)))))
      (a!305 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 0)))))
      (a!307 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 1)))))
      (a!309 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 2)))))
      (a!311 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 3)))))
      (a!313 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 4)))))
      (a!315 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 5)))))
      (a!317 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 6)))))
      (a!319 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 7)))))
      (a!321 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 8)))))
      (a!323 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 9)))))
      (a!325 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 10)))))
      (a!327 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 11)))))
      (a!329 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 12)))))
      (a!331 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 13)))))
      (a!333 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 14)))))
      (a!335 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 15)))))
      (a!337 (+ 11000000 (__f1 (__f2 (select initial_1_trace 16)))))
      (a!338 (= (__f6 (__f3 (select initial_1_trace 17)))
                (__f2 (__f6 (select initial_1_trace 16)))))
      (a!340 (not (__f2 (__f4 (select initial_1_trace 17))))))
(let ((a!3 (and (__f5 (__f1 (select initial_1_trace 0)))
                (= (__f2 (select initial_1_trace 1)) (_tuple_2 a!1 0))
                (__f2 (__f5 (select initial_1_trace 0)))
                a!2))
      (a!6 (and (__f5 (__f1 (select initial_1_trace 0)))
                (= (__f2 (select initial_1_trace 2)) (_tuple_2 a!1 0))
                (__f2 (__f5 (select initial_1_trace 0)))
                a!5))
      (a!9 (and (__f5 (__f1 (select initial_1_trace 1)))
                (= (__f2 (select initial_1_trace 2)) (_tuple_2 a!7 0))
                (__f2 (__f5 (select initial_1_trace 1)))
                a!8))
      (a!12 (and (__f5 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 3)) (_tuple_2 a!1 0))
                 (__f2 (__f5 (select initial_1_trace 0)))
                 a!11))
      (a!14 (and (__f5 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 3)) (_tuple_2 a!7 0))
                 (__f2 (__f5 (select initial_1_trace 1)))
                 a!13))
      (a!17 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 3)) (_tuple_2 a!15 0))
                 (__f2 (__f5 (select initial_1_trace 2)))
                 a!16))
      (a!20 (and (__f5 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!1 0))
                 (__f2 (__f5 (select initial_1_trace 0)))
                 a!19))
      (a!22 (and (__f5 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!7 0))
                 (__f2 (__f5 (select initial_1_trace 1)))
                 a!21))
      (a!24 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!15 0))
                 (__f2 (__f5 (select initial_1_trace 2)))
                 a!23))
      (a!27 (and (__f5 (__f1 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!25 0))
                 (__f2 (__f5 (select initial_1_trace 3)))
                 a!26))
      (a!30 (and (__f5 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!1 0))
                 (__f2 (__f5 (select initial_1_trace 0)))
                 a!29))
      (a!32 (and (__f5 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!7 0))
                 (__f2 (__f5 (select initial_1_trace 1)))
                 a!31))
      (a!34 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!15 0))
                 (__f2 (__f5 (select initial_1_trace 2)))
                 a!33))
      (a!36 (and (__f5 (__f1 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!25 0))
                 (__f2 (__f5 (select initial_1_trace 3)))
                 a!35))
      (a!39 (and (__f5 (__f1 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!37 0))
                 (__f2 (__f5 (select initial_1_trace 4)))
                 a!38))
      (a!42 (and (__f5 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!1 0))
                 (__f2 (__f5 (select initial_1_trace 0)))
                 a!41))
      (a!44 (and (__f5 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!7 0))
                 (__f2 (__f5 (select initial_1_trace 1)))
                 a!43))
      (a!46 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!15 0))
                 (__f2 (__f5 (select initial_1_trace 2)))
                 a!45))
      (a!48 (and (__f5 (__f1 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!25 0))
                 (__f2 (__f5 (select initial_1_trace 3)))
                 a!47))
      (a!50 (and (__f5 (__f1 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!37 0))
                 (__f2 (__f5 (select initial_1_trace 4)))
                 a!49))
      (a!53 (and (__f5 (__f1 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!51 0))
                 (__f2 (__f5 (select initial_1_trace 5)))
                 a!52))
      (a!56 (and (__f5 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!1 0))
                 (__f2 (__f5 (select initial_1_trace 0)))
                 a!55))
      (a!58 (and (__f5 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!7 0))
                 (__f2 (__f5 (select initial_1_trace 1)))
                 a!57))
      (a!60 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!15 0))
                 (__f2 (__f5 (select initial_1_trace 2)))
                 a!59))
      (a!62 (and (__f5 (__f1 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!25 0))
                 (__f2 (__f5 (select initial_1_trace 3)))
                 a!61))
      (a!64 (and (__f5 (__f1 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!37 0))
                 (__f2 (__f5 (select initial_1_trace 4)))
                 a!63))
      (a!66 (and (__f5 (__f1 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!51 0))
                 (__f2 (__f5 (select initial_1_trace 5)))
                 a!65))
      (a!69 (and (__f5 (__f1 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!67 0))
                 (__f2 (__f5 (select initial_1_trace 6)))
                 a!68))
      (a!72 (and (__f5 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!1 0))
                 (__f2 (__f5 (select initial_1_trace 0)))
                 a!71))
      (a!74 (and (__f5 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!7 0))
                 (__f2 (__f5 (select initial_1_trace 1)))
                 a!73))
      (a!76 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!15 0))
                 (__f2 (__f5 (select initial_1_trace 2)))
                 a!75))
      (a!78 (and (__f5 (__f1 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!25 0))
                 (__f2 (__f5 (select initial_1_trace 3)))
                 a!77))
      (a!80 (and (__f5 (__f1 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!37 0))
                 (__f2 (__f5 (select initial_1_trace 4)))
                 a!79))
      (a!82 (and (__f5 (__f1 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!51 0))
                 (__f2 (__f5 (select initial_1_trace 5)))
                 a!81))
      (a!84 (and (__f5 (__f1 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!67 0))
                 (__f2 (__f5 (select initial_1_trace 6)))
                 a!83))
      (a!87 (and (__f5 (__f1 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!85 0))
                 (__f2 (__f5 (select initial_1_trace 7)))
                 a!86))
      (a!90 (and (__f5 (__f1 (select initial_1_trace 0)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!1 0))
                 (__f2 (__f5 (select initial_1_trace 0)))
                 a!89))
      (a!92 (and (__f5 (__f1 (select initial_1_trace 1)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!7 0))
                 (__f2 (__f5 (select initial_1_trace 1)))
                 a!91))
      (a!94 (and (__f5 (__f1 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!15 0))
                 (__f2 (__f5 (select initial_1_trace 2)))
                 a!93))
      (a!96 (and (__f5 (__f1 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!25 0))
                 (__f2 (__f5 (select initial_1_trace 3)))
                 a!95))
      (a!98 (and (__f5 (__f1 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!37 0))
                 (__f2 (__f5 (select initial_1_trace 4)))
                 a!97))
      (a!100 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!51 0))
                  (__f2 (__f5 (select initial_1_trace 5)))
                  a!99))
      (a!102 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!67 0))
                  (__f2 (__f5 (select initial_1_trace 6)))
                  a!101))
      (a!104 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!85 0))
                  (__f2 (__f5 (select initial_1_trace 7)))
                  a!103))
      (a!107 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!105 0))
                  (__f2 (__f5 (select initial_1_trace 8)))
                  a!106))
      (a!110 (and (__f5 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!1 0))
                  (__f2 (__f5 (select initial_1_trace 0)))
                  a!109))
      (a!112 (and (__f5 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!7 0))
                  (__f2 (__f5 (select initial_1_trace 1)))
                  a!111))
      (a!114 (and (__f5 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!15 0))
                  (__f2 (__f5 (select initial_1_trace 2)))
                  a!113))
      (a!116 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!25 0))
                  (__f2 (__f5 (select initial_1_trace 3)))
                  a!115))
      (a!118 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!37 0))
                  (__f2 (__f5 (select initial_1_trace 4)))
                  a!117))
      (a!120 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!51 0))
                  (__f2 (__f5 (select initial_1_trace 5)))
                  a!119))
      (a!122 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!67 0))
                  (__f2 (__f5 (select initial_1_trace 6)))
                  a!121))
      (a!124 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!85 0))
                  (__f2 (__f5 (select initial_1_trace 7)))
                  a!123))
      (a!126 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!105 0))
                  (__f2 (__f5 (select initial_1_trace 8)))
                  a!125))
      (a!129 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!127 0))
                  (__f2 (__f5 (select initial_1_trace 9)))
                  a!128))
      (a!132 (and (__f5 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!1 0))
                  (__f2 (__f5 (select initial_1_trace 0)))
                  a!131))
      (a!134 (and (__f5 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!7 0))
                  (__f2 (__f5 (select initial_1_trace 1)))
                  a!133))
      (a!136 (and (__f5 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!15 0))
                  (__f2 (__f5 (select initial_1_trace 2)))
                  a!135))
      (a!138 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!25 0))
                  (__f2 (__f5 (select initial_1_trace 3)))
                  a!137))
      (a!140 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!37 0))
                  (__f2 (__f5 (select initial_1_trace 4)))
                  a!139))
      (a!142 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!51 0))
                  (__f2 (__f5 (select initial_1_trace 5)))
                  a!141))
      (a!144 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!67 0))
                  (__f2 (__f5 (select initial_1_trace 6)))
                  a!143))
      (a!146 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!85 0))
                  (__f2 (__f5 (select initial_1_trace 7)))
                  a!145))
      (a!148 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!105 0))
                  (__f2 (__f5 (select initial_1_trace 8)))
                  a!147))
      (a!150 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!127 0))
                  (__f2 (__f5 (select initial_1_trace 9)))
                  a!149))
      (a!153 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!151 0))
                  (__f2 (__f5 (select initial_1_trace 10)))
                  a!152))
      (a!156 (and (__f5 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!1 0))
                  (__f2 (__f5 (select initial_1_trace 0)))
                  a!155))
      (a!158 (and (__f5 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!7 0))
                  (__f2 (__f5 (select initial_1_trace 1)))
                  a!157))
      (a!160 (and (__f5 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!15 0))
                  (__f2 (__f5 (select initial_1_trace 2)))
                  a!159))
      (a!162 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!25 0))
                  (__f2 (__f5 (select initial_1_trace 3)))
                  a!161))
      (a!164 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!37 0))
                  (__f2 (__f5 (select initial_1_trace 4)))
                  a!163))
      (a!166 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!51 0))
                  (__f2 (__f5 (select initial_1_trace 5)))
                  a!165))
      (a!168 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!67 0))
                  (__f2 (__f5 (select initial_1_trace 6)))
                  a!167))
      (a!170 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!85 0))
                  (__f2 (__f5 (select initial_1_trace 7)))
                  a!169))
      (a!172 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!105 0))
                  (__f2 (__f5 (select initial_1_trace 8)))
                  a!171))
      (a!174 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!127 0))
                  (__f2 (__f5 (select initial_1_trace 9)))
                  a!173))
      (a!176 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!151 0))
                  (__f2 (__f5 (select initial_1_trace 10)))
                  a!175))
      (a!179 (and (__f5 (__f1 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!177 0))
                  (__f2 (__f5 (select initial_1_trace 11)))
                  a!178))
      (a!182 (and (__f5 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!1 0))
                  (__f2 (__f5 (select initial_1_trace 0)))
                  a!181))
      (a!184 (and (__f5 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!7 0))
                  (__f2 (__f5 (select initial_1_trace 1)))
                  a!183))
      (a!186 (and (__f5 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!15 0))
                  (__f2 (__f5 (select initial_1_trace 2)))
                  a!185))
      (a!188 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!25 0))
                  (__f2 (__f5 (select initial_1_trace 3)))
                  a!187))
      (a!190 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!37 0))
                  (__f2 (__f5 (select initial_1_trace 4)))
                  a!189))
      (a!192 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!51 0))
                  (__f2 (__f5 (select initial_1_trace 5)))
                  a!191))
      (a!194 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!67 0))
                  (__f2 (__f5 (select initial_1_trace 6)))
                  a!193))
      (a!196 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!85 0))
                  (__f2 (__f5 (select initial_1_trace 7)))
                  a!195))
      (a!198 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!105 0))
                  (__f2 (__f5 (select initial_1_trace 8)))
                  a!197))
      (a!200 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!127 0))
                  (__f2 (__f5 (select initial_1_trace 9)))
                  a!199))
      (a!202 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!151 0))
                  (__f2 (__f5 (select initial_1_trace 10)))
                  a!201))
      (a!204 (and (__f5 (__f1 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!177 0))
                  (__f2 (__f5 (select initial_1_trace 11)))
                  a!203))
      (a!207 (and (__f5 (__f1 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!205 0))
                  (__f2 (__f5 (select initial_1_trace 12)))
                  a!206))
      (a!210 (and (__f5 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!1 0))
                  (__f2 (__f5 (select initial_1_trace 0)))
                  a!209))
      (a!212 (and (__f5 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!7 0))
                  (__f2 (__f5 (select initial_1_trace 1)))
                  a!211))
      (a!214 (and (__f5 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!15 0))
                  (__f2 (__f5 (select initial_1_trace 2)))
                  a!213))
      (a!216 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!25 0))
                  (__f2 (__f5 (select initial_1_trace 3)))
                  a!215))
      (a!218 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!37 0))
                  (__f2 (__f5 (select initial_1_trace 4)))
                  a!217))
      (a!220 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!51 0))
                  (__f2 (__f5 (select initial_1_trace 5)))
                  a!219))
      (a!222 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!67 0))
                  (__f2 (__f5 (select initial_1_trace 6)))
                  a!221))
      (a!224 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!85 0))
                  (__f2 (__f5 (select initial_1_trace 7)))
                  a!223))
      (a!226 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!105 0))
                  (__f2 (__f5 (select initial_1_trace 8)))
                  a!225))
      (a!228 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!127 0))
                  (__f2 (__f5 (select initial_1_trace 9)))
                  a!227))
      (a!230 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!151 0))
                  (__f2 (__f5 (select initial_1_trace 10)))
                  a!229))
      (a!232 (and (__f5 (__f1 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!177 0))
                  (__f2 (__f5 (select initial_1_trace 11)))
                  a!231))
      (a!234 (and (__f5 (__f1 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!205 0))
                  (__f2 (__f5 (select initial_1_trace 12)))
                  a!233))
      (a!237 (and (__f5 (__f1 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!235 0))
                  (__f2 (__f5 (select initial_1_trace 13)))
                  a!236))
      (a!240 (and (__f5 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!1 0))
                  (__f2 (__f5 (select initial_1_trace 0)))
                  a!239))
      (a!242 (and (__f5 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!7 0))
                  (__f2 (__f5 (select initial_1_trace 1)))
                  a!241))
      (a!244 (and (__f5 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!15 0))
                  (__f2 (__f5 (select initial_1_trace 2)))
                  a!243))
      (a!246 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!25 0))
                  (__f2 (__f5 (select initial_1_trace 3)))
                  a!245))
      (a!248 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!37 0))
                  (__f2 (__f5 (select initial_1_trace 4)))
                  a!247))
      (a!250 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!51 0))
                  (__f2 (__f5 (select initial_1_trace 5)))
                  a!249))
      (a!252 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!67 0))
                  (__f2 (__f5 (select initial_1_trace 6)))
                  a!251))
      (a!254 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!85 0))
                  (__f2 (__f5 (select initial_1_trace 7)))
                  a!253))
      (a!256 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!105 0))
                  (__f2 (__f5 (select initial_1_trace 8)))
                  a!255))
      (a!258 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!127 0))
                  (__f2 (__f5 (select initial_1_trace 9)))
                  a!257))
      (a!260 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!151 0))
                  (__f2 (__f5 (select initial_1_trace 10)))
                  a!259))
      (a!262 (and (__f5 (__f1 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!177 0))
                  (__f2 (__f5 (select initial_1_trace 11)))
                  a!261))
      (a!264 (and (__f5 (__f1 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!205 0))
                  (__f2 (__f5 (select initial_1_trace 12)))
                  a!263))
      (a!266 (and (__f5 (__f1 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!235 0))
                  (__f2 (__f5 (select initial_1_trace 13)))
                  a!265))
      (a!269 (and (__f5 (__f1 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!267 0))
                  (__f2 (__f5 (select initial_1_trace 14)))
                  a!268))
      (a!272 (and (__f5 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!1 0))
                  (__f2 (__f5 (select initial_1_trace 0)))
                  a!271))
      (a!274 (and (__f5 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!7 0))
                  (__f2 (__f5 (select initial_1_trace 1)))
                  a!273))
      (a!276 (and (__f5 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!15 0))
                  (__f2 (__f5 (select initial_1_trace 2)))
                  a!275))
      (a!278 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!25 0))
                  (__f2 (__f5 (select initial_1_trace 3)))
                  a!277))
      (a!280 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!37 0))
                  (__f2 (__f5 (select initial_1_trace 4)))
                  a!279))
      (a!282 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!51 0))
                  (__f2 (__f5 (select initial_1_trace 5)))
                  a!281))
      (a!284 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!67 0))
                  (__f2 (__f5 (select initial_1_trace 6)))
                  a!283))
      (a!286 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!85 0))
                  (__f2 (__f5 (select initial_1_trace 7)))
                  a!285))
      (a!288 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!105 0))
                  (__f2 (__f5 (select initial_1_trace 8)))
                  a!287))
      (a!290 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!127 0))
                  (__f2 (__f5 (select initial_1_trace 9)))
                  a!289))
      (a!292 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!151 0))
                  (__f2 (__f5 (select initial_1_trace 10)))
                  a!291))
      (a!294 (and (__f5 (__f1 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!177 0))
                  (__f2 (__f5 (select initial_1_trace 11)))
                  a!293))
      (a!296 (and (__f5 (__f1 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!205 0))
                  (__f2 (__f5 (select initial_1_trace 12)))
                  a!295))
      (a!298 (and (__f5 (__f1 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!235 0))
                  (__f2 (__f5 (select initial_1_trace 13)))
                  a!297))
      (a!300 (and (__f5 (__f1 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!267 0))
                  (__f2 (__f5 (select initial_1_trace 14)))
                  a!299))
      (a!303 (and (__f5 (__f1 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!301 0))
                  (__f2 (__f5 (select initial_1_trace 15)))
                  a!302))
      (a!306 (and (__f5 (__f1 (select initial_1_trace 0)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!1 0))
                  (__f2 (__f5 (select initial_1_trace 0)))
                  a!305))
      (a!308 (and (__f5 (__f1 (select initial_1_trace 1)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!7 0))
                  (__f2 (__f5 (select initial_1_trace 1)))
                  a!307))
      (a!310 (and (__f5 (__f1 (select initial_1_trace 2)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!15 0))
                  (__f2 (__f5 (select initial_1_trace 2)))
                  a!309))
      (a!312 (and (__f5 (__f1 (select initial_1_trace 3)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!25 0))
                  (__f2 (__f5 (select initial_1_trace 3)))
                  a!311))
      (a!314 (and (__f5 (__f1 (select initial_1_trace 4)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!37 0))
                  (__f2 (__f5 (select initial_1_trace 4)))
                  a!313))
      (a!316 (and (__f5 (__f1 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!51 0))
                  (__f2 (__f5 (select initial_1_trace 5)))
                  a!315))
      (a!318 (and (__f5 (__f1 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!67 0))
                  (__f2 (__f5 (select initial_1_trace 6)))
                  a!317))
      (a!320 (and (__f5 (__f1 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!85 0))
                  (__f2 (__f5 (select initial_1_trace 7)))
                  a!319))
      (a!322 (and (__f5 (__f1 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!105 0))
                  (__f2 (__f5 (select initial_1_trace 8)))
                  a!321))
      (a!324 (and (__f5 (__f1 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!127 0))
                  (__f2 (__f5 (select initial_1_trace 9)))
                  a!323))
      (a!326 (and (__f5 (__f1 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!151 0))
                  (__f2 (__f5 (select initial_1_trace 10)))
                  a!325))
      (a!328 (and (__f5 (__f1 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!177 0))
                  (__f2 (__f5 (select initial_1_trace 11)))
                  a!327))
      (a!330 (and (__f5 (__f1 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!205 0))
                  (__f2 (__f5 (select initial_1_trace 12)))
                  a!329))
      (a!332 (and (__f5 (__f1 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!235 0))
                  (__f2 (__f5 (select initial_1_trace 13)))
                  a!331))
      (a!334 (and (__f5 (__f1 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!267 0))
                  (__f2 (__f5 (select initial_1_trace 14)))
                  a!333))
      (a!336 (and (__f5 (__f1 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!301 0))
                  (__f2 (__f5 (select initial_1_trace 15)))
                  a!335))
      (a!339 (and (__f5 (__f1 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!337 0))
                  (__f2 (__f5 (select initial_1_trace 16)))
                  a!338)))
  (and (or a!3 a!4)
       (or a!6 a!9 a!10)
       (or a!12 a!14 a!17 a!18)
       (or a!20 a!22 a!24 a!27 a!28)
       (or a!30 a!32 a!34 a!36 a!39 a!40)
       (or a!42 a!44 a!46 a!48 a!50 a!53 a!54)
       (or a!56 a!58 a!60 a!62 a!64 a!66 a!69 a!70)
       (or a!72 a!74 a!76 a!78 a!80 a!82 a!84 a!87 a!88)
       (or a!90 a!92 a!94 a!96 a!98 a!100 a!102 a!104 a!107 a!108)
       (or a!110 a!112 a!114 a!116 a!118 a!120 a!122 a!124 a!126 a!129 a!130)
       (or a!132
           a!134
           a!136
           a!138
           a!140
           a!142
           a!144
           a!146
           a!148
           a!150
           a!153
           a!154)
       (or a!156
           a!158
           a!160
           a!162
           a!164
           a!166
           a!168
           a!170
           a!172
           a!174
           a!176
           a!179
           a!180)
       (or a!182
           a!184
           a!186
           a!188
           a!190
           a!192
           a!194
           a!196
           a!198
           a!200
           a!202
           a!204
           a!207
           a!208)
       (or a!210
           a!212
           a!214
           a!216
           a!218
           a!220
           a!222
           a!224
           a!226
           a!228
           a!230
           a!232
           a!234
           a!237
           a!238)
       (or a!240
           a!242
           a!244
           a!246
           a!248
           a!250
           a!252
           a!254
           a!256
           a!258
           a!260
           a!262
           a!264
           a!266
           a!269
           a!270)
       (or a!272
           a!274
           a!276
           a!278
           a!280
           a!282
           a!284
           a!286
           a!288
           a!290
           a!292
           a!294
           a!296
           a!298
           a!300
           a!303
           a!304)
       (or a!306
           a!308
           a!310
           a!312
           a!314
           a!316
           a!318
           a!320
           a!322
           a!324
           a!326
           a!328
           a!330
           a!332
           a!334
           a!336
           a!339
           a!340)))))
(assert (let ((a!1 (= (__f10 (__f3 (select initial_1_trace 2)))
              (__f9 (__f3 (select initial_1_trace 1)))))
      (a!2 (_tuple_2 (__f1 (__f2 (select initial_1_trace 1)))
                     (__f2 (__f2 (select initial_1_trace 1)))))
      (a!4 (= (__f10 (__f3 (select initial_1_trace 3)))
              (__f9 (__f3 (select initial_1_trace 1)))))
      (a!6 (= (__f10 (__f3 (select initial_1_trace 4)))
              (__f9 (__f3 (select initial_1_trace 1)))))
      (a!8 (= (__f10 (__f3 (select initial_1_trace 5)))
              (__f9 (__f3 (select initial_1_trace 1)))))
      (a!10 (= (__f10 (__f3 (select initial_1_trace 6)))
               (__f9 (__f3 (select initial_1_trace 1)))))
      (a!12 (= (__f10 (__f3 (select initial_1_trace 7)))
               (__f9 (__f3 (select initial_1_trace 1)))))
      (a!14 (= (__f10 (__f3 (select initial_1_trace 8)))
               (__f9 (__f3 (select initial_1_trace 1)))))
      (a!16 (= (__f10 (__f3 (select initial_1_trace 9)))
               (__f9 (__f3 (select initial_1_trace 1)))))
      (a!18 (= (__f10 (__f3 (select initial_1_trace 10)))
               (__f9 (__f3 (select initial_1_trace 1)))))
      (a!20 (= (__f10 (__f3 (select initial_1_trace 11)))
               (__f9 (__f3 (select initial_1_trace 1)))))
      (a!22 (= (__f10 (__f3 (select initial_1_trace 12)))
               (__f9 (__f3 (select initial_1_trace 1)))))
      (a!24 (= (__f10 (__f3 (select initial_1_trace 13)))
               (__f9 (__f3 (select initial_1_trace 1)))))
      (a!26 (= (__f10 (__f3 (select initial_1_trace 14)))
               (__f9 (__f3 (select initial_1_trace 1)))))
      (a!28 (= (__f10 (__f3 (select initial_1_trace 15)))
               (__f9 (__f3 (select initial_1_trace 1)))))
      (a!30 (= (__f10 (__f3 (select initial_1_trace 16)))
               (__f9 (__f3 (select initial_1_trace 1)))))
      (a!32 (= (__f10 (__f3 (select initial_1_trace 17)))
               (__f9 (__f3 (select initial_1_trace 1)))))
      (a!34 (not (__f5 (__f4 (select initial_1_trace 1)))))
      (a!35 (not (__f6 (__f4 (select initial_1_trace 1)))))
      (a!36 (= (__f9 (__f3 (select initial_1_trace 0)))
               (__f10 (__f3 (select initial_1_trace 1)))))
      (a!37 (_tuple_2 (__f1 (__f2 (select initial_1_trace 0)))
                      (__f2 (__f2 (select initial_1_trace 0)))))
      (a!39 (= (__f10 (__f3 (select initial_1_trace 3)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!40 (_tuple_2 (__f1 (__f2 (select initial_1_trace 2)))
                      (__f2 (__f2 (select initial_1_trace 2)))))
      (a!42 (= (__f10 (__f3 (select initial_1_trace 4)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!44 (= (__f10 (__f3 (select initial_1_trace 5)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!46 (= (__f10 (__f3 (select initial_1_trace 6)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!48 (= (__f10 (__f3 (select initial_1_trace 7)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!50 (= (__f10 (__f3 (select initial_1_trace 8)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!52 (= (__f10 (__f3 (select initial_1_trace 9)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!54 (= (__f10 (__f3 (select initial_1_trace 10)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!56 (= (__f10 (__f3 (select initial_1_trace 11)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!58 (= (__f10 (__f3 (select initial_1_trace 12)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!60 (= (__f10 (__f3 (select initial_1_trace 13)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!62 (= (__f10 (__f3 (select initial_1_trace 14)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!64 (= (__f10 (__f3 (select initial_1_trace 15)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!66 (= (__f10 (__f3 (select initial_1_trace 16)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!68 (= (__f10 (__f3 (select initial_1_trace 17)))
               (__f9 (__f3 (select initial_1_trace 2)))))
      (a!70 (not (__f5 (__f4 (select initial_1_trace 2)))))
      (a!71 (= (__f9 (__f3 (select initial_1_trace 0)))
               (__f10 (__f3 (select initial_1_trace 2)))))
      (a!73 (= (__f9 (__f3 (select initial_1_trace 1)))
               (__f10 (__f3 (select initial_1_trace 2)))))
      (a!75 (not (__f6 (__f4 (select initial_1_trace 2)))))
      (a!76 (= (__f10 (__f3 (select initial_1_trace 4)))
               (__f9 (__f3 (select initial_1_trace 3)))))
      (a!77 (_tuple_2 (__f1 (__f2 (select initial_1_trace 3)))
                      (__f2 (__f2 (select initial_1_trace 3)))))
      (a!79 (= (__f10 (__f3 (select initial_1_trace 5)))
               (__f9 (__f3 (select initial_1_trace 3)))))
      (a!81 (= (__f10 (__f3 (select initial_1_trace 6)))
               (__f9 (__f3 (select initial_1_trace 3)))))
      (a!83 (= (__f10 (__f3 (select initial_1_trace 7)))
               (__f9 (__f3 (select initial_1_trace 3)))))
      (a!85 (= (__f10 (__f3 (select initial_1_trace 8)))
               (__f9 (__f3 (select initial_1_trace 3)))))
      (a!87 (= (__f10 (__f3 (select initial_1_trace 9)))
               (__f9 (__f3 (select initial_1_trace 3)))))
      (a!89 (= (__f10 (__f3 (select initial_1_trace 10)))
               (__f9 (__f3 (select initial_1_trace 3)))))
      (a!91 (= (__f10 (__f3 (select initial_1_trace 11)))
               (__f9 (__f3 (select initial_1_trace 3)))))
      (a!93 (= (__f10 (__f3 (select initial_1_trace 12)))
               (__f9 (__f3 (select initial_1_trace 3)))))
      (a!95 (= (__f10 (__f3 (select initial_1_trace 13)))
               (__f9 (__f3 (select initial_1_trace 3)))))
      (a!97 (= (__f10 (__f3 (select initial_1_trace 14)))
               (__f9 (__f3 (select initial_1_trace 3)))))
      (a!99 (= (__f10 (__f3 (select initial_1_trace 15)))
               (__f9 (__f3 (select initial_1_trace 3)))))
      (a!101 (= (__f10 (__f3 (select initial_1_trace 16)))
                (__f9 (__f3 (select initial_1_trace 3)))))
      (a!103 (= (__f10 (__f3 (select initial_1_trace 17)))
                (__f9 (__f3 (select initial_1_trace 3)))))
      (a!105 (not (__f5 (__f4 (select initial_1_trace 3)))))
      (a!106 (= (__f9 (__f3 (select initial_1_trace 0)))
                (__f10 (__f3 (select initial_1_trace 3)))))
      (a!108 (= (__f9 (__f3 (select initial_1_trace 1)))
                (__f10 (__f3 (select initial_1_trace 3)))))
      (a!110 (= (__f9 (__f3 (select initial_1_trace 2)))
                (__f10 (__f3 (select initial_1_trace 3)))))
      (a!112 (not (__f6 (__f4 (select initial_1_trace 3)))))
      (a!113 (= (__f10 (__f3 (select initial_1_trace 5)))
                (__f9 (__f3 (select initial_1_trace 4)))))
      (a!114 (_tuple_2 (__f1 (__f2 (select initial_1_trace 4)))
                       (__f2 (__f2 (select initial_1_trace 4)))))
      (a!116 (= (__f10 (__f3 (select initial_1_trace 6)))
                (__f9 (__f3 (select initial_1_trace 4)))))
      (a!118 (= (__f10 (__f3 (select initial_1_trace 7)))
                (__f9 (__f3 (select initial_1_trace 4)))))
      (a!120 (= (__f10 (__f3 (select initial_1_trace 8)))
                (__f9 (__f3 (select initial_1_trace 4)))))
      (a!122 (= (__f10 (__f3 (select initial_1_trace 9)))
                (__f9 (__f3 (select initial_1_trace 4)))))
      (a!124 (= (__f10 (__f3 (select initial_1_trace 10)))
                (__f9 (__f3 (select initial_1_trace 4)))))
      (a!126 (= (__f10 (__f3 (select initial_1_trace 11)))
                (__f9 (__f3 (select initial_1_trace 4)))))
      (a!128 (= (__f10 (__f3 (select initial_1_trace 12)))
                (__f9 (__f3 (select initial_1_trace 4)))))
      (a!130 (= (__f10 (__f3 (select initial_1_trace 13)))
                (__f9 (__f3 (select initial_1_trace 4)))))
      (a!132 (= (__f10 (__f3 (select initial_1_trace 14)))
                (__f9 (__f3 (select initial_1_trace 4)))))
      (a!134 (= (__f10 (__f3 (select initial_1_trace 15)))
                (__f9 (__f3 (select initial_1_trace 4)))))
      (a!136 (= (__f10 (__f3 (select initial_1_trace 16)))
                (__f9 (__f3 (select initial_1_trace 4)))))
      (a!138 (= (__f10 (__f3 (select initial_1_trace 17)))
                (__f9 (__f3 (select initial_1_trace 4)))))
      (a!140 (not (__f5 (__f4 (select initial_1_trace 4)))))
      (a!141 (= (__f9 (__f3 (select initial_1_trace 0)))
                (__f10 (__f3 (select initial_1_trace 4)))))
      (a!143 (= (__f9 (__f3 (select initial_1_trace 1)))
                (__f10 (__f3 (select initial_1_trace 4)))))
      (a!145 (= (__f9 (__f3 (select initial_1_trace 2)))
                (__f10 (__f3 (select initial_1_trace 4)))))
      (a!147 (= (__f9 (__f3 (select initial_1_trace 3)))
                (__f10 (__f3 (select initial_1_trace 4)))))
      (a!149 (not (__f6 (__f4 (select initial_1_trace 4)))))
      (a!150 (= (__f10 (__f3 (select initial_1_trace 6)))
                (__f9 (__f3 (select initial_1_trace 5)))))
      (a!151 (_tuple_2 (__f1 (__f2 (select initial_1_trace 5)))
                       (__f2 (__f2 (select initial_1_trace 5)))))
      (a!153 (= (__f10 (__f3 (select initial_1_trace 7)))
                (__f9 (__f3 (select initial_1_trace 5)))))
      (a!155 (= (__f10 (__f3 (select initial_1_trace 8)))
                (__f9 (__f3 (select initial_1_trace 5)))))
      (a!157 (= (__f10 (__f3 (select initial_1_trace 9)))
                (__f9 (__f3 (select initial_1_trace 5)))))
      (a!159 (= (__f10 (__f3 (select initial_1_trace 10)))
                (__f9 (__f3 (select initial_1_trace 5)))))
      (a!161 (= (__f10 (__f3 (select initial_1_trace 11)))
                (__f9 (__f3 (select initial_1_trace 5)))))
      (a!163 (= (__f10 (__f3 (select initial_1_trace 12)))
                (__f9 (__f3 (select initial_1_trace 5)))))
      (a!165 (= (__f10 (__f3 (select initial_1_trace 13)))
                (__f9 (__f3 (select initial_1_trace 5)))))
      (a!167 (= (__f10 (__f3 (select initial_1_trace 14)))
                (__f9 (__f3 (select initial_1_trace 5)))))
      (a!169 (= (__f10 (__f3 (select initial_1_trace 15)))
                (__f9 (__f3 (select initial_1_trace 5)))))
      (a!171 (= (__f10 (__f3 (select initial_1_trace 16)))
                (__f9 (__f3 (select initial_1_trace 5)))))
      (a!173 (= (__f10 (__f3 (select initial_1_trace 17)))
                (__f9 (__f3 (select initial_1_trace 5)))))
      (a!175 (not (__f5 (__f4 (select initial_1_trace 5)))))
      (a!176 (= (__f9 (__f3 (select initial_1_trace 0)))
                (__f10 (__f3 (select initial_1_trace 5)))))
      (a!178 (= (__f9 (__f3 (select initial_1_trace 1)))
                (__f10 (__f3 (select initial_1_trace 5)))))
      (a!180 (= (__f9 (__f3 (select initial_1_trace 2)))
                (__f10 (__f3 (select initial_1_trace 5)))))
      (a!182 (= (__f9 (__f3 (select initial_1_trace 3)))
                (__f10 (__f3 (select initial_1_trace 5)))))
      (a!184 (= (__f9 (__f3 (select initial_1_trace 4)))
                (__f10 (__f3 (select initial_1_trace 5)))))
      (a!186 (not (__f6 (__f4 (select initial_1_trace 5)))))
      (a!187 (= (__f10 (__f3 (select initial_1_trace 7)))
                (__f9 (__f3 (select initial_1_trace 6)))))
      (a!188 (_tuple_2 (__f1 (__f2 (select initial_1_trace 6)))
                       (__f2 (__f2 (select initial_1_trace 6)))))
      (a!190 (= (__f10 (__f3 (select initial_1_trace 8)))
                (__f9 (__f3 (select initial_1_trace 6)))))
      (a!192 (= (__f10 (__f3 (select initial_1_trace 9)))
                (__f9 (__f3 (select initial_1_trace 6)))))
      (a!194 (= (__f10 (__f3 (select initial_1_trace 10)))
                (__f9 (__f3 (select initial_1_trace 6)))))
      (a!196 (= (__f10 (__f3 (select initial_1_trace 11)))
                (__f9 (__f3 (select initial_1_trace 6)))))
      (a!198 (= (__f10 (__f3 (select initial_1_trace 12)))
                (__f9 (__f3 (select initial_1_trace 6)))))
      (a!200 (= (__f10 (__f3 (select initial_1_trace 13)))
                (__f9 (__f3 (select initial_1_trace 6)))))
      (a!202 (= (__f10 (__f3 (select initial_1_trace 14)))
                (__f9 (__f3 (select initial_1_trace 6)))))
      (a!204 (= (__f10 (__f3 (select initial_1_trace 15)))
                (__f9 (__f3 (select initial_1_trace 6)))))
      (a!206 (= (__f10 (__f3 (select initial_1_trace 16)))
                (__f9 (__f3 (select initial_1_trace 6)))))
      (a!208 (= (__f10 (__f3 (select initial_1_trace 17)))
                (__f9 (__f3 (select initial_1_trace 6)))))
      (a!210 (not (__f5 (__f4 (select initial_1_trace 6)))))
      (a!211 (= (__f9 (__f3 (select initial_1_trace 0)))
                (__f10 (__f3 (select initial_1_trace 6)))))
      (a!213 (= (__f9 (__f3 (select initial_1_trace 1)))
                (__f10 (__f3 (select initial_1_trace 6)))))
      (a!215 (= (__f9 (__f3 (select initial_1_trace 2)))
                (__f10 (__f3 (select initial_1_trace 6)))))
      (a!217 (= (__f9 (__f3 (select initial_1_trace 3)))
                (__f10 (__f3 (select initial_1_trace 6)))))
      (a!219 (= (__f9 (__f3 (select initial_1_trace 4)))
                (__f10 (__f3 (select initial_1_trace 6)))))
      (a!221 (= (__f9 (__f3 (select initial_1_trace 5)))
                (__f10 (__f3 (select initial_1_trace 6)))))
      (a!223 (not (__f6 (__f4 (select initial_1_trace 6)))))
      (a!224 (= (__f10 (__f3 (select initial_1_trace 8)))
                (__f9 (__f3 (select initial_1_trace 7)))))
      (a!225 (_tuple_2 (__f1 (__f2 (select initial_1_trace 7)))
                       (__f2 (__f2 (select initial_1_trace 7)))))
      (a!227 (= (__f10 (__f3 (select initial_1_trace 9)))
                (__f9 (__f3 (select initial_1_trace 7)))))
      (a!229 (= (__f10 (__f3 (select initial_1_trace 10)))
                (__f9 (__f3 (select initial_1_trace 7)))))
      (a!231 (= (__f10 (__f3 (select initial_1_trace 11)))
                (__f9 (__f3 (select initial_1_trace 7)))))
      (a!233 (= (__f10 (__f3 (select initial_1_trace 12)))
                (__f9 (__f3 (select initial_1_trace 7)))))
      (a!235 (= (__f10 (__f3 (select initial_1_trace 13)))
                (__f9 (__f3 (select initial_1_trace 7)))))
      (a!237 (= (__f10 (__f3 (select initial_1_trace 14)))
                (__f9 (__f3 (select initial_1_trace 7)))))
      (a!239 (= (__f10 (__f3 (select initial_1_trace 15)))
                (__f9 (__f3 (select initial_1_trace 7)))))
      (a!241 (= (__f10 (__f3 (select initial_1_trace 16)))
                (__f9 (__f3 (select initial_1_trace 7)))))
      (a!243 (= (__f10 (__f3 (select initial_1_trace 17)))
                (__f9 (__f3 (select initial_1_trace 7)))))
      (a!245 (not (__f5 (__f4 (select initial_1_trace 7)))))
      (a!246 (= (__f9 (__f3 (select initial_1_trace 0)))
                (__f10 (__f3 (select initial_1_trace 7)))))
      (a!248 (= (__f9 (__f3 (select initial_1_trace 1)))
                (__f10 (__f3 (select initial_1_trace 7)))))
      (a!250 (= (__f9 (__f3 (select initial_1_trace 2)))
                (__f10 (__f3 (select initial_1_trace 7)))))
      (a!252 (= (__f9 (__f3 (select initial_1_trace 3)))
                (__f10 (__f3 (select initial_1_trace 7)))))
      (a!254 (= (__f9 (__f3 (select initial_1_trace 4)))
                (__f10 (__f3 (select initial_1_trace 7)))))
      (a!256 (= (__f9 (__f3 (select initial_1_trace 5)))
                (__f10 (__f3 (select initial_1_trace 7)))))
      (a!258 (= (__f9 (__f3 (select initial_1_trace 6)))
                (__f10 (__f3 (select initial_1_trace 7)))))
      (a!260 (not (__f6 (__f4 (select initial_1_trace 7)))))
      (a!261 (= (__f10 (__f3 (select initial_1_trace 9)))
                (__f9 (__f3 (select initial_1_trace 8)))))
      (a!262 (_tuple_2 (__f1 (__f2 (select initial_1_trace 8)))
                       (__f2 (__f2 (select initial_1_trace 8)))))
      (a!264 (= (__f10 (__f3 (select initial_1_trace 10)))
                (__f9 (__f3 (select initial_1_trace 8)))))
      (a!266 (= (__f10 (__f3 (select initial_1_trace 11)))
                (__f9 (__f3 (select initial_1_trace 8)))))
      (a!268 (= (__f10 (__f3 (select initial_1_trace 12)))
                (__f9 (__f3 (select initial_1_trace 8)))))
      (a!270 (= (__f10 (__f3 (select initial_1_trace 13)))
                (__f9 (__f3 (select initial_1_trace 8)))))
      (a!272 (= (__f10 (__f3 (select initial_1_trace 14)))
                (__f9 (__f3 (select initial_1_trace 8)))))
      (a!274 (= (__f10 (__f3 (select initial_1_trace 15)))
                (__f9 (__f3 (select initial_1_trace 8)))))
      (a!276 (= (__f10 (__f3 (select initial_1_trace 16)))
                (__f9 (__f3 (select initial_1_trace 8)))))
      (a!278 (= (__f10 (__f3 (select initial_1_trace 17)))
                (__f9 (__f3 (select initial_1_trace 8)))))
      (a!280 (not (__f5 (__f4 (select initial_1_trace 8)))))
      (a!281 (= (__f9 (__f3 (select initial_1_trace 0)))
                (__f10 (__f3 (select initial_1_trace 8)))))
      (a!283 (= (__f9 (__f3 (select initial_1_trace 1)))
                (__f10 (__f3 (select initial_1_trace 8)))))
      (a!285 (= (__f9 (__f3 (select initial_1_trace 2)))
                (__f10 (__f3 (select initial_1_trace 8)))))
      (a!287 (= (__f9 (__f3 (select initial_1_trace 3)))
                (__f10 (__f3 (select initial_1_trace 8)))))
      (a!289 (= (__f9 (__f3 (select initial_1_trace 4)))
                (__f10 (__f3 (select initial_1_trace 8)))))
      (a!291 (= (__f9 (__f3 (select initial_1_trace 5)))
                (__f10 (__f3 (select initial_1_trace 8)))))
      (a!293 (= (__f9 (__f3 (select initial_1_trace 6)))
                (__f10 (__f3 (select initial_1_trace 8)))))
      (a!295 (= (__f9 (__f3 (select initial_1_trace 7)))
                (__f10 (__f3 (select initial_1_trace 8)))))
      (a!297 (not (__f6 (__f4 (select initial_1_trace 8))))))
(let ((a!3 (and (__f6 (__f4 (select initial_1_trace 2)))
                a!1
                (= (__f2 (select initial_1_trace 2)) a!2)))
      (a!5 (and (__f6 (__f4 (select initial_1_trace 3)))
                a!4
                (= (__f2 (select initial_1_trace 3)) a!2)))
      (a!7 (and (__f6 (__f4 (select initial_1_trace 4)))
                a!6
                (= (__f2 (select initial_1_trace 4)) a!2)))
      (a!9 (and (__f6 (__f4 (select initial_1_trace 5)))
                a!8
                (= (__f2 (select initial_1_trace 5)) a!2)))
      (a!11 (and (__f6 (__f4 (select initial_1_trace 6)))
                 a!10
                 (= (__f2 (select initial_1_trace 6)) a!2)))
      (a!13 (and (__f6 (__f4 (select initial_1_trace 7)))
                 a!12
                 (= (__f2 (select initial_1_trace 7)) a!2)))
      (a!15 (and (__f6 (__f4 (select initial_1_trace 8)))
                 a!14
                 (= (__f2 (select initial_1_trace 8)) a!2)))
      (a!17 (and (__f6 (__f4 (select initial_1_trace 9)))
                 a!16
                 (= (__f2 (select initial_1_trace 9)) a!2)))
      (a!19 (and (__f6 (__f4 (select initial_1_trace 10)))
                 a!18
                 (= (__f2 (select initial_1_trace 10)) a!2)))
      (a!21 (and (__f6 (__f4 (select initial_1_trace 11)))
                 a!20
                 (= (__f2 (select initial_1_trace 11)) a!2)))
      (a!23 (and (__f6 (__f4 (select initial_1_trace 12)))
                 a!22
                 (= (__f2 (select initial_1_trace 12)) a!2)))
      (a!25 (and (__f6 (__f4 (select initial_1_trace 13)))
                 a!24
                 (= (__f2 (select initial_1_trace 13)) a!2)))
      (a!27 (and (__f6 (__f4 (select initial_1_trace 14)))
                 a!26
                 (= (__f2 (select initial_1_trace 14)) a!2)))
      (a!29 (and (__f6 (__f4 (select initial_1_trace 15)))
                 a!28
                 (= (__f2 (select initial_1_trace 15)) a!2)))
      (a!31 (and (__f6 (__f4 (select initial_1_trace 16)))
                 a!30
                 (= (__f2 (select initial_1_trace 16)) a!2)))
      (a!33 (and (__f6 (__f4 (select initial_1_trace 17)))
                 a!32
                 (= (__f2 (select initial_1_trace 17)) a!2)))
      (a!38 (and (__f5 (__f4 (select initial_1_trace 0)))
                 a!36
                 (= (__f2 (select initial_1_trace 1)) a!37)))
      (a!41 (and (__f6 (__f4 (select initial_1_trace 3)))
                 a!39
                 (= (__f2 (select initial_1_trace 3)) a!40)))
      (a!43 (and (__f6 (__f4 (select initial_1_trace 4)))
                 a!42
                 (= (__f2 (select initial_1_trace 4)) a!40)))
      (a!45 (and (__f6 (__f4 (select initial_1_trace 5)))
                 a!44
                 (= (__f2 (select initial_1_trace 5)) a!40)))
      (a!47 (and (__f6 (__f4 (select initial_1_trace 6)))
                 a!46
                 (= (__f2 (select initial_1_trace 6)) a!40)))
      (a!49 (and (__f6 (__f4 (select initial_1_trace 7)))
                 a!48
                 (= (__f2 (select initial_1_trace 7)) a!40)))
      (a!51 (and (__f6 (__f4 (select initial_1_trace 8)))
                 a!50
                 (= (__f2 (select initial_1_trace 8)) a!40)))
      (a!53 (and (__f6 (__f4 (select initial_1_trace 9)))
                 a!52
                 (= (__f2 (select initial_1_trace 9)) a!40)))
      (a!55 (and (__f6 (__f4 (select initial_1_trace 10)))
                 a!54
                 (= (__f2 (select initial_1_trace 10)) a!40)))
      (a!57 (and (__f6 (__f4 (select initial_1_trace 11)))
                 a!56
                 (= (__f2 (select initial_1_trace 11)) a!40)))
      (a!59 (and (__f6 (__f4 (select initial_1_trace 12)))
                 a!58
                 (= (__f2 (select initial_1_trace 12)) a!40)))
      (a!61 (and (__f6 (__f4 (select initial_1_trace 13)))
                 a!60
                 (= (__f2 (select initial_1_trace 13)) a!40)))
      (a!63 (and (__f6 (__f4 (select initial_1_trace 14)))
                 a!62
                 (= (__f2 (select initial_1_trace 14)) a!40)))
      (a!65 (and (__f6 (__f4 (select initial_1_trace 15)))
                 a!64
                 (= (__f2 (select initial_1_trace 15)) a!40)))
      (a!67 (and (__f6 (__f4 (select initial_1_trace 16)))
                 a!66
                 (= (__f2 (select initial_1_trace 16)) a!40)))
      (a!69 (and (__f6 (__f4 (select initial_1_trace 17)))
                 a!68
                 (= (__f2 (select initial_1_trace 17)) a!40)))
      (a!72 (and (__f5 (__f4 (select initial_1_trace 0)))
                 a!71
                 (= (__f2 (select initial_1_trace 2)) a!37)))
      (a!74 (and (__f5 (__f4 (select initial_1_trace 1)))
                 a!73
                 (= (__f2 (select initial_1_trace 2)) a!2)))
      (a!78 (and (__f6 (__f4 (select initial_1_trace 4)))
                 a!76
                 (= (__f2 (select initial_1_trace 4)) a!77)))
      (a!80 (and (__f6 (__f4 (select initial_1_trace 5)))
                 a!79
                 (= (__f2 (select initial_1_trace 5)) a!77)))
      (a!82 (and (__f6 (__f4 (select initial_1_trace 6)))
                 a!81
                 (= (__f2 (select initial_1_trace 6)) a!77)))
      (a!84 (and (__f6 (__f4 (select initial_1_trace 7)))
                 a!83
                 (= (__f2 (select initial_1_trace 7)) a!77)))
      (a!86 (and (__f6 (__f4 (select initial_1_trace 8)))
                 a!85
                 (= (__f2 (select initial_1_trace 8)) a!77)))
      (a!88 (and (__f6 (__f4 (select initial_1_trace 9)))
                 a!87
                 (= (__f2 (select initial_1_trace 9)) a!77)))
      (a!90 (and (__f6 (__f4 (select initial_1_trace 10)))
                 a!89
                 (= (__f2 (select initial_1_trace 10)) a!77)))
      (a!92 (and (__f6 (__f4 (select initial_1_trace 11)))
                 a!91
                 (= (__f2 (select initial_1_trace 11)) a!77)))
      (a!94 (and (__f6 (__f4 (select initial_1_trace 12)))
                 a!93
                 (= (__f2 (select initial_1_trace 12)) a!77)))
      (a!96 (and (__f6 (__f4 (select initial_1_trace 13)))
                 a!95
                 (= (__f2 (select initial_1_trace 13)) a!77)))
      (a!98 (and (__f6 (__f4 (select initial_1_trace 14)))
                 a!97
                 (= (__f2 (select initial_1_trace 14)) a!77)))
      (a!100 (and (__f6 (__f4 (select initial_1_trace 15)))
                  a!99
                  (= (__f2 (select initial_1_trace 15)) a!77)))
      (a!102 (and (__f6 (__f4 (select initial_1_trace 16)))
                  a!101
                  (= (__f2 (select initial_1_trace 16)) a!77)))
      (a!104 (and (__f6 (__f4 (select initial_1_trace 17)))
                  a!103
                  (= (__f2 (select initial_1_trace 17)) a!77)))
      (a!107 (and (__f5 (__f4 (select initial_1_trace 0)))
                  a!106
                  (= (__f2 (select initial_1_trace 3)) a!37)))
      (a!109 (and (__f5 (__f4 (select initial_1_trace 1)))
                  a!108
                  (= (__f2 (select initial_1_trace 3)) a!2)))
      (a!111 (and (__f5 (__f4 (select initial_1_trace 2)))
                  a!110
                  (= (__f2 (select initial_1_trace 3)) a!40)))
      (a!115 (and (__f6 (__f4 (select initial_1_trace 5)))
                  a!113
                  (= (__f2 (select initial_1_trace 5)) a!114)))
      (a!117 (and (__f6 (__f4 (select initial_1_trace 6)))
                  a!116
                  (= (__f2 (select initial_1_trace 6)) a!114)))
      (a!119 (and (__f6 (__f4 (select initial_1_trace 7)))
                  a!118
                  (= (__f2 (select initial_1_trace 7)) a!114)))
      (a!121 (and (__f6 (__f4 (select initial_1_trace 8)))
                  a!120
                  (= (__f2 (select initial_1_trace 8)) a!114)))
      (a!123 (and (__f6 (__f4 (select initial_1_trace 9)))
                  a!122
                  (= (__f2 (select initial_1_trace 9)) a!114)))
      (a!125 (and (__f6 (__f4 (select initial_1_trace 10)))
                  a!124
                  (= (__f2 (select initial_1_trace 10)) a!114)))
      (a!127 (and (__f6 (__f4 (select initial_1_trace 11)))
                  a!126
                  (= (__f2 (select initial_1_trace 11)) a!114)))
      (a!129 (and (__f6 (__f4 (select initial_1_trace 12)))
                  a!128
                  (= (__f2 (select initial_1_trace 12)) a!114)))
      (a!131 (and (__f6 (__f4 (select initial_1_trace 13)))
                  a!130
                  (= (__f2 (select initial_1_trace 13)) a!114)))
      (a!133 (and (__f6 (__f4 (select initial_1_trace 14)))
                  a!132
                  (= (__f2 (select initial_1_trace 14)) a!114)))
      (a!135 (and (__f6 (__f4 (select initial_1_trace 15)))
                  a!134
                  (= (__f2 (select initial_1_trace 15)) a!114)))
      (a!137 (and (__f6 (__f4 (select initial_1_trace 16)))
                  a!136
                  (= (__f2 (select initial_1_trace 16)) a!114)))
      (a!139 (and (__f6 (__f4 (select initial_1_trace 17)))
                  a!138
                  (= (__f2 (select initial_1_trace 17)) a!114)))
      (a!142 (and (__f5 (__f4 (select initial_1_trace 0)))
                  a!141
                  (= (__f2 (select initial_1_trace 4)) a!37)))
      (a!144 (and (__f5 (__f4 (select initial_1_trace 1)))
                  a!143
                  (= (__f2 (select initial_1_trace 4)) a!2)))
      (a!146 (and (__f5 (__f4 (select initial_1_trace 2)))
                  a!145
                  (= (__f2 (select initial_1_trace 4)) a!40)))
      (a!148 (and (__f5 (__f4 (select initial_1_trace 3)))
                  a!147
                  (= (__f2 (select initial_1_trace 4)) a!77)))
      (a!152 (and (__f6 (__f4 (select initial_1_trace 6)))
                  a!150
                  (= (__f2 (select initial_1_trace 6)) a!151)))
      (a!154 (and (__f6 (__f4 (select initial_1_trace 7)))
                  a!153
                  (= (__f2 (select initial_1_trace 7)) a!151)))
      (a!156 (and (__f6 (__f4 (select initial_1_trace 8)))
                  a!155
                  (= (__f2 (select initial_1_trace 8)) a!151)))
      (a!158 (and (__f6 (__f4 (select initial_1_trace 9)))
                  a!157
                  (= (__f2 (select initial_1_trace 9)) a!151)))
      (a!160 (and (__f6 (__f4 (select initial_1_trace 10)))
                  a!159
                  (= (__f2 (select initial_1_trace 10)) a!151)))
      (a!162 (and (__f6 (__f4 (select initial_1_trace 11)))
                  a!161
                  (= (__f2 (select initial_1_trace 11)) a!151)))
      (a!164 (and (__f6 (__f4 (select initial_1_trace 12)))
                  a!163
                  (= (__f2 (select initial_1_trace 12)) a!151)))
      (a!166 (and (__f6 (__f4 (select initial_1_trace 13)))
                  a!165
                  (= (__f2 (select initial_1_trace 13)) a!151)))
      (a!168 (and (__f6 (__f4 (select initial_1_trace 14)))
                  a!167
                  (= (__f2 (select initial_1_trace 14)) a!151)))
      (a!170 (and (__f6 (__f4 (select initial_1_trace 15)))
                  a!169
                  (= (__f2 (select initial_1_trace 15)) a!151)))
      (a!172 (and (__f6 (__f4 (select initial_1_trace 16)))
                  a!171
                  (= (__f2 (select initial_1_trace 16)) a!151)))
      (a!174 (and (__f6 (__f4 (select initial_1_trace 17)))
                  a!173
                  (= (__f2 (select initial_1_trace 17)) a!151)))
      (a!177 (and (__f5 (__f4 (select initial_1_trace 0)))
                  a!176
                  (= (__f2 (select initial_1_trace 5)) a!37)))
      (a!179 (and (__f5 (__f4 (select initial_1_trace 1)))
                  a!178
                  (= (__f2 (select initial_1_trace 5)) a!2)))
      (a!181 (and (__f5 (__f4 (select initial_1_trace 2)))
                  a!180
                  (= (__f2 (select initial_1_trace 5)) a!40)))
      (a!183 (and (__f5 (__f4 (select initial_1_trace 3)))
                  a!182
                  (= (__f2 (select initial_1_trace 5)) a!77)))
      (a!185 (and (__f5 (__f4 (select initial_1_trace 4)))
                  a!184
                  (= (__f2 (select initial_1_trace 5)) a!114)))
      (a!189 (and (__f6 (__f4 (select initial_1_trace 7)))
                  a!187
                  (= (__f2 (select initial_1_trace 7)) a!188)))
      (a!191 (and (__f6 (__f4 (select initial_1_trace 8)))
                  a!190
                  (= (__f2 (select initial_1_trace 8)) a!188)))
      (a!193 (and (__f6 (__f4 (select initial_1_trace 9)))
                  a!192
                  (= (__f2 (select initial_1_trace 9)) a!188)))
      (a!195 (and (__f6 (__f4 (select initial_1_trace 10)))
                  a!194
                  (= (__f2 (select initial_1_trace 10)) a!188)))
      (a!197 (and (__f6 (__f4 (select initial_1_trace 11)))
                  a!196
                  (= (__f2 (select initial_1_trace 11)) a!188)))
      (a!199 (and (__f6 (__f4 (select initial_1_trace 12)))
                  a!198
                  (= (__f2 (select initial_1_trace 12)) a!188)))
      (a!201 (and (__f6 (__f4 (select initial_1_trace 13)))
                  a!200
                  (= (__f2 (select initial_1_trace 13)) a!188)))
      (a!203 (and (__f6 (__f4 (select initial_1_trace 14)))
                  a!202
                  (= (__f2 (select initial_1_trace 14)) a!188)))
      (a!205 (and (__f6 (__f4 (select initial_1_trace 15)))
                  a!204
                  (= (__f2 (select initial_1_trace 15)) a!188)))
      (a!207 (and (__f6 (__f4 (select initial_1_trace 16)))
                  a!206
                  (= (__f2 (select initial_1_trace 16)) a!188)))
      (a!209 (and (__f6 (__f4 (select initial_1_trace 17)))
                  a!208
                  (= (__f2 (select initial_1_trace 17)) a!188)))
      (a!212 (and (__f5 (__f4 (select initial_1_trace 0)))
                  a!211
                  (= (__f2 (select initial_1_trace 6)) a!37)))
      (a!214 (and (__f5 (__f4 (select initial_1_trace 1)))
                  a!213
                  (= (__f2 (select initial_1_trace 6)) a!2)))
      (a!216 (and (__f5 (__f4 (select initial_1_trace 2)))
                  a!215
                  (= (__f2 (select initial_1_trace 6)) a!40)))
      (a!218 (and (__f5 (__f4 (select initial_1_trace 3)))
                  a!217
                  (= (__f2 (select initial_1_trace 6)) a!77)))
      (a!220 (and (__f5 (__f4 (select initial_1_trace 4)))
                  a!219
                  (= (__f2 (select initial_1_trace 6)) a!114)))
      (a!222 (and (__f5 (__f4 (select initial_1_trace 5)))
                  a!221
                  (= (__f2 (select initial_1_trace 6)) a!151)))
      (a!226 (and (__f6 (__f4 (select initial_1_trace 8)))
                  a!224
                  (= (__f2 (select initial_1_trace 8)) a!225)))
      (a!228 (and (__f6 (__f4 (select initial_1_trace 9)))
                  a!227
                  (= (__f2 (select initial_1_trace 9)) a!225)))
      (a!230 (and (__f6 (__f4 (select initial_1_trace 10)))
                  a!229
                  (= (__f2 (select initial_1_trace 10)) a!225)))
      (a!232 (and (__f6 (__f4 (select initial_1_trace 11)))
                  a!231
                  (= (__f2 (select initial_1_trace 11)) a!225)))
      (a!234 (and (__f6 (__f4 (select initial_1_trace 12)))
                  a!233
                  (= (__f2 (select initial_1_trace 12)) a!225)))
      (a!236 (and (__f6 (__f4 (select initial_1_trace 13)))
                  a!235
                  (= (__f2 (select initial_1_trace 13)) a!225)))
      (a!238 (and (__f6 (__f4 (select initial_1_trace 14)))
                  a!237
                  (= (__f2 (select initial_1_trace 14)) a!225)))
      (a!240 (and (__f6 (__f4 (select initial_1_trace 15)))
                  a!239
                  (= (__f2 (select initial_1_trace 15)) a!225)))
      (a!242 (and (__f6 (__f4 (select initial_1_trace 16)))
                  a!241
                  (= (__f2 (select initial_1_trace 16)) a!225)))
      (a!244 (and (__f6 (__f4 (select initial_1_trace 17)))
                  a!243
                  (= (__f2 (select initial_1_trace 17)) a!225)))
      (a!247 (and (__f5 (__f4 (select initial_1_trace 0)))
                  a!246
                  (= (__f2 (select initial_1_trace 7)) a!37)))
      (a!249 (and (__f5 (__f4 (select initial_1_trace 1)))
                  a!248
                  (= (__f2 (select initial_1_trace 7)) a!2)))
      (a!251 (and (__f5 (__f4 (select initial_1_trace 2)))
                  a!250
                  (= (__f2 (select initial_1_trace 7)) a!40)))
      (a!253 (and (__f5 (__f4 (select initial_1_trace 3)))
                  a!252
                  (= (__f2 (select initial_1_trace 7)) a!77)))
      (a!255 (and (__f5 (__f4 (select initial_1_trace 4)))
                  a!254
                  (= (__f2 (select initial_1_trace 7)) a!114)))
      (a!257 (and (__f5 (__f4 (select initial_1_trace 5)))
                  a!256
                  (= (__f2 (select initial_1_trace 7)) a!151)))
      (a!259 (and (__f5 (__f4 (select initial_1_trace 6)))
                  a!258
                  (= (__f2 (select initial_1_trace 7)) a!188)))
      (a!263 (and (__f6 (__f4 (select initial_1_trace 9)))
                  a!261
                  (= (__f2 (select initial_1_trace 9)) a!262)))
      (a!265 (and (__f6 (__f4 (select initial_1_trace 10)))
                  a!264
                  (= (__f2 (select initial_1_trace 10)) a!262)))
      (a!267 (and (__f6 (__f4 (select initial_1_trace 11)))
                  a!266
                  (= (__f2 (select initial_1_trace 11)) a!262)))
      (a!269 (and (__f6 (__f4 (select initial_1_trace 12)))
                  a!268
                  (= (__f2 (select initial_1_trace 12)) a!262)))
      (a!271 (and (__f6 (__f4 (select initial_1_trace 13)))
                  a!270
                  (= (__f2 (select initial_1_trace 13)) a!262)))
      (a!273 (and (__f6 (__f4 (select initial_1_trace 14)))
                  a!272
                  (= (__f2 (select initial_1_trace 14)) a!262)))
      (a!275 (and (__f6 (__f4 (select initial_1_trace 15)))
                  a!274
                  (= (__f2 (select initial_1_trace 15)) a!262)))
      (a!277 (and (__f6 (__f4 (select initial_1_trace 16)))
                  a!276
                  (= (__f2 (select initial_1_trace 16)) a!262)))
      (a!279 (and (__f6 (__f4 (select initial_1_trace 17)))
                  a!278
                  (= (__f2 (select initial_1_trace 17)) a!262)))
      (a!282 (and (__f5 (__f4 (select initial_1_trace 0)))
                  a!281
                  (= (__f2 (select initial_1_trace 8)) a!37)))
      (a!284 (and (__f5 (__f4 (select initial_1_trace 1)))
                  a!283
                  (= (__f2 (select initial_1_trace 8)) a!2)))
      (a!286 (and (__f5 (__f4 (select initial_1_trace 2)))
                  a!285
                  (= (__f2 (select initial_1_trace 8)) a!40)))
      (a!288 (and (__f5 (__f4 (select initial_1_trace 3)))
                  a!287
                  (= (__f2 (select initial_1_trace 8)) a!77)))
      (a!290 (and (__f5 (__f4 (select initial_1_trace 4)))
                  a!289
                  (= (__f2 (select initial_1_trace 8)) a!114)))
      (a!292 (and (__f5 (__f4 (select initial_1_trace 5)))
                  a!291
                  (= (__f2 (select initial_1_trace 8)) a!151)))
      (a!294 (and (__f5 (__f4 (select initial_1_trace 6)))
                  a!293
                  (= (__f2 (select initial_1_trace 8)) a!188)))
      (a!296 (and (__f5 (__f4 (select initial_1_trace 7)))
                  a!295
                  (= (__f2 (select initial_1_trace 8)) a!225))))
  (and (or a!3
           a!5
           a!7
           a!9
           a!11
           a!13
           a!15
           a!17
           a!19
           a!21
           a!23
           a!25
           a!27
           a!29
           a!31
           a!33
           a!34)
       (or a!35 a!38)
       (or a!41
           a!43
           a!45
           a!47
           a!49
           a!51
           a!53
           a!55
           a!57
           a!59
           a!61
           a!63
           a!65
           a!67
           a!69
           a!70)
       (or a!72 a!74 a!75)
       (or a!78
           a!80
           a!82
           a!84
           a!86
           a!88
           a!90
           a!92
           a!94
           a!96
           a!98
           a!100
           a!102
           a!104
           a!105)
       (or a!107 a!109 a!111 a!112)
       (or a!115
           a!117
           a!119
           a!121
           a!123
           a!125
           a!127
           a!129
           a!131
           a!133
           a!135
           a!137
           a!139
           a!140)
       (or a!142 a!144 a!146 a!148 a!149)
       (or a!152
           a!154
           a!156
           a!158
           a!160
           a!162
           a!164
           a!166
           a!168
           a!170
           a!172
           a!174
           a!175)
       (or a!177 a!179 a!181 a!183 a!185 a!186)
       (or a!189
           a!191
           a!193
           a!195
           a!197
           a!199
           a!201
           a!203
           a!205
           a!207
           a!209
           a!210)
       (or a!212 a!214 a!216 a!218 a!220 a!222 a!223)
       (or a!226 a!228 a!230 a!232 a!234 a!236 a!238 a!240 a!242 a!244 a!245)
       (or a!247 a!249 a!251 a!253 a!255 a!257 a!259 a!260)
       (or a!263 a!265 a!267 a!269 a!271 a!273 a!275 a!277 a!279 a!280)
       (or a!282 a!284 a!286 a!288 a!290 a!292 a!294 a!296 a!297)))))
(assert (let ((a!1 (= (__f14 (__f3 (select initial_1_trace 2)))
              (__f12 (__f3 (select initial_1_trace 1)))))
      (a!2 (_tuple_2 (__f1 (__f2 (select initial_1_trace 1)))
                     (__f2 (__f2 (select initial_1_trace 1)))))
      (a!4 (= (__f14 (__f3 (select initial_1_trace 3)))
              (__f12 (__f3 (select initial_1_trace 1)))))
      (a!6 (= (__f14 (__f3 (select initial_1_trace 4)))
              (__f12 (__f3 (select initial_1_trace 1)))))
      (a!8 (= (__f14 (__f3 (select initial_1_trace 5)))
              (__f12 (__f3 (select initial_1_trace 1)))))
      (a!10 (= (__f14 (__f3 (select initial_1_trace 6)))
               (__f12 (__f3 (select initial_1_trace 1)))))
      (a!12 (= (__f14 (__f3 (select initial_1_trace 7)))
               (__f12 (__f3 (select initial_1_trace 1)))))
      (a!14 (= (__f14 (__f3 (select initial_1_trace 8)))
               (__f12 (__f3 (select initial_1_trace 1)))))
      (a!16 (= (__f14 (__f3 (select initial_1_trace 9)))
               (__f12 (__f3 (select initial_1_trace 1)))))
      (a!18 (= (__f14 (__f3 (select initial_1_trace 10)))
               (__f12 (__f3 (select initial_1_trace 1)))))
      (a!20 (= (__f14 (__f3 (select initial_1_trace 11)))
               (__f12 (__f3 (select initial_1_trace 1)))))
      (a!22 (= (__f14 (__f3 (select initial_1_trace 12)))
               (__f12 (__f3 (select initial_1_trace 1)))))
      (a!24 (= (__f14 (__f3 (select initial_1_trace 13)))
               (__f12 (__f3 (select initial_1_trace 1)))))
      (a!26 (= (__f14 (__f3 (select initial_1_trace 14)))
               (__f12 (__f3 (select initial_1_trace 1)))))
      (a!28 (= (__f14 (__f3 (select initial_1_trace 15)))
               (__f12 (__f3 (select initial_1_trace 1)))))
      (a!30 (= (__f14 (__f3 (select initial_1_trace 16)))
               (__f12 (__f3 (select initial_1_trace 1)))))
      (a!32 (= (__f14 (__f3 (select initial_1_trace 17)))
               (__f12 (__f3 (select initial_1_trace 1)))))
      (a!34 (not (__f8 (__f4 (select initial_1_trace 1)))))
      (a!35 (not (__f10 (__f4 (select initial_1_trace 1)))))
      (a!36 (= (__f12 (__f3 (select initial_1_trace 0)))
               (__f14 (__f3 (select initial_1_trace 1)))))
      (a!37 (_tuple_2 (__f1 (__f2 (select initial_1_trace 0)))
                      (__f2 (__f2 (select initial_1_trace 0)))))
      (a!39 (= (__f14 (__f3 (select initial_1_trace 3)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!40 (_tuple_2 (__f1 (__f2 (select initial_1_trace 2)))
                      (__f2 (__f2 (select initial_1_trace 2)))))
      (a!42 (= (__f14 (__f3 (select initial_1_trace 4)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!44 (= (__f14 (__f3 (select initial_1_trace 5)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!46 (= (__f14 (__f3 (select initial_1_trace 6)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!48 (= (__f14 (__f3 (select initial_1_trace 7)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!50 (= (__f14 (__f3 (select initial_1_trace 8)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!52 (= (__f14 (__f3 (select initial_1_trace 9)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!54 (= (__f14 (__f3 (select initial_1_trace 10)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!56 (= (__f14 (__f3 (select initial_1_trace 11)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!58 (= (__f14 (__f3 (select initial_1_trace 12)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!60 (= (__f14 (__f3 (select initial_1_trace 13)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!62 (= (__f14 (__f3 (select initial_1_trace 14)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!64 (= (__f14 (__f3 (select initial_1_trace 15)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!66 (= (__f14 (__f3 (select initial_1_trace 16)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!68 (= (__f14 (__f3 (select initial_1_trace 17)))
               (__f12 (__f3 (select initial_1_trace 2)))))
      (a!70 (not (__f8 (__f4 (select initial_1_trace 2)))))
      (a!71 (= (__f12 (__f3 (select initial_1_trace 0)))
               (__f14 (__f3 (select initial_1_trace 2)))))
      (a!73 (= (__f12 (__f3 (select initial_1_trace 1)))
               (__f14 (__f3 (select initial_1_trace 2)))))
      (a!75 (not (__f10 (__f4 (select initial_1_trace 2)))))
      (a!76 (= (__f14 (__f3 (select initial_1_trace 4)))
               (__f12 (__f3 (select initial_1_trace 3)))))
      (a!77 (_tuple_2 (__f1 (__f2 (select initial_1_trace 3)))
                      (__f2 (__f2 (select initial_1_trace 3)))))
      (a!79 (= (__f14 (__f3 (select initial_1_trace 5)))
               (__f12 (__f3 (select initial_1_trace 3)))))
      (a!81 (= (__f14 (__f3 (select initial_1_trace 6)))
               (__f12 (__f3 (select initial_1_trace 3)))))
      (a!83 (= (__f14 (__f3 (select initial_1_trace 7)))
               (__f12 (__f3 (select initial_1_trace 3)))))
      (a!85 (= (__f14 (__f3 (select initial_1_trace 8)))
               (__f12 (__f3 (select initial_1_trace 3)))))
      (a!87 (= (__f14 (__f3 (select initial_1_trace 9)))
               (__f12 (__f3 (select initial_1_trace 3)))))
      (a!89 (= (__f14 (__f3 (select initial_1_trace 10)))
               (__f12 (__f3 (select initial_1_trace 3)))))
      (a!91 (= (__f14 (__f3 (select initial_1_trace 11)))
               (__f12 (__f3 (select initial_1_trace 3)))))
      (a!93 (= (__f14 (__f3 (select initial_1_trace 12)))
               (__f12 (__f3 (select initial_1_trace 3)))))
      (a!95 (= (__f14 (__f3 (select initial_1_trace 13)))
               (__f12 (__f3 (select initial_1_trace 3)))))
      (a!97 (= (__f14 (__f3 (select initial_1_trace 14)))
               (__f12 (__f3 (select initial_1_trace 3)))))
      (a!99 (= (__f14 (__f3 (select initial_1_trace 15)))
               (__f12 (__f3 (select initial_1_trace 3)))))
      (a!101 (= (__f14 (__f3 (select initial_1_trace 16)))
                (__f12 (__f3 (select initial_1_trace 3)))))
      (a!103 (= (__f14 (__f3 (select initial_1_trace 17)))
                (__f12 (__f3 (select initial_1_trace 3)))))
      (a!105 (not (__f8 (__f4 (select initial_1_trace 3)))))
      (a!106 (= (__f12 (__f3 (select initial_1_trace 0)))
                (__f14 (__f3 (select initial_1_trace 3)))))
      (a!108 (= (__f12 (__f3 (select initial_1_trace 1)))
                (__f14 (__f3 (select initial_1_trace 3)))))
      (a!110 (= (__f12 (__f3 (select initial_1_trace 2)))
                (__f14 (__f3 (select initial_1_trace 3)))))
      (a!112 (not (__f10 (__f4 (select initial_1_trace 3)))))
      (a!113 (= (__f14 (__f3 (select initial_1_trace 5)))
                (__f12 (__f3 (select initial_1_trace 4)))))
      (a!114 (_tuple_2 (__f1 (__f2 (select initial_1_trace 4)))
                       (__f2 (__f2 (select initial_1_trace 4)))))
      (a!116 (= (__f14 (__f3 (select initial_1_trace 6)))
                (__f12 (__f3 (select initial_1_trace 4)))))
      (a!118 (= (__f14 (__f3 (select initial_1_trace 7)))
                (__f12 (__f3 (select initial_1_trace 4)))))
      (a!120 (= (__f14 (__f3 (select initial_1_trace 8)))
                (__f12 (__f3 (select initial_1_trace 4)))))
      (a!122 (= (__f14 (__f3 (select initial_1_trace 9)))
                (__f12 (__f3 (select initial_1_trace 4)))))
      (a!124 (= (__f14 (__f3 (select initial_1_trace 10)))
                (__f12 (__f3 (select initial_1_trace 4)))))
      (a!126 (= (__f14 (__f3 (select initial_1_trace 11)))
                (__f12 (__f3 (select initial_1_trace 4)))))
      (a!128 (= (__f14 (__f3 (select initial_1_trace 12)))
                (__f12 (__f3 (select initial_1_trace 4)))))
      (a!130 (= (__f14 (__f3 (select initial_1_trace 13)))
                (__f12 (__f3 (select initial_1_trace 4)))))
      (a!132 (= (__f14 (__f3 (select initial_1_trace 14)))
                (__f12 (__f3 (select initial_1_trace 4)))))
      (a!134 (= (__f14 (__f3 (select initial_1_trace 15)))
                (__f12 (__f3 (select initial_1_trace 4)))))
      (a!136 (= (__f14 (__f3 (select initial_1_trace 16)))
                (__f12 (__f3 (select initial_1_trace 4)))))
      (a!138 (= (__f14 (__f3 (select initial_1_trace 17)))
                (__f12 (__f3 (select initial_1_trace 4)))))
      (a!140 (not (__f8 (__f4 (select initial_1_trace 4)))))
      (a!141 (= (__f12 (__f3 (select initial_1_trace 0)))
                (__f14 (__f3 (select initial_1_trace 4)))))
      (a!143 (= (__f12 (__f3 (select initial_1_trace 1)))
                (__f14 (__f3 (select initial_1_trace 4)))))
      (a!145 (= (__f12 (__f3 (select initial_1_trace 2)))
                (__f14 (__f3 (select initial_1_trace 4)))))
      (a!147 (= (__f12 (__f3 (select initial_1_trace 3)))
                (__f14 (__f3 (select initial_1_trace 4)))))
      (a!149 (not (__f10 (__f4 (select initial_1_trace 4)))))
      (a!150 (= (__f14 (__f3 (select initial_1_trace 6)))
                (__f12 (__f3 (select initial_1_trace 5)))))
      (a!151 (_tuple_2 (__f1 (__f2 (select initial_1_trace 5)))
                       (__f2 (__f2 (select initial_1_trace 5)))))
      (a!153 (= (__f14 (__f3 (select initial_1_trace 7)))
                (__f12 (__f3 (select initial_1_trace 5)))))
      (a!155 (= (__f14 (__f3 (select initial_1_trace 8)))
                (__f12 (__f3 (select initial_1_trace 5)))))
      (a!157 (= (__f14 (__f3 (select initial_1_trace 9)))
                (__f12 (__f3 (select initial_1_trace 5)))))
      (a!159 (= (__f14 (__f3 (select initial_1_trace 10)))
                (__f12 (__f3 (select initial_1_trace 5)))))
      (a!161 (= (__f14 (__f3 (select initial_1_trace 11)))
                (__f12 (__f3 (select initial_1_trace 5)))))
      (a!163 (= (__f14 (__f3 (select initial_1_trace 12)))
                (__f12 (__f3 (select initial_1_trace 5)))))
      (a!165 (= (__f14 (__f3 (select initial_1_trace 13)))
                (__f12 (__f3 (select initial_1_trace 5)))))
      (a!167 (= (__f14 (__f3 (select initial_1_trace 14)))
                (__f12 (__f3 (select initial_1_trace 5)))))
      (a!169 (= (__f14 (__f3 (select initial_1_trace 15)))
                (__f12 (__f3 (select initial_1_trace 5)))))
      (a!171 (= (__f14 (__f3 (select initial_1_trace 16)))
                (__f12 (__f3 (select initial_1_trace 5)))))
      (a!173 (= (__f14 (__f3 (select initial_1_trace 17)))
                (__f12 (__f3 (select initial_1_trace 5)))))
      (a!175 (not (__f8 (__f4 (select initial_1_trace 5)))))
      (a!176 (= (__f12 (__f3 (select initial_1_trace 0)))
                (__f14 (__f3 (select initial_1_trace 5)))))
      (a!178 (= (__f12 (__f3 (select initial_1_trace 1)))
                (__f14 (__f3 (select initial_1_trace 5)))))
      (a!180 (= (__f12 (__f3 (select initial_1_trace 2)))
                (__f14 (__f3 (select initial_1_trace 5)))))
      (a!182 (= (__f12 (__f3 (select initial_1_trace 3)))
                (__f14 (__f3 (select initial_1_trace 5)))))
      (a!184 (= (__f12 (__f3 (select initial_1_trace 4)))
                (__f14 (__f3 (select initial_1_trace 5)))))
      (a!186 (not (__f10 (__f4 (select initial_1_trace 5)))))
      (a!187 (= (__f14 (__f3 (select initial_1_trace 7)))
                (__f12 (__f3 (select initial_1_trace 6)))))
      (a!188 (_tuple_2 (__f1 (__f2 (select initial_1_trace 6)))
                       (__f2 (__f2 (select initial_1_trace 6)))))
      (a!190 (= (__f14 (__f3 (select initial_1_trace 8)))
                (__f12 (__f3 (select initial_1_trace 6)))))
      (a!192 (= (__f14 (__f3 (select initial_1_trace 9)))
                (__f12 (__f3 (select initial_1_trace 6)))))
      (a!194 (= (__f14 (__f3 (select initial_1_trace 10)))
                (__f12 (__f3 (select initial_1_trace 6)))))
      (a!196 (= (__f14 (__f3 (select initial_1_trace 11)))
                (__f12 (__f3 (select initial_1_trace 6)))))
      (a!198 (= (__f14 (__f3 (select initial_1_trace 12)))
                (__f12 (__f3 (select initial_1_trace 6)))))
      (a!200 (= (__f14 (__f3 (select initial_1_trace 13)))
                (__f12 (__f3 (select initial_1_trace 6)))))
      (a!202 (= (__f14 (__f3 (select initial_1_trace 14)))
                (__f12 (__f3 (select initial_1_trace 6)))))
      (a!204 (= (__f14 (__f3 (select initial_1_trace 15)))
                (__f12 (__f3 (select initial_1_trace 6)))))
      (a!206 (= (__f14 (__f3 (select initial_1_trace 16)))
                (__f12 (__f3 (select initial_1_trace 6)))))
      (a!208 (= (__f14 (__f3 (select initial_1_trace 17)))
                (__f12 (__f3 (select initial_1_trace 6)))))
      (a!210 (not (__f8 (__f4 (select initial_1_trace 6)))))
      (a!211 (= (__f12 (__f3 (select initial_1_trace 0)))
                (__f14 (__f3 (select initial_1_trace 6)))))
      (a!213 (= (__f12 (__f3 (select initial_1_trace 1)))
                (__f14 (__f3 (select initial_1_trace 6)))))
      (a!215 (= (__f12 (__f3 (select initial_1_trace 2)))
                (__f14 (__f3 (select initial_1_trace 6)))))
      (a!217 (= (__f12 (__f3 (select initial_1_trace 3)))
                (__f14 (__f3 (select initial_1_trace 6)))))
      (a!219 (= (__f12 (__f3 (select initial_1_trace 4)))
                (__f14 (__f3 (select initial_1_trace 6)))))
      (a!221 (= (__f12 (__f3 (select initial_1_trace 5)))
                (__f14 (__f3 (select initial_1_trace 6)))))
      (a!223 (not (__f10 (__f4 (select initial_1_trace 6)))))
      (a!224 (= (__f14 (__f3 (select initial_1_trace 8)))
                (__f12 (__f3 (select initial_1_trace 7)))))
      (a!225 (_tuple_2 (__f1 (__f2 (select initial_1_trace 7)))
                       (__f2 (__f2 (select initial_1_trace 7)))))
      (a!227 (= (__f14 (__f3 (select initial_1_trace 9)))
                (__f12 (__f3 (select initial_1_trace 7)))))
      (a!229 (= (__f14 (__f3 (select initial_1_trace 10)))
                (__f12 (__f3 (select initial_1_trace 7)))))
      (a!231 (= (__f14 (__f3 (select initial_1_trace 11)))
                (__f12 (__f3 (select initial_1_trace 7)))))
      (a!233 (= (__f14 (__f3 (select initial_1_trace 12)))
                (__f12 (__f3 (select initial_1_trace 7)))))
      (a!235 (= (__f14 (__f3 (select initial_1_trace 13)))
                (__f12 (__f3 (select initial_1_trace 7)))))
      (a!237 (= (__f14 (__f3 (select initial_1_trace 14)))
                (__f12 (__f3 (select initial_1_trace 7)))))
      (a!239 (= (__f14 (__f3 (select initial_1_trace 15)))
                (__f12 (__f3 (select initial_1_trace 7)))))
      (a!241 (= (__f14 (__f3 (select initial_1_trace 16)))
                (__f12 (__f3 (select initial_1_trace 7)))))
      (a!243 (= (__f14 (__f3 (select initial_1_trace 17)))
                (__f12 (__f3 (select initial_1_trace 7)))))
      (a!245 (not (__f8 (__f4 (select initial_1_trace 7)))))
      (a!246 (= (__f12 (__f3 (select initial_1_trace 0)))
                (__f14 (__f3 (select initial_1_trace 7)))))
      (a!248 (= (__f12 (__f3 (select initial_1_trace 1)))
                (__f14 (__f3 (select initial_1_trace 7)))))
      (a!250 (= (__f12 (__f3 (select initial_1_trace 2)))
                (__f14 (__f3 (select initial_1_trace 7)))))
      (a!252 (= (__f12 (__f3 (select initial_1_trace 3)))
                (__f14 (__f3 (select initial_1_trace 7)))))
      (a!254 (= (__f12 (__f3 (select initial_1_trace 4)))
                (__f14 (__f3 (select initial_1_trace 7)))))
      (a!256 (= (__f12 (__f3 (select initial_1_trace 5)))
                (__f14 (__f3 (select initial_1_trace 7)))))
      (a!258 (= (__f12 (__f3 (select initial_1_trace 6)))
                (__f14 (__f3 (select initial_1_trace 7)))))
      (a!260 (not (__f10 (__f4 (select initial_1_trace 7)))))
      (a!261 (= (__f14 (__f3 (select initial_1_trace 9)))
                (__f12 (__f3 (select initial_1_trace 8)))))
      (a!262 (_tuple_2 (__f1 (__f2 (select initial_1_trace 8)))
                       (__f2 (__f2 (select initial_1_trace 8)))))
      (a!264 (= (__f14 (__f3 (select initial_1_trace 10)))
                (__f12 (__f3 (select initial_1_trace 8)))))
      (a!266 (= (__f14 (__f3 (select initial_1_trace 11)))
                (__f12 (__f3 (select initial_1_trace 8)))))
      (a!268 (= (__f14 (__f3 (select initial_1_trace 12)))
                (__f12 (__f3 (select initial_1_trace 8)))))
      (a!270 (= (__f14 (__f3 (select initial_1_trace 13)))
                (__f12 (__f3 (select initial_1_trace 8)))))
      (a!272 (= (__f14 (__f3 (select initial_1_trace 14)))
                (__f12 (__f3 (select initial_1_trace 8)))))
      (a!274 (= (__f14 (__f3 (select initial_1_trace 15)))
                (__f12 (__f3 (select initial_1_trace 8)))))
      (a!276 (= (__f14 (__f3 (select initial_1_trace 16)))
                (__f12 (__f3 (select initial_1_trace 8)))))
      (a!278 (= (__f14 (__f3 (select initial_1_trace 17)))
                (__f12 (__f3 (select initial_1_trace 8)))))
      (a!280 (not (__f8 (__f4 (select initial_1_trace 8)))))
      (a!281 (= (__f12 (__f3 (select initial_1_trace 0)))
                (__f14 (__f3 (select initial_1_trace 8)))))
      (a!283 (= (__f12 (__f3 (select initial_1_trace 1)))
                (__f14 (__f3 (select initial_1_trace 8)))))
      (a!285 (= (__f12 (__f3 (select initial_1_trace 2)))
                (__f14 (__f3 (select initial_1_trace 8)))))
      (a!287 (= (__f12 (__f3 (select initial_1_trace 3)))
                (__f14 (__f3 (select initial_1_trace 8)))))
      (a!289 (= (__f12 (__f3 (select initial_1_trace 4)))
                (__f14 (__f3 (select initial_1_trace 8)))))
      (a!291 (= (__f12 (__f3 (select initial_1_trace 5)))
                (__f14 (__f3 (select initial_1_trace 8)))))
      (a!293 (= (__f12 (__f3 (select initial_1_trace 6)))
                (__f14 (__f3 (select initial_1_trace 8)))))
      (a!295 (= (__f12 (__f3 (select initial_1_trace 7)))
                (__f14 (__f3 (select initial_1_trace 8)))))
      (a!297 (not (__f10 (__f4 (select initial_1_trace 8))))))
(let ((a!3 (and (__f10 (__f4 (select initial_1_trace 2)))
                a!1
                (= (__f2 (select initial_1_trace 2)) a!2)))
      (a!5 (and (__f10 (__f4 (select initial_1_trace 3)))
                a!4
                (= (__f2 (select initial_1_trace 3)) a!2)))
      (a!7 (and (__f10 (__f4 (select initial_1_trace 4)))
                a!6
                (= (__f2 (select initial_1_trace 4)) a!2)))
      (a!9 (and (__f10 (__f4 (select initial_1_trace 5)))
                a!8
                (= (__f2 (select initial_1_trace 5)) a!2)))
      (a!11 (and (__f10 (__f4 (select initial_1_trace 6)))
                 a!10
                 (= (__f2 (select initial_1_trace 6)) a!2)))
      (a!13 (and (__f10 (__f4 (select initial_1_trace 7)))
                 a!12
                 (= (__f2 (select initial_1_trace 7)) a!2)))
      (a!15 (and (__f10 (__f4 (select initial_1_trace 8)))
                 a!14
                 (= (__f2 (select initial_1_trace 8)) a!2)))
      (a!17 (and (__f10 (__f4 (select initial_1_trace 9)))
                 a!16
                 (= (__f2 (select initial_1_trace 9)) a!2)))
      (a!19 (and (__f10 (__f4 (select initial_1_trace 10)))
                 a!18
                 (= (__f2 (select initial_1_trace 10)) a!2)))
      (a!21 (and (__f10 (__f4 (select initial_1_trace 11)))
                 a!20
                 (= (__f2 (select initial_1_trace 11)) a!2)))
      (a!23 (and (__f10 (__f4 (select initial_1_trace 12)))
                 a!22
                 (= (__f2 (select initial_1_trace 12)) a!2)))
      (a!25 (and (__f10 (__f4 (select initial_1_trace 13)))
                 a!24
                 (= (__f2 (select initial_1_trace 13)) a!2)))
      (a!27 (and (__f10 (__f4 (select initial_1_trace 14)))
                 a!26
                 (= (__f2 (select initial_1_trace 14)) a!2)))
      (a!29 (and (__f10 (__f4 (select initial_1_trace 15)))
                 a!28
                 (= (__f2 (select initial_1_trace 15)) a!2)))
      (a!31 (and (__f10 (__f4 (select initial_1_trace 16)))
                 a!30
                 (= (__f2 (select initial_1_trace 16)) a!2)))
      (a!33 (and (__f10 (__f4 (select initial_1_trace 17)))
                 a!32
                 (= (__f2 (select initial_1_trace 17)) a!2)))
      (a!38 (and (__f8 (__f4 (select initial_1_trace 0)))
                 a!36
                 (= (__f2 (select initial_1_trace 1)) a!37)))
      (a!41 (and (__f10 (__f4 (select initial_1_trace 3)))
                 a!39
                 (= (__f2 (select initial_1_trace 3)) a!40)))
      (a!43 (and (__f10 (__f4 (select initial_1_trace 4)))
                 a!42
                 (= (__f2 (select initial_1_trace 4)) a!40)))
      (a!45 (and (__f10 (__f4 (select initial_1_trace 5)))
                 a!44
                 (= (__f2 (select initial_1_trace 5)) a!40)))
      (a!47 (and (__f10 (__f4 (select initial_1_trace 6)))
                 a!46
                 (= (__f2 (select initial_1_trace 6)) a!40)))
      (a!49 (and (__f10 (__f4 (select initial_1_trace 7)))
                 a!48
                 (= (__f2 (select initial_1_trace 7)) a!40)))
      (a!51 (and (__f10 (__f4 (select initial_1_trace 8)))
                 a!50
                 (= (__f2 (select initial_1_trace 8)) a!40)))
      (a!53 (and (__f10 (__f4 (select initial_1_trace 9)))
                 a!52
                 (= (__f2 (select initial_1_trace 9)) a!40)))
      (a!55 (and (__f10 (__f4 (select initial_1_trace 10)))
                 a!54
                 (= (__f2 (select initial_1_trace 10)) a!40)))
      (a!57 (and (__f10 (__f4 (select initial_1_trace 11)))
                 a!56
                 (= (__f2 (select initial_1_trace 11)) a!40)))
      (a!59 (and (__f10 (__f4 (select initial_1_trace 12)))
                 a!58
                 (= (__f2 (select initial_1_trace 12)) a!40)))
      (a!61 (and (__f10 (__f4 (select initial_1_trace 13)))
                 a!60
                 (= (__f2 (select initial_1_trace 13)) a!40)))
      (a!63 (and (__f10 (__f4 (select initial_1_trace 14)))
                 a!62
                 (= (__f2 (select initial_1_trace 14)) a!40)))
      (a!65 (and (__f10 (__f4 (select initial_1_trace 15)))
                 a!64
                 (= (__f2 (select initial_1_trace 15)) a!40)))
      (a!67 (and (__f10 (__f4 (select initial_1_trace 16)))
                 a!66
                 (= (__f2 (select initial_1_trace 16)) a!40)))
      (a!69 (and (__f10 (__f4 (select initial_1_trace 17)))
                 a!68
                 (= (__f2 (select initial_1_trace 17)) a!40)))
      (a!72 (and (__f8 (__f4 (select initial_1_trace 0)))
                 a!71
                 (= (__f2 (select initial_1_trace 2)) a!37)))
      (a!74 (and (__f8 (__f4 (select initial_1_trace 1)))
                 a!73
                 (= (__f2 (select initial_1_trace 2)) a!2)))
      (a!78 (and (__f10 (__f4 (select initial_1_trace 4)))
                 a!76
                 (= (__f2 (select initial_1_trace 4)) a!77)))
      (a!80 (and (__f10 (__f4 (select initial_1_trace 5)))
                 a!79
                 (= (__f2 (select initial_1_trace 5)) a!77)))
      (a!82 (and (__f10 (__f4 (select initial_1_trace 6)))
                 a!81
                 (= (__f2 (select initial_1_trace 6)) a!77)))
      (a!84 (and (__f10 (__f4 (select initial_1_trace 7)))
                 a!83
                 (= (__f2 (select initial_1_trace 7)) a!77)))
      (a!86 (and (__f10 (__f4 (select initial_1_trace 8)))
                 a!85
                 (= (__f2 (select initial_1_trace 8)) a!77)))
      (a!88 (and (__f10 (__f4 (select initial_1_trace 9)))
                 a!87
                 (= (__f2 (select initial_1_trace 9)) a!77)))
      (a!90 (and (__f10 (__f4 (select initial_1_trace 10)))
                 a!89
                 (= (__f2 (select initial_1_trace 10)) a!77)))
      (a!92 (and (__f10 (__f4 (select initial_1_trace 11)))
                 a!91
                 (= (__f2 (select initial_1_trace 11)) a!77)))
      (a!94 (and (__f10 (__f4 (select initial_1_trace 12)))
                 a!93
                 (= (__f2 (select initial_1_trace 12)) a!77)))
      (a!96 (and (__f10 (__f4 (select initial_1_trace 13)))
                 a!95
                 (= (__f2 (select initial_1_trace 13)) a!77)))
      (a!98 (and (__f10 (__f4 (select initial_1_trace 14)))
                 a!97
                 (= (__f2 (select initial_1_trace 14)) a!77)))
      (a!100 (and (__f10 (__f4 (select initial_1_trace 15)))
                  a!99
                  (= (__f2 (select initial_1_trace 15)) a!77)))
      (a!102 (and (__f10 (__f4 (select initial_1_trace 16)))
                  a!101
                  (= (__f2 (select initial_1_trace 16)) a!77)))
      (a!104 (and (__f10 (__f4 (select initial_1_trace 17)))
                  a!103
                  (= (__f2 (select initial_1_trace 17)) a!77)))
      (a!107 (and (__f8 (__f4 (select initial_1_trace 0)))
                  a!106
                  (= (__f2 (select initial_1_trace 3)) a!37)))
      (a!109 (and (__f8 (__f4 (select initial_1_trace 1)))
                  a!108
                  (= (__f2 (select initial_1_trace 3)) a!2)))
      (a!111 (and (__f8 (__f4 (select initial_1_trace 2)))
                  a!110
                  (= (__f2 (select initial_1_trace 3)) a!40)))
      (a!115 (and (__f10 (__f4 (select initial_1_trace 5)))
                  a!113
                  (= (__f2 (select initial_1_trace 5)) a!114)))
      (a!117 (and (__f10 (__f4 (select initial_1_trace 6)))
                  a!116
                  (= (__f2 (select initial_1_trace 6)) a!114)))
      (a!119 (and (__f10 (__f4 (select initial_1_trace 7)))
                  a!118
                  (= (__f2 (select initial_1_trace 7)) a!114)))
      (a!121 (and (__f10 (__f4 (select initial_1_trace 8)))
                  a!120
                  (= (__f2 (select initial_1_trace 8)) a!114)))
      (a!123 (and (__f10 (__f4 (select initial_1_trace 9)))
                  a!122
                  (= (__f2 (select initial_1_trace 9)) a!114)))
      (a!125 (and (__f10 (__f4 (select initial_1_trace 10)))
                  a!124
                  (= (__f2 (select initial_1_trace 10)) a!114)))
      (a!127 (and (__f10 (__f4 (select initial_1_trace 11)))
                  a!126
                  (= (__f2 (select initial_1_trace 11)) a!114)))
      (a!129 (and (__f10 (__f4 (select initial_1_trace 12)))
                  a!128
                  (= (__f2 (select initial_1_trace 12)) a!114)))
      (a!131 (and (__f10 (__f4 (select initial_1_trace 13)))
                  a!130
                  (= (__f2 (select initial_1_trace 13)) a!114)))
      (a!133 (and (__f10 (__f4 (select initial_1_trace 14)))
                  a!132
                  (= (__f2 (select initial_1_trace 14)) a!114)))
      (a!135 (and (__f10 (__f4 (select initial_1_trace 15)))
                  a!134
                  (= (__f2 (select initial_1_trace 15)) a!114)))
      (a!137 (and (__f10 (__f4 (select initial_1_trace 16)))
                  a!136
                  (= (__f2 (select initial_1_trace 16)) a!114)))
      (a!139 (and (__f10 (__f4 (select initial_1_trace 17)))
                  a!138
                  (= (__f2 (select initial_1_trace 17)) a!114)))
      (a!142 (and (__f8 (__f4 (select initial_1_trace 0)))
                  a!141
                  (= (__f2 (select initial_1_trace 4)) a!37)))
      (a!144 (and (__f8 (__f4 (select initial_1_trace 1)))
                  a!143
                  (= (__f2 (select initial_1_trace 4)) a!2)))
      (a!146 (and (__f8 (__f4 (select initial_1_trace 2)))
                  a!145
                  (= (__f2 (select initial_1_trace 4)) a!40)))
      (a!148 (and (__f8 (__f4 (select initial_1_trace 3)))
                  a!147
                  (= (__f2 (select initial_1_trace 4)) a!77)))
      (a!152 (and (__f10 (__f4 (select initial_1_trace 6)))
                  a!150
                  (= (__f2 (select initial_1_trace 6)) a!151)))
      (a!154 (and (__f10 (__f4 (select initial_1_trace 7)))
                  a!153
                  (= (__f2 (select initial_1_trace 7)) a!151)))
      (a!156 (and (__f10 (__f4 (select initial_1_trace 8)))
                  a!155
                  (= (__f2 (select initial_1_trace 8)) a!151)))
      (a!158 (and (__f10 (__f4 (select initial_1_trace 9)))
                  a!157
                  (= (__f2 (select initial_1_trace 9)) a!151)))
      (a!160 (and (__f10 (__f4 (select initial_1_trace 10)))
                  a!159
                  (= (__f2 (select initial_1_trace 10)) a!151)))
      (a!162 (and (__f10 (__f4 (select initial_1_trace 11)))
                  a!161
                  (= (__f2 (select initial_1_trace 11)) a!151)))
      (a!164 (and (__f10 (__f4 (select initial_1_trace 12)))
                  a!163
                  (= (__f2 (select initial_1_trace 12)) a!151)))
      (a!166 (and (__f10 (__f4 (select initial_1_trace 13)))
                  a!165
                  (= (__f2 (select initial_1_trace 13)) a!151)))
      (a!168 (and (__f10 (__f4 (select initial_1_trace 14)))
                  a!167
                  (= (__f2 (select initial_1_trace 14)) a!151)))
      (a!170 (and (__f10 (__f4 (select initial_1_trace 15)))
                  a!169
                  (= (__f2 (select initial_1_trace 15)) a!151)))
      (a!172 (and (__f10 (__f4 (select initial_1_trace 16)))
                  a!171
                  (= (__f2 (select initial_1_trace 16)) a!151)))
      (a!174 (and (__f10 (__f4 (select initial_1_trace 17)))
                  a!173
                  (= (__f2 (select initial_1_trace 17)) a!151)))
      (a!177 (and (__f8 (__f4 (select initial_1_trace 0)))
                  a!176
                  (= (__f2 (select initial_1_trace 5)) a!37)))
      (a!179 (and (__f8 (__f4 (select initial_1_trace 1)))
                  a!178
                  (= (__f2 (select initial_1_trace 5)) a!2)))
      (a!181 (and (__f8 (__f4 (select initial_1_trace 2)))
                  a!180
                  (= (__f2 (select initial_1_trace 5)) a!40)))
      (a!183 (and (__f8 (__f4 (select initial_1_trace 3)))
                  a!182
                  (= (__f2 (select initial_1_trace 5)) a!77)))
      (a!185 (and (__f8 (__f4 (select initial_1_trace 4)))
                  a!184
                  (= (__f2 (select initial_1_trace 5)) a!114)))
      (a!189 (and (__f10 (__f4 (select initial_1_trace 7)))
                  a!187
                  (= (__f2 (select initial_1_trace 7)) a!188)))
      (a!191 (and (__f10 (__f4 (select initial_1_trace 8)))
                  a!190
                  (= (__f2 (select initial_1_trace 8)) a!188)))
      (a!193 (and (__f10 (__f4 (select initial_1_trace 9)))
                  a!192
                  (= (__f2 (select initial_1_trace 9)) a!188)))
      (a!195 (and (__f10 (__f4 (select initial_1_trace 10)))
                  a!194
                  (= (__f2 (select initial_1_trace 10)) a!188)))
      (a!197 (and (__f10 (__f4 (select initial_1_trace 11)))
                  a!196
                  (= (__f2 (select initial_1_trace 11)) a!188)))
      (a!199 (and (__f10 (__f4 (select initial_1_trace 12)))
                  a!198
                  (= (__f2 (select initial_1_trace 12)) a!188)))
      (a!201 (and (__f10 (__f4 (select initial_1_trace 13)))
                  a!200
                  (= (__f2 (select initial_1_trace 13)) a!188)))
      (a!203 (and (__f10 (__f4 (select initial_1_trace 14)))
                  a!202
                  (= (__f2 (select initial_1_trace 14)) a!188)))
      (a!205 (and (__f10 (__f4 (select initial_1_trace 15)))
                  a!204
                  (= (__f2 (select initial_1_trace 15)) a!188)))
      (a!207 (and (__f10 (__f4 (select initial_1_trace 16)))
                  a!206
                  (= (__f2 (select initial_1_trace 16)) a!188)))
      (a!209 (and (__f10 (__f4 (select initial_1_trace 17)))
                  a!208
                  (= (__f2 (select initial_1_trace 17)) a!188)))
      (a!212 (and (__f8 (__f4 (select initial_1_trace 0)))
                  a!211
                  (= (__f2 (select initial_1_trace 6)) a!37)))
      (a!214 (and (__f8 (__f4 (select initial_1_trace 1)))
                  a!213
                  (= (__f2 (select initial_1_trace 6)) a!2)))
      (a!216 (and (__f8 (__f4 (select initial_1_trace 2)))
                  a!215
                  (= (__f2 (select initial_1_trace 6)) a!40)))
      (a!218 (and (__f8 (__f4 (select initial_1_trace 3)))
                  a!217
                  (= (__f2 (select initial_1_trace 6)) a!77)))
      (a!220 (and (__f8 (__f4 (select initial_1_trace 4)))
                  a!219
                  (= (__f2 (select initial_1_trace 6)) a!114)))
      (a!222 (and (__f8 (__f4 (select initial_1_trace 5)))
                  a!221
                  (= (__f2 (select initial_1_trace 6)) a!151)))
      (a!226 (and (__f10 (__f4 (select initial_1_trace 8)))
                  a!224
                  (= (__f2 (select initial_1_trace 8)) a!225)))
      (a!228 (and (__f10 (__f4 (select initial_1_trace 9)))
                  a!227
                  (= (__f2 (select initial_1_trace 9)) a!225)))
      (a!230 (and (__f10 (__f4 (select initial_1_trace 10)))
                  a!229
                  (= (__f2 (select initial_1_trace 10)) a!225)))
      (a!232 (and (__f10 (__f4 (select initial_1_trace 11)))
                  a!231
                  (= (__f2 (select initial_1_trace 11)) a!225)))
      (a!234 (and (__f10 (__f4 (select initial_1_trace 12)))
                  a!233
                  (= (__f2 (select initial_1_trace 12)) a!225)))
      (a!236 (and (__f10 (__f4 (select initial_1_trace 13)))
                  a!235
                  (= (__f2 (select initial_1_trace 13)) a!225)))
      (a!238 (and (__f10 (__f4 (select initial_1_trace 14)))
                  a!237
                  (= (__f2 (select initial_1_trace 14)) a!225)))
      (a!240 (and (__f10 (__f4 (select initial_1_trace 15)))
                  a!239
                  (= (__f2 (select initial_1_trace 15)) a!225)))
      (a!242 (and (__f10 (__f4 (select initial_1_trace 16)))
                  a!241
                  (= (__f2 (select initial_1_trace 16)) a!225)))
      (a!244 (and (__f10 (__f4 (select initial_1_trace 17)))
                  a!243
                  (= (__f2 (select initial_1_trace 17)) a!225)))
      (a!247 (and (__f8 (__f4 (select initial_1_trace 0)))
                  a!246
                  (= (__f2 (select initial_1_trace 7)) a!37)))
      (a!249 (and (__f8 (__f4 (select initial_1_trace 1)))
                  a!248
                  (= (__f2 (select initial_1_trace 7)) a!2)))
      (a!251 (and (__f8 (__f4 (select initial_1_trace 2)))
                  a!250
                  (= (__f2 (select initial_1_trace 7)) a!40)))
      (a!253 (and (__f8 (__f4 (select initial_1_trace 3)))
                  a!252
                  (= (__f2 (select initial_1_trace 7)) a!77)))
      (a!255 (and (__f8 (__f4 (select initial_1_trace 4)))
                  a!254
                  (= (__f2 (select initial_1_trace 7)) a!114)))
      (a!257 (and (__f8 (__f4 (select initial_1_trace 5)))
                  a!256
                  (= (__f2 (select initial_1_trace 7)) a!151)))
      (a!259 (and (__f8 (__f4 (select initial_1_trace 6)))
                  a!258
                  (= (__f2 (select initial_1_trace 7)) a!188)))
      (a!263 (and (__f10 (__f4 (select initial_1_trace 9)))
                  a!261
                  (= (__f2 (select initial_1_trace 9)) a!262)))
      (a!265 (and (__f10 (__f4 (select initial_1_trace 10)))
                  a!264
                  (= (__f2 (select initial_1_trace 10)) a!262)))
      (a!267 (and (__f10 (__f4 (select initial_1_trace 11)))
                  a!266
                  (= (__f2 (select initial_1_trace 11)) a!262)))
      (a!269 (and (__f10 (__f4 (select initial_1_trace 12)))
                  a!268
                  (= (__f2 (select initial_1_trace 12)) a!262)))
      (a!271 (and (__f10 (__f4 (select initial_1_trace 13)))
                  a!270
                  (= (__f2 (select initial_1_trace 13)) a!262)))
      (a!273 (and (__f10 (__f4 (select initial_1_trace 14)))
                  a!272
                  (= (__f2 (select initial_1_trace 14)) a!262)))
      (a!275 (and (__f10 (__f4 (select initial_1_trace 15)))
                  a!274
                  (= (__f2 (select initial_1_trace 15)) a!262)))
      (a!277 (and (__f10 (__f4 (select initial_1_trace 16)))
                  a!276
                  (= (__f2 (select initial_1_trace 16)) a!262)))
      (a!279 (and (__f10 (__f4 (select initial_1_trace 17)))
                  a!278
                  (= (__f2 (select initial_1_trace 17)) a!262)))
      (a!282 (and (__f8 (__f4 (select initial_1_trace 0)))
                  a!281
                  (= (__f2 (select initial_1_trace 8)) a!37)))
      (a!284 (and (__f8 (__f4 (select initial_1_trace 1)))
                  a!283
                  (= (__f2 (select initial_1_trace 8)) a!2)))
      (a!286 (and (__f8 (__f4 (select initial_1_trace 2)))
                  a!285
                  (= (__f2 (select initial_1_trace 8)) a!40)))
      (a!288 (and (__f8 (__f4 (select initial_1_trace 3)))
                  a!287
                  (= (__f2 (select initial_1_trace 8)) a!77)))
      (a!290 (and (__f8 (__f4 (select initial_1_trace 4)))
                  a!289
                  (= (__f2 (select initial_1_trace 8)) a!114)))
      (a!292 (and (__f8 (__f4 (select initial_1_trace 5)))
                  a!291
                  (= (__f2 (select initial_1_trace 8)) a!151)))
      (a!294 (and (__f8 (__f4 (select initial_1_trace 6)))
                  a!293
                  (= (__f2 (select initial_1_trace 8)) a!188)))
      (a!296 (and (__f8 (__f4 (select initial_1_trace 7)))
                  a!295
                  (= (__f2 (select initial_1_trace 8)) a!225))))
  (and (or a!3
           a!5
           a!7
           a!9
           a!11
           a!13
           a!15
           a!17
           a!19
           a!21
           a!23
           a!25
           a!27
           a!29
           a!31
           a!33
           a!34)
       (or a!35 a!38)
       (or a!41
           a!43
           a!45
           a!47
           a!49
           a!51
           a!53
           a!55
           a!57
           a!59
           a!61
           a!63
           a!65
           a!67
           a!69
           a!70)
       (or a!72 a!74 a!75)
       (or a!78
           a!80
           a!82
           a!84
           a!86
           a!88
           a!90
           a!92
           a!94
           a!96
           a!98
           a!100
           a!102
           a!104
           a!105)
       (or a!107 a!109 a!111 a!112)
       (or a!115
           a!117
           a!119
           a!121
           a!123
           a!125
           a!127
           a!129
           a!131
           a!133
           a!135
           a!137
           a!139
           a!140)
       (or a!142 a!144 a!146 a!148 a!149)
       (or a!152
           a!154
           a!156
           a!158
           a!160
           a!162
           a!164
           a!166
           a!168
           a!170
           a!172
           a!174
           a!175)
       (or a!177 a!179 a!181 a!183 a!185 a!186)
       (or a!189
           a!191
           a!193
           a!195
           a!197
           a!199
           a!201
           a!203
           a!205
           a!207
           a!209
           a!210)
       (or a!212 a!214 a!216 a!218 a!220 a!222 a!223)
       (or a!226 a!228 a!230 a!232 a!234 a!236 a!238 a!240 a!242 a!244 a!245)
       (or a!247 a!249 a!251 a!253 a!255 a!257 a!259 a!260)
       (or a!263 a!265 a!267 a!269 a!271 a!273 a!275 a!277 a!279 a!280)
       (or a!282 a!284 a!286 a!288 a!290 a!292 a!294 a!296 a!297)))))
(assert (let ((a!1 (_tuple_0 false false false false false false false false false))
      (a!2 (= (__f13 (__f3 (select initial_1_trace 1))) 0))
      (a!4 (= (__f13 (__f3 (select initial_1_trace 2))) 0))
      (a!6 (= (__f13 (__f3 (select initial_1_trace 3))) 0))
      (a!8 (= (__f13 (__f3 (select initial_1_trace 4))) 0))
      (a!10 (= (__f13 (__f3 (select initial_1_trace 5))) 0))
      (a!12 (= (__f13 (__f3 (select initial_1_trace 6))) 0))
      (a!14 (= (__f13 (__f3 (select initial_1_trace 7))) 0))
      (a!16 (= (__f13 (__f3 (select initial_1_trace 8))) 0))
      (a!18 (= (__f13 (__f3 (select initial_1_trace 9))) 0))
      (a!20 (= (__f13 (__f3 (select initial_1_trace 10))) 0))
      (a!22 (= (__f13 (__f3 (select initial_1_trace 11))) 0))
      (a!24 (= (__f13 (__f3 (select initial_1_trace 12))) 0))
      (a!26 (= (__f13 (__f3 (select initial_1_trace 13))) 0))
      (a!28 (= (__f13 (__f3 (select initial_1_trace 14))) 0))
      (a!30 (= (__f13 (__f3 (select initial_1_trace 15))) 0))
      (a!32 (= (__f13 (__f3 (select initial_1_trace 16))) 0))
      (a!34 (= (__f13 (__f3 (select initial_1_trace 17))) 0)))
(let ((a!3 (or (= (__f1 (select initial_1_trace 1)) a!1)
               (__f9 (__f4 (select initial_1_trace 1)))
               a!2))
      (a!5 (or (= (__f1 (select initial_1_trace 2)) a!1)
               (__f9 (__f4 (select initial_1_trace 2)))
               a!4))
      (a!7 (or (= (__f1 (select initial_1_trace 3)) a!1)
               (__f9 (__f4 (select initial_1_trace 3)))
               a!6))
      (a!9 (or (= (__f1 (select initial_1_trace 4)) a!1)
               (__f9 (__f4 (select initial_1_trace 4)))
               a!8))
      (a!11 (or (= (__f1 (select initial_1_trace 5)) a!1)
                (__f9 (__f4 (select initial_1_trace 5)))
                a!10))
      (a!13 (or (= (__f1 (select initial_1_trace 6)) a!1)
                (__f9 (__f4 (select initial_1_trace 6)))
                a!12))
      (a!15 (or (= (__f1 (select initial_1_trace 7)) a!1)
                (__f9 (__f4 (select initial_1_trace 7)))
                a!14))
      (a!17 (or (= (__f1 (select initial_1_trace 8)) a!1)
                (__f9 (__f4 (select initial_1_trace 8)))
                a!16))
      (a!19 (or (= (__f1 (select initial_1_trace 9)) a!1)
                (__f9 (__f4 (select initial_1_trace 9)))
                a!18))
      (a!21 (or (= (__f1 (select initial_1_trace 10)) a!1)
                (__f9 (__f4 (select initial_1_trace 10)))
                a!20))
      (a!23 (or (= (__f1 (select initial_1_trace 11)) a!1)
                (__f9 (__f4 (select initial_1_trace 11)))
                a!22))
      (a!25 (or (= (__f1 (select initial_1_trace 12)) a!1)
                (__f9 (__f4 (select initial_1_trace 12)))
                a!24))
      (a!27 (or (= (__f1 (select initial_1_trace 13)) a!1)
                (__f9 (__f4 (select initial_1_trace 13)))
                a!26))
      (a!29 (or (= (__f1 (select initial_1_trace 14)) a!1)
                (__f9 (__f4 (select initial_1_trace 14)))
                a!28))
      (a!31 (or (= (__f1 (select initial_1_trace 15)) a!1)
                (__f9 (__f4 (select initial_1_trace 15)))
                a!30))
      (a!33 (or (= (__f1 (select initial_1_trace 16)) a!1)
                (__f9 (__f4 (select initial_1_trace 16)))
                a!32))
      (a!35 (or (= (__f1 (select initial_1_trace 17)) a!1)
                (__f9 (__f4 (select initial_1_trace 17)))
                a!34)))
  (and a!3
       a!5
       a!7
       a!9
       a!11
       a!13
       a!15
       a!17
       a!19
       a!21
       a!23
       a!25
       a!27
       a!29
       a!31
       a!33
       a!35))))
(assert (let ((a!1 (or (__f1 (__f1 (select initial_1_trace 2)))
               (__f1 (__f1 (select initial_1_trace 3)))
               (__f1 (__f1 (select initial_1_trace 4)))
               (__f1 (__f1 (select initial_1_trace 5)))
               (__f1 (__f1 (select initial_1_trace 6)))
               (__f1 (__f1 (select initial_1_trace 7)))
               (__f1 (__f1 (select initial_1_trace 8)))))
      (a!3 (or (__f1 (__f1 (select initial_1_trace 1)))
               (__f1 (__f1 (select initial_1_trace 3)))
               (__f1 (__f1 (select initial_1_trace 4)))
               (__f1 (__f1 (select initial_1_trace 5)))
               (__f1 (__f1 (select initial_1_trace 6)))
               (__f1 (__f1 (select initial_1_trace 7)))
               (__f1 (__f1 (select initial_1_trace 8)))))
      (a!5 (or (__f1 (__f1 (select initial_1_trace 1)))
               (__f1 (__f1 (select initial_1_trace 2)))
               (__f1 (__f1 (select initial_1_trace 4)))
               (__f1 (__f1 (select initial_1_trace 5)))
               (__f1 (__f1 (select initial_1_trace 6)))
               (__f1 (__f1 (select initial_1_trace 7)))
               (__f1 (__f1 (select initial_1_trace 8)))))
      (a!7 (or (__f1 (__f1 (select initial_1_trace 1)))
               (__f1 (__f1 (select initial_1_trace 2)))
               (__f1 (__f1 (select initial_1_trace 3)))
               (__f1 (__f1 (select initial_1_trace 5)))
               (__f1 (__f1 (select initial_1_trace 6)))
               (__f1 (__f1 (select initial_1_trace 7)))
               (__f1 (__f1 (select initial_1_trace 8)))))
      (a!9 (or (__f1 (__f1 (select initial_1_trace 1)))
               (__f1 (__f1 (select initial_1_trace 2)))
               (__f1 (__f1 (select initial_1_trace 3)))
               (__f1 (__f1 (select initial_1_trace 4)))
               (__f1 (__f1 (select initial_1_trace 6)))
               (__f1 (__f1 (select initial_1_trace 7)))
               (__f1 (__f1 (select initial_1_trace 8)))))
      (a!11 (or (__f1 (__f1 (select initial_1_trace 1)))
                (__f1 (__f1 (select initial_1_trace 2)))
                (__f1 (__f1 (select initial_1_trace 3)))
                (__f1 (__f1 (select initial_1_trace 4)))
                (__f1 (__f1 (select initial_1_trace 5)))
                (__f1 (__f1 (select initial_1_trace 7)))
                (__f1 (__f1 (select initial_1_trace 8)))))
      (a!13 (or (__f1 (__f1 (select initial_1_trace 1)))
                (__f1 (__f1 (select initial_1_trace 2)))
                (__f1 (__f1 (select initial_1_trace 3)))
                (__f1 (__f1 (select initial_1_trace 4)))
                (__f1 (__f1 (select initial_1_trace 5)))
                (__f1 (__f1 (select initial_1_trace 6)))
                (__f1 (__f1 (select initial_1_trace 8)))))
      (a!15 (or (__f1 (__f1 (select initial_1_trace 1)))
                (__f1 (__f1 (select initial_1_trace 2)))
                (__f1 (__f1 (select initial_1_trace 3)))
                (__f1 (__f1 (select initial_1_trace 4)))
                (__f1 (__f1 (select initial_1_trace 5)))
                (__f1 (__f1 (select initial_1_trace 6)))
                (__f1 (__f1 (select initial_1_trace 7))))))
(let ((a!2 (and (__f1 (__f1 (select initial_1_trace 1)))
                (= (__f2 (select initial_1_trace 1)) (_tuple_2 0 0))
                (not a!1)))
      (a!4 (and (__f1 (__f1 (select initial_1_trace 2)))
                (= (__f2 (select initial_1_trace 2)) (_tuple_2 0 0))
                (not a!3)))
      (a!6 (and (__f1 (__f1 (select initial_1_trace 3)))
                (= (__f2 (select initial_1_trace 3)) (_tuple_2 0 0))
                (not a!5)))
      (a!8 (and (__f1 (__f1 (select initial_1_trace 4)))
                (= (__f2 (select initial_1_trace 4)) (_tuple_2 0 0))
                (not a!7)))
      (a!10 (and (__f1 (__f1 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 0 0))
                 (not a!9)))
      (a!12 (and (__f1 (__f1 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 0 0))
                 (not a!11)))
      (a!14 (and (__f1 (__f1 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 0 0))
                 (not a!13)))
      (a!16 (and (__f1 (__f1 (select initial_1_trace 8)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 0 0))
                 (not a!15))))
  (or (not (= initial_2_start_time 0)) a!2 a!4 a!6 a!8 a!10 a!12 a!14 a!16))))
(assert (let ((a!1 (= (__f9 (__f4 (select initial_1_trace 1)))
              (__f6 (__f1 (select initial_1_trace 1)))))
      (a!2 (= (__f9 (__f4 (select initial_1_trace 2)))
              (__f6 (__f1 (select initial_1_trace 2)))))
      (a!3 (= (__f9 (__f4 (select initial_1_trace 3)))
              (__f6 (__f1 (select initial_1_trace 3)))))
      (a!4 (= (__f9 (__f4 (select initial_1_trace 4)))
              (__f6 (__f1 (select initial_1_trace 4)))))
      (a!5 (= (__f9 (__f4 (select initial_1_trace 5)))
              (__f6 (__f1 (select initial_1_trace 5)))))
      (a!6 (= (__f9 (__f4 (select initial_1_trace 6)))
              (__f6 (__f1 (select initial_1_trace 6)))))
      (a!7 (= (__f9 (__f4 (select initial_1_trace 7)))
              (__f6 (__f1 (select initial_1_trace 7)))))
      (a!8 (= (__f9 (__f4 (select initial_1_trace 8)))
              (__f6 (__f1 (select initial_1_trace 8)))))
      (a!9 (= (__f9 (__f4 (select initial_1_trace 9)))
              (__f6 (__f1 (select initial_1_trace 9)))))
      (a!10 (= (__f9 (__f4 (select initial_1_trace 10)))
               (__f6 (__f1 (select initial_1_trace 10)))))
      (a!11 (= (__f9 (__f4 (select initial_1_trace 11)))
               (__f6 (__f1 (select initial_1_trace 11)))))
      (a!12 (= (__f9 (__f4 (select initial_1_trace 12)))
               (__f6 (__f1 (select initial_1_trace 12)))))
      (a!13 (= (__f9 (__f4 (select initial_1_trace 13)))
               (__f6 (__f1 (select initial_1_trace 13)))))
      (a!14 (= (__f9 (__f4 (select initial_1_trace 14)))
               (__f6 (__f1 (select initial_1_trace 14)))))
      (a!15 (= (__f9 (__f4 (select initial_1_trace 15)))
               (__f6 (__f1 (select initial_1_trace 15)))))
      (a!16 (= (__f9 (__f4 (select initial_1_trace 16)))
               (__f6 (__f1 (select initial_1_trace 16)))))
      (a!17 (= (__f9 (__f4 (select initial_1_trace 17)))
               (__f6 (__f1 (select initial_1_trace 17))))))
  (and a!1
       a!2
       a!3
       a!4
       a!5
       a!6
       a!7
       a!8
       a!9
       a!10
       a!11
       a!12
       a!13
       a!14
       a!15
       a!16
       a!17)))
(assert (let ((a!1 (= (__f2 (__f2 (select initial_1_trace 0))) 0))
      (a!3 (not (__f11 (__f4 (select initial_1_trace 0)))))
      (a!4 (= (__f2 (__f2 (select initial_1_trace 1))) 0))
      (a!6 (not (__f11 (__f4 (select initial_1_trace 1)))))
      (a!7 (= (__f2 (__f2 (select initial_1_trace 2))) 0))
      (a!9 (not (__f11 (__f4 (select initial_1_trace 2)))))
      (a!10 (= (__f2 (__f2 (select initial_1_trace 3))) 0))
      (a!12 (not (__f11 (__f4 (select initial_1_trace 3)))))
      (a!13 (= (__f2 (__f2 (select initial_1_trace 4))) 0))
      (a!15 (not (__f11 (__f4 (select initial_1_trace 4)))))
      (a!16 (= (__f2 (__f2 (select initial_1_trace 5))) 0))
      (a!18 (not (__f11 (__f4 (select initial_1_trace 5)))))
      (a!19 (= (__f2 (__f2 (select initial_1_trace 6))) 0))
      (a!21 (not (__f11 (__f4 (select initial_1_trace 6)))))
      (a!22 (= (__f2 (__f2 (select initial_1_trace 7))) 0))
      (a!24 (not (__f11 (__f4 (select initial_1_trace 7)))))
      (a!25 (= (__f2 (__f2 (select initial_1_trace 8))) 0))
      (a!27 (not (__f11 (__f4 (select initial_1_trace 8))))))
(let ((a!2 (and (exists ((n Int))
                  (! (let ((a!1 (= (__f1 (__f2 (select initial_1_trace 0)))
                                   (+ 100000000 (* 100000000 n)))))
                       (and (>= n 0) a!1))
                     :skolemid _skolem_0
                     :qid _exists_0))
                a!1))
      (a!5 (and (exists ((n Int))
                  (! (let ((a!1 (= (__f1 (__f2 (select initial_1_trace 1)))
                                   (+ 100000000 (* 100000000 n)))))
                       (and (>= n 0) a!1))
                     :skolemid _skolem_1
                     :qid _exists_1))
                a!4))
      (a!8 (and (exists ((n Int))
                  (! (let ((a!1 (= (__f1 (__f2 (select initial_1_trace 2)))
                                   (+ 100000000 (* 100000000 n)))))
                       (and (>= n 0) a!1))
                     :skolemid _skolem_2
                     :qid _exists_2))
                a!7))
      (a!11 (and (exists ((n Int))
                   (! (let ((a!1 (= (__f1 (__f2 (select initial_1_trace 3)))
                                    (+ 100000000 (* 100000000 n)))))
                        (and (>= n 0) a!1))
                      :skolemid _skolem_3
                      :qid _exists_3))
                 a!10))
      (a!14 (and (exists ((n Int))
                   (! (let ((a!1 (= (__f1 (__f2 (select initial_1_trace 4)))
                                    (+ 100000000 (* 100000000 n)))))
                        (and (>= n 0) a!1))
                      :skolemid _skolem_4
                      :qid _exists_4))
                 a!13))
      (a!17 (and (exists ((n Int))
                   (! (let ((a!1 (= (__f1 (__f2 (select initial_1_trace 5)))
                                    (+ 100000000 (* 100000000 n)))))
                        (and (>= n 0) a!1))
                      :skolemid _skolem_5
                      :qid _exists_5))
                 a!16))
      (a!20 (and (exists ((n Int))
                   (! (let ((a!1 (= (__f1 (__f2 (select initial_1_trace 6)))
                                    (+ 100000000 (* 100000000 n)))))
                        (and (>= n 0) a!1))
                      :skolemid _skolem_6
                      :qid _exists_6))
                 a!19))
      (a!23 (and (exists ((n Int))
                   (! (let ((a!1 (= (__f1 (__f2 (select initial_1_trace 7)))
                                    (+ 100000000 (* 100000000 n)))))
                        (and (>= n 0) a!1))
                      :skolemid _skolem_7
                      :qid _exists_7))
                 a!22))
      (a!26 (and (exists ((n Int))
                   (! (let ((a!1 (= (__f1 (__f2 (select initial_1_trace 8)))
                                    (+ 100000000 (* 100000000 n)))))
                        (and (>= n 0) a!1))
                      :skolemid _skolem_8
                      :qid _exists_8))
                 a!25)))
  (and (or a!2 a!3)
       (or a!5 a!6)
       (or a!8 a!9)
       (or a!11 a!12)
       (or a!14 a!15)
       (or a!17 a!18)
       (or a!20 a!21)
       (or a!23 a!24)
       (or a!26 a!27)))))
(assert (let ((a!1 (= (__f2 (__f3 (select initial_1_trace 1))) 1))
      (a!2 (= (__f1 (__f3 (select initial_1_trace 1)))
              (__f1 (__f3 (select initial_1_trace 0)))))
      (a!3 (= (__f3 (__f3 (select initial_1_trace 1)))
              (__f3 (__f3 (select initial_1_trace 0)))))
      (a!4 (= (__f4 (__f3 (select initial_1_trace 1)))
              (__f4 (__f3 (select initial_1_trace 0)))))
      (a!5 (= (__f7 (__f3 (select initial_1_trace 1))) 0))
      (a!6 (not (__f3 (__f4 (select initial_1_trace 1)))))
      (a!7 (= (__f9 (__f3 (select initial_1_trace 1))) 0))
      (a!8 (not (__f5 (__f4 (select initial_1_trace 1)))))
      (a!9 (= (__f11 (__f3 (select initial_1_trace 1))) 0))
      (a!10 (not (__f7 (__f4 (select initial_1_trace 1)))))
      (a!11 (= (__f12 (__f3 (select initial_1_trace 1))) 0))
      (a!12 (not (__f8 (__f4 (select initial_1_trace 1)))))
      (a!13 (not (__f1 (__f5 (select initial_1_trace 1)))))
      (a!14 (not (__f2 (__f5 (select initial_1_trace 1)))))
      (a!15 (not (__f7 (__f1 (select initial_1_trace 1)))))
      (a!16 (= (__f2 (__f3 (select initial_1_trace 2))) 1))
      (a!17 (= (__f1 (__f3 (select initial_1_trace 2)))
               (__f1 (__f3 (select initial_1_trace 1)))))
      (a!18 (= (__f3 (__f3 (select initial_1_trace 2)))
               (__f3 (__f3 (select initial_1_trace 1)))))
      (a!19 (= (__f4 (__f3 (select initial_1_trace 2)))
               (__f4 (__f3 (select initial_1_trace 1)))))
      (a!20 (= (__f7 (__f3 (select initial_1_trace 2))) 0))
      (a!21 (not (__f3 (__f4 (select initial_1_trace 2)))))
      (a!22 (= (__f9 (__f3 (select initial_1_trace 2))) 0))
      (a!23 (not (__f5 (__f4 (select initial_1_trace 2)))))
      (a!24 (= (__f11 (__f3 (select initial_1_trace 2))) 0))
      (a!25 (not (__f7 (__f4 (select initial_1_trace 2)))))
      (a!26 (= (__f12 (__f3 (select initial_1_trace 2))) 0))
      (a!27 (not (__f8 (__f4 (select initial_1_trace 2)))))
      (a!28 (not (__f1 (__f5 (select initial_1_trace 2)))))
      (a!29 (not (__f2 (__f5 (select initial_1_trace 2)))))
      (a!30 (not (__f7 (__f1 (select initial_1_trace 2)))))
      (a!31 (= (__f2 (__f3 (select initial_1_trace 3))) 1))
      (a!32 (= (__f1 (__f3 (select initial_1_trace 3)))
               (__f1 (__f3 (select initial_1_trace 2)))))
      (a!33 (= (__f3 (__f3 (select initial_1_trace 3)))
               (__f3 (__f3 (select initial_1_trace 2)))))
      (a!34 (= (__f4 (__f3 (select initial_1_trace 3)))
               (__f4 (__f3 (select initial_1_trace 2)))))
      (a!35 (= (__f7 (__f3 (select initial_1_trace 3))) 0))
      (a!36 (not (__f3 (__f4 (select initial_1_trace 3)))))
      (a!37 (= (__f9 (__f3 (select initial_1_trace 3))) 0))
      (a!38 (not (__f5 (__f4 (select initial_1_trace 3)))))
      (a!39 (= (__f11 (__f3 (select initial_1_trace 3))) 0))
      (a!40 (not (__f7 (__f4 (select initial_1_trace 3)))))
      (a!41 (= (__f12 (__f3 (select initial_1_trace 3))) 0))
      (a!42 (not (__f8 (__f4 (select initial_1_trace 3)))))
      (a!43 (not (__f1 (__f5 (select initial_1_trace 3)))))
      (a!44 (not (__f2 (__f5 (select initial_1_trace 3)))))
      (a!45 (not (__f7 (__f1 (select initial_1_trace 3)))))
      (a!46 (= (__f2 (__f3 (select initial_1_trace 4))) 1))
      (a!47 (= (__f1 (__f3 (select initial_1_trace 4)))
               (__f1 (__f3 (select initial_1_trace 3)))))
      (a!48 (= (__f3 (__f3 (select initial_1_trace 4)))
               (__f3 (__f3 (select initial_1_trace 3)))))
      (a!49 (= (__f4 (__f3 (select initial_1_trace 4)))
               (__f4 (__f3 (select initial_1_trace 3)))))
      (a!50 (= (__f7 (__f3 (select initial_1_trace 4))) 0))
      (a!51 (not (__f3 (__f4 (select initial_1_trace 4)))))
      (a!52 (= (__f9 (__f3 (select initial_1_trace 4))) 0))
      (a!53 (not (__f5 (__f4 (select initial_1_trace 4)))))
      (a!54 (= (__f11 (__f3 (select initial_1_trace 4))) 0))
      (a!55 (not (__f7 (__f4 (select initial_1_trace 4)))))
      (a!56 (= (__f12 (__f3 (select initial_1_trace 4))) 0))
      (a!57 (not (__f8 (__f4 (select initial_1_trace 4)))))
      (a!58 (not (__f1 (__f5 (select initial_1_trace 4)))))
      (a!59 (not (__f2 (__f5 (select initial_1_trace 4)))))
      (a!60 (not (__f7 (__f1 (select initial_1_trace 4)))))
      (a!61 (= (__f2 (__f3 (select initial_1_trace 5))) 1))
      (a!62 (= (__f1 (__f3 (select initial_1_trace 5)))
               (__f1 (__f3 (select initial_1_trace 4)))))
      (a!63 (= (__f3 (__f3 (select initial_1_trace 5)))
               (__f3 (__f3 (select initial_1_trace 4)))))
      (a!64 (= (__f4 (__f3 (select initial_1_trace 5)))
               (__f4 (__f3 (select initial_1_trace 4)))))
      (a!65 (= (__f7 (__f3 (select initial_1_trace 5))) 0))
      (a!66 (not (__f3 (__f4 (select initial_1_trace 5)))))
      (a!67 (= (__f9 (__f3 (select initial_1_trace 5))) 0))
      (a!68 (not (__f5 (__f4 (select initial_1_trace 5)))))
      (a!69 (= (__f11 (__f3 (select initial_1_trace 5))) 0))
      (a!70 (not (__f7 (__f4 (select initial_1_trace 5)))))
      (a!71 (= (__f12 (__f3 (select initial_1_trace 5))) 0))
      (a!72 (not (__f8 (__f4 (select initial_1_trace 5)))))
      (a!73 (not (__f1 (__f5 (select initial_1_trace 5)))))
      (a!74 (not (__f2 (__f5 (select initial_1_trace 5)))))
      (a!75 (not (__f7 (__f1 (select initial_1_trace 5)))))
      (a!76 (= (__f2 (__f3 (select initial_1_trace 6))) 1))
      (a!77 (= (__f1 (__f3 (select initial_1_trace 6)))
               (__f1 (__f3 (select initial_1_trace 5)))))
      (a!78 (= (__f3 (__f3 (select initial_1_trace 6)))
               (__f3 (__f3 (select initial_1_trace 5)))))
      (a!79 (= (__f4 (__f3 (select initial_1_trace 6)))
               (__f4 (__f3 (select initial_1_trace 5)))))
      (a!80 (= (__f7 (__f3 (select initial_1_trace 6))) 0))
      (a!81 (not (__f3 (__f4 (select initial_1_trace 6)))))
      (a!82 (= (__f9 (__f3 (select initial_1_trace 6))) 0))
      (a!83 (not (__f5 (__f4 (select initial_1_trace 6)))))
      (a!84 (= (__f11 (__f3 (select initial_1_trace 6))) 0))
      (a!85 (not (__f7 (__f4 (select initial_1_trace 6)))))
      (a!86 (= (__f12 (__f3 (select initial_1_trace 6))) 0))
      (a!87 (not (__f8 (__f4 (select initial_1_trace 6)))))
      (a!88 (not (__f1 (__f5 (select initial_1_trace 6)))))
      (a!89 (not (__f2 (__f5 (select initial_1_trace 6)))))
      (a!90 (not (__f7 (__f1 (select initial_1_trace 6)))))
      (a!91 (= (__f2 (__f3 (select initial_1_trace 7))) 1))
      (a!92 (= (__f1 (__f3 (select initial_1_trace 7)))
               (__f1 (__f3 (select initial_1_trace 6)))))
      (a!93 (= (__f3 (__f3 (select initial_1_trace 7)))
               (__f3 (__f3 (select initial_1_trace 6)))))
      (a!94 (= (__f4 (__f3 (select initial_1_trace 7)))
               (__f4 (__f3 (select initial_1_trace 6)))))
      (a!95 (= (__f7 (__f3 (select initial_1_trace 7))) 0))
      (a!96 (not (__f3 (__f4 (select initial_1_trace 7)))))
      (a!97 (= (__f9 (__f3 (select initial_1_trace 7))) 0))
      (a!98 (not (__f5 (__f4 (select initial_1_trace 7)))))
      (a!99 (= (__f11 (__f3 (select initial_1_trace 7))) 0))
      (a!100 (not (__f7 (__f4 (select initial_1_trace 7)))))
      (a!101 (= (__f12 (__f3 (select initial_1_trace 7))) 0))
      (a!102 (not (__f8 (__f4 (select initial_1_trace 7)))))
      (a!103 (not (__f1 (__f5 (select initial_1_trace 7)))))
      (a!104 (not (__f2 (__f5 (select initial_1_trace 7)))))
      (a!105 (not (__f7 (__f1 (select initial_1_trace 7)))))
      (a!106 (= (__f2 (__f3 (select initial_1_trace 8))) 1))
      (a!107 (= (__f1 (__f3 (select initial_1_trace 8)))
                (__f1 (__f3 (select initial_1_trace 7)))))
      (a!108 (= (__f3 (__f3 (select initial_1_trace 8)))
                (__f3 (__f3 (select initial_1_trace 7)))))
      (a!109 (= (__f4 (__f3 (select initial_1_trace 8)))
                (__f4 (__f3 (select initial_1_trace 7)))))
      (a!110 (= (__f7 (__f3 (select initial_1_trace 8))) 0))
      (a!111 (not (__f3 (__f4 (select initial_1_trace 8)))))
      (a!112 (= (__f9 (__f3 (select initial_1_trace 8))) 0))
      (a!113 (not (__f5 (__f4 (select initial_1_trace 8)))))
      (a!114 (= (__f11 (__f3 (select initial_1_trace 8))) 0))
      (a!115 (not (__f7 (__f4 (select initial_1_trace 8)))))
      (a!116 (= (__f12 (__f3 (select initial_1_trace 8))) 0))
      (a!117 (not (__f8 (__f4 (select initial_1_trace 8)))))
      (a!118 (not (__f1 (__f5 (select initial_1_trace 8)))))
      (a!119 (not (__f2 (__f5 (select initial_1_trace 8)))))
      (a!120 (not (__f7 (__f1 (select initial_1_trace 8))))))
  (and (or (and a!1 a!2 a!3 a!4 a!5 a!6 a!7 a!8 a!9 a!10 a!11 a!12 a!13 a!14)
           a!15)
       (or (and a!16
                a!17
                a!18
                a!19
                a!20
                a!21
                a!22
                a!23
                a!24
                a!25
                a!26
                a!27
                a!28
                a!29)
           a!30)
       (or (and a!31
                a!32
                a!33
                a!34
                a!35
                a!36
                a!37
                a!38
                a!39
                a!40
                a!41
                a!42
                a!43
                a!44)
           a!45)
       (or (and a!46
                a!47
                a!48
                a!49
                a!50
                a!51
                a!52
                a!53
                a!54
                a!55
                a!56
                a!57
                a!58
                a!59)
           a!60)
       (or (and a!61
                a!62
                a!63
                a!64
                a!65
                a!66
                a!67
                a!68
                a!69
                a!70
                a!71
                a!72
                a!73
                a!74)
           a!75)
       (or (and a!76
                a!77
                a!78
                a!79
                a!80
                a!81
                a!82
                a!83
                a!84
                a!85
                a!86
                a!87
                a!88
                a!89)
           a!90)
       (or (and a!91
                a!92
                a!93
                a!94
                a!95
                a!96
                a!97
                a!98
                a!99
                a!100
                a!101
                a!102
                a!103
                a!104)
           a!105)
       (or (and a!106
                a!107
                a!108
                a!109
                a!110
                a!111
                a!112
                a!113
                a!114
                a!115
                a!116
                a!117
                a!118
                a!119)
           a!120))))
(assert (let ((a!1 (= (__f1 (__f4 (select initial_1_trace 1)))
              (__f3 (__f1 (select initial_1_trace 1)))))
      (a!2 (= (__f1 (__f4 (select initial_1_trace 2)))
              (__f3 (__f1 (select initial_1_trace 2)))))
      (a!3 (= (__f1 (__f4 (select initial_1_trace 3)))
              (__f3 (__f1 (select initial_1_trace 3)))))
      (a!4 (= (__f1 (__f4 (select initial_1_trace 4)))
              (__f3 (__f1 (select initial_1_trace 4)))))
      (a!5 (= (__f1 (__f4 (select initial_1_trace 5)))
              (__f3 (__f1 (select initial_1_trace 5)))))
      (a!6 (= (__f1 (__f4 (select initial_1_trace 6)))
              (__f3 (__f1 (select initial_1_trace 6)))))
      (a!7 (= (__f1 (__f4 (select initial_1_trace 7)))
              (__f3 (__f1 (select initial_1_trace 7)))))
      (a!8 (= (__f1 (__f4 (select initial_1_trace 8)))
              (__f3 (__f1 (select initial_1_trace 8)))))
      (a!9 (= (__f1 (__f4 (select initial_1_trace 9)))
              (__f3 (__f1 (select initial_1_trace 9)))))
      (a!10 (= (__f1 (__f4 (select initial_1_trace 10)))
               (__f3 (__f1 (select initial_1_trace 10)))))
      (a!11 (= (__f1 (__f4 (select initial_1_trace 11)))
               (__f3 (__f1 (select initial_1_trace 11)))))
      (a!12 (= (__f1 (__f4 (select initial_1_trace 12)))
               (__f3 (__f1 (select initial_1_trace 12)))))
      (a!13 (= (__f1 (__f4 (select initial_1_trace 13)))
               (__f3 (__f1 (select initial_1_trace 13)))))
      (a!14 (= (__f1 (__f4 (select initial_1_trace 14)))
               (__f3 (__f1 (select initial_1_trace 14)))))
      (a!15 (= (__f1 (__f4 (select initial_1_trace 15)))
               (__f3 (__f1 (select initial_1_trace 15)))))
      (a!16 (= (__f1 (__f4 (select initial_1_trace 16)))
               (__f3 (__f1 (select initial_1_trace 16)))))
      (a!17 (= (__f1 (__f4 (select initial_1_trace 17)))
               (__f3 (__f1 (select initial_1_trace 17))))))
  (and a!1
       a!2
       a!3
       a!4
       a!5
       a!6
       a!7
       a!8
       a!9
       a!10
       a!11
       a!12
       a!13
       a!14
       a!15
       a!16
       a!17)))
(assert (let ((a!1 (= (__f4 (__f3 (select initial_1_trace 1))) 0))
      (a!2 (= (__f4 (__f3 (select initial_1_trace 1))) 1))
      (a!3 (= (__f1 (__f3 (select initial_1_trace 1)))
              (__f1 (__f3 (select initial_1_trace 0)))))
      (a!4 (= (__f2 (__f3 (select initial_1_trace 1)))
              (__f2 (__f3 (select initial_1_trace 0)))))
      (a!5 (= (__f3 (__f3 (select initial_1_trace 1)))
              (__f3 (__f3 (select initial_1_trace 0)))))
      (a!6 (= (__f7 (__f3 (select initial_1_trace 1))) 0))
      (a!7 (not (__f3 (__f4 (select initial_1_trace 1)))))
      (a!8 (= (__f9 (__f3 (select initial_1_trace 1))) 0))
      (a!9 (not (__f5 (__f4 (select initial_1_trace 1)))))
      (a!10 (= (__f11 (__f3 (select initial_1_trace 1))) 0))
      (a!11 (not (__f7 (__f4 (select initial_1_trace 1)))))
      (a!12 (= (__f12 (__f3 (select initial_1_trace 1))) 0))
      (a!13 (not (__f8 (__f4 (select initial_1_trace 1)))))
      (a!14 (not (__f1 (__f5 (select initial_1_trace 1)))))
      (a!15 (not (__f2 (__f5 (select initial_1_trace 1)))))
      (a!16 (not (__f9 (__f1 (select initial_1_trace 1)))))
      (a!18 (= (__f4 (__f3 (select initial_1_trace 2))) 0))
      (a!19 (= (__f4 (__f3 (select initial_1_trace 2))) 1))
      (a!20 (= (__f1 (__f3 (select initial_1_trace 2)))
               (__f1 (__f3 (select initial_1_trace 1)))))
      (a!21 (= (__f2 (__f3 (select initial_1_trace 2)))
               (__f2 (__f3 (select initial_1_trace 1)))))
      (a!22 (= (__f3 (__f3 (select initial_1_trace 2)))
               (__f3 (__f3 (select initial_1_trace 1)))))
      (a!23 (= (__f7 (__f3 (select initial_1_trace 2))) 0))
      (a!24 (not (__f3 (__f4 (select initial_1_trace 2)))))
      (a!25 (= (__f9 (__f3 (select initial_1_trace 2))) 0))
      (a!26 (not (__f5 (__f4 (select initial_1_trace 2)))))
      (a!27 (= (__f11 (__f3 (select initial_1_trace 2))) 0))
      (a!28 (not (__f7 (__f4 (select initial_1_trace 2)))))
      (a!29 (= (__f12 (__f3 (select initial_1_trace 2))) 0))
      (a!30 (not (__f8 (__f4 (select initial_1_trace 2)))))
      (a!31 (not (__f1 (__f5 (select initial_1_trace 2)))))
      (a!32 (not (__f2 (__f5 (select initial_1_trace 2)))))
      (a!33 (not (__f9 (__f1 (select initial_1_trace 2)))))
      (a!35 (= (__f4 (__f3 (select initial_1_trace 3))) 0))
      (a!36 (= (__f4 (__f3 (select initial_1_trace 3))) 1))
      (a!37 (= (__f1 (__f3 (select initial_1_trace 3)))
               (__f1 (__f3 (select initial_1_trace 2)))))
      (a!38 (= (__f2 (__f3 (select initial_1_trace 3)))
               (__f2 (__f3 (select initial_1_trace 2)))))
      (a!39 (= (__f3 (__f3 (select initial_1_trace 3)))
               (__f3 (__f3 (select initial_1_trace 2)))))
      (a!40 (= (__f7 (__f3 (select initial_1_trace 3))) 0))
      (a!41 (not (__f3 (__f4 (select initial_1_trace 3)))))
      (a!42 (= (__f9 (__f3 (select initial_1_trace 3))) 0))
      (a!43 (not (__f5 (__f4 (select initial_1_trace 3)))))
      (a!44 (= (__f11 (__f3 (select initial_1_trace 3))) 0))
      (a!45 (not (__f7 (__f4 (select initial_1_trace 3)))))
      (a!46 (= (__f12 (__f3 (select initial_1_trace 3))) 0))
      (a!47 (not (__f8 (__f4 (select initial_1_trace 3)))))
      (a!48 (not (__f1 (__f5 (select initial_1_trace 3)))))
      (a!49 (not (__f2 (__f5 (select initial_1_trace 3)))))
      (a!50 (not (__f9 (__f1 (select initial_1_trace 3)))))
      (a!52 (= (__f4 (__f3 (select initial_1_trace 4))) 0))
      (a!53 (= (__f4 (__f3 (select initial_1_trace 4))) 1))
      (a!54 (= (__f1 (__f3 (select initial_1_trace 4)))
               (__f1 (__f3 (select initial_1_trace 3)))))
      (a!55 (= (__f2 (__f3 (select initial_1_trace 4)))
               (__f2 (__f3 (select initial_1_trace 3)))))
      (a!56 (= (__f3 (__f3 (select initial_1_trace 4)))
               (__f3 (__f3 (select initial_1_trace 3)))))
      (a!57 (= (__f7 (__f3 (select initial_1_trace 4))) 0))
      (a!58 (not (__f3 (__f4 (select initial_1_trace 4)))))
      (a!59 (= (__f9 (__f3 (select initial_1_trace 4))) 0))
      (a!60 (not (__f5 (__f4 (select initial_1_trace 4)))))
      (a!61 (= (__f11 (__f3 (select initial_1_trace 4))) 0))
      (a!62 (not (__f7 (__f4 (select initial_1_trace 4)))))
      (a!63 (= (__f12 (__f3 (select initial_1_trace 4))) 0))
      (a!64 (not (__f8 (__f4 (select initial_1_trace 4)))))
      (a!65 (not (__f1 (__f5 (select initial_1_trace 4)))))
      (a!66 (not (__f2 (__f5 (select initial_1_trace 4)))))
      (a!67 (not (__f9 (__f1 (select initial_1_trace 4)))))
      (a!69 (= (__f4 (__f3 (select initial_1_trace 5))) 0))
      (a!70 (= (__f4 (__f3 (select initial_1_trace 5))) 1))
      (a!71 (= (__f1 (__f3 (select initial_1_trace 5)))
               (__f1 (__f3 (select initial_1_trace 4)))))
      (a!72 (= (__f2 (__f3 (select initial_1_trace 5)))
               (__f2 (__f3 (select initial_1_trace 4)))))
      (a!73 (= (__f3 (__f3 (select initial_1_trace 5)))
               (__f3 (__f3 (select initial_1_trace 4)))))
      (a!74 (= (__f7 (__f3 (select initial_1_trace 5))) 0))
      (a!75 (not (__f3 (__f4 (select initial_1_trace 5)))))
      (a!76 (= (__f9 (__f3 (select initial_1_trace 5))) 0))
      (a!77 (not (__f5 (__f4 (select initial_1_trace 5)))))
      (a!78 (= (__f11 (__f3 (select initial_1_trace 5))) 0))
      (a!79 (not (__f7 (__f4 (select initial_1_trace 5)))))
      (a!80 (= (__f12 (__f3 (select initial_1_trace 5))) 0))
      (a!81 (not (__f8 (__f4 (select initial_1_trace 5)))))
      (a!82 (not (__f1 (__f5 (select initial_1_trace 5)))))
      (a!83 (not (__f2 (__f5 (select initial_1_trace 5)))))
      (a!84 (not (__f9 (__f1 (select initial_1_trace 5)))))
      (a!86 (= (__f4 (__f3 (select initial_1_trace 6))) 0))
      (a!87 (= (__f4 (__f3 (select initial_1_trace 6))) 1))
      (a!88 (= (__f1 (__f3 (select initial_1_trace 6)))
               (__f1 (__f3 (select initial_1_trace 5)))))
      (a!89 (= (__f2 (__f3 (select initial_1_trace 6)))
               (__f2 (__f3 (select initial_1_trace 5)))))
      (a!90 (= (__f3 (__f3 (select initial_1_trace 6)))
               (__f3 (__f3 (select initial_1_trace 5)))))
      (a!91 (= (__f7 (__f3 (select initial_1_trace 6))) 0))
      (a!92 (not (__f3 (__f4 (select initial_1_trace 6)))))
      (a!93 (= (__f9 (__f3 (select initial_1_trace 6))) 0))
      (a!94 (not (__f5 (__f4 (select initial_1_trace 6)))))
      (a!95 (= (__f11 (__f3 (select initial_1_trace 6))) 0))
      (a!96 (not (__f7 (__f4 (select initial_1_trace 6)))))
      (a!97 (= (__f12 (__f3 (select initial_1_trace 6))) 0))
      (a!98 (not (__f8 (__f4 (select initial_1_trace 6)))))
      (a!99 (not (__f1 (__f5 (select initial_1_trace 6)))))
      (a!100 (not (__f2 (__f5 (select initial_1_trace 6)))))
      (a!101 (not (__f9 (__f1 (select initial_1_trace 6)))))
      (a!103 (= (__f4 (__f3 (select initial_1_trace 7))) 0))
      (a!104 (= (__f4 (__f3 (select initial_1_trace 7))) 1))
      (a!105 (= (__f1 (__f3 (select initial_1_trace 7)))
                (__f1 (__f3 (select initial_1_trace 6)))))
      (a!106 (= (__f2 (__f3 (select initial_1_trace 7)))
                (__f2 (__f3 (select initial_1_trace 6)))))
      (a!107 (= (__f3 (__f3 (select initial_1_trace 7)))
                (__f3 (__f3 (select initial_1_trace 6)))))
      (a!108 (= (__f7 (__f3 (select initial_1_trace 7))) 0))
      (a!109 (not (__f3 (__f4 (select initial_1_trace 7)))))
      (a!110 (= (__f9 (__f3 (select initial_1_trace 7))) 0))
      (a!111 (not (__f5 (__f4 (select initial_1_trace 7)))))
      (a!112 (= (__f11 (__f3 (select initial_1_trace 7))) 0))
      (a!113 (not (__f7 (__f4 (select initial_1_trace 7)))))
      (a!114 (= (__f12 (__f3 (select initial_1_trace 7))) 0))
      (a!115 (not (__f8 (__f4 (select initial_1_trace 7)))))
      (a!116 (not (__f1 (__f5 (select initial_1_trace 7)))))
      (a!117 (not (__f2 (__f5 (select initial_1_trace 7)))))
      (a!118 (not (__f9 (__f1 (select initial_1_trace 7)))))
      (a!120 (= (__f4 (__f3 (select initial_1_trace 8))) 0))
      (a!121 (= (__f4 (__f3 (select initial_1_trace 8))) 1))
      (a!122 (= (__f1 (__f3 (select initial_1_trace 8)))
                (__f1 (__f3 (select initial_1_trace 7)))))
      (a!123 (= (__f2 (__f3 (select initial_1_trace 8)))
                (__f2 (__f3 (select initial_1_trace 7)))))
      (a!124 (= (__f3 (__f3 (select initial_1_trace 8)))
                (__f3 (__f3 (select initial_1_trace 7)))))
      (a!125 (= (__f7 (__f3 (select initial_1_trace 8))) 0))
      (a!126 (not (__f3 (__f4 (select initial_1_trace 8)))))
      (a!127 (= (__f9 (__f3 (select initial_1_trace 8))) 0))
      (a!128 (not (__f5 (__f4 (select initial_1_trace 8)))))
      (a!129 (= (__f11 (__f3 (select initial_1_trace 8))) 0))
      (a!130 (not (__f7 (__f4 (select initial_1_trace 8)))))
      (a!131 (= (__f12 (__f3 (select initial_1_trace 8))) 0))
      (a!132 (not (__f8 (__f4 (select initial_1_trace 8)))))
      (a!133 (not (__f1 (__f5 (select initial_1_trace 8)))))
      (a!134 (not (__f2 (__f5 (select initial_1_trace 8)))))
      (a!135 (not (__f9 (__f1 (select initial_1_trace 8))))))
(let ((a!17 (or (and (or (not a!1) a!2)
                     a!1
                     a!3
                     a!4
                     a!5
                     a!6
                     a!7
                     a!8
                     a!9
                     a!10
                     a!11
                     a!12
                     a!13
                     a!14
                     a!15)
                a!16))
      (a!34 (or (and (or (not a!18) a!19)
                     a!18
                     a!20
                     a!21
                     a!22
                     a!23
                     a!24
                     a!25
                     a!26
                     a!27
                     a!28
                     a!29
                     a!30
                     a!31
                     a!32)
                a!33))
      (a!51 (or (and (or (not a!35) a!36)
                     a!35
                     a!37
                     a!38
                     a!39
                     a!40
                     a!41
                     a!42
                     a!43
                     a!44
                     a!45
                     a!46
                     a!47
                     a!48
                     a!49)
                a!50))
      (a!68 (or (and (or (not a!52) a!53)
                     a!52
                     a!54
                     a!55
                     a!56
                     a!57
                     a!58
                     a!59
                     a!60
                     a!61
                     a!62
                     a!63
                     a!64
                     a!65
                     a!66)
                a!67))
      (a!85 (or (and (or (not a!69) a!70)
                     a!69
                     a!71
                     a!72
                     a!73
                     a!74
                     a!75
                     a!76
                     a!77
                     a!78
                     a!79
                     a!80
                     a!81
                     a!82
                     a!83)
                a!84))
      (a!102 (or (and (or (not a!86) a!87)
                      a!86
                      a!88
                      a!89
                      a!90
                      a!91
                      a!92
                      a!93
                      a!94
                      a!95
                      a!96
                      a!97
                      a!98
                      a!99
                      a!100)
                 a!101))
      (a!119 (or (and (or (not a!103) a!104)
                      a!103
                      a!105
                      a!106
                      a!107
                      a!108
                      a!109
                      a!110
                      a!111
                      a!112
                      a!113
                      a!114
                      a!115
                      a!116
                      a!117)
                 a!118))
      (a!136 (or (and (or (not a!120) a!121)
                      a!120
                      a!122
                      a!123
                      a!124
                      a!125
                      a!126
                      a!127
                      a!128
                      a!129
                      a!130
                      a!131
                      a!132
                      a!133
                      a!134)
                 a!135)))
  (and a!17 a!34 a!51 a!68 a!85 a!102 a!119 a!136))))
(assert (let ((a!1 (_tuple_0 false false false false false false false false false))
      (a!2 (= (__f5 (__f3 (select initial_1_trace 1))) 0))
      (a!4 (= (__f5 (__f3 (select initial_1_trace 2))) 0))
      (a!6 (= (__f5 (__f3 (select initial_1_trace 3))) 0))
      (a!8 (= (__f5 (__f3 (select initial_1_trace 4))) 0))
      (a!10 (= (__f5 (__f3 (select initial_1_trace 5))) 0))
      (a!12 (= (__f5 (__f3 (select initial_1_trace 6))) 0))
      (a!14 (= (__f5 (__f3 (select initial_1_trace 7))) 0))
      (a!16 (= (__f5 (__f3 (select initial_1_trace 8))) 0))
      (a!18 (= (__f5 (__f3 (select initial_1_trace 9))) 0))
      (a!20 (= (__f5 (__f3 (select initial_1_trace 10))) 0))
      (a!22 (= (__f5 (__f3 (select initial_1_trace 11))) 0))
      (a!24 (= (__f5 (__f3 (select initial_1_trace 12))) 0))
      (a!26 (= (__f5 (__f3 (select initial_1_trace 13))) 0))
      (a!28 (= (__f5 (__f3 (select initial_1_trace 14))) 0))
      (a!30 (= (__f5 (__f3 (select initial_1_trace 15))) 0))
      (a!32 (= (__f5 (__f3 (select initial_1_trace 16))) 0))
      (a!34 (= (__f5 (__f3 (select initial_1_trace 17))) 0)))
(let ((a!3 (or (__f1 (__f4 (select initial_1_trace 1)))
               (= (__f1 (select initial_1_trace 1)) a!1)
               a!2))
      (a!5 (or (__f1 (__f4 (select initial_1_trace 2)))
               (= (__f1 (select initial_1_trace 2)) a!1)
               a!4))
      (a!7 (or (__f1 (__f4 (select initial_1_trace 3)))
               (= (__f1 (select initial_1_trace 3)) a!1)
               a!6))
      (a!9 (or (__f1 (__f4 (select initial_1_trace 4)))
               (= (__f1 (select initial_1_trace 4)) a!1)
               a!8))
      (a!11 (or (__f1 (__f4 (select initial_1_trace 5)))
                (= (__f1 (select initial_1_trace 5)) a!1)
                a!10))
      (a!13 (or (__f1 (__f4 (select initial_1_trace 6)))
                (= (__f1 (select initial_1_trace 6)) a!1)
                a!12))
      (a!15 (or (__f1 (__f4 (select initial_1_trace 7)))
                (= (__f1 (select initial_1_trace 7)) a!1)
                a!14))
      (a!17 (or (__f1 (__f4 (select initial_1_trace 8)))
                (= (__f1 (select initial_1_trace 8)) a!1)
                a!16))
      (a!19 (or (__f1 (__f4 (select initial_1_trace 9)))
                (= (__f1 (select initial_1_trace 9)) a!1)
                a!18))
      (a!21 (or (__f1 (__f4 (select initial_1_trace 10)))
                (= (__f1 (select initial_1_trace 10)) a!1)
                a!20))
      (a!23 (or (__f1 (__f4 (select initial_1_trace 11)))
                (= (__f1 (select initial_1_trace 11)) a!1)
                a!22))
      (a!25 (or (__f1 (__f4 (select initial_1_trace 12)))
                (= (__f1 (select initial_1_trace 12)) a!1)
                a!24))
      (a!27 (or (__f1 (__f4 (select initial_1_trace 13)))
                (= (__f1 (select initial_1_trace 13)) a!1)
                a!26))
      (a!29 (or (__f1 (__f4 (select initial_1_trace 14)))
                (= (__f1 (select initial_1_trace 14)) a!1)
                a!28))
      (a!31 (or (__f1 (__f4 (select initial_1_trace 15)))
                (= (__f1 (select initial_1_trace 15)) a!1)
                a!30))
      (a!33 (or (__f1 (__f4 (select initial_1_trace 16)))
                (= (__f1 (select initial_1_trace 16)) a!1)
                a!32))
      (a!35 (or (__f1 (__f4 (select initial_1_trace 17)))
                (= (__f1 (select initial_1_trace 17)) a!1)
                a!34)))
  (and a!3
       a!5
       a!7
       a!9
       a!11
       a!13
       a!15
       a!17
       a!19
       a!21
       a!23
       a!25
       a!27
       a!29
       a!31
       a!33
       a!35))))
(assert (let ((a!1 (= (__f1 (__f3 (select initial_1_trace 1)))
              (__f13 (__f3 (select initial_1_trace 1)))))
      (a!2 (= (__f2 (__f3 (select initial_1_trace 1)))
              (__f2 (__f3 (select initial_1_trace 0)))))
      (a!3 (= (__f3 (__f3 (select initial_1_trace 1)))
              (__f3 (__f3 (select initial_1_trace 0)))))
      (a!4 (= (__f4 (__f3 (select initial_1_trace 1)))
              (__f4 (__f3 (select initial_1_trace 0)))))
      (a!5 (= (__f7 (__f3 (select initial_1_trace 1))) 0))
      (a!6 (not (__f3 (__f4 (select initial_1_trace 1)))))
      (a!7 (= (__f9 (__f3 (select initial_1_trace 1))) 0))
      (a!8 (not (__f5 (__f4 (select initial_1_trace 1)))))
      (a!9 (= (__f11 (__f3 (select initial_1_trace 1))) 0))
      (a!10 (not (__f7 (__f4 (select initial_1_trace 1)))))
      (a!11 (= (__f12 (__f3 (select initial_1_trace 1))) 0))
      (a!12 (not (__f8 (__f4 (select initial_1_trace 1)))))
      (a!13 (not (__f1 (__f5 (select initial_1_trace 1)))))
      (a!14 (not (__f2 (__f5 (select initial_1_trace 1)))))
      (a!15 (not (__f6 (__f1 (select initial_1_trace 1)))))
      (a!16 (= (__f1 (__f3 (select initial_1_trace 2)))
               (__f13 (__f3 (select initial_1_trace 2)))))
      (a!17 (= (__f2 (__f3 (select initial_1_trace 2)))
               (__f2 (__f3 (select initial_1_trace 1)))))
      (a!18 (= (__f3 (__f3 (select initial_1_trace 2)))
               (__f3 (__f3 (select initial_1_trace 1)))))
      (a!19 (= (__f4 (__f3 (select initial_1_trace 2)))
               (__f4 (__f3 (select initial_1_trace 1)))))
      (a!20 (= (__f7 (__f3 (select initial_1_trace 2))) 0))
      (a!21 (not (__f3 (__f4 (select initial_1_trace 2)))))
      (a!22 (= (__f9 (__f3 (select initial_1_trace 2))) 0))
      (a!23 (not (__f5 (__f4 (select initial_1_trace 2)))))
      (a!24 (= (__f11 (__f3 (select initial_1_trace 2))) 0))
      (a!25 (not (__f7 (__f4 (select initial_1_trace 2)))))
      (a!26 (= (__f12 (__f3 (select initial_1_trace 2))) 0))
      (a!27 (not (__f8 (__f4 (select initial_1_trace 2)))))
      (a!28 (not (__f1 (__f5 (select initial_1_trace 2)))))
      (a!29 (not (__f2 (__f5 (select initial_1_trace 2)))))
      (a!30 (not (__f6 (__f1 (select initial_1_trace 2)))))
      (a!31 (= (__f1 (__f3 (select initial_1_trace 3)))
               (__f13 (__f3 (select initial_1_trace 3)))))
      (a!32 (= (__f2 (__f3 (select initial_1_trace 3)))
               (__f2 (__f3 (select initial_1_trace 2)))))
      (a!33 (= (__f3 (__f3 (select initial_1_trace 3)))
               (__f3 (__f3 (select initial_1_trace 2)))))
      (a!34 (= (__f4 (__f3 (select initial_1_trace 3)))
               (__f4 (__f3 (select initial_1_trace 2)))))
      (a!35 (= (__f7 (__f3 (select initial_1_trace 3))) 0))
      (a!36 (not (__f3 (__f4 (select initial_1_trace 3)))))
      (a!37 (= (__f9 (__f3 (select initial_1_trace 3))) 0))
      (a!38 (not (__f5 (__f4 (select initial_1_trace 3)))))
      (a!39 (= (__f11 (__f3 (select initial_1_trace 3))) 0))
      (a!40 (not (__f7 (__f4 (select initial_1_trace 3)))))
      (a!41 (= (__f12 (__f3 (select initial_1_trace 3))) 0))
      (a!42 (not (__f8 (__f4 (select initial_1_trace 3)))))
      (a!43 (not (__f1 (__f5 (select initial_1_trace 3)))))
      (a!44 (not (__f2 (__f5 (select initial_1_trace 3)))))
      (a!45 (not (__f6 (__f1 (select initial_1_trace 3)))))
      (a!46 (= (__f1 (__f3 (select initial_1_trace 4)))
               (__f13 (__f3 (select initial_1_trace 4)))))
      (a!47 (= (__f2 (__f3 (select initial_1_trace 4)))
               (__f2 (__f3 (select initial_1_trace 3)))))
      (a!48 (= (__f3 (__f3 (select initial_1_trace 4)))
               (__f3 (__f3 (select initial_1_trace 3)))))
      (a!49 (= (__f4 (__f3 (select initial_1_trace 4)))
               (__f4 (__f3 (select initial_1_trace 3)))))
      (a!50 (= (__f7 (__f3 (select initial_1_trace 4))) 0))
      (a!51 (not (__f3 (__f4 (select initial_1_trace 4)))))
      (a!52 (= (__f9 (__f3 (select initial_1_trace 4))) 0))
      (a!53 (not (__f5 (__f4 (select initial_1_trace 4)))))
      (a!54 (= (__f11 (__f3 (select initial_1_trace 4))) 0))
      (a!55 (not (__f7 (__f4 (select initial_1_trace 4)))))
      (a!56 (= (__f12 (__f3 (select initial_1_trace 4))) 0))
      (a!57 (not (__f8 (__f4 (select initial_1_trace 4)))))
      (a!58 (not (__f1 (__f5 (select initial_1_trace 4)))))
      (a!59 (not (__f2 (__f5 (select initial_1_trace 4)))))
      (a!60 (not (__f6 (__f1 (select initial_1_trace 4)))))
      (a!61 (= (__f1 (__f3 (select initial_1_trace 5)))
               (__f13 (__f3 (select initial_1_trace 5)))))
      (a!62 (= (__f2 (__f3 (select initial_1_trace 5)))
               (__f2 (__f3 (select initial_1_trace 4)))))
      (a!63 (= (__f3 (__f3 (select initial_1_trace 5)))
               (__f3 (__f3 (select initial_1_trace 4)))))
      (a!64 (= (__f4 (__f3 (select initial_1_trace 5)))
               (__f4 (__f3 (select initial_1_trace 4)))))
      (a!65 (= (__f7 (__f3 (select initial_1_trace 5))) 0))
      (a!66 (not (__f3 (__f4 (select initial_1_trace 5)))))
      (a!67 (= (__f9 (__f3 (select initial_1_trace 5))) 0))
      (a!68 (not (__f5 (__f4 (select initial_1_trace 5)))))
      (a!69 (= (__f11 (__f3 (select initial_1_trace 5))) 0))
      (a!70 (not (__f7 (__f4 (select initial_1_trace 5)))))
      (a!71 (= (__f12 (__f3 (select initial_1_trace 5))) 0))
      (a!72 (not (__f8 (__f4 (select initial_1_trace 5)))))
      (a!73 (not (__f1 (__f5 (select initial_1_trace 5)))))
      (a!74 (not (__f2 (__f5 (select initial_1_trace 5)))))
      (a!75 (not (__f6 (__f1 (select initial_1_trace 5)))))
      (a!76 (= (__f1 (__f3 (select initial_1_trace 6)))
               (__f13 (__f3 (select initial_1_trace 6)))))
      (a!77 (= (__f2 (__f3 (select initial_1_trace 6)))
               (__f2 (__f3 (select initial_1_trace 5)))))
      (a!78 (= (__f3 (__f3 (select initial_1_trace 6)))
               (__f3 (__f3 (select initial_1_trace 5)))))
      (a!79 (= (__f4 (__f3 (select initial_1_trace 6)))
               (__f4 (__f3 (select initial_1_trace 5)))))
      (a!80 (= (__f7 (__f3 (select initial_1_trace 6))) 0))
      (a!81 (not (__f3 (__f4 (select initial_1_trace 6)))))
      (a!82 (= (__f9 (__f3 (select initial_1_trace 6))) 0))
      (a!83 (not (__f5 (__f4 (select initial_1_trace 6)))))
      (a!84 (= (__f11 (__f3 (select initial_1_trace 6))) 0))
      (a!85 (not (__f7 (__f4 (select initial_1_trace 6)))))
      (a!86 (= (__f12 (__f3 (select initial_1_trace 6))) 0))
      (a!87 (not (__f8 (__f4 (select initial_1_trace 6)))))
      (a!88 (not (__f1 (__f5 (select initial_1_trace 6)))))
      (a!89 (not (__f2 (__f5 (select initial_1_trace 6)))))
      (a!90 (not (__f6 (__f1 (select initial_1_trace 6)))))
      (a!91 (= (__f1 (__f3 (select initial_1_trace 7)))
               (__f13 (__f3 (select initial_1_trace 7)))))
      (a!92 (= (__f2 (__f3 (select initial_1_trace 7)))
               (__f2 (__f3 (select initial_1_trace 6)))))
      (a!93 (= (__f3 (__f3 (select initial_1_trace 7)))
               (__f3 (__f3 (select initial_1_trace 6)))))
      (a!94 (= (__f4 (__f3 (select initial_1_trace 7)))
               (__f4 (__f3 (select initial_1_trace 6)))))
      (a!95 (= (__f7 (__f3 (select initial_1_trace 7))) 0))
      (a!96 (not (__f3 (__f4 (select initial_1_trace 7)))))
      (a!97 (= (__f9 (__f3 (select initial_1_trace 7))) 0))
      (a!98 (not (__f5 (__f4 (select initial_1_trace 7)))))
      (a!99 (= (__f11 (__f3 (select initial_1_trace 7))) 0))
      (a!100 (not (__f7 (__f4 (select initial_1_trace 7)))))
      (a!101 (= (__f12 (__f3 (select initial_1_trace 7))) 0))
      (a!102 (not (__f8 (__f4 (select initial_1_trace 7)))))
      (a!103 (not (__f1 (__f5 (select initial_1_trace 7)))))
      (a!104 (not (__f2 (__f5 (select initial_1_trace 7)))))
      (a!105 (not (__f6 (__f1 (select initial_1_trace 7)))))
      (a!106 (= (__f1 (__f3 (select initial_1_trace 8)))
                (__f13 (__f3 (select initial_1_trace 8)))))
      (a!107 (= (__f2 (__f3 (select initial_1_trace 8)))
                (__f2 (__f3 (select initial_1_trace 7)))))
      (a!108 (= (__f3 (__f3 (select initial_1_trace 8)))
                (__f3 (__f3 (select initial_1_trace 7)))))
      (a!109 (= (__f4 (__f3 (select initial_1_trace 8)))
                (__f4 (__f3 (select initial_1_trace 7)))))
      (a!110 (= (__f7 (__f3 (select initial_1_trace 8))) 0))
      (a!111 (not (__f3 (__f4 (select initial_1_trace 8)))))
      (a!112 (= (__f9 (__f3 (select initial_1_trace 8))) 0))
      (a!113 (not (__f5 (__f4 (select initial_1_trace 8)))))
      (a!114 (= (__f11 (__f3 (select initial_1_trace 8))) 0))
      (a!115 (not (__f7 (__f4 (select initial_1_trace 8)))))
      (a!116 (= (__f12 (__f3 (select initial_1_trace 8))) 0))
      (a!117 (not (__f8 (__f4 (select initial_1_trace 8)))))
      (a!118 (not (__f1 (__f5 (select initial_1_trace 8)))))
      (a!119 (not (__f2 (__f5 (select initial_1_trace 8)))))
      (a!120 (not (__f6 (__f1 (select initial_1_trace 8))))))
  (and (or (and a!1 a!2 a!3 a!4 a!5 a!6 a!7 a!8 a!9 a!10 a!11 a!12 a!13 a!14)
           a!15)
       (or (and a!16
                a!17
                a!18
                a!19
                a!20
                a!21
                a!22
                a!23
                a!24
                a!25
                a!26
                a!27
                a!28
                a!29)
           a!30)
       (or (and a!31
                a!32
                a!33
                a!34
                a!35
                a!36
                a!37
                a!38
                a!39
                a!40
                a!41
                a!42
                a!43
                a!44)
           a!45)
       (or (and a!46
                a!47
                a!48
                a!49
                a!50
                a!51
                a!52
                a!53
                a!54
                a!55
                a!56
                a!57
                a!58
                a!59)
           a!60)
       (or (and a!61
                a!62
                a!63
                a!64
                a!65
                a!66
                a!67
                a!68
                a!69
                a!70
                a!71
                a!72
                a!73
                a!74)
           a!75)
       (or (and a!76
                a!77
                a!78
                a!79
                a!80
                a!81
                a!82
                a!83
                a!84
                a!85
                a!86
                a!87
                a!88
                a!89)
           a!90)
       (or (and a!91
                a!92
                a!93
                a!94
                a!95
                a!96
                a!97
                a!98
                a!99
                a!100
                a!101
                a!102
                a!103
                a!104)
           a!105)
       (or (and a!106
                a!107
                a!108
                a!109
                a!110
                a!111
                a!112
                a!113
                a!114
                a!115
                a!116
                a!117
                a!118
                a!119)
           a!120))))
(assert (let ((a!1 (and (__f11 (__f4 (select initial_1_trace 1)))
                (= (__f2 (select initial_1_trace 1)) (_tuple_2 100000000 0))))
      (a!2 (and (__f11 (__f4 (select initial_1_trace 2)))
                (= (__f2 (select initial_1_trace 2)) (_tuple_2 100000000 0))))
      (a!3 (and (__f11 (__f4 (select initial_1_trace 3)))
                (= (__f2 (select initial_1_trace 3)) (_tuple_2 100000000 0))))
      (a!4 (and (__f11 (__f4 (select initial_1_trace 4)))
                (= (__f2 (select initial_1_trace 4)) (_tuple_2 100000000 0))))
      (a!5 (and (__f11 (__f4 (select initial_1_trace 5)))
                (= (__f2 (select initial_1_trace 5)) (_tuple_2 100000000 0))))
      (a!6 (and (__f11 (__f4 (select initial_1_trace 6)))
                (= (__f2 (select initial_1_trace 6)) (_tuple_2 100000000 0))))
      (a!7 (and (__f11 (__f4 (select initial_1_trace 7)))
                (= (__f2 (select initial_1_trace 7)) (_tuple_2 100000000 0))))
      (a!8 (and (__f11 (__f4 (select initial_1_trace 8)))
                (= (__f2 (select initial_1_trace 8)) (_tuple_2 100000000 0))))
      (a!9 (>= (__f1 (__f2 (select initial_1_trace 8))) 100000000))
      (a!10 (<= 100000000 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!11 (_tuple_0 false false false false false false false false false)))
(let ((a!12 (not (= (__f1 (select initial_1_trace 1)) a!11)))
      (a!13 (not (= (__f1 (select initial_1_trace 2)) a!11)))
      (a!14 (not (= (__f1 (select initial_1_trace 3)) a!11)))
      (a!15 (not (= (__f1 (select initial_1_trace 4)) a!11)))
      (a!16 (not (= (__f1 (select initial_1_trace 5)) a!11)))
      (a!17 (not (= (__f1 (select initial_1_trace 6)) a!11)))
      (a!18 (not (= (__f1 (select initial_1_trace 7)) a!11)))
      (a!19 (not (= (__f1 (select initial_1_trace 8)) a!11))))
  (and (or a!1 a!2 a!3 a!4 a!5 a!6 a!7 a!8 (not a!9))
       (or a!10 (and a!12 a!13 a!14 a!15 a!16 a!17 a!18 a!19))))))
(assert (let ((a!1 (_tuple_0 false false false false false false false false false)))
(let ((a!2 (not (= (__f1 (select initial_1_trace 1)) a!1)))
      (a!4 (not (= (__f1 (select initial_1_trace 2)) a!1)))
      (a!6 (not (= (__f1 (select initial_1_trace 3)) a!1)))
      (a!8 (not (= (__f1 (select initial_1_trace 4)) a!1)))
      (a!10 (not (= (__f1 (select initial_1_trace 5)) a!1)))
      (a!12 (not (= (__f1 (select initial_1_trace 6)) a!1)))
      (a!14 (not (= (__f1 (select initial_1_trace 7)) a!1)))
      (a!16 (not (= (__f1 (select initial_1_trace 8)) a!1)))
      (a!18 (not (= (__f1 (select initial_1_trace 9)) a!1)))
      (a!20 (not (= (__f1 (select initial_1_trace 10)) a!1)))
      (a!22 (not (= (__f1 (select initial_1_trace 11)) a!1)))
      (a!24 (not (= (__f1 (select initial_1_trace 12)) a!1)))
      (a!26 (not (= (__f1 (select initial_1_trace 13)) a!1)))
      (a!28 (not (= (__f1 (select initial_1_trace 14)) a!1)))
      (a!30 (not (= (__f1 (select initial_1_trace 15)) a!1)))
      (a!32 (not (= (__f1 (select initial_1_trace 16)) a!1))))
(let ((a!3 (or a!2 (= (__f1 (select initial_1_trace 2)) a!1)))
      (a!5 (or (= (__f1 (select initial_1_trace 3)) a!1) (and a!2 a!4)))
      (a!7 (or (= (__f1 (select initial_1_trace 4)) a!1) (and a!2 a!4 a!6)))
      (a!9 (or (= (__f1 (select initial_1_trace 5)) a!1) (and a!2 a!4 a!6 a!8)))
      (a!11 (or (= (__f1 (select initial_1_trace 6)) a!1)
                (and a!2 a!4 a!6 a!8 a!10)))
      (a!13 (or (= (__f1 (select initial_1_trace 7)) a!1)
                (and a!2 a!4 a!6 a!8 a!10 a!12)))
      (a!15 (or (= (__f1 (select initial_1_trace 8)) a!1)
                (and a!2 a!4 a!6 a!8 a!10 a!12 a!14)))
      (a!17 (or (= (__f1 (select initial_1_trace 9)) a!1)
                (and a!2 a!4 a!6 a!8 a!10 a!12 a!14 a!16)))
      (a!19 (or (= (__f1 (select initial_1_trace 10)) a!1)
                (and a!2 a!4 a!6 a!8 a!10 a!12 a!14 a!16 a!18)))
      (a!21 (or (= (__f1 (select initial_1_trace 11)) a!1)
                (and a!2 a!4 a!6 a!8 a!10 a!12 a!14 a!16 a!18 a!20)))
      (a!23 (or (= (__f1 (select initial_1_trace 12)) a!1)
                (and a!2 a!4 a!6 a!8 a!10 a!12 a!14 a!16 a!18 a!20 a!22)))
      (a!25 (or (= (__f1 (select initial_1_trace 13)) a!1)
                (and a!2 a!4 a!6 a!8 a!10 a!12 a!14 a!16 a!18 a!20 a!22 a!24)))
      (a!27 (or (= (__f1 (select initial_1_trace 14)) a!1)
                (and a!2
                     a!4
                     a!6
                     a!8
                     a!10
                     a!12
                     a!14
                     a!16
                     a!18
                     a!20
                     a!22
                     a!24
                     a!26)))
      (a!29 (or (= (__f1 (select initial_1_trace 15)) a!1)
                (and a!2
                     a!4
                     a!6
                     a!8
                     a!10
                     a!12
                     a!14
                     a!16
                     a!18
                     a!20
                     a!22
                     a!24
                     a!26
                     a!28)))
      (a!31 (or (= (__f1 (select initial_1_trace 16)) a!1)
                (and a!2
                     a!4
                     a!6
                     a!8
                     a!10
                     a!12
                     a!14
                     a!16
                     a!18
                     a!20
                     a!22
                     a!24
                     a!26
                     a!28
                     a!30)))
      (a!33 (or (= (__f1 (select initial_1_trace 17)) a!1)
                (and a!2
                     a!4
                     a!6
                     a!8
                     a!10
                     a!12
                     a!14
                     a!16
                     a!18
                     a!20
                     a!22
                     a!24
                     a!26
                     a!28
                     a!30
                     a!32))))
  (and a!3
       a!5
       a!7
       a!9
       a!11
       a!13
       a!15
       a!17
       a!19
       a!21
       a!23
       a!25
       a!27
       a!29
       a!31
       a!33)))))
(assert (let ((a!1 (not (__f11 (__f4 (select initial_1_trace 0)))))
      (a!2 (+ 100000000 (__f1 (__f2 (select initial_1_trace 0)))))
      (a!20 (not (__f11 (__f4 (select initial_1_trace 1)))))
      (a!21 (+ 100000000 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!38 (not (__f11 (__f4 (select initial_1_trace 2)))))
      (a!39 (+ 100000000 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!55 (not (__f11 (__f4 (select initial_1_trace 3)))))
      (a!56 (+ 100000000 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!71 (not (__f11 (__f4 (select initial_1_trace 4)))))
      (a!72 (+ 100000000 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!86 (not (__f11 (__f4 (select initial_1_trace 5)))))
      (a!87 (+ 100000000 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!100 (not (__f11 (__f4 (select initial_1_trace 6)))))
      (a!101 (+ 100000000 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!113 (not (__f11 (__f4 (select initial_1_trace 7)))))
      (a!114 (+ 100000000 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!125 (not (__f11 (__f4 (select initial_1_trace 8)))))
      (a!126 (+ 100000000 (__f1 (__f2 (select initial_1_trace 8))))))
(let ((a!3 (and (__f11 (__f4 (select initial_1_trace 1)))
                (= (__f2 (select initial_1_trace 1)) (_tuple_2 a!2 0))))
      (a!4 (and (__f11 (__f4 (select initial_1_trace 2)))
                (= (__f2 (select initial_1_trace 2)) (_tuple_2 a!2 0))))
      (a!5 (and (__f11 (__f4 (select initial_1_trace 3)))
                (= (__f2 (select initial_1_trace 3)) (_tuple_2 a!2 0))))
      (a!6 (and (__f11 (__f4 (select initial_1_trace 4)))
                (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!2 0))))
      (a!7 (and (__f11 (__f4 (select initial_1_trace 5)))
                (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!2 0))))
      (a!8 (and (__f11 (__f4 (select initial_1_trace 6)))
                (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!2 0))))
      (a!9 (and (__f11 (__f4 (select initial_1_trace 7)))
                (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!2 0))))
      (a!10 (and (__f11 (__f4 (select initial_1_trace 8)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!2 0))))
      (a!11 (and (__f11 (__f4 (select initial_1_trace 9)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!2 0))))
      (a!12 (and (__f11 (__f4 (select initial_1_trace 10)))
                 (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!2 0))))
      (a!13 (and (__f11 (__f4 (select initial_1_trace 11)))
                 (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!2 0))))
      (a!14 (and (__f11 (__f4 (select initial_1_trace 12)))
                 (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!2 0))))
      (a!15 (and (__f11 (__f4 (select initial_1_trace 13)))
                 (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!2 0))))
      (a!16 (and (__f11 (__f4 (select initial_1_trace 14)))
                 (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!2 0))))
      (a!17 (and (__f11 (__f4 (select initial_1_trace 15)))
                 (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!2 0))))
      (a!18 (and (__f11 (__f4 (select initial_1_trace 16)))
                 (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!2 0))))
      (a!19 (and (__f11 (__f4 (select initial_1_trace 17)))
                 (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!2 0))))
      (a!22 (and (__f11 (__f4 (select initial_1_trace 2)))
                 (= (__f2 (select initial_1_trace 2)) (_tuple_2 a!21 0))))
      (a!23 (and (__f11 (__f4 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 3)) (_tuple_2 a!21 0))))
      (a!24 (and (__f11 (__f4 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!21 0))))
      (a!25 (and (__f11 (__f4 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!21 0))))
      (a!26 (and (__f11 (__f4 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!21 0))))
      (a!27 (and (__f11 (__f4 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!21 0))))
      (a!28 (and (__f11 (__f4 (select initial_1_trace 8)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!21 0))))
      (a!29 (and (__f11 (__f4 (select initial_1_trace 9)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!21 0))))
      (a!30 (and (__f11 (__f4 (select initial_1_trace 10)))
                 (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!21 0))))
      (a!31 (and (__f11 (__f4 (select initial_1_trace 11)))
                 (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!21 0))))
      (a!32 (and (__f11 (__f4 (select initial_1_trace 12)))
                 (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!21 0))))
      (a!33 (and (__f11 (__f4 (select initial_1_trace 13)))
                 (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!21 0))))
      (a!34 (and (__f11 (__f4 (select initial_1_trace 14)))
                 (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!21 0))))
      (a!35 (and (__f11 (__f4 (select initial_1_trace 15)))
                 (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!21 0))))
      (a!36 (and (__f11 (__f4 (select initial_1_trace 16)))
                 (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!21 0))))
      (a!37 (and (__f11 (__f4 (select initial_1_trace 17)))
                 (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!21 0))))
      (a!40 (and (__f11 (__f4 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 3)) (_tuple_2 a!39 0))))
      (a!41 (and (__f11 (__f4 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!39 0))))
      (a!42 (and (__f11 (__f4 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!39 0))))
      (a!43 (and (__f11 (__f4 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!39 0))))
      (a!44 (and (__f11 (__f4 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!39 0))))
      (a!45 (and (__f11 (__f4 (select initial_1_trace 8)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!39 0))))
      (a!46 (and (__f11 (__f4 (select initial_1_trace 9)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!39 0))))
      (a!47 (and (__f11 (__f4 (select initial_1_trace 10)))
                 (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!39 0))))
      (a!48 (and (__f11 (__f4 (select initial_1_trace 11)))
                 (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!39 0))))
      (a!49 (and (__f11 (__f4 (select initial_1_trace 12)))
                 (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!39 0))))
      (a!50 (and (__f11 (__f4 (select initial_1_trace 13)))
                 (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!39 0))))
      (a!51 (and (__f11 (__f4 (select initial_1_trace 14)))
                 (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!39 0))))
      (a!52 (and (__f11 (__f4 (select initial_1_trace 15)))
                 (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!39 0))))
      (a!53 (and (__f11 (__f4 (select initial_1_trace 16)))
                 (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!39 0))))
      (a!54 (and (__f11 (__f4 (select initial_1_trace 17)))
                 (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!39 0))))
      (a!57 (and (__f11 (__f4 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!56 0))))
      (a!58 (and (__f11 (__f4 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!56 0))))
      (a!59 (and (__f11 (__f4 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!56 0))))
      (a!60 (and (__f11 (__f4 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!56 0))))
      (a!61 (and (__f11 (__f4 (select initial_1_trace 8)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!56 0))))
      (a!62 (and (__f11 (__f4 (select initial_1_trace 9)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!56 0))))
      (a!63 (and (__f11 (__f4 (select initial_1_trace 10)))
                 (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!56 0))))
      (a!64 (and (__f11 (__f4 (select initial_1_trace 11)))
                 (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!56 0))))
      (a!65 (and (__f11 (__f4 (select initial_1_trace 12)))
                 (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!56 0))))
      (a!66 (and (__f11 (__f4 (select initial_1_trace 13)))
                 (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!56 0))))
      (a!67 (and (__f11 (__f4 (select initial_1_trace 14)))
                 (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!56 0))))
      (a!68 (and (__f11 (__f4 (select initial_1_trace 15)))
                 (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!56 0))))
      (a!69 (and (__f11 (__f4 (select initial_1_trace 16)))
                 (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!56 0))))
      (a!70 (and (__f11 (__f4 (select initial_1_trace 17)))
                 (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!56 0))))
      (a!73 (and (__f11 (__f4 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!72 0))))
      (a!74 (and (__f11 (__f4 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!72 0))))
      (a!75 (and (__f11 (__f4 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!72 0))))
      (a!76 (and (__f11 (__f4 (select initial_1_trace 8)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!72 0))))
      (a!77 (and (__f11 (__f4 (select initial_1_trace 9)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!72 0))))
      (a!78 (and (__f11 (__f4 (select initial_1_trace 10)))
                 (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!72 0))))
      (a!79 (and (__f11 (__f4 (select initial_1_trace 11)))
                 (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!72 0))))
      (a!80 (and (__f11 (__f4 (select initial_1_trace 12)))
                 (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!72 0))))
      (a!81 (and (__f11 (__f4 (select initial_1_trace 13)))
                 (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!72 0))))
      (a!82 (and (__f11 (__f4 (select initial_1_trace 14)))
                 (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!72 0))))
      (a!83 (and (__f11 (__f4 (select initial_1_trace 15)))
                 (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!72 0))))
      (a!84 (and (__f11 (__f4 (select initial_1_trace 16)))
                 (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!72 0))))
      (a!85 (and (__f11 (__f4 (select initial_1_trace 17)))
                 (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!72 0))))
      (a!88 (and (__f11 (__f4 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!87 0))))
      (a!89 (and (__f11 (__f4 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!87 0))))
      (a!90 (and (__f11 (__f4 (select initial_1_trace 8)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!87 0))))
      (a!91 (and (__f11 (__f4 (select initial_1_trace 9)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!87 0))))
      (a!92 (and (__f11 (__f4 (select initial_1_trace 10)))
                 (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!87 0))))
      (a!93 (and (__f11 (__f4 (select initial_1_trace 11)))
                 (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!87 0))))
      (a!94 (and (__f11 (__f4 (select initial_1_trace 12)))
                 (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!87 0))))
      (a!95 (and (__f11 (__f4 (select initial_1_trace 13)))
                 (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!87 0))))
      (a!96 (and (__f11 (__f4 (select initial_1_trace 14)))
                 (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!87 0))))
      (a!97 (and (__f11 (__f4 (select initial_1_trace 15)))
                 (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!87 0))))
      (a!98 (and (__f11 (__f4 (select initial_1_trace 16)))
                 (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!87 0))))
      (a!99 (and (__f11 (__f4 (select initial_1_trace 17)))
                 (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!87 0))))
      (a!102 (and (__f11 (__f4 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!101 0))))
      (a!103 (and (__f11 (__f4 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!101 0))))
      (a!104 (and (__f11 (__f4 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!101 0))))
      (a!105 (and (__f11 (__f4 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!101 0))))
      (a!106 (and (__f11 (__f4 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!101 0))))
      (a!107 (and (__f11 (__f4 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!101 0))))
      (a!108 (and (__f11 (__f4 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!101 0))))
      (a!109 (and (__f11 (__f4 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!101 0))))
      (a!110 (and (__f11 (__f4 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!101 0))))
      (a!111 (and (__f11 (__f4 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!101 0))))
      (a!112 (and (__f11 (__f4 (select initial_1_trace 17)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!101 0))))
      (a!115 (and (__f11 (__f4 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!114 0))))
      (a!116 (and (__f11 (__f4 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!114 0))))
      (a!117 (and (__f11 (__f4 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!114 0))))
      (a!118 (and (__f11 (__f4 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!114 0))))
      (a!119 (and (__f11 (__f4 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!114 0))))
      (a!120 (and (__f11 (__f4 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!114 0))))
      (a!121 (and (__f11 (__f4 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!114 0))))
      (a!122 (and (__f11 (__f4 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!114 0))))
      (a!123 (and (__f11 (__f4 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!114 0))))
      (a!124 (and (__f11 (__f4 (select initial_1_trace 17)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!114 0))))
      (a!127 (and (__f11 (__f4 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!126 0))))
      (a!128 (and (__f11 (__f4 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!126 0))))
      (a!129 (and (__f11 (__f4 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!126 0))))
      (a!130 (and (__f11 (__f4 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!126 0))))
      (a!131 (and (__f11 (__f4 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!126 0))))
      (a!132 (and (__f11 (__f4 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!126 0))))
      (a!133 (and (__f11 (__f4 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!126 0))))
      (a!134 (and (__f11 (__f4 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!126 0))))
      (a!135 (and (__f11 (__f4 (select initial_1_trace 17)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!126 0)))))
  (and (or a!1
           a!3
           a!4
           a!5
           a!6
           a!7
           a!8
           a!9
           a!10
           a!11
           a!12
           a!13
           a!14
           a!15
           a!16
           a!17
           a!18
           a!19)
       (or a!20
           a!22
           a!23
           a!24
           a!25
           a!26
           a!27
           a!28
           a!29
           a!30
           a!31
           a!32
           a!33
           a!34
           a!35
           a!36
           a!37)
       (or a!38
           a!40
           a!41
           a!42
           a!43
           a!44
           a!45
           a!46
           a!47
           a!48
           a!49
           a!50
           a!51
           a!52
           a!53
           a!54)
       (or a!55
           a!57
           a!58
           a!59
           a!60
           a!61
           a!62
           a!63
           a!64
           a!65
           a!66
           a!67
           a!68
           a!69
           a!70)
       (or a!71
           a!73
           a!74
           a!75
           a!76
           a!77
           a!78
           a!79
           a!80
           a!81
           a!82
           a!83
           a!84
           a!85)
       (or a!86 a!88 a!89 a!90 a!91 a!92 a!93 a!94 a!95 a!96 a!97 a!98 a!99)
       (or a!100
           a!102
           a!103
           a!104
           a!105
           a!106
           a!107
           a!108
           a!109
           a!110
           a!111
           a!112)
       (or a!113 a!115 a!116 a!117 a!118 a!119 a!120 a!121 a!122 a!123 a!124)
       (or a!125 a!127 a!128 a!129 a!130 a!131 a!132 a!133 a!134 a!135)))))
(assert (let ((a!1 (= (__f7 (__f3 (select initial_1_trace 1))) 1))
      (a!2 (= (__f1 (__f3 (select initial_1_trace 1)))
              (__f1 (__f3 (select initial_1_trace 0)))))
      (a!3 (= (__f2 (__f3 (select initial_1_trace 1)))
              (__f2 (__f3 (select initial_1_trace 0)))))
      (a!4 (= (__f3 (__f3 (select initial_1_trace 1)))
              (__f3 (__f3 (select initial_1_trace 0)))))
      (a!5 (= (__f4 (__f3 (select initial_1_trace 1)))
              (__f4 (__f3 (select initial_1_trace 0)))))
      (a!6 (= (__f9 (__f3 (select initial_1_trace 1))) 0))
      (a!7 (not (__f5 (__f4 (select initial_1_trace 1)))))
      (a!8 (= (__f11 (__f3 (select initial_1_trace 1))) 0))
      (a!9 (not (__f7 (__f4 (select initial_1_trace 1)))))
      (a!10 (= (__f12 (__f3 (select initial_1_trace 1))) 0))
      (a!11 (not (__f8 (__f4 (select initial_1_trace 1)))))
      (a!12 (not (__f1 (__f5 (select initial_1_trace 1)))))
      (a!13 (not (__f2 (__f5 (select initial_1_trace 1)))))
      (a!15 (not (__f1 (__f1 (select initial_1_trace 1)))))
      (a!16 (= (__f7 (__f3 (select initial_1_trace 2))) 1))
      (a!17 (= (__f1 (__f3 (select initial_1_trace 2)))
               (__f1 (__f3 (select initial_1_trace 1)))))
      (a!18 (= (__f2 (__f3 (select initial_1_trace 2)))
               (__f2 (__f3 (select initial_1_trace 1)))))
      (a!19 (= (__f3 (__f3 (select initial_1_trace 2)))
               (__f3 (__f3 (select initial_1_trace 1)))))
      (a!20 (= (__f4 (__f3 (select initial_1_trace 2)))
               (__f4 (__f3 (select initial_1_trace 1)))))
      (a!21 (= (__f9 (__f3 (select initial_1_trace 2))) 0))
      (a!22 (not (__f5 (__f4 (select initial_1_trace 2)))))
      (a!23 (= (__f11 (__f3 (select initial_1_trace 2))) 0))
      (a!24 (not (__f7 (__f4 (select initial_1_trace 2)))))
      (a!25 (= (__f12 (__f3 (select initial_1_trace 2))) 0))
      (a!26 (not (__f8 (__f4 (select initial_1_trace 2)))))
      (a!27 (not (__f1 (__f5 (select initial_1_trace 2)))))
      (a!28 (not (__f2 (__f5 (select initial_1_trace 2)))))
      (a!30 (not (__f1 (__f1 (select initial_1_trace 2)))))
      (a!31 (= (__f7 (__f3 (select initial_1_trace 3))) 1))
      (a!32 (= (__f1 (__f3 (select initial_1_trace 3)))
               (__f1 (__f3 (select initial_1_trace 2)))))
      (a!33 (= (__f2 (__f3 (select initial_1_trace 3)))
               (__f2 (__f3 (select initial_1_trace 2)))))
      (a!34 (= (__f3 (__f3 (select initial_1_trace 3)))
               (__f3 (__f3 (select initial_1_trace 2)))))
      (a!35 (= (__f4 (__f3 (select initial_1_trace 3)))
               (__f4 (__f3 (select initial_1_trace 2)))))
      (a!36 (= (__f9 (__f3 (select initial_1_trace 3))) 0))
      (a!37 (not (__f5 (__f4 (select initial_1_trace 3)))))
      (a!38 (= (__f11 (__f3 (select initial_1_trace 3))) 0))
      (a!39 (not (__f7 (__f4 (select initial_1_trace 3)))))
      (a!40 (= (__f12 (__f3 (select initial_1_trace 3))) 0))
      (a!41 (not (__f8 (__f4 (select initial_1_trace 3)))))
      (a!42 (not (__f1 (__f5 (select initial_1_trace 3)))))
      (a!43 (not (__f2 (__f5 (select initial_1_trace 3)))))
      (a!45 (not (__f1 (__f1 (select initial_1_trace 3)))))
      (a!46 (= (__f7 (__f3 (select initial_1_trace 4))) 1))
      (a!47 (= (__f1 (__f3 (select initial_1_trace 4)))
               (__f1 (__f3 (select initial_1_trace 3)))))
      (a!48 (= (__f2 (__f3 (select initial_1_trace 4)))
               (__f2 (__f3 (select initial_1_trace 3)))))
      (a!49 (= (__f3 (__f3 (select initial_1_trace 4)))
               (__f3 (__f3 (select initial_1_trace 3)))))
      (a!50 (= (__f4 (__f3 (select initial_1_trace 4)))
               (__f4 (__f3 (select initial_1_trace 3)))))
      (a!51 (= (__f9 (__f3 (select initial_1_trace 4))) 0))
      (a!52 (not (__f5 (__f4 (select initial_1_trace 4)))))
      (a!53 (= (__f11 (__f3 (select initial_1_trace 4))) 0))
      (a!54 (not (__f7 (__f4 (select initial_1_trace 4)))))
      (a!55 (= (__f12 (__f3 (select initial_1_trace 4))) 0))
      (a!56 (not (__f8 (__f4 (select initial_1_trace 4)))))
      (a!57 (not (__f1 (__f5 (select initial_1_trace 4)))))
      (a!58 (not (__f2 (__f5 (select initial_1_trace 4)))))
      (a!60 (not (__f1 (__f1 (select initial_1_trace 4)))))
      (a!61 (= (__f7 (__f3 (select initial_1_trace 5))) 1))
      (a!62 (= (__f1 (__f3 (select initial_1_trace 5)))
               (__f1 (__f3 (select initial_1_trace 4)))))
      (a!63 (= (__f2 (__f3 (select initial_1_trace 5)))
               (__f2 (__f3 (select initial_1_trace 4)))))
      (a!64 (= (__f3 (__f3 (select initial_1_trace 5)))
               (__f3 (__f3 (select initial_1_trace 4)))))
      (a!65 (= (__f4 (__f3 (select initial_1_trace 5)))
               (__f4 (__f3 (select initial_1_trace 4)))))
      (a!66 (= (__f9 (__f3 (select initial_1_trace 5))) 0))
      (a!67 (not (__f5 (__f4 (select initial_1_trace 5)))))
      (a!68 (= (__f11 (__f3 (select initial_1_trace 5))) 0))
      (a!69 (not (__f7 (__f4 (select initial_1_trace 5)))))
      (a!70 (= (__f12 (__f3 (select initial_1_trace 5))) 0))
      (a!71 (not (__f8 (__f4 (select initial_1_trace 5)))))
      (a!72 (not (__f1 (__f5 (select initial_1_trace 5)))))
      (a!73 (not (__f2 (__f5 (select initial_1_trace 5)))))
      (a!75 (not (__f1 (__f1 (select initial_1_trace 5)))))
      (a!76 (= (__f7 (__f3 (select initial_1_trace 6))) 1))
      (a!77 (= (__f1 (__f3 (select initial_1_trace 6)))
               (__f1 (__f3 (select initial_1_trace 5)))))
      (a!78 (= (__f2 (__f3 (select initial_1_trace 6)))
               (__f2 (__f3 (select initial_1_trace 5)))))
      (a!79 (= (__f3 (__f3 (select initial_1_trace 6)))
               (__f3 (__f3 (select initial_1_trace 5)))))
      (a!80 (= (__f4 (__f3 (select initial_1_trace 6)))
               (__f4 (__f3 (select initial_1_trace 5)))))
      (a!81 (= (__f9 (__f3 (select initial_1_trace 6))) 0))
      (a!82 (not (__f5 (__f4 (select initial_1_trace 6)))))
      (a!83 (= (__f11 (__f3 (select initial_1_trace 6))) 0))
      (a!84 (not (__f7 (__f4 (select initial_1_trace 6)))))
      (a!85 (= (__f12 (__f3 (select initial_1_trace 6))) 0))
      (a!86 (not (__f8 (__f4 (select initial_1_trace 6)))))
      (a!87 (not (__f1 (__f5 (select initial_1_trace 6)))))
      (a!88 (not (__f2 (__f5 (select initial_1_trace 6)))))
      (a!90 (not (__f1 (__f1 (select initial_1_trace 6)))))
      (a!91 (= (__f7 (__f3 (select initial_1_trace 7))) 1))
      (a!92 (= (__f1 (__f3 (select initial_1_trace 7)))
               (__f1 (__f3 (select initial_1_trace 6)))))
      (a!93 (= (__f2 (__f3 (select initial_1_trace 7)))
               (__f2 (__f3 (select initial_1_trace 6)))))
      (a!94 (= (__f3 (__f3 (select initial_1_trace 7)))
               (__f3 (__f3 (select initial_1_trace 6)))))
      (a!95 (= (__f4 (__f3 (select initial_1_trace 7)))
               (__f4 (__f3 (select initial_1_trace 6)))))
      (a!96 (= (__f9 (__f3 (select initial_1_trace 7))) 0))
      (a!97 (not (__f5 (__f4 (select initial_1_trace 7)))))
      (a!98 (= (__f11 (__f3 (select initial_1_trace 7))) 0))
      (a!99 (not (__f7 (__f4 (select initial_1_trace 7)))))
      (a!100 (= (__f12 (__f3 (select initial_1_trace 7))) 0))
      (a!101 (not (__f8 (__f4 (select initial_1_trace 7)))))
      (a!102 (not (__f1 (__f5 (select initial_1_trace 7)))))
      (a!103 (not (__f2 (__f5 (select initial_1_trace 7)))))
      (a!105 (not (__f1 (__f1 (select initial_1_trace 7)))))
      (a!106 (= (__f7 (__f3 (select initial_1_trace 8))) 1))
      (a!107 (= (__f1 (__f3 (select initial_1_trace 8)))
                (__f1 (__f3 (select initial_1_trace 7)))))
      (a!108 (= (__f2 (__f3 (select initial_1_trace 8)))
                (__f2 (__f3 (select initial_1_trace 7)))))
      (a!109 (= (__f3 (__f3 (select initial_1_trace 8)))
                (__f3 (__f3 (select initial_1_trace 7)))))
      (a!110 (= (__f4 (__f3 (select initial_1_trace 8)))
                (__f4 (__f3 (select initial_1_trace 7)))))
      (a!111 (= (__f9 (__f3 (select initial_1_trace 8))) 0))
      (a!112 (not (__f5 (__f4 (select initial_1_trace 8)))))
      (a!113 (= (__f11 (__f3 (select initial_1_trace 8))) 0))
      (a!114 (not (__f7 (__f4 (select initial_1_trace 8)))))
      (a!115 (= (__f12 (__f3 (select initial_1_trace 8))) 0))
      (a!116 (not (__f8 (__f4 (select initial_1_trace 8)))))
      (a!117 (not (__f1 (__f5 (select initial_1_trace 8)))))
      (a!118 (not (__f2 (__f5 (select initial_1_trace 8)))))
      (a!120 (not (__f1 (__f1 (select initial_1_trace 8))))))
(let ((a!14 (and a!1
                 (__f3 (__f4 (select initial_1_trace 1)))
                 a!2
                 a!3
                 a!4
                 a!5
                 a!6
                 a!7
                 a!8
                 a!9
                 a!10
                 a!11
                 a!12
                 a!13))
      (a!29 (and a!16
                 (__f3 (__f4 (select initial_1_trace 2)))
                 a!17
                 a!18
                 a!19
                 a!20
                 a!21
                 a!22
                 a!23
                 a!24
                 a!25
                 a!26
                 a!27
                 a!28))
      (a!44 (and a!31
                 (__f3 (__f4 (select initial_1_trace 3)))
                 a!32
                 a!33
                 a!34
                 a!35
                 a!36
                 a!37
                 a!38
                 a!39
                 a!40
                 a!41
                 a!42
                 a!43))
      (a!59 (and a!46
                 (__f3 (__f4 (select initial_1_trace 4)))
                 a!47
                 a!48
                 a!49
                 a!50
                 a!51
                 a!52
                 a!53
                 a!54
                 a!55
                 a!56
                 a!57
                 a!58))
      (a!74 (and a!61
                 (__f3 (__f4 (select initial_1_trace 5)))
                 a!62
                 a!63
                 a!64
                 a!65
                 a!66
                 a!67
                 a!68
                 a!69
                 a!70
                 a!71
                 a!72
                 a!73))
      (a!89 (and a!76
                 (__f3 (__f4 (select initial_1_trace 6)))
                 a!77
                 a!78
                 a!79
                 a!80
                 a!81
                 a!82
                 a!83
                 a!84
                 a!85
                 a!86
                 a!87
                 a!88))
      (a!104 (and a!91
                  (__f3 (__f4 (select initial_1_trace 7)))
                  a!92
                  a!93
                  a!94
                  a!95
                  a!96
                  a!97
                  a!98
                  a!99
                  a!100
                  a!101
                  a!102
                  a!103))
      (a!119 (and a!106
                  (__f3 (__f4 (select initial_1_trace 8)))
                  a!107
                  a!108
                  a!109
                  a!110
                  a!111
                  a!112
                  a!113
                  a!114
                  a!115
                  a!116
                  a!117
                  a!118)))
  (and (or a!14 a!15)
       (or a!29 a!30)
       (or a!44 a!45)
       (or a!59 a!60)
       (or a!74 a!75)
       (or a!89 a!90)
       (or a!104 a!105)
       (or a!119 a!120)))))
(assert (let ((a!1 (_tuple_0 false false false false false false false false false))
      (a!2 (= (__f8 (__f3 (select initial_1_trace 1))) 0))
      (a!4 (= (__f8 (__f3 (select initial_1_trace 2))) 0))
      (a!6 (= (__f8 (__f3 (select initial_1_trace 3))) 0))
      (a!8 (= (__f8 (__f3 (select initial_1_trace 4))) 0))
      (a!10 (= (__f8 (__f3 (select initial_1_trace 5))) 0))
      (a!12 (= (__f8 (__f3 (select initial_1_trace 6))) 0))
      (a!14 (= (__f8 (__f3 (select initial_1_trace 7))) 0))
      (a!16 (= (__f8 (__f3 (select initial_1_trace 8))) 0))
      (a!18 (= (__f8 (__f3 (select initial_1_trace 9))) 0))
      (a!20 (= (__f8 (__f3 (select initial_1_trace 10))) 0))
      (a!22 (= (__f8 (__f3 (select initial_1_trace 11))) 0))
      (a!24 (= (__f8 (__f3 (select initial_1_trace 12))) 0))
      (a!26 (= (__f8 (__f3 (select initial_1_trace 13))) 0))
      (a!28 (= (__f8 (__f3 (select initial_1_trace 14))) 0))
      (a!30 (= (__f8 (__f3 (select initial_1_trace 15))) 0))
      (a!32 (= (__f8 (__f3 (select initial_1_trace 16))) 0))
      (a!34 (= (__f8 (__f3 (select initial_1_trace 17))) 0)))
(let ((a!3 (or (= (__f1 (select initial_1_trace 1)) a!1)
               (__f4 (__f4 (select initial_1_trace 1)))
               a!2))
      (a!5 (or (= (__f1 (select initial_1_trace 2)) a!1)
               (__f4 (__f4 (select initial_1_trace 2)))
               a!4))
      (a!7 (or (= (__f1 (select initial_1_trace 3)) a!1)
               (__f4 (__f4 (select initial_1_trace 3)))
               a!6))
      (a!9 (or (= (__f1 (select initial_1_trace 4)) a!1)
               (__f4 (__f4 (select initial_1_trace 4)))
               a!8))
      (a!11 (or (= (__f1 (select initial_1_trace 5)) a!1)
                (__f4 (__f4 (select initial_1_trace 5)))
                a!10))
      (a!13 (or (= (__f1 (select initial_1_trace 6)) a!1)
                (__f4 (__f4 (select initial_1_trace 6)))
                a!12))
      (a!15 (or (= (__f1 (select initial_1_trace 7)) a!1)
                (__f4 (__f4 (select initial_1_trace 7)))
                a!14))
      (a!17 (or (= (__f1 (select initial_1_trace 8)) a!1)
                (__f4 (__f4 (select initial_1_trace 8)))
                a!16))
      (a!19 (or (= (__f1 (select initial_1_trace 9)) a!1)
                (__f4 (__f4 (select initial_1_trace 9)))
                a!18))
      (a!21 (or (= (__f1 (select initial_1_trace 10)) a!1)
                (__f4 (__f4 (select initial_1_trace 10)))
                a!20))
      (a!23 (or (= (__f1 (select initial_1_trace 11)) a!1)
                (__f4 (__f4 (select initial_1_trace 11)))
                a!22))
      (a!25 (or (= (__f1 (select initial_1_trace 12)) a!1)
                (__f4 (__f4 (select initial_1_trace 12)))
                a!24))
      (a!27 (or (= (__f1 (select initial_1_trace 13)) a!1)
                (__f4 (__f4 (select initial_1_trace 13)))
                a!26))
      (a!29 (or (= (__f1 (select initial_1_trace 14)) a!1)
                (__f4 (__f4 (select initial_1_trace 14)))
                a!28))
      (a!31 (or (= (__f1 (select initial_1_trace 15)) a!1)
                (__f4 (__f4 (select initial_1_trace 15)))
                a!30))
      (a!33 (or (= (__f1 (select initial_1_trace 16)) a!1)
                (__f4 (__f4 (select initial_1_trace 16)))
                a!32))
      (a!35 (or (= (__f1 (select initial_1_trace 17)) a!1)
                (__f4 (__f4 (select initial_1_trace 17)))
                a!34)))
  (and a!3
       a!5
       a!7
       a!9
       a!11
       a!13
       a!15
       a!17
       a!19
       a!21
       a!23
       a!25
       a!27
       a!29
       a!31
       a!33
       a!35))))
(assert (let ((a!1 (= (__f2 (__f3 (select initial_1_trace 1))) 0))
      (a!2 (= (__f3 (__f3 (select initial_1_trace 1))) 1))
      (a!3 (= (__f1 (__f3 (select initial_1_trace 1))) 1))
      (a!5 (= (__f3 (__f3 (select initial_1_trace 1)))
              (__f3 (__f3 (select initial_1_trace 0)))))
      (a!6 (= (__f1 (__f3 (select initial_1_trace 1)))
              (__f1 (__f3 (select initial_1_trace 0)))))
      (a!7 (= (__f2 (__f3 (select initial_1_trace 1)))
              (__f2 (__f3 (select initial_1_trace 0)))))
      (a!8 (= (__f4 (__f3 (select initial_1_trace 1)))
              (__f4 (__f3 (select initial_1_trace 0)))))
      (a!9 (= (__f7 (__f3 (select initial_1_trace 1))) 0))
      (a!10 (not (__f3 (__f4 (select initial_1_trace 1)))))
      (a!11 (= (__f9 (__f3 (select initial_1_trace 1))) 0))
      (a!12 (not (__f5 (__f4 (select initial_1_trace 1)))))
      (a!13 (= (__f11 (__f3 (select initial_1_trace 1))) 0))
      (a!14 (not (__f7 (__f4 (select initial_1_trace 1)))))
      (a!15 (= (__f12 (__f3 (select initial_1_trace 1))) 0))
      (a!16 (not (__f8 (__f4 (select initial_1_trace 1)))))
      (a!17 (not (__f1 (__f5 (select initial_1_trace 1)))))
      (a!18 (not (__f2 (__f5 (select initial_1_trace 1)))))
      (a!20 (not (__f8 (__f1 (select initial_1_trace 1)))))
      (a!21 (= (__f2 (__f3 (select initial_1_trace 2))) 0))
      (a!22 (= (__f3 (__f3 (select initial_1_trace 2))) 1))
      (a!23 (= (__f1 (__f3 (select initial_1_trace 2))) 1))
      (a!25 (= (__f3 (__f3 (select initial_1_trace 2)))
               (__f3 (__f3 (select initial_1_trace 1)))))
      (a!26 (= (__f1 (__f3 (select initial_1_trace 2)))
               (__f1 (__f3 (select initial_1_trace 1)))))
      (a!27 (= (__f2 (__f3 (select initial_1_trace 2)))
               (__f2 (__f3 (select initial_1_trace 1)))))
      (a!28 (= (__f4 (__f3 (select initial_1_trace 2)))
               (__f4 (__f3 (select initial_1_trace 1)))))
      (a!29 (= (__f7 (__f3 (select initial_1_trace 2))) 0))
      (a!30 (not (__f3 (__f4 (select initial_1_trace 2)))))
      (a!31 (= (__f9 (__f3 (select initial_1_trace 2))) 0))
      (a!32 (not (__f5 (__f4 (select initial_1_trace 2)))))
      (a!33 (= (__f11 (__f3 (select initial_1_trace 2))) 0))
      (a!34 (not (__f7 (__f4 (select initial_1_trace 2)))))
      (a!35 (= (__f12 (__f3 (select initial_1_trace 2))) 0))
      (a!36 (not (__f8 (__f4 (select initial_1_trace 2)))))
      (a!37 (not (__f1 (__f5 (select initial_1_trace 2)))))
      (a!38 (not (__f2 (__f5 (select initial_1_trace 2)))))
      (a!40 (not (__f8 (__f1 (select initial_1_trace 2)))))
      (a!41 (= (__f2 (__f3 (select initial_1_trace 3))) 0))
      (a!42 (= (__f3 (__f3 (select initial_1_trace 3))) 1))
      (a!43 (= (__f1 (__f3 (select initial_1_trace 3))) 1))
      (a!45 (= (__f3 (__f3 (select initial_1_trace 3)))
               (__f3 (__f3 (select initial_1_trace 2)))))
      (a!46 (= (__f1 (__f3 (select initial_1_trace 3)))
               (__f1 (__f3 (select initial_1_trace 2)))))
      (a!47 (= (__f2 (__f3 (select initial_1_trace 3)))
               (__f2 (__f3 (select initial_1_trace 2)))))
      (a!48 (= (__f4 (__f3 (select initial_1_trace 3)))
               (__f4 (__f3 (select initial_1_trace 2)))))
      (a!49 (= (__f7 (__f3 (select initial_1_trace 3))) 0))
      (a!50 (not (__f3 (__f4 (select initial_1_trace 3)))))
      (a!51 (= (__f9 (__f3 (select initial_1_trace 3))) 0))
      (a!52 (not (__f5 (__f4 (select initial_1_trace 3)))))
      (a!53 (= (__f11 (__f3 (select initial_1_trace 3))) 0))
      (a!54 (not (__f7 (__f4 (select initial_1_trace 3)))))
      (a!55 (= (__f12 (__f3 (select initial_1_trace 3))) 0))
      (a!56 (not (__f8 (__f4 (select initial_1_trace 3)))))
      (a!57 (not (__f1 (__f5 (select initial_1_trace 3)))))
      (a!58 (not (__f2 (__f5 (select initial_1_trace 3)))))
      (a!60 (not (__f8 (__f1 (select initial_1_trace 3)))))
      (a!61 (= (__f2 (__f3 (select initial_1_trace 4))) 0))
      (a!62 (= (__f3 (__f3 (select initial_1_trace 4))) 1))
      (a!63 (= (__f1 (__f3 (select initial_1_trace 4))) 1))
      (a!65 (= (__f3 (__f3 (select initial_1_trace 4)))
               (__f3 (__f3 (select initial_1_trace 3)))))
      (a!66 (= (__f1 (__f3 (select initial_1_trace 4)))
               (__f1 (__f3 (select initial_1_trace 3)))))
      (a!67 (= (__f2 (__f3 (select initial_1_trace 4)))
               (__f2 (__f3 (select initial_1_trace 3)))))
      (a!68 (= (__f4 (__f3 (select initial_1_trace 4)))
               (__f4 (__f3 (select initial_1_trace 3)))))
      (a!69 (= (__f7 (__f3 (select initial_1_trace 4))) 0))
      (a!70 (not (__f3 (__f4 (select initial_1_trace 4)))))
      (a!71 (= (__f9 (__f3 (select initial_1_trace 4))) 0))
      (a!72 (not (__f5 (__f4 (select initial_1_trace 4)))))
      (a!73 (= (__f11 (__f3 (select initial_1_trace 4))) 0))
      (a!74 (not (__f7 (__f4 (select initial_1_trace 4)))))
      (a!75 (= (__f12 (__f3 (select initial_1_trace 4))) 0))
      (a!76 (not (__f8 (__f4 (select initial_1_trace 4)))))
      (a!77 (not (__f1 (__f5 (select initial_1_trace 4)))))
      (a!78 (not (__f2 (__f5 (select initial_1_trace 4)))))
      (a!80 (not (__f8 (__f1 (select initial_1_trace 4)))))
      (a!81 (= (__f2 (__f3 (select initial_1_trace 5))) 0))
      (a!82 (= (__f3 (__f3 (select initial_1_trace 5))) 1))
      (a!83 (= (__f1 (__f3 (select initial_1_trace 5))) 1))
      (a!85 (= (__f3 (__f3 (select initial_1_trace 5)))
               (__f3 (__f3 (select initial_1_trace 4)))))
      (a!86 (= (__f1 (__f3 (select initial_1_trace 5)))
               (__f1 (__f3 (select initial_1_trace 4)))))
      (a!87 (= (__f2 (__f3 (select initial_1_trace 5)))
               (__f2 (__f3 (select initial_1_trace 4)))))
      (a!88 (= (__f4 (__f3 (select initial_1_trace 5)))
               (__f4 (__f3 (select initial_1_trace 4)))))
      (a!89 (= (__f7 (__f3 (select initial_1_trace 5))) 0))
      (a!90 (not (__f3 (__f4 (select initial_1_trace 5)))))
      (a!91 (= (__f9 (__f3 (select initial_1_trace 5))) 0))
      (a!92 (not (__f5 (__f4 (select initial_1_trace 5)))))
      (a!93 (= (__f11 (__f3 (select initial_1_trace 5))) 0))
      (a!94 (not (__f7 (__f4 (select initial_1_trace 5)))))
      (a!95 (= (__f12 (__f3 (select initial_1_trace 5))) 0))
      (a!96 (not (__f8 (__f4 (select initial_1_trace 5)))))
      (a!97 (not (__f1 (__f5 (select initial_1_trace 5)))))
      (a!98 (not (__f2 (__f5 (select initial_1_trace 5)))))
      (a!100 (not (__f8 (__f1 (select initial_1_trace 5)))))
      (a!101 (= (__f2 (__f3 (select initial_1_trace 6))) 0))
      (a!102 (= (__f3 (__f3 (select initial_1_trace 6))) 1))
      (a!103 (= (__f1 (__f3 (select initial_1_trace 6))) 1))
      (a!105 (= (__f3 (__f3 (select initial_1_trace 6)))
                (__f3 (__f3 (select initial_1_trace 5)))))
      (a!106 (= (__f1 (__f3 (select initial_1_trace 6)))
                (__f1 (__f3 (select initial_1_trace 5)))))
      (a!107 (= (__f2 (__f3 (select initial_1_trace 6)))
                (__f2 (__f3 (select initial_1_trace 5)))))
      (a!108 (= (__f4 (__f3 (select initial_1_trace 6)))
                (__f4 (__f3 (select initial_1_trace 5)))))
      (a!109 (= (__f7 (__f3 (select initial_1_trace 6))) 0))
      (a!110 (not (__f3 (__f4 (select initial_1_trace 6)))))
      (a!111 (= (__f9 (__f3 (select initial_1_trace 6))) 0))
      (a!112 (not (__f5 (__f4 (select initial_1_trace 6)))))
      (a!113 (= (__f11 (__f3 (select initial_1_trace 6))) 0))
      (a!114 (not (__f7 (__f4 (select initial_1_trace 6)))))
      (a!115 (= (__f12 (__f3 (select initial_1_trace 6))) 0))
      (a!116 (not (__f8 (__f4 (select initial_1_trace 6)))))
      (a!117 (not (__f1 (__f5 (select initial_1_trace 6)))))
      (a!118 (not (__f2 (__f5 (select initial_1_trace 6)))))
      (a!120 (not (__f8 (__f1 (select initial_1_trace 6)))))
      (a!121 (= (__f2 (__f3 (select initial_1_trace 7))) 0))
      (a!122 (= (__f3 (__f3 (select initial_1_trace 7))) 1))
      (a!123 (= (__f1 (__f3 (select initial_1_trace 7))) 1))
      (a!125 (= (__f3 (__f3 (select initial_1_trace 7)))
                (__f3 (__f3 (select initial_1_trace 6)))))
      (a!126 (= (__f1 (__f3 (select initial_1_trace 7)))
                (__f1 (__f3 (select initial_1_trace 6)))))
      (a!127 (= (__f2 (__f3 (select initial_1_trace 7)))
                (__f2 (__f3 (select initial_1_trace 6)))))
      (a!128 (= (__f4 (__f3 (select initial_1_trace 7)))
                (__f4 (__f3 (select initial_1_trace 6)))))
      (a!129 (= (__f7 (__f3 (select initial_1_trace 7))) 0))
      (a!130 (not (__f3 (__f4 (select initial_1_trace 7)))))
      (a!131 (= (__f9 (__f3 (select initial_1_trace 7))) 0))
      (a!132 (not (__f5 (__f4 (select initial_1_trace 7)))))
      (a!133 (= (__f11 (__f3 (select initial_1_trace 7))) 0))
      (a!134 (not (__f7 (__f4 (select initial_1_trace 7)))))
      (a!135 (= (__f12 (__f3 (select initial_1_trace 7))) 0))
      (a!136 (not (__f8 (__f4 (select initial_1_trace 7)))))
      (a!137 (not (__f1 (__f5 (select initial_1_trace 7)))))
      (a!138 (not (__f2 (__f5 (select initial_1_trace 7)))))
      (a!140 (not (__f8 (__f1 (select initial_1_trace 7)))))
      (a!141 (= (__f2 (__f3 (select initial_1_trace 8))) 0))
      (a!142 (= (__f3 (__f3 (select initial_1_trace 8))) 1))
      (a!143 (= (__f1 (__f3 (select initial_1_trace 8))) 1))
      (a!145 (= (__f3 (__f3 (select initial_1_trace 8)))
                (__f3 (__f3 (select initial_1_trace 7)))))
      (a!146 (= (__f1 (__f3 (select initial_1_trace 8)))
                (__f1 (__f3 (select initial_1_trace 7)))))
      (a!147 (= (__f2 (__f3 (select initial_1_trace 8)))
                (__f2 (__f3 (select initial_1_trace 7)))))
      (a!148 (= (__f4 (__f3 (select initial_1_trace 8)))
                (__f4 (__f3 (select initial_1_trace 7)))))
      (a!149 (= (__f7 (__f3 (select initial_1_trace 8))) 0))
      (a!150 (not (__f3 (__f4 (select initial_1_trace 8)))))
      (a!151 (= (__f9 (__f3 (select initial_1_trace 8))) 0))
      (a!152 (not (__f5 (__f4 (select initial_1_trace 8)))))
      (a!153 (= (__f11 (__f3 (select initial_1_trace 8))) 0))
      (a!154 (not (__f7 (__f4 (select initial_1_trace 8)))))
      (a!155 (= (__f12 (__f3 (select initial_1_trace 8))) 0))
      (a!156 (not (__f8 (__f4 (select initial_1_trace 8)))))
      (a!157 (not (__f1 (__f5 (select initial_1_trace 8)))))
      (a!158 (not (__f2 (__f5 (select initial_1_trace 8)))))
      (a!160 (not (__f8 (__f1 (select initial_1_trace 8))))))
(let ((a!4 (or (not (and (not a!1) (not a!3))) a!2))
      (a!24 (or (not (and (not a!21) (not a!23))) a!22))
      (a!44 (or (not (and (not a!41) (not a!43))) a!42))
      (a!64 (or (not (and (not a!61) (not a!63))) a!62))
      (a!84 (or (not (and (not a!81) (not a!83))) a!82))
      (a!104 (or (not (and (not a!101) (not a!103))) a!102))
      (a!124 (or (not (and (not a!121) (not a!123))) a!122))
      (a!144 (or (not (and (not a!141) (not a!143))) a!142)))
(let ((a!19 (and (or (not a!1) a!2)
                 a!4
                 (or a!5 a!1 (and (not a!1) (not a!3)))
                 a!6
                 a!7
                 a!8
                 a!9
                 a!10
                 a!11
                 a!12
                 a!13
                 a!14
                 a!15
                 a!16
                 a!17
                 a!18))
      (a!39 (and (or (not a!21) a!22)
                 a!24
                 (or a!25 a!21 (and (not a!21) (not a!23)))
                 a!26
                 a!27
                 a!28
                 a!29
                 a!30
                 a!31
                 a!32
                 a!33
                 a!34
                 a!35
                 a!36
                 a!37
                 a!38))
      (a!59 (and (or (not a!41) a!42)
                 a!44
                 (or a!45 a!41 (and (not a!41) (not a!43)))
                 a!46
                 a!47
                 a!48
                 a!49
                 a!50
                 a!51
                 a!52
                 a!53
                 a!54
                 a!55
                 a!56
                 a!57
                 a!58))
      (a!79 (and (or (not a!61) a!62)
                 a!64
                 (or a!65 a!61 (and (not a!61) (not a!63)))
                 a!66
                 a!67
                 a!68
                 a!69
                 a!70
                 a!71
                 a!72
                 a!73
                 a!74
                 a!75
                 a!76
                 a!77
                 a!78))
      (a!99 (and (or (not a!81) a!82)
                 a!84
                 (or a!85 a!81 (and (not a!81) (not a!83)))
                 a!86
                 a!87
                 a!88
                 a!89
                 a!90
                 a!91
                 a!92
                 a!93
                 a!94
                 a!95
                 a!96
                 a!97
                 a!98))
      (a!119 (and (or (not a!101) a!102)
                  a!104
                  (or a!105 a!101 (and (not a!101) (not a!103)))
                  a!106
                  a!107
                  a!108
                  a!109
                  a!110
                  a!111
                  a!112
                  a!113
                  a!114
                  a!115
                  a!116
                  a!117
                  a!118))
      (a!139 (and (or (not a!121) a!122)
                  a!124
                  (or a!125 a!121 (and (not a!121) (not a!123)))
                  a!126
                  a!127
                  a!128
                  a!129
                  a!130
                  a!131
                  a!132
                  a!133
                  a!134
                  a!135
                  a!136
                  a!137
                  a!138))
      (a!159 (and (or (not a!141) a!142)
                  a!144
                  (or a!145 a!141 (and (not a!141) (not a!143)))
                  a!146
                  a!147
                  a!148
                  a!149
                  a!150
                  a!151
                  a!152
                  a!153
                  a!154
                  a!155
                  a!156
                  a!157
                  a!158)))
  (and (or a!19 a!20)
       (or a!39 a!40)
       (or a!59 a!60)
       (or a!79 a!80)
       (or a!99 a!100)
       (or a!119 a!120)
       (or a!139 a!140)
       (or a!159 a!160))))))
(assert (let ((a!1 (>= (__f1 (__f2 (select initial_1_trace 1))) 0))
      (a!2 (>= (__f1 (__f2 (select initial_1_trace 2))) 0))
      (a!3 (>= (__f1 (__f2 (select initial_1_trace 3))) 0))
      (a!4 (>= (__f1 (__f2 (select initial_1_trace 4))) 0))
      (a!5 (>= (__f1 (__f2 (select initial_1_trace 5))) 0))
      (a!6 (>= (__f1 (__f2 (select initial_1_trace 6))) 0))
      (a!7 (>= (__f1 (__f2 (select initial_1_trace 7))) 0))
      (a!8 (>= (__f1 (__f2 (select initial_1_trace 8))) 0))
      (a!9 (>= (__f1 (__f2 (select initial_1_trace 9))) 0))
      (a!10 (>= (__f1 (__f2 (select initial_1_trace 10))) 0))
      (a!11 (>= (__f1 (__f2 (select initial_1_trace 11))) 0))
      (a!12 (>= (__f1 (__f2 (select initial_1_trace 12))) 0))
      (a!13 (>= (__f1 (__f2 (select initial_1_trace 13))) 0))
      (a!14 (>= (__f1 (__f2 (select initial_1_trace 14))) 0))
      (a!15 (>= (__f1 (__f2 (select initial_1_trace 15))) 0))
      (a!16 (>= (__f1 (__f2 (select initial_1_trace 16))) 0))
      (a!17 (>= (__f1 (__f2 (select initial_1_trace 17))) 0)))
  (and a!1
       a!2
       a!3
       a!4
       a!5
       a!6
       a!7
       a!8
       a!9
       a!10
       a!11
       a!12
       a!13
       a!14
       a!15
       a!16
       a!17)))
(assert (let ((a!1 (not (= (__f2 (select initial_1_trace 0))
                   (__f2 (select initial_1_trace 1)))))
      (a!2 (not (= (__f1 (select initial_1_trace 0))
                   (__f1 (select initial_1_trace 1)))))
      (a!3 (not (= (__f2 (select initial_1_trace 0))
                   (__f2 (select initial_1_trace 2)))))
      (a!4 (not (= (__f1 (select initial_1_trace 0))
                   (__f1 (select initial_1_trace 2)))))
      (a!5 (not (= (__f2 (select initial_1_trace 0))
                   (__f2 (select initial_1_trace 3)))))
      (a!6 (not (= (__f1 (select initial_1_trace 0))
                   (__f1 (select initial_1_trace 3)))))
      (a!7 (not (= (__f2 (select initial_1_trace 0))
                   (__f2 (select initial_1_trace 4)))))
      (a!8 (not (= (__f1 (select initial_1_trace 0))
                   (__f1 (select initial_1_trace 4)))))
      (a!9 (not (= (__f2 (select initial_1_trace 0))
                   (__f2 (select initial_1_trace 5)))))
      (a!10 (not (= (__f1 (select initial_1_trace 0))
                    (__f1 (select initial_1_trace 5)))))
      (a!11 (not (= (__f2 (select initial_1_trace 0))
                    (__f2 (select initial_1_trace 6)))))
      (a!12 (not (= (__f1 (select initial_1_trace 0))
                    (__f1 (select initial_1_trace 6)))))
      (a!13 (not (= (__f2 (select initial_1_trace 0))
                    (__f2 (select initial_1_trace 7)))))
      (a!14 (not (= (__f1 (select initial_1_trace 0))
                    (__f1 (select initial_1_trace 7)))))
      (a!15 (not (= (__f2 (select initial_1_trace 0))
                    (__f2 (select initial_1_trace 8)))))
      (a!16 (not (= (__f1 (select initial_1_trace 0))
                    (__f1 (select initial_1_trace 8)))))
      (a!17 (not (= (__f2 (select initial_1_trace 0))
                    (__f2 (select initial_1_trace 9)))))
      (a!18 (not (= (__f1 (select initial_1_trace 0))
                    (__f1 (select initial_1_trace 9)))))
      (a!19 (not (= (__f2 (select initial_1_trace 0))
                    (__f2 (select initial_1_trace 10)))))
      (a!20 (not (= (__f1 (select initial_1_trace 0))
                    (__f1 (select initial_1_trace 10)))))
      (a!21 (not (= (__f2 (select initial_1_trace 0))
                    (__f2 (select initial_1_trace 11)))))
      (a!22 (not (= (__f1 (select initial_1_trace 0))
                    (__f1 (select initial_1_trace 11)))))
      (a!23 (not (= (__f2 (select initial_1_trace 0))
                    (__f2 (select initial_1_trace 12)))))
      (a!24 (not (= (__f1 (select initial_1_trace 0))
                    (__f1 (select initial_1_trace 12)))))
      (a!25 (not (= (__f2 (select initial_1_trace 0))
                    (__f2 (select initial_1_trace 13)))))
      (a!26 (not (= (__f1 (select initial_1_trace 0))
                    (__f1 (select initial_1_trace 13)))))
      (a!27 (not (= (__f2 (select initial_1_trace 0))
                    (__f2 (select initial_1_trace 14)))))
      (a!28 (not (= (__f1 (select initial_1_trace 0))
                    (__f1 (select initial_1_trace 14)))))
      (a!29 (not (= (__f2 (select initial_1_trace 0))
                    (__f2 (select initial_1_trace 15)))))
      (a!30 (not (= (__f1 (select initial_1_trace 0))
                    (__f1 (select initial_1_trace 15)))))
      (a!31 (not (= (__f2 (select initial_1_trace 0))
                    (__f2 (select initial_1_trace 16)))))
      (a!32 (not (= (__f1 (select initial_1_trace 0))
                    (__f1 (select initial_1_trace 16)))))
      (a!33 (not (= (__f2 (select initial_1_trace 0))
                    (__f2 (select initial_1_trace 17)))))
      (a!34 (not (= (__f1 (select initial_1_trace 0))
                    (__f1 (select initial_1_trace 17)))))
      (a!35 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 0)))))
      (a!36 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 0)))))
      (a!37 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 2)))))
      (a!38 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 2)))))
      (a!39 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 3)))))
      (a!40 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 3)))))
      (a!41 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 4)))))
      (a!42 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 4)))))
      (a!43 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 5)))))
      (a!44 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 5)))))
      (a!45 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 6)))))
      (a!46 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 6)))))
      (a!47 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 7)))))
      (a!48 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 7)))))
      (a!49 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 8)))))
      (a!50 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 8)))))
      (a!51 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 9)))))
      (a!52 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 9)))))
      (a!53 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 10)))))
      (a!54 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 10)))))
      (a!55 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 11)))))
      (a!56 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 11)))))
      (a!57 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 12)))))
      (a!58 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 12)))))
      (a!59 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 13)))))
      (a!60 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 13)))))
      (a!61 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 14)))))
      (a!62 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 14)))))
      (a!63 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 15)))))
      (a!64 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 15)))))
      (a!65 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 16)))))
      (a!66 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 16)))))
      (a!67 (not (= (__f2 (select initial_1_trace 1))
                    (__f2 (select initial_1_trace 17)))))
      (a!68 (not (= (__f1 (select initial_1_trace 1))
                    (__f1 (select initial_1_trace 17)))))
      (a!69 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 0)))))
      (a!70 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 0)))))
      (a!71 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 1)))))
      (a!72 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 1)))))
      (a!73 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 3)))))
      (a!74 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 3)))))
      (a!75 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 4)))))
      (a!76 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 4)))))
      (a!77 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 5)))))
      (a!78 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 5)))))
      (a!79 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 6)))))
      (a!80 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 6)))))
      (a!81 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 7)))))
      (a!82 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 7)))))
      (a!83 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 8)))))
      (a!84 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 8)))))
      (a!85 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 9)))))
      (a!86 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 9)))))
      (a!87 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 10)))))
      (a!88 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 10)))))
      (a!89 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 11)))))
      (a!90 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 11)))))
      (a!91 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 12)))))
      (a!92 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 12)))))
      (a!93 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 13)))))
      (a!94 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 13)))))
      (a!95 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 14)))))
      (a!96 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 14)))))
      (a!97 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 15)))))
      (a!98 (not (= (__f1 (select initial_1_trace 2))
                    (__f1 (select initial_1_trace 15)))))
      (a!99 (not (= (__f2 (select initial_1_trace 2))
                    (__f2 (select initial_1_trace 16)))))
      (a!100 (not (= (__f1 (select initial_1_trace 2))
                     (__f1 (select initial_1_trace 16)))))
      (a!101 (not (= (__f2 (select initial_1_trace 2))
                     (__f2 (select initial_1_trace 17)))))
      (a!102 (not (= (__f1 (select initial_1_trace 2))
                     (__f1 (select initial_1_trace 17)))))
      (a!103 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 0)))))
      (a!104 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 0)))))
      (a!105 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 1)))))
      (a!106 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 1)))))
      (a!107 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 2)))))
      (a!108 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 2)))))
      (a!109 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 4)))))
      (a!110 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 4)))))
      (a!111 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 5)))))
      (a!112 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 5)))))
      (a!113 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 6)))))
      (a!114 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 6)))))
      (a!115 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 7)))))
      (a!116 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 7)))))
      (a!117 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 8)))))
      (a!118 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 8)))))
      (a!119 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 9)))))
      (a!120 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 9)))))
      (a!121 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 10)))))
      (a!122 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 10)))))
      (a!123 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 11)))))
      (a!124 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 11)))))
      (a!125 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 12)))))
      (a!126 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 12)))))
      (a!127 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 13)))))
      (a!128 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 13)))))
      (a!129 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 14)))))
      (a!130 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 14)))))
      (a!131 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 15)))))
      (a!132 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 15)))))
      (a!133 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 16)))))
      (a!134 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 16)))))
      (a!135 (not (= (__f2 (select initial_1_trace 3))
                     (__f2 (select initial_1_trace 17)))))
      (a!136 (not (= (__f1 (select initial_1_trace 3))
                     (__f1 (select initial_1_trace 17)))))
      (a!137 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 0)))))
      (a!138 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 0)))))
      (a!139 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 1)))))
      (a!140 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 1)))))
      (a!141 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 2)))))
      (a!142 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 2)))))
      (a!143 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 3)))))
      (a!144 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 3)))))
      (a!145 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 5)))))
      (a!146 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 5)))))
      (a!147 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 6)))))
      (a!148 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 6)))))
      (a!149 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 7)))))
      (a!150 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 7)))))
      (a!151 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 8)))))
      (a!152 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 8)))))
      (a!153 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 9)))))
      (a!154 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 9)))))
      (a!155 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 10)))))
      (a!156 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 10)))))
      (a!157 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 11)))))
      (a!158 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 11)))))
      (a!159 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 12)))))
      (a!160 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 12)))))
      (a!161 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 13)))))
      (a!162 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 13)))))
      (a!163 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 14)))))
      (a!164 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 14)))))
      (a!165 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 15)))))
      (a!166 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 15)))))
      (a!167 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 16)))))
      (a!168 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 16)))))
      (a!169 (not (= (__f2 (select initial_1_trace 4))
                     (__f2 (select initial_1_trace 17)))))
      (a!170 (not (= (__f1 (select initial_1_trace 4))
                     (__f1 (select initial_1_trace 17)))))
      (a!171 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 0)))))
      (a!172 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 0)))))
      (a!173 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 1)))))
      (a!174 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 1)))))
      (a!175 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 2)))))
      (a!176 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 2)))))
      (a!177 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 3)))))
      (a!178 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 3)))))
      (a!179 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 4)))))
      (a!180 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 4)))))
      (a!181 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 6)))))
      (a!182 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 6)))))
      (a!183 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 7)))))
      (a!184 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 7)))))
      (a!185 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 8)))))
      (a!186 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 8)))))
      (a!187 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 9)))))
      (a!188 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 9)))))
      (a!189 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 10)))))
      (a!190 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 10)))))
      (a!191 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 11)))))
      (a!192 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 11)))))
      (a!193 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 12)))))
      (a!194 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 12)))))
      (a!195 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 13)))))
      (a!196 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 13)))))
      (a!197 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 14)))))
      (a!198 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 14)))))
      (a!199 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 15)))))
      (a!200 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 15)))))
      (a!201 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 16)))))
      (a!202 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 16)))))
      (a!203 (not (= (__f2 (select initial_1_trace 5))
                     (__f2 (select initial_1_trace 17)))))
      (a!204 (not (= (__f1 (select initial_1_trace 5))
                     (__f1 (select initial_1_trace 17)))))
      (a!205 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 0)))))
      (a!206 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 0)))))
      (a!207 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 1)))))
      (a!208 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 1)))))
      (a!209 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 2)))))
      (a!210 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 2)))))
      (a!211 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 3)))))
      (a!212 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 3)))))
      (a!213 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 4)))))
      (a!214 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 4)))))
      (a!215 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 5)))))
      (a!216 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 5)))))
      (a!217 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 7)))))
      (a!218 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 7)))))
      (a!219 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 8)))))
      (a!220 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 8)))))
      (a!221 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 9)))))
      (a!222 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 9)))))
      (a!223 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 10)))))
      (a!224 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 10)))))
      (a!225 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 11)))))
      (a!226 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 11)))))
      (a!227 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 12)))))
      (a!228 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 12)))))
      (a!229 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 13)))))
      (a!230 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 13)))))
      (a!231 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 14)))))
      (a!232 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 14)))))
      (a!233 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 15)))))
      (a!234 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 15)))))
      (a!235 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 16)))))
      (a!236 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 16)))))
      (a!237 (not (= (__f2 (select initial_1_trace 6))
                     (__f2 (select initial_1_trace 17)))))
      (a!238 (not (= (__f1 (select initial_1_trace 6))
                     (__f1 (select initial_1_trace 17)))))
      (a!239 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 0)))))
      (a!240 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 0)))))
      (a!241 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 1)))))
      (a!242 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 1)))))
      (a!243 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 2)))))
      (a!244 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 2)))))
      (a!245 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 3)))))
      (a!246 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 3)))))
      (a!247 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 4)))))
      (a!248 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 4)))))
      (a!249 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 5)))))
      (a!250 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 5)))))
      (a!251 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 6)))))
      (a!252 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 6)))))
      (a!253 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 8)))))
      (a!254 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 8)))))
      (a!255 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 9)))))
      (a!256 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 9)))))
      (a!257 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 10)))))
      (a!258 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 10)))))
      (a!259 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 11)))))
      (a!260 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 11)))))
      (a!261 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 12)))))
      (a!262 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 12)))))
      (a!263 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 13)))))
      (a!264 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 13)))))
      (a!265 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 14)))))
      (a!266 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 14)))))
      (a!267 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 15)))))
      (a!268 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 15)))))
      (a!269 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 16)))))
      (a!270 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 16)))))
      (a!271 (not (= (__f2 (select initial_1_trace 7))
                     (__f2 (select initial_1_trace 17)))))
      (a!272 (not (= (__f1 (select initial_1_trace 7))
                     (__f1 (select initial_1_trace 17)))))
      (a!273 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 0)))))
      (a!274 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 0)))))
      (a!275 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 1)))))
      (a!276 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 1)))))
      (a!277 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 2)))))
      (a!278 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 2)))))
      (a!279 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 3)))))
      (a!280 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 3)))))
      (a!281 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 4)))))
      (a!282 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 4)))))
      (a!283 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 5)))))
      (a!284 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 5)))))
      (a!285 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 6)))))
      (a!286 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 6)))))
      (a!287 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 7)))))
      (a!288 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 7)))))
      (a!289 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 9)))))
      (a!290 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 9)))))
      (a!291 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 10)))))
      (a!292 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 10)))))
      (a!293 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 11)))))
      (a!294 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 11)))))
      (a!295 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 12)))))
      (a!296 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 12)))))
      (a!297 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 13)))))
      (a!298 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 13)))))
      (a!299 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 14)))))
      (a!300 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 14)))))
      (a!301 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 15)))))
      (a!302 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 15)))))
      (a!303 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 16)))))
      (a!304 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 16)))))
      (a!305 (not (= (__f2 (select initial_1_trace 8))
                     (__f2 (select initial_1_trace 17)))))
      (a!306 (not (= (__f1 (select initial_1_trace 8))
                     (__f1 (select initial_1_trace 17)))))
      (a!307 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 0)))))
      (a!308 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 0)))))
      (a!309 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 1)))))
      (a!310 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 1)))))
      (a!311 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 2)))))
      (a!312 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 2)))))
      (a!313 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 3)))))
      (a!314 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 3)))))
      (a!315 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 4)))))
      (a!316 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 4)))))
      (a!317 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 5)))))
      (a!318 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 5)))))
      (a!319 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 6)))))
      (a!320 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 6)))))
      (a!321 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 7)))))
      (a!322 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 7)))))
      (a!323 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 8)))))
      (a!324 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 8)))))
      (a!325 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 10)))))
      (a!326 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 10)))))
      (a!327 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 11)))))
      (a!328 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 11)))))
      (a!329 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 12)))))
      (a!330 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 12)))))
      (a!331 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 13)))))
      (a!332 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 13)))))
      (a!333 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 14)))))
      (a!334 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 14)))))
      (a!335 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 15)))))
      (a!336 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 15)))))
      (a!337 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 16)))))
      (a!338 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 16)))))
      (a!339 (not (= (__f2 (select initial_1_trace 9))
                     (__f2 (select initial_1_trace 17)))))
      (a!340 (not (= (__f1 (select initial_1_trace 9))
                     (__f1 (select initial_1_trace 17)))))
      (a!341 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 0)))))
      (a!342 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 0)))))
      (a!343 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 1)))))
      (a!344 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 1)))))
      (a!345 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 2)))))
      (a!346 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 2)))))
      (a!347 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 3)))))
      (a!348 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 3)))))
      (a!349 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 4)))))
      (a!350 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 4)))))
      (a!351 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 5)))))
      (a!352 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 5)))))
      (a!353 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 6)))))
      (a!354 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 6)))))
      (a!355 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 7)))))
      (a!356 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 7)))))
      (a!357 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 8)))))
      (a!358 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 8)))))
      (a!359 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 9)))))
      (a!360 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 9)))))
      (a!361 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 11)))))
      (a!362 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 11)))))
      (a!363 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 12)))))
      (a!364 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 12)))))
      (a!365 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 13)))))
      (a!366 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 13)))))
      (a!367 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 14)))))
      (a!368 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 14)))))
      (a!369 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 15)))))
      (a!370 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 15)))))
      (a!371 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 16)))))
      (a!372 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 16)))))
      (a!373 (not (= (__f2 (select initial_1_trace 10))
                     (__f2 (select initial_1_trace 17)))))
      (a!374 (not (= (__f1 (select initial_1_trace 10))
                     (__f1 (select initial_1_trace 17)))))
      (a!375 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 0)))))
      (a!376 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 0)))))
      (a!377 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 1)))))
      (a!378 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 1)))))
      (a!379 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 2)))))
      (a!380 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 2)))))
      (a!381 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 3)))))
      (a!382 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 3)))))
      (a!383 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 4)))))
      (a!384 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 4)))))
      (a!385 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 5)))))
      (a!386 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 5)))))
      (a!387 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 6)))))
      (a!388 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 6)))))
      (a!389 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 7)))))
      (a!390 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 7)))))
      (a!391 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 8)))))
      (a!392 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 8)))))
      (a!393 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 9)))))
      (a!394 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 9)))))
      (a!395 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 10)))))
      (a!396 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 10)))))
      (a!397 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 12)))))
      (a!398 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 12)))))
      (a!399 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 13)))))
      (a!400 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 13)))))
      (a!401 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 14)))))
      (a!402 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 14)))))
      (a!403 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 15)))))
      (a!404 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 15)))))
      (a!405 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 16)))))
      (a!406 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 16)))))
      (a!407 (not (= (__f2 (select initial_1_trace 11))
                     (__f2 (select initial_1_trace 17)))))
      (a!408 (not (= (__f1 (select initial_1_trace 11))
                     (__f1 (select initial_1_trace 17)))))
      (a!409 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 0)))))
      (a!410 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 0)))))
      (a!411 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 1)))))
      (a!412 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 1)))))
      (a!413 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 2)))))
      (a!414 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 2)))))
      (a!415 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 3)))))
      (a!416 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 3)))))
      (a!417 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 4)))))
      (a!418 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 4)))))
      (a!419 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 5)))))
      (a!420 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 5)))))
      (a!421 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 6)))))
      (a!422 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 6)))))
      (a!423 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 7)))))
      (a!424 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 7)))))
      (a!425 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 8)))))
      (a!426 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 8)))))
      (a!427 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 9)))))
      (a!428 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 9)))))
      (a!429 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 10)))))
      (a!430 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 10)))))
      (a!431 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 11)))))
      (a!432 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 11)))))
      (a!433 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 13)))))
      (a!434 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 13)))))
      (a!435 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 14)))))
      (a!436 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 14)))))
      (a!437 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 15)))))
      (a!438 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 15)))))
      (a!439 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 16)))))
      (a!440 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 16)))))
      (a!441 (not (= (__f2 (select initial_1_trace 12))
                     (__f2 (select initial_1_trace 17)))))
      (a!442 (not (= (__f1 (select initial_1_trace 12))
                     (__f1 (select initial_1_trace 17)))))
      (a!443 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 0)))))
      (a!444 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 0)))))
      (a!445 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 1)))))
      (a!446 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 1)))))
      (a!447 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 2)))))
      (a!448 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 2)))))
      (a!449 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 3)))))
      (a!450 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 3)))))
      (a!451 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 4)))))
      (a!452 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 4)))))
      (a!453 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 5)))))
      (a!454 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 5)))))
      (a!455 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 6)))))
      (a!456 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 6)))))
      (a!457 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 7)))))
      (a!458 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 7)))))
      (a!459 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 8)))))
      (a!460 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 8)))))
      (a!461 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 9)))))
      (a!462 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 9)))))
      (a!463 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 10)))))
      (a!464 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 10)))))
      (a!465 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 11)))))
      (a!466 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 11)))))
      (a!467 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 12)))))
      (a!468 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 12)))))
      (a!469 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 14)))))
      (a!470 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 14)))))
      (a!471 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 15)))))
      (a!472 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 15)))))
      (a!473 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 16)))))
      (a!474 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 16)))))
      (a!475 (not (= (__f2 (select initial_1_trace 13))
                     (__f2 (select initial_1_trace 17)))))
      (a!476 (not (= (__f1 (select initial_1_trace 13))
                     (__f1 (select initial_1_trace 17)))))
      (a!477 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 0)))))
      (a!478 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 0)))))
      (a!479 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 1)))))
      (a!480 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 1)))))
      (a!481 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 2)))))
      (a!482 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 2)))))
      (a!483 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 3)))))
      (a!484 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 3)))))
      (a!485 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 4)))))
      (a!486 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 4)))))
      (a!487 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 5)))))
      (a!488 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 5)))))
      (a!489 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 6)))))
      (a!490 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 6)))))
      (a!491 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 7)))))
      (a!492 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 7)))))
      (a!493 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 8)))))
      (a!494 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 8)))))
      (a!495 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 9)))))
      (a!496 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 9)))))
      (a!497 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 10)))))
      (a!498 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 10)))))
      (a!499 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 11)))))
      (a!500 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 11)))))
      (a!501 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 12)))))
      (a!502 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 12)))))
      (a!503 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 13)))))
      (a!504 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 13)))))
      (a!505 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 15)))))
      (a!506 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 15)))))
      (a!507 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 16)))))
      (a!508 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 16)))))
      (a!509 (not (= (__f2 (select initial_1_trace 14))
                     (__f2 (select initial_1_trace 17)))))
      (a!510 (not (= (__f1 (select initial_1_trace 14))
                     (__f1 (select initial_1_trace 17)))))
      (a!511 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 0)))))
      (a!512 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 0)))))
      (a!513 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 1)))))
      (a!514 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 1)))))
      (a!515 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 2)))))
      (a!516 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 2)))))
      (a!517 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 3)))))
      (a!518 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 3)))))
      (a!519 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 4)))))
      (a!520 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 4)))))
      (a!521 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 5)))))
      (a!522 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 5)))))
      (a!523 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 6)))))
      (a!524 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 6)))))
      (a!525 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 7)))))
      (a!526 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 7)))))
      (a!527 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 8)))))
      (a!528 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 8)))))
      (a!529 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 9)))))
      (a!530 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 9)))))
      (a!531 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 10)))))
      (a!532 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 10)))))
      (a!533 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 11)))))
      (a!534 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 11)))))
      (a!535 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 12)))))
      (a!536 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 12)))))
      (a!537 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 13)))))
      (a!538 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 13)))))
      (a!539 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 14)))))
      (a!540 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 14)))))
      (a!541 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 16)))))
      (a!542 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 16)))))
      (a!543 (not (= (__f2 (select initial_1_trace 15))
                     (__f2 (select initial_1_trace 17)))))
      (a!544 (not (= (__f1 (select initial_1_trace 15))
                     (__f1 (select initial_1_trace 17)))))
      (a!545 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 0)))))
      (a!546 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 0)))))
      (a!547 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 1)))))
      (a!548 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 1)))))
      (a!549 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 2)))))
      (a!550 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 2)))))
      (a!551 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 3)))))
      (a!552 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 3)))))
      (a!553 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 4)))))
      (a!554 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 4)))))
      (a!555 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 5)))))
      (a!556 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 5)))))
      (a!557 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 6)))))
      (a!558 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 6)))))
      (a!559 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 7)))))
      (a!560 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 7)))))
      (a!561 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 8)))))
      (a!562 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 8)))))
      (a!563 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 9)))))
      (a!564 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 9)))))
      (a!565 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 10)))))
      (a!566 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 10)))))
      (a!567 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 11)))))
      (a!568 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 11)))))
      (a!569 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 12)))))
      (a!570 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 12)))))
      (a!571 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 13)))))
      (a!572 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 13)))))
      (a!573 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 14)))))
      (a!574 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 14)))))
      (a!575 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 15)))))
      (a!576 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 15)))))
      (a!577 (not (= (__f2 (select initial_1_trace 16))
                     (__f2 (select initial_1_trace 17)))))
      (a!578 (not (= (__f1 (select initial_1_trace 16))
                     (__f1 (select initial_1_trace 17)))))
      (a!579 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 0)))))
      (a!580 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 0)))))
      (a!581 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 1)))))
      (a!582 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 1)))))
      (a!583 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 2)))))
      (a!584 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 2)))))
      (a!585 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 3)))))
      (a!586 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 3)))))
      (a!587 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 4)))))
      (a!588 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 4)))))
      (a!589 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 5)))))
      (a!590 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 5)))))
      (a!591 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 6)))))
      (a!592 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 6)))))
      (a!593 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 7)))))
      (a!594 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 7)))))
      (a!595 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 8)))))
      (a!596 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 8)))))
      (a!597 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 9)))))
      (a!598 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 9)))))
      (a!599 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 10)))))
      (a!600 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 10)))))
      (a!601 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 11)))))
      (a!602 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 11)))))
      (a!603 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 12)))))
      (a!604 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 12)))))
      (a!605 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 13)))))
      (a!606 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 13)))))
      (a!607 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 14)))))
      (a!608 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 14)))))
      (a!609 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 15)))))
      (a!610 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 15)))))
      (a!611 (not (= (__f2 (select initial_1_trace 17))
                     (__f2 (select initial_1_trace 16)))))
      (a!612 (not (= (__f1 (select initial_1_trace 17))
                     (__f1 (select initial_1_trace 16))))))
  (and (or a!1 a!2)
       (or a!3 a!4)
       (or a!5 a!6)
       (or a!7 a!8)
       (or a!9 a!10)
       (or a!11 a!12)
       (or a!13 a!14)
       (or a!15 a!16)
       (or a!17 a!18)
       (or a!19 a!20)
       (or a!21 a!22)
       (or a!23 a!24)
       (or a!25 a!26)
       (or a!27 a!28)
       (or a!29 a!30)
       (or a!31 a!32)
       (or a!33 a!34)
       (or a!35 a!36)
       (or a!37 a!38)
       (or a!39 a!40)
       (or a!41 a!42)
       (or a!43 a!44)
       (or a!45 a!46)
       (or a!47 a!48)
       (or a!49 a!50)
       (or a!51 a!52)
       (or a!53 a!54)
       (or a!55 a!56)
       (or a!57 a!58)
       (or a!59 a!60)
       (or a!61 a!62)
       (or a!63 a!64)
       (or a!65 a!66)
       (or a!67 a!68)
       (or a!69 a!70)
       (or a!71 a!72)
       (or a!73 a!74)
       (or a!75 a!76)
       (or a!77 a!78)
       (or a!79 a!80)
       (or a!81 a!82)
       (or a!83 a!84)
       (or a!85 a!86)
       (or a!87 a!88)
       (or a!89 a!90)
       (or a!91 a!92)
       (or a!93 a!94)
       (or a!95 a!96)
       (or a!97 a!98)
       (or a!99 a!100)
       (or a!101 a!102)
       (or a!103 a!104)
       (or a!105 a!106)
       (or a!107 a!108)
       (or a!109 a!110)
       (or a!111 a!112)
       (or a!113 a!114)
       (or a!115 a!116)
       (or a!117 a!118)
       (or a!119 a!120)
       (or a!121 a!122)
       (or a!123 a!124)
       (or a!125 a!126)
       (or a!127 a!128)
       (or a!129 a!130)
       (or a!131 a!132)
       (or a!133 a!134)
       (or a!135 a!136)
       (or a!137 a!138)
       (or a!139 a!140)
       (or a!141 a!142)
       (or a!143 a!144)
       (or a!145 a!146)
       (or a!147 a!148)
       (or a!149 a!150)
       (or a!151 a!152)
       (or a!153 a!154)
       (or a!155 a!156)
       (or a!157 a!158)
       (or a!159 a!160)
       (or a!161 a!162)
       (or a!163 a!164)
       (or a!165 a!166)
       (or a!167 a!168)
       (or a!169 a!170)
       (or a!171 a!172)
       (or a!173 a!174)
       (or a!175 a!176)
       (or a!177 a!178)
       (or a!179 a!180)
       (or a!181 a!182)
       (or a!183 a!184)
       (or a!185 a!186)
       (or a!187 a!188)
       (or a!189 a!190)
       (or a!191 a!192)
       (or a!193 a!194)
       (or a!195 a!196)
       (or a!197 a!198)
       (or a!199 a!200)
       (or a!201 a!202)
       (or a!203 a!204)
       (or a!205 a!206)
       (or a!207 a!208)
       (or a!209 a!210)
       (or a!211 a!212)
       (or a!213 a!214)
       (or a!215 a!216)
       (or a!217 a!218)
       (or a!219 a!220)
       (or a!221 a!222)
       (or a!223 a!224)
       (or a!225 a!226)
       (or a!227 a!228)
       (or a!229 a!230)
       (or a!231 a!232)
       (or a!233 a!234)
       (or a!235 a!236)
       (or a!237 a!238)
       (or a!239 a!240)
       (or a!241 a!242)
       (or a!243 a!244)
       (or a!245 a!246)
       (or a!247 a!248)
       (or a!249 a!250)
       (or a!251 a!252)
       (or a!253 a!254)
       (or a!255 a!256)
       (or a!257 a!258)
       (or a!259 a!260)
       (or a!261 a!262)
       (or a!263 a!264)
       (or a!265 a!266)
       (or a!267 a!268)
       (or a!269 a!270)
       (or a!271 a!272)
       (or a!273 a!274)
       (or a!275 a!276)
       (or a!277 a!278)
       (or a!279 a!280)
       (or a!281 a!282)
       (or a!283 a!284)
       (or a!285 a!286)
       (or a!287 a!288)
       (or a!289 a!290)
       (or a!291 a!292)
       (or a!293 a!294)
       (or a!295 a!296)
       (or a!297 a!298)
       (or a!299 a!300)
       (or a!301 a!302)
       (or a!303 a!304)
       (or a!305 a!306)
       (or a!307 a!308)
       (or a!309 a!310)
       (or a!311 a!312)
       (or a!313 a!314)
       (or a!315 a!316)
       (or a!317 a!318)
       (or a!319 a!320)
       (or a!321 a!322)
       (or a!323 a!324)
       (or a!325 a!326)
       (or a!327 a!328)
       (or a!329 a!330)
       (or a!331 a!332)
       (or a!333 a!334)
       (or a!335 a!336)
       (or a!337 a!338)
       (or a!339 a!340)
       (or a!341 a!342)
       (or a!343 a!344)
       (or a!345 a!346)
       (or a!347 a!348)
       (or a!349 a!350)
       (or a!351 a!352)
       (or a!353 a!354)
       (or a!355 a!356)
       (or a!357 a!358)
       (or a!359 a!360)
       (or a!361 a!362)
       (or a!363 a!364)
       (or a!365 a!366)
       (or a!367 a!368)
       (or a!369 a!370)
       (or a!371 a!372)
       (or a!373 a!374)
       (or a!375 a!376)
       (or a!377 a!378)
       (or a!379 a!380)
       (or a!381 a!382)
       (or a!383 a!384)
       (or a!385 a!386)
       (or a!387 a!388)
       (or a!389 a!390)
       (or a!391 a!392)
       (or a!393 a!394)
       (or a!395 a!396)
       (or a!397 a!398)
       (or a!399 a!400)
       (or a!401 a!402)
       (or a!403 a!404)
       (or a!405 a!406)
       (or a!407 a!408)
       (or a!409 a!410)
       (or a!411 a!412)
       (or a!413 a!414)
       (or a!415 a!416)
       (or a!417 a!418)
       (or a!419 a!420)
       (or a!421 a!422)
       (or a!423 a!424)
       (or a!425 a!426)
       (or a!427 a!428)
       (or a!429 a!430)
       (or a!431 a!432)
       (or a!433 a!434)
       (or a!435 a!436)
       (or a!437 a!438)
       (or a!439 a!440)
       (or a!441 a!442)
       (or a!443 a!444)
       (or a!445 a!446)
       (or a!447 a!448)
       (or a!449 a!450)
       (or a!451 a!452)
       (or a!453 a!454)
       (or a!455 a!456)
       (or a!457 a!458)
       (or a!459 a!460)
       (or a!461 a!462)
       (or a!463 a!464)
       (or a!465 a!466)
       (or a!467 a!468)
       (or a!469 a!470)
       (or a!471 a!472)
       (or a!473 a!474)
       (or a!475 a!476)
       (or a!477 a!478)
       (or a!479 a!480)
       (or a!481 a!482)
       (or a!483 a!484)
       (or a!485 a!486)
       (or a!487 a!488)
       (or a!489 a!490)
       (or a!491 a!492)
       (or a!493 a!494)
       (or a!495 a!496)
       (or a!497 a!498)
       (or a!499 a!500)
       (or a!501 a!502)
       (or a!503 a!504)
       (or a!505 a!506)
       (or a!507 a!508)
       (or a!509 a!510)
       (or a!511 a!512)
       (or a!513 a!514)
       (or a!515 a!516)
       (or a!517 a!518)
       (or a!519 a!520)
       (or a!521 a!522)
       (or a!523 a!524)
       (or a!525 a!526)
       (or a!527 a!528)
       (or a!529 a!530)
       (or a!531 a!532)
       (or a!533 a!534)
       (or a!535 a!536)
       (or a!537 a!538)
       (or a!539 a!540)
       (or a!541 a!542)
       (or a!543 a!544)
       (or a!545 a!546)
       (or a!547 a!548)
       (or a!549 a!550)
       (or a!551 a!552)
       (or a!553 a!554)
       (or a!555 a!556)
       (or a!557 a!558)
       (or a!559 a!560)
       (or a!561 a!562)
       (or a!563 a!564)
       (or a!565 a!566)
       (or a!567 a!568)
       (or a!569 a!570)
       (or a!571 a!572)
       (or a!573 a!574)
       (or a!575 a!576)
       (or a!577 a!578)
       (or a!579 a!580)
       (or a!581 a!582)
       (or a!583 a!584)
       (or a!585 a!586)
       (or a!587 a!588)
       (or a!589 a!590)
       (or a!591 a!592)
       (or a!593 a!594)
       (or a!595 a!596)
       (or a!597 a!598)
       (or a!599 a!600)
       (or a!601 a!602)
       (or a!603 a!604)
       (or a!605 a!606)
       (or a!607 a!608)
       (or a!609 a!610)
       (or a!611 a!612))))
(assert (let ((a!1 (= (__f2 (__f4 (select initial_1_trace 1)))
              (__f8 (__f1 (select initial_1_trace 1)))))
      (a!2 (= (__f2 (__f4 (select initial_1_trace 2)))
              (__f8 (__f1 (select initial_1_trace 2)))))
      (a!3 (= (__f2 (__f4 (select initial_1_trace 3)))
              (__f8 (__f1 (select initial_1_trace 3)))))
      (a!4 (= (__f2 (__f4 (select initial_1_trace 4)))
              (__f8 (__f1 (select initial_1_trace 4)))))
      (a!5 (= (__f2 (__f4 (select initial_1_trace 5)))
              (__f8 (__f1 (select initial_1_trace 5)))))
      (a!6 (= (__f2 (__f4 (select initial_1_trace 6)))
              (__f8 (__f1 (select initial_1_trace 6)))))
      (a!7 (= (__f2 (__f4 (select initial_1_trace 7)))
              (__f8 (__f1 (select initial_1_trace 7)))))
      (a!8 (= (__f2 (__f4 (select initial_1_trace 8)))
              (__f8 (__f1 (select initial_1_trace 8)))))
      (a!9 (= (__f2 (__f4 (select initial_1_trace 9)))
              (__f8 (__f1 (select initial_1_trace 9)))))
      (a!10 (= (__f2 (__f4 (select initial_1_trace 10)))
               (__f8 (__f1 (select initial_1_trace 10)))))
      (a!11 (= (__f2 (__f4 (select initial_1_trace 11)))
               (__f8 (__f1 (select initial_1_trace 11)))))
      (a!12 (= (__f2 (__f4 (select initial_1_trace 12)))
               (__f8 (__f1 (select initial_1_trace 12)))))
      (a!13 (= (__f2 (__f4 (select initial_1_trace 13)))
               (__f8 (__f1 (select initial_1_trace 13)))))
      (a!14 (= (__f2 (__f4 (select initial_1_trace 14)))
               (__f8 (__f1 (select initial_1_trace 14)))))
      (a!15 (= (__f2 (__f4 (select initial_1_trace 15)))
               (__f8 (__f1 (select initial_1_trace 15)))))
      (a!16 (= (__f2 (__f4 (select initial_1_trace 16)))
               (__f8 (__f1 (select initial_1_trace 16)))))
      (a!17 (= (__f2 (__f4 (select initial_1_trace 17)))
               (__f8 (__f1 (select initial_1_trace 17))))))
  (and a!1
       a!2
       a!3
       a!4
       a!5
       a!6
       a!7
       a!8
       a!9
       a!10
       a!11
       a!12
       a!13
       a!14
       a!15
       a!16
       a!17)))
(assert (let ((a!1 (not (__f7 (__f4 (select initial_1_trace 1)))))
      (a!2 (= (__f13 (__f3 (select initial_1_trace 2)))
              (__f11 (__f3 (select initial_1_trace 1)))))
      (a!3 (_tuple_2 (__f1 (__f2 (select initial_1_trace 1)))
                     (__f2 (__f2 (select initial_1_trace 1)))))
      (a!5 (= (__f13 (__f3 (select initial_1_trace 3)))
              (__f11 (__f3 (select initial_1_trace 1)))))
      (a!7 (= (__f13 (__f3 (select initial_1_trace 4)))
              (__f11 (__f3 (select initial_1_trace 1)))))
      (a!9 (= (__f13 (__f3 (select initial_1_trace 5)))
              (__f11 (__f3 (select initial_1_trace 1)))))
      (a!11 (= (__f13 (__f3 (select initial_1_trace 6)))
               (__f11 (__f3 (select initial_1_trace 1)))))
      (a!13 (= (__f13 (__f3 (select initial_1_trace 7)))
               (__f11 (__f3 (select initial_1_trace 1)))))
      (a!15 (= (__f13 (__f3 (select initial_1_trace 8)))
               (__f11 (__f3 (select initial_1_trace 1)))))
      (a!17 (= (__f13 (__f3 (select initial_1_trace 9)))
               (__f11 (__f3 (select initial_1_trace 1)))))
      (a!19 (= (__f13 (__f3 (select initial_1_trace 10)))
               (__f11 (__f3 (select initial_1_trace 1)))))
      (a!21 (= (__f13 (__f3 (select initial_1_trace 11)))
               (__f11 (__f3 (select initial_1_trace 1)))))
      (a!23 (= (__f13 (__f3 (select initial_1_trace 12)))
               (__f11 (__f3 (select initial_1_trace 1)))))
      (a!25 (= (__f13 (__f3 (select initial_1_trace 13)))
               (__f11 (__f3 (select initial_1_trace 1)))))
      (a!27 (= (__f13 (__f3 (select initial_1_trace 14)))
               (__f11 (__f3 (select initial_1_trace 1)))))
      (a!29 (= (__f13 (__f3 (select initial_1_trace 15)))
               (__f11 (__f3 (select initial_1_trace 1)))))
      (a!31 (= (__f13 (__f3 (select initial_1_trace 16)))
               (__f11 (__f3 (select initial_1_trace 1)))))
      (a!33 (= (__f13 (__f3 (select initial_1_trace 17)))
               (__f11 (__f3 (select initial_1_trace 1)))))
      (a!35 (not (__f9 (__f4 (select initial_1_trace 1)))))
      (a!36 (= (__f11 (__f3 (select initial_1_trace 0)))
               (__f13 (__f3 (select initial_1_trace 1)))))
      (a!37 (_tuple_2 (__f1 (__f2 (select initial_1_trace 0)))
                      (__f2 (__f2 (select initial_1_trace 0)))))
      (a!39 (not (__f7 (__f4 (select initial_1_trace 2)))))
      (a!40 (= (__f13 (__f3 (select initial_1_trace 3)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!41 (_tuple_2 (__f1 (__f2 (select initial_1_trace 2)))
                      (__f2 (__f2 (select initial_1_trace 2)))))
      (a!43 (= (__f13 (__f3 (select initial_1_trace 4)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!45 (= (__f13 (__f3 (select initial_1_trace 5)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!47 (= (__f13 (__f3 (select initial_1_trace 6)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!49 (= (__f13 (__f3 (select initial_1_trace 7)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!51 (= (__f13 (__f3 (select initial_1_trace 8)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!53 (= (__f13 (__f3 (select initial_1_trace 9)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!55 (= (__f13 (__f3 (select initial_1_trace 10)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!57 (= (__f13 (__f3 (select initial_1_trace 11)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!59 (= (__f13 (__f3 (select initial_1_trace 12)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!61 (= (__f13 (__f3 (select initial_1_trace 13)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!63 (= (__f13 (__f3 (select initial_1_trace 14)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!65 (= (__f13 (__f3 (select initial_1_trace 15)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!67 (= (__f13 (__f3 (select initial_1_trace 16)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!69 (= (__f13 (__f3 (select initial_1_trace 17)))
               (__f11 (__f3 (select initial_1_trace 2)))))
      (a!71 (not (__f9 (__f4 (select initial_1_trace 2)))))
      (a!72 (= (__f11 (__f3 (select initial_1_trace 0)))
               (__f13 (__f3 (select initial_1_trace 2)))))
      (a!74 (= (__f11 (__f3 (select initial_1_trace 1)))
               (__f13 (__f3 (select initial_1_trace 2)))))
      (a!76 (not (__f7 (__f4 (select initial_1_trace 3)))))
      (a!77 (= (__f13 (__f3 (select initial_1_trace 4)))
               (__f11 (__f3 (select initial_1_trace 3)))))
      (a!78 (_tuple_2 (__f1 (__f2 (select initial_1_trace 3)))
                      (__f2 (__f2 (select initial_1_trace 3)))))
      (a!80 (= (__f13 (__f3 (select initial_1_trace 5)))
               (__f11 (__f3 (select initial_1_trace 3)))))
      (a!82 (= (__f13 (__f3 (select initial_1_trace 6)))
               (__f11 (__f3 (select initial_1_trace 3)))))
      (a!84 (= (__f13 (__f3 (select initial_1_trace 7)))
               (__f11 (__f3 (select initial_1_trace 3)))))
      (a!86 (= (__f13 (__f3 (select initial_1_trace 8)))
               (__f11 (__f3 (select initial_1_trace 3)))))
      (a!88 (= (__f13 (__f3 (select initial_1_trace 9)))
               (__f11 (__f3 (select initial_1_trace 3)))))
      (a!90 (= (__f13 (__f3 (select initial_1_trace 10)))
               (__f11 (__f3 (select initial_1_trace 3)))))
      (a!92 (= (__f13 (__f3 (select initial_1_trace 11)))
               (__f11 (__f3 (select initial_1_trace 3)))))
      (a!94 (= (__f13 (__f3 (select initial_1_trace 12)))
               (__f11 (__f3 (select initial_1_trace 3)))))
      (a!96 (= (__f13 (__f3 (select initial_1_trace 13)))
               (__f11 (__f3 (select initial_1_trace 3)))))
      (a!98 (= (__f13 (__f3 (select initial_1_trace 14)))
               (__f11 (__f3 (select initial_1_trace 3)))))
      (a!100 (= (__f13 (__f3 (select initial_1_trace 15)))
                (__f11 (__f3 (select initial_1_trace 3)))))
      (a!102 (= (__f13 (__f3 (select initial_1_trace 16)))
                (__f11 (__f3 (select initial_1_trace 3)))))
      (a!104 (= (__f13 (__f3 (select initial_1_trace 17)))
                (__f11 (__f3 (select initial_1_trace 3)))))
      (a!106 (not (__f9 (__f4 (select initial_1_trace 3)))))
      (a!107 (= (__f11 (__f3 (select initial_1_trace 0)))
                (__f13 (__f3 (select initial_1_trace 3)))))
      (a!109 (= (__f11 (__f3 (select initial_1_trace 1)))
                (__f13 (__f3 (select initial_1_trace 3)))))
      (a!111 (= (__f11 (__f3 (select initial_1_trace 2)))
                (__f13 (__f3 (select initial_1_trace 3)))))
      (a!113 (not (__f7 (__f4 (select initial_1_trace 4)))))
      (a!114 (= (__f13 (__f3 (select initial_1_trace 5)))
                (__f11 (__f3 (select initial_1_trace 4)))))
      (a!115 (_tuple_2 (__f1 (__f2 (select initial_1_trace 4)))
                       (__f2 (__f2 (select initial_1_trace 4)))))
      (a!117 (= (__f13 (__f3 (select initial_1_trace 6)))
                (__f11 (__f3 (select initial_1_trace 4)))))
      (a!119 (= (__f13 (__f3 (select initial_1_trace 7)))
                (__f11 (__f3 (select initial_1_trace 4)))))
      (a!121 (= (__f13 (__f3 (select initial_1_trace 8)))
                (__f11 (__f3 (select initial_1_trace 4)))))
      (a!123 (= (__f13 (__f3 (select initial_1_trace 9)))
                (__f11 (__f3 (select initial_1_trace 4)))))
      (a!125 (= (__f13 (__f3 (select initial_1_trace 10)))
                (__f11 (__f3 (select initial_1_trace 4)))))
      (a!127 (= (__f13 (__f3 (select initial_1_trace 11)))
                (__f11 (__f3 (select initial_1_trace 4)))))
      (a!129 (= (__f13 (__f3 (select initial_1_trace 12)))
                (__f11 (__f3 (select initial_1_trace 4)))))
      (a!131 (= (__f13 (__f3 (select initial_1_trace 13)))
                (__f11 (__f3 (select initial_1_trace 4)))))
      (a!133 (= (__f13 (__f3 (select initial_1_trace 14)))
                (__f11 (__f3 (select initial_1_trace 4)))))
      (a!135 (= (__f13 (__f3 (select initial_1_trace 15)))
                (__f11 (__f3 (select initial_1_trace 4)))))
      (a!137 (= (__f13 (__f3 (select initial_1_trace 16)))
                (__f11 (__f3 (select initial_1_trace 4)))))
      (a!139 (= (__f13 (__f3 (select initial_1_trace 17)))
                (__f11 (__f3 (select initial_1_trace 4)))))
      (a!141 (not (__f9 (__f4 (select initial_1_trace 4)))))
      (a!142 (= (__f11 (__f3 (select initial_1_trace 0)))
                (__f13 (__f3 (select initial_1_trace 4)))))
      (a!144 (= (__f11 (__f3 (select initial_1_trace 1)))
                (__f13 (__f3 (select initial_1_trace 4)))))
      (a!146 (= (__f11 (__f3 (select initial_1_trace 2)))
                (__f13 (__f3 (select initial_1_trace 4)))))
      (a!148 (= (__f11 (__f3 (select initial_1_trace 3)))
                (__f13 (__f3 (select initial_1_trace 4)))))
      (a!150 (not (__f7 (__f4 (select initial_1_trace 5)))))
      (a!151 (= (__f13 (__f3 (select initial_1_trace 6)))
                (__f11 (__f3 (select initial_1_trace 5)))))
      (a!152 (_tuple_2 (__f1 (__f2 (select initial_1_trace 5)))
                       (__f2 (__f2 (select initial_1_trace 5)))))
      (a!154 (= (__f13 (__f3 (select initial_1_trace 7)))
                (__f11 (__f3 (select initial_1_trace 5)))))
      (a!156 (= (__f13 (__f3 (select initial_1_trace 8)))
                (__f11 (__f3 (select initial_1_trace 5)))))
      (a!158 (= (__f13 (__f3 (select initial_1_trace 9)))
                (__f11 (__f3 (select initial_1_trace 5)))))
      (a!160 (= (__f13 (__f3 (select initial_1_trace 10)))
                (__f11 (__f3 (select initial_1_trace 5)))))
      (a!162 (= (__f13 (__f3 (select initial_1_trace 11)))
                (__f11 (__f3 (select initial_1_trace 5)))))
      (a!164 (= (__f13 (__f3 (select initial_1_trace 12)))
                (__f11 (__f3 (select initial_1_trace 5)))))
      (a!166 (= (__f13 (__f3 (select initial_1_trace 13)))
                (__f11 (__f3 (select initial_1_trace 5)))))
      (a!168 (= (__f13 (__f3 (select initial_1_trace 14)))
                (__f11 (__f3 (select initial_1_trace 5)))))
      (a!170 (= (__f13 (__f3 (select initial_1_trace 15)))
                (__f11 (__f3 (select initial_1_trace 5)))))
      (a!172 (= (__f13 (__f3 (select initial_1_trace 16)))
                (__f11 (__f3 (select initial_1_trace 5)))))
      (a!174 (= (__f13 (__f3 (select initial_1_trace 17)))
                (__f11 (__f3 (select initial_1_trace 5)))))
      (a!176 (not (__f9 (__f4 (select initial_1_trace 5)))))
      (a!177 (= (__f11 (__f3 (select initial_1_trace 0)))
                (__f13 (__f3 (select initial_1_trace 5)))))
      (a!179 (= (__f11 (__f3 (select initial_1_trace 1)))
                (__f13 (__f3 (select initial_1_trace 5)))))
      (a!181 (= (__f11 (__f3 (select initial_1_trace 2)))
                (__f13 (__f3 (select initial_1_trace 5)))))
      (a!183 (= (__f11 (__f3 (select initial_1_trace 3)))
                (__f13 (__f3 (select initial_1_trace 5)))))
      (a!185 (= (__f11 (__f3 (select initial_1_trace 4)))
                (__f13 (__f3 (select initial_1_trace 5)))))
      (a!187 (not (__f7 (__f4 (select initial_1_trace 6)))))
      (a!188 (= (__f13 (__f3 (select initial_1_trace 7)))
                (__f11 (__f3 (select initial_1_trace 6)))))
      (a!189 (_tuple_2 (__f1 (__f2 (select initial_1_trace 6)))
                       (__f2 (__f2 (select initial_1_trace 6)))))
      (a!191 (= (__f13 (__f3 (select initial_1_trace 8)))
                (__f11 (__f3 (select initial_1_trace 6)))))
      (a!193 (= (__f13 (__f3 (select initial_1_trace 9)))
                (__f11 (__f3 (select initial_1_trace 6)))))
      (a!195 (= (__f13 (__f3 (select initial_1_trace 10)))
                (__f11 (__f3 (select initial_1_trace 6)))))
      (a!197 (= (__f13 (__f3 (select initial_1_trace 11)))
                (__f11 (__f3 (select initial_1_trace 6)))))
      (a!199 (= (__f13 (__f3 (select initial_1_trace 12)))
                (__f11 (__f3 (select initial_1_trace 6)))))
      (a!201 (= (__f13 (__f3 (select initial_1_trace 13)))
                (__f11 (__f3 (select initial_1_trace 6)))))
      (a!203 (= (__f13 (__f3 (select initial_1_trace 14)))
                (__f11 (__f3 (select initial_1_trace 6)))))
      (a!205 (= (__f13 (__f3 (select initial_1_trace 15)))
                (__f11 (__f3 (select initial_1_trace 6)))))
      (a!207 (= (__f13 (__f3 (select initial_1_trace 16)))
                (__f11 (__f3 (select initial_1_trace 6)))))
      (a!209 (= (__f13 (__f3 (select initial_1_trace 17)))
                (__f11 (__f3 (select initial_1_trace 6)))))
      (a!211 (not (__f9 (__f4 (select initial_1_trace 6)))))
      (a!212 (= (__f11 (__f3 (select initial_1_trace 0)))
                (__f13 (__f3 (select initial_1_trace 6)))))
      (a!214 (= (__f11 (__f3 (select initial_1_trace 1)))
                (__f13 (__f3 (select initial_1_trace 6)))))
      (a!216 (= (__f11 (__f3 (select initial_1_trace 2)))
                (__f13 (__f3 (select initial_1_trace 6)))))
      (a!218 (= (__f11 (__f3 (select initial_1_trace 3)))
                (__f13 (__f3 (select initial_1_trace 6)))))
      (a!220 (= (__f11 (__f3 (select initial_1_trace 4)))
                (__f13 (__f3 (select initial_1_trace 6)))))
      (a!222 (= (__f11 (__f3 (select initial_1_trace 5)))
                (__f13 (__f3 (select initial_1_trace 6)))))
      (a!224 (not (__f7 (__f4 (select initial_1_trace 7)))))
      (a!225 (= (__f13 (__f3 (select initial_1_trace 8)))
                (__f11 (__f3 (select initial_1_trace 7)))))
      (a!226 (_tuple_2 (__f1 (__f2 (select initial_1_trace 7)))
                       (__f2 (__f2 (select initial_1_trace 7)))))
      (a!228 (= (__f13 (__f3 (select initial_1_trace 9)))
                (__f11 (__f3 (select initial_1_trace 7)))))
      (a!230 (= (__f13 (__f3 (select initial_1_trace 10)))
                (__f11 (__f3 (select initial_1_trace 7)))))
      (a!232 (= (__f13 (__f3 (select initial_1_trace 11)))
                (__f11 (__f3 (select initial_1_trace 7)))))
      (a!234 (= (__f13 (__f3 (select initial_1_trace 12)))
                (__f11 (__f3 (select initial_1_trace 7)))))
      (a!236 (= (__f13 (__f3 (select initial_1_trace 13)))
                (__f11 (__f3 (select initial_1_trace 7)))))
      (a!238 (= (__f13 (__f3 (select initial_1_trace 14)))
                (__f11 (__f3 (select initial_1_trace 7)))))
      (a!240 (= (__f13 (__f3 (select initial_1_trace 15)))
                (__f11 (__f3 (select initial_1_trace 7)))))
      (a!242 (= (__f13 (__f3 (select initial_1_trace 16)))
                (__f11 (__f3 (select initial_1_trace 7)))))
      (a!244 (= (__f13 (__f3 (select initial_1_trace 17)))
                (__f11 (__f3 (select initial_1_trace 7)))))
      (a!246 (not (__f9 (__f4 (select initial_1_trace 7)))))
      (a!247 (= (__f11 (__f3 (select initial_1_trace 0)))
                (__f13 (__f3 (select initial_1_trace 7)))))
      (a!249 (= (__f11 (__f3 (select initial_1_trace 1)))
                (__f13 (__f3 (select initial_1_trace 7)))))
      (a!251 (= (__f11 (__f3 (select initial_1_trace 2)))
                (__f13 (__f3 (select initial_1_trace 7)))))
      (a!253 (= (__f11 (__f3 (select initial_1_trace 3)))
                (__f13 (__f3 (select initial_1_trace 7)))))
      (a!255 (= (__f11 (__f3 (select initial_1_trace 4)))
                (__f13 (__f3 (select initial_1_trace 7)))))
      (a!257 (= (__f11 (__f3 (select initial_1_trace 5)))
                (__f13 (__f3 (select initial_1_trace 7)))))
      (a!259 (= (__f11 (__f3 (select initial_1_trace 6)))
                (__f13 (__f3 (select initial_1_trace 7)))))
      (a!261 (not (__f7 (__f4 (select initial_1_trace 8)))))
      (a!262 (= (__f13 (__f3 (select initial_1_trace 9)))
                (__f11 (__f3 (select initial_1_trace 8)))))
      (a!263 (_tuple_2 (__f1 (__f2 (select initial_1_trace 8)))
                       (__f2 (__f2 (select initial_1_trace 8)))))
      (a!265 (= (__f13 (__f3 (select initial_1_trace 10)))
                (__f11 (__f3 (select initial_1_trace 8)))))
      (a!267 (= (__f13 (__f3 (select initial_1_trace 11)))
                (__f11 (__f3 (select initial_1_trace 8)))))
      (a!269 (= (__f13 (__f3 (select initial_1_trace 12)))
                (__f11 (__f3 (select initial_1_trace 8)))))
      (a!271 (= (__f13 (__f3 (select initial_1_trace 13)))
                (__f11 (__f3 (select initial_1_trace 8)))))
      (a!273 (= (__f13 (__f3 (select initial_1_trace 14)))
                (__f11 (__f3 (select initial_1_trace 8)))))
      (a!275 (= (__f13 (__f3 (select initial_1_trace 15)))
                (__f11 (__f3 (select initial_1_trace 8)))))
      (a!277 (= (__f13 (__f3 (select initial_1_trace 16)))
                (__f11 (__f3 (select initial_1_trace 8)))))
      (a!279 (= (__f13 (__f3 (select initial_1_trace 17)))
                (__f11 (__f3 (select initial_1_trace 8)))))
      (a!281 (not (__f9 (__f4 (select initial_1_trace 8)))))
      (a!282 (= (__f11 (__f3 (select initial_1_trace 0)))
                (__f13 (__f3 (select initial_1_trace 8)))))
      (a!284 (= (__f11 (__f3 (select initial_1_trace 1)))
                (__f13 (__f3 (select initial_1_trace 8)))))
      (a!286 (= (__f11 (__f3 (select initial_1_trace 2)))
                (__f13 (__f3 (select initial_1_trace 8)))))
      (a!288 (= (__f11 (__f3 (select initial_1_trace 3)))
                (__f13 (__f3 (select initial_1_trace 8)))))
      (a!290 (= (__f11 (__f3 (select initial_1_trace 4)))
                (__f13 (__f3 (select initial_1_trace 8)))))
      (a!292 (= (__f11 (__f3 (select initial_1_trace 5)))
                (__f13 (__f3 (select initial_1_trace 8)))))
      (a!294 (= (__f11 (__f3 (select initial_1_trace 6)))
                (__f13 (__f3 (select initial_1_trace 8)))))
      (a!296 (= (__f11 (__f3 (select initial_1_trace 7)))
                (__f13 (__f3 (select initial_1_trace 8))))))
(let ((a!4 (and (__f9 (__f4 (select initial_1_trace 2)))
                a!2
                (= (__f2 (select initial_1_trace 2)) a!3)))
      (a!6 (and (__f9 (__f4 (select initial_1_trace 3)))
                a!5
                (= (__f2 (select initial_1_trace 3)) a!3)))
      (a!8 (and (__f9 (__f4 (select initial_1_trace 4)))
                a!7
                (= (__f2 (select initial_1_trace 4)) a!3)))
      (a!10 (and (__f9 (__f4 (select initial_1_trace 5)))
                 a!9
                 (= (__f2 (select initial_1_trace 5)) a!3)))
      (a!12 (and (__f9 (__f4 (select initial_1_trace 6)))
                 a!11
                 (= (__f2 (select initial_1_trace 6)) a!3)))
      (a!14 (and (__f9 (__f4 (select initial_1_trace 7)))
                 a!13
                 (= (__f2 (select initial_1_trace 7)) a!3)))
      (a!16 (and (__f9 (__f4 (select initial_1_trace 8)))
                 a!15
                 (= (__f2 (select initial_1_trace 8)) a!3)))
      (a!18 (and (__f9 (__f4 (select initial_1_trace 9)))
                 a!17
                 (= (__f2 (select initial_1_trace 9)) a!3)))
      (a!20 (and (__f9 (__f4 (select initial_1_trace 10)))
                 a!19
                 (= (__f2 (select initial_1_trace 10)) a!3)))
      (a!22 (and (__f9 (__f4 (select initial_1_trace 11)))
                 a!21
                 (= (__f2 (select initial_1_trace 11)) a!3)))
      (a!24 (and (__f9 (__f4 (select initial_1_trace 12)))
                 a!23
                 (= (__f2 (select initial_1_trace 12)) a!3)))
      (a!26 (and (__f9 (__f4 (select initial_1_trace 13)))
                 a!25
                 (= (__f2 (select initial_1_trace 13)) a!3)))
      (a!28 (and (__f9 (__f4 (select initial_1_trace 14)))
                 a!27
                 (= (__f2 (select initial_1_trace 14)) a!3)))
      (a!30 (and (__f9 (__f4 (select initial_1_trace 15)))
                 a!29
                 (= (__f2 (select initial_1_trace 15)) a!3)))
      (a!32 (and (__f9 (__f4 (select initial_1_trace 16)))
                 a!31
                 (= (__f2 (select initial_1_trace 16)) a!3)))
      (a!34 (and (__f9 (__f4 (select initial_1_trace 17)))
                 a!33
                 (= (__f2 (select initial_1_trace 17)) a!3)))
      (a!38 (and (__f7 (__f4 (select initial_1_trace 0)))
                 a!36
                 (= (__f2 (select initial_1_trace 1)) a!37)))
      (a!42 (and (__f9 (__f4 (select initial_1_trace 3)))
                 a!40
                 (= (__f2 (select initial_1_trace 3)) a!41)))
      (a!44 (and (__f9 (__f4 (select initial_1_trace 4)))
                 a!43
                 (= (__f2 (select initial_1_trace 4)) a!41)))
      (a!46 (and (__f9 (__f4 (select initial_1_trace 5)))
                 a!45
                 (= (__f2 (select initial_1_trace 5)) a!41)))
      (a!48 (and (__f9 (__f4 (select initial_1_trace 6)))
                 a!47
                 (= (__f2 (select initial_1_trace 6)) a!41)))
      (a!50 (and (__f9 (__f4 (select initial_1_trace 7)))
                 a!49
                 (= (__f2 (select initial_1_trace 7)) a!41)))
      (a!52 (and (__f9 (__f4 (select initial_1_trace 8)))
                 a!51
                 (= (__f2 (select initial_1_trace 8)) a!41)))
      (a!54 (and (__f9 (__f4 (select initial_1_trace 9)))
                 a!53
                 (= (__f2 (select initial_1_trace 9)) a!41)))
      (a!56 (and (__f9 (__f4 (select initial_1_trace 10)))
                 a!55
                 (= (__f2 (select initial_1_trace 10)) a!41)))
      (a!58 (and (__f9 (__f4 (select initial_1_trace 11)))
                 a!57
                 (= (__f2 (select initial_1_trace 11)) a!41)))
      (a!60 (and (__f9 (__f4 (select initial_1_trace 12)))
                 a!59
                 (= (__f2 (select initial_1_trace 12)) a!41)))
      (a!62 (and (__f9 (__f4 (select initial_1_trace 13)))
                 a!61
                 (= (__f2 (select initial_1_trace 13)) a!41)))
      (a!64 (and (__f9 (__f4 (select initial_1_trace 14)))
                 a!63
                 (= (__f2 (select initial_1_trace 14)) a!41)))
      (a!66 (and (__f9 (__f4 (select initial_1_trace 15)))
                 a!65
                 (= (__f2 (select initial_1_trace 15)) a!41)))
      (a!68 (and (__f9 (__f4 (select initial_1_trace 16)))
                 a!67
                 (= (__f2 (select initial_1_trace 16)) a!41)))
      (a!70 (and (__f9 (__f4 (select initial_1_trace 17)))
                 a!69
                 (= (__f2 (select initial_1_trace 17)) a!41)))
      (a!73 (and (__f7 (__f4 (select initial_1_trace 0)))
                 a!72
                 (= (__f2 (select initial_1_trace 2)) a!37)))
      (a!75 (and (__f7 (__f4 (select initial_1_trace 1)))
                 a!74
                 (= (__f2 (select initial_1_trace 2)) a!3)))
      (a!79 (and (__f9 (__f4 (select initial_1_trace 4)))
                 a!77
                 (= (__f2 (select initial_1_trace 4)) a!78)))
      (a!81 (and (__f9 (__f4 (select initial_1_trace 5)))
                 a!80
                 (= (__f2 (select initial_1_trace 5)) a!78)))
      (a!83 (and (__f9 (__f4 (select initial_1_trace 6)))
                 a!82
                 (= (__f2 (select initial_1_trace 6)) a!78)))
      (a!85 (and (__f9 (__f4 (select initial_1_trace 7)))
                 a!84
                 (= (__f2 (select initial_1_trace 7)) a!78)))
      (a!87 (and (__f9 (__f4 (select initial_1_trace 8)))
                 a!86
                 (= (__f2 (select initial_1_trace 8)) a!78)))
      (a!89 (and (__f9 (__f4 (select initial_1_trace 9)))
                 a!88
                 (= (__f2 (select initial_1_trace 9)) a!78)))
      (a!91 (and (__f9 (__f4 (select initial_1_trace 10)))
                 a!90
                 (= (__f2 (select initial_1_trace 10)) a!78)))
      (a!93 (and (__f9 (__f4 (select initial_1_trace 11)))
                 a!92
                 (= (__f2 (select initial_1_trace 11)) a!78)))
      (a!95 (and (__f9 (__f4 (select initial_1_trace 12)))
                 a!94
                 (= (__f2 (select initial_1_trace 12)) a!78)))
      (a!97 (and (__f9 (__f4 (select initial_1_trace 13)))
                 a!96
                 (= (__f2 (select initial_1_trace 13)) a!78)))
      (a!99 (and (__f9 (__f4 (select initial_1_trace 14)))
                 a!98
                 (= (__f2 (select initial_1_trace 14)) a!78)))
      (a!101 (and (__f9 (__f4 (select initial_1_trace 15)))
                  a!100
                  (= (__f2 (select initial_1_trace 15)) a!78)))
      (a!103 (and (__f9 (__f4 (select initial_1_trace 16)))
                  a!102
                  (= (__f2 (select initial_1_trace 16)) a!78)))
      (a!105 (and (__f9 (__f4 (select initial_1_trace 17)))
                  a!104
                  (= (__f2 (select initial_1_trace 17)) a!78)))
      (a!108 (and (__f7 (__f4 (select initial_1_trace 0)))
                  a!107
                  (= (__f2 (select initial_1_trace 3)) a!37)))
      (a!110 (and (__f7 (__f4 (select initial_1_trace 1)))
                  a!109
                  (= (__f2 (select initial_1_trace 3)) a!3)))
      (a!112 (and (__f7 (__f4 (select initial_1_trace 2)))
                  a!111
                  (= (__f2 (select initial_1_trace 3)) a!41)))
      (a!116 (and (__f9 (__f4 (select initial_1_trace 5)))
                  a!114
                  (= (__f2 (select initial_1_trace 5)) a!115)))
      (a!118 (and (__f9 (__f4 (select initial_1_trace 6)))
                  a!117
                  (= (__f2 (select initial_1_trace 6)) a!115)))
      (a!120 (and (__f9 (__f4 (select initial_1_trace 7)))
                  a!119
                  (= (__f2 (select initial_1_trace 7)) a!115)))
      (a!122 (and (__f9 (__f4 (select initial_1_trace 8)))
                  a!121
                  (= (__f2 (select initial_1_trace 8)) a!115)))
      (a!124 (and (__f9 (__f4 (select initial_1_trace 9)))
                  a!123
                  (= (__f2 (select initial_1_trace 9)) a!115)))
      (a!126 (and (__f9 (__f4 (select initial_1_trace 10)))
                  a!125
                  (= (__f2 (select initial_1_trace 10)) a!115)))
      (a!128 (and (__f9 (__f4 (select initial_1_trace 11)))
                  a!127
                  (= (__f2 (select initial_1_trace 11)) a!115)))
      (a!130 (and (__f9 (__f4 (select initial_1_trace 12)))
                  a!129
                  (= (__f2 (select initial_1_trace 12)) a!115)))
      (a!132 (and (__f9 (__f4 (select initial_1_trace 13)))
                  a!131
                  (= (__f2 (select initial_1_trace 13)) a!115)))
      (a!134 (and (__f9 (__f4 (select initial_1_trace 14)))
                  a!133
                  (= (__f2 (select initial_1_trace 14)) a!115)))
      (a!136 (and (__f9 (__f4 (select initial_1_trace 15)))
                  a!135
                  (= (__f2 (select initial_1_trace 15)) a!115)))
      (a!138 (and (__f9 (__f4 (select initial_1_trace 16)))
                  a!137
                  (= (__f2 (select initial_1_trace 16)) a!115)))
      (a!140 (and (__f9 (__f4 (select initial_1_trace 17)))
                  a!139
                  (= (__f2 (select initial_1_trace 17)) a!115)))
      (a!143 (and (__f7 (__f4 (select initial_1_trace 0)))
                  a!142
                  (= (__f2 (select initial_1_trace 4)) a!37)))
      (a!145 (and (__f7 (__f4 (select initial_1_trace 1)))
                  a!144
                  (= (__f2 (select initial_1_trace 4)) a!3)))
      (a!147 (and (__f7 (__f4 (select initial_1_trace 2)))
                  a!146
                  (= (__f2 (select initial_1_trace 4)) a!41)))
      (a!149 (and (__f7 (__f4 (select initial_1_trace 3)))
                  a!148
                  (= (__f2 (select initial_1_trace 4)) a!78)))
      (a!153 (and (__f9 (__f4 (select initial_1_trace 6)))
                  a!151
                  (= (__f2 (select initial_1_trace 6)) a!152)))
      (a!155 (and (__f9 (__f4 (select initial_1_trace 7)))
                  a!154
                  (= (__f2 (select initial_1_trace 7)) a!152)))
      (a!157 (and (__f9 (__f4 (select initial_1_trace 8)))
                  a!156
                  (= (__f2 (select initial_1_trace 8)) a!152)))
      (a!159 (and (__f9 (__f4 (select initial_1_trace 9)))
                  a!158
                  (= (__f2 (select initial_1_trace 9)) a!152)))
      (a!161 (and (__f9 (__f4 (select initial_1_trace 10)))
                  a!160
                  (= (__f2 (select initial_1_trace 10)) a!152)))
      (a!163 (and (__f9 (__f4 (select initial_1_trace 11)))
                  a!162
                  (= (__f2 (select initial_1_trace 11)) a!152)))
      (a!165 (and (__f9 (__f4 (select initial_1_trace 12)))
                  a!164
                  (= (__f2 (select initial_1_trace 12)) a!152)))
      (a!167 (and (__f9 (__f4 (select initial_1_trace 13)))
                  a!166
                  (= (__f2 (select initial_1_trace 13)) a!152)))
      (a!169 (and (__f9 (__f4 (select initial_1_trace 14)))
                  a!168
                  (= (__f2 (select initial_1_trace 14)) a!152)))
      (a!171 (and (__f9 (__f4 (select initial_1_trace 15)))
                  a!170
                  (= (__f2 (select initial_1_trace 15)) a!152)))
      (a!173 (and (__f9 (__f4 (select initial_1_trace 16)))
                  a!172
                  (= (__f2 (select initial_1_trace 16)) a!152)))
      (a!175 (and (__f9 (__f4 (select initial_1_trace 17)))
                  a!174
                  (= (__f2 (select initial_1_trace 17)) a!152)))
      (a!178 (and (__f7 (__f4 (select initial_1_trace 0)))
                  a!177
                  (= (__f2 (select initial_1_trace 5)) a!37)))
      (a!180 (and (__f7 (__f4 (select initial_1_trace 1)))
                  a!179
                  (= (__f2 (select initial_1_trace 5)) a!3)))
      (a!182 (and (__f7 (__f4 (select initial_1_trace 2)))
                  a!181
                  (= (__f2 (select initial_1_trace 5)) a!41)))
      (a!184 (and (__f7 (__f4 (select initial_1_trace 3)))
                  a!183
                  (= (__f2 (select initial_1_trace 5)) a!78)))
      (a!186 (and (__f7 (__f4 (select initial_1_trace 4)))
                  a!185
                  (= (__f2 (select initial_1_trace 5)) a!115)))
      (a!190 (and (__f9 (__f4 (select initial_1_trace 7)))
                  a!188
                  (= (__f2 (select initial_1_trace 7)) a!189)))
      (a!192 (and (__f9 (__f4 (select initial_1_trace 8)))
                  a!191
                  (= (__f2 (select initial_1_trace 8)) a!189)))
      (a!194 (and (__f9 (__f4 (select initial_1_trace 9)))
                  a!193
                  (= (__f2 (select initial_1_trace 9)) a!189)))
      (a!196 (and (__f9 (__f4 (select initial_1_trace 10)))
                  a!195
                  (= (__f2 (select initial_1_trace 10)) a!189)))
      (a!198 (and (__f9 (__f4 (select initial_1_trace 11)))
                  a!197
                  (= (__f2 (select initial_1_trace 11)) a!189)))
      (a!200 (and (__f9 (__f4 (select initial_1_trace 12)))
                  a!199
                  (= (__f2 (select initial_1_trace 12)) a!189)))
      (a!202 (and (__f9 (__f4 (select initial_1_trace 13)))
                  a!201
                  (= (__f2 (select initial_1_trace 13)) a!189)))
      (a!204 (and (__f9 (__f4 (select initial_1_trace 14)))
                  a!203
                  (= (__f2 (select initial_1_trace 14)) a!189)))
      (a!206 (and (__f9 (__f4 (select initial_1_trace 15)))
                  a!205
                  (= (__f2 (select initial_1_trace 15)) a!189)))
      (a!208 (and (__f9 (__f4 (select initial_1_trace 16)))
                  a!207
                  (= (__f2 (select initial_1_trace 16)) a!189)))
      (a!210 (and (__f9 (__f4 (select initial_1_trace 17)))
                  a!209
                  (= (__f2 (select initial_1_trace 17)) a!189)))
      (a!213 (and (__f7 (__f4 (select initial_1_trace 0)))
                  a!212
                  (= (__f2 (select initial_1_trace 6)) a!37)))
      (a!215 (and (__f7 (__f4 (select initial_1_trace 1)))
                  a!214
                  (= (__f2 (select initial_1_trace 6)) a!3)))
      (a!217 (and (__f7 (__f4 (select initial_1_trace 2)))
                  a!216
                  (= (__f2 (select initial_1_trace 6)) a!41)))
      (a!219 (and (__f7 (__f4 (select initial_1_trace 3)))
                  a!218
                  (= (__f2 (select initial_1_trace 6)) a!78)))
      (a!221 (and (__f7 (__f4 (select initial_1_trace 4)))
                  a!220
                  (= (__f2 (select initial_1_trace 6)) a!115)))
      (a!223 (and (__f7 (__f4 (select initial_1_trace 5)))
                  a!222
                  (= (__f2 (select initial_1_trace 6)) a!152)))
      (a!227 (and (__f9 (__f4 (select initial_1_trace 8)))
                  a!225
                  (= (__f2 (select initial_1_trace 8)) a!226)))
      (a!229 (and (__f9 (__f4 (select initial_1_trace 9)))
                  a!228
                  (= (__f2 (select initial_1_trace 9)) a!226)))
      (a!231 (and (__f9 (__f4 (select initial_1_trace 10)))
                  a!230
                  (= (__f2 (select initial_1_trace 10)) a!226)))
      (a!233 (and (__f9 (__f4 (select initial_1_trace 11)))
                  a!232
                  (= (__f2 (select initial_1_trace 11)) a!226)))
      (a!235 (and (__f9 (__f4 (select initial_1_trace 12)))
                  a!234
                  (= (__f2 (select initial_1_trace 12)) a!226)))
      (a!237 (and (__f9 (__f4 (select initial_1_trace 13)))
                  a!236
                  (= (__f2 (select initial_1_trace 13)) a!226)))
      (a!239 (and (__f9 (__f4 (select initial_1_trace 14)))
                  a!238
                  (= (__f2 (select initial_1_trace 14)) a!226)))
      (a!241 (and (__f9 (__f4 (select initial_1_trace 15)))
                  a!240
                  (= (__f2 (select initial_1_trace 15)) a!226)))
      (a!243 (and (__f9 (__f4 (select initial_1_trace 16)))
                  a!242
                  (= (__f2 (select initial_1_trace 16)) a!226)))
      (a!245 (and (__f9 (__f4 (select initial_1_trace 17)))
                  a!244
                  (= (__f2 (select initial_1_trace 17)) a!226)))
      (a!248 (and (__f7 (__f4 (select initial_1_trace 0)))
                  a!247
                  (= (__f2 (select initial_1_trace 7)) a!37)))
      (a!250 (and (__f7 (__f4 (select initial_1_trace 1)))
                  a!249
                  (= (__f2 (select initial_1_trace 7)) a!3)))
      (a!252 (and (__f7 (__f4 (select initial_1_trace 2)))
                  a!251
                  (= (__f2 (select initial_1_trace 7)) a!41)))
      (a!254 (and (__f7 (__f4 (select initial_1_trace 3)))
                  a!253
                  (= (__f2 (select initial_1_trace 7)) a!78)))
      (a!256 (and (__f7 (__f4 (select initial_1_trace 4)))
                  a!255
                  (= (__f2 (select initial_1_trace 7)) a!115)))
      (a!258 (and (__f7 (__f4 (select initial_1_trace 5)))
                  a!257
                  (= (__f2 (select initial_1_trace 7)) a!152)))
      (a!260 (and (__f7 (__f4 (select initial_1_trace 6)))
                  a!259
                  (= (__f2 (select initial_1_trace 7)) a!189)))
      (a!264 (and (__f9 (__f4 (select initial_1_trace 9)))
                  a!262
                  (= (__f2 (select initial_1_trace 9)) a!263)))
      (a!266 (and (__f9 (__f4 (select initial_1_trace 10)))
                  a!265
                  (= (__f2 (select initial_1_trace 10)) a!263)))
      (a!268 (and (__f9 (__f4 (select initial_1_trace 11)))
                  a!267
                  (= (__f2 (select initial_1_trace 11)) a!263)))
      (a!270 (and (__f9 (__f4 (select initial_1_trace 12)))
                  a!269
                  (= (__f2 (select initial_1_trace 12)) a!263)))
      (a!272 (and (__f9 (__f4 (select initial_1_trace 13)))
                  a!271
                  (= (__f2 (select initial_1_trace 13)) a!263)))
      (a!274 (and (__f9 (__f4 (select initial_1_trace 14)))
                  a!273
                  (= (__f2 (select initial_1_trace 14)) a!263)))
      (a!276 (and (__f9 (__f4 (select initial_1_trace 15)))
                  a!275
                  (= (__f2 (select initial_1_trace 15)) a!263)))
      (a!278 (and (__f9 (__f4 (select initial_1_trace 16)))
                  a!277
                  (= (__f2 (select initial_1_trace 16)) a!263)))
      (a!280 (and (__f9 (__f4 (select initial_1_trace 17)))
                  a!279
                  (= (__f2 (select initial_1_trace 17)) a!263)))
      (a!283 (and (__f7 (__f4 (select initial_1_trace 0)))
                  a!282
                  (= (__f2 (select initial_1_trace 8)) a!37)))
      (a!285 (and (__f7 (__f4 (select initial_1_trace 1)))
                  a!284
                  (= (__f2 (select initial_1_trace 8)) a!3)))
      (a!287 (and (__f7 (__f4 (select initial_1_trace 2)))
                  a!286
                  (= (__f2 (select initial_1_trace 8)) a!41)))
      (a!289 (and (__f7 (__f4 (select initial_1_trace 3)))
                  a!288
                  (= (__f2 (select initial_1_trace 8)) a!78)))
      (a!291 (and (__f7 (__f4 (select initial_1_trace 4)))
                  a!290
                  (= (__f2 (select initial_1_trace 8)) a!115)))
      (a!293 (and (__f7 (__f4 (select initial_1_trace 5)))
                  a!292
                  (= (__f2 (select initial_1_trace 8)) a!152)))
      (a!295 (and (__f7 (__f4 (select initial_1_trace 6)))
                  a!294
                  (= (__f2 (select initial_1_trace 8)) a!189)))
      (a!297 (and (__f7 (__f4 (select initial_1_trace 7)))
                  a!296
                  (= (__f2 (select initial_1_trace 8)) a!226))))
  (and (or a!1
           a!4
           a!6
           a!8
           a!10
           a!12
           a!14
           a!16
           a!18
           a!20
           a!22
           a!24
           a!26
           a!28
           a!30
           a!32
           a!34)
       (or a!35 a!38)
       (or a!39
           a!42
           a!44
           a!46
           a!48
           a!50
           a!52
           a!54
           a!56
           a!58
           a!60
           a!62
           a!64
           a!66
           a!68
           a!70)
       (or a!71 a!73 a!75)
       (or a!76
           a!79
           a!81
           a!83
           a!85
           a!87
           a!89
           a!91
           a!93
           a!95
           a!97
           a!99
           a!101
           a!103
           a!105)
       (or a!106 a!108 a!110 a!112)
       (or a!113
           a!116
           a!118
           a!120
           a!122
           a!124
           a!126
           a!128
           a!130
           a!132
           a!134
           a!136
           a!138
           a!140)
       (or a!141 a!143 a!145 a!147 a!149)
       (or a!150
           a!153
           a!155
           a!157
           a!159
           a!161
           a!163
           a!165
           a!167
           a!169
           a!171
           a!173
           a!175)
       (or a!176 a!178 a!180 a!182 a!184 a!186)
       (or a!187
           a!190
           a!192
           a!194
           a!196
           a!198
           a!200
           a!202
           a!204
           a!206
           a!208
           a!210)
       (or a!211 a!213 a!215 a!217 a!219 a!221 a!223)
       (or a!224 a!227 a!229 a!231 a!233 a!235 a!237 a!239 a!241 a!243 a!245)
       (or a!246 a!248 a!250 a!252 a!254 a!256 a!258 a!260)
       (or a!261 a!264 a!266 a!268 a!270 a!272 a!274 a!276 a!278 a!280)
       (or a!281 a!283 a!285 a!287 a!289 a!291 a!293 a!295 a!297)))))
(assert (let ((a!1 (_tuple_0 false false false false false false false false false))
      (a!2 (= (__f10 (__f3 (select initial_1_trace 1))) 0))
      (a!4 (= (__f10 (__f3 (select initial_1_trace 2))) 0))
      (a!6 (= (__f10 (__f3 (select initial_1_trace 3))) 0))
      (a!8 (= (__f10 (__f3 (select initial_1_trace 4))) 0))
      (a!10 (= (__f10 (__f3 (select initial_1_trace 5))) 0))
      (a!12 (= (__f10 (__f3 (select initial_1_trace 6))) 0))
      (a!14 (= (__f10 (__f3 (select initial_1_trace 7))) 0))
      (a!16 (= (__f10 (__f3 (select initial_1_trace 8))) 0))
      (a!18 (= (__f10 (__f3 (select initial_1_trace 9))) 0))
      (a!20 (= (__f10 (__f3 (select initial_1_trace 10))) 0))
      (a!22 (= (__f10 (__f3 (select initial_1_trace 11))) 0))
      (a!24 (= (__f10 (__f3 (select initial_1_trace 12))) 0))
      (a!26 (= (__f10 (__f3 (select initial_1_trace 13))) 0))
      (a!28 (= (__f10 (__f3 (select initial_1_trace 14))) 0))
      (a!30 (= (__f10 (__f3 (select initial_1_trace 15))) 0))
      (a!32 (= (__f10 (__f3 (select initial_1_trace 16))) 0))
      (a!34 (= (__f10 (__f3 (select initial_1_trace 17))) 0)))
(let ((a!3 (or (__f6 (__f4 (select initial_1_trace 1)))
               (= (__f1 (select initial_1_trace 1)) a!1)
               a!2))
      (a!5 (or (__f6 (__f4 (select initial_1_trace 2)))
               (= (__f1 (select initial_1_trace 2)) a!1)
               a!4))
      (a!7 (or (__f6 (__f4 (select initial_1_trace 3)))
               (= (__f1 (select initial_1_trace 3)) a!1)
               a!6))
      (a!9 (or (__f6 (__f4 (select initial_1_trace 4)))
               (= (__f1 (select initial_1_trace 4)) a!1)
               a!8))
      (a!11 (or (__f6 (__f4 (select initial_1_trace 5)))
                (= (__f1 (select initial_1_trace 5)) a!1)
                a!10))
      (a!13 (or (__f6 (__f4 (select initial_1_trace 6)))
                (= (__f1 (select initial_1_trace 6)) a!1)
                a!12))
      (a!15 (or (__f6 (__f4 (select initial_1_trace 7)))
                (= (__f1 (select initial_1_trace 7)) a!1)
                a!14))
      (a!17 (or (__f6 (__f4 (select initial_1_trace 8)))
                (= (__f1 (select initial_1_trace 8)) a!1)
                a!16))
      (a!19 (or (__f6 (__f4 (select initial_1_trace 9)))
                (= (__f1 (select initial_1_trace 9)) a!1)
                a!18))
      (a!21 (or (__f6 (__f4 (select initial_1_trace 10)))
                (= (__f1 (select initial_1_trace 10)) a!1)
                a!20))
      (a!23 (or (__f6 (__f4 (select initial_1_trace 11)))
                (= (__f1 (select initial_1_trace 11)) a!1)
                a!22))
      (a!25 (or (__f6 (__f4 (select initial_1_trace 12)))
                (= (__f1 (select initial_1_trace 12)) a!1)
                a!24))
      (a!27 (or (__f6 (__f4 (select initial_1_trace 13)))
                (= (__f1 (select initial_1_trace 13)) a!1)
                a!26))
      (a!29 (or (__f6 (__f4 (select initial_1_trace 14)))
                (= (__f1 (select initial_1_trace 14)) a!1)
                a!28))
      (a!31 (or (__f6 (__f4 (select initial_1_trace 15)))
                (= (__f1 (select initial_1_trace 15)) a!1)
                a!30))
      (a!33 (or (__f6 (__f4 (select initial_1_trace 16)))
                (= (__f1 (select initial_1_trace 16)) a!1)
                a!32))
      (a!35 (or (__f6 (__f4 (select initial_1_trace 17)))
                (= (__f1 (select initial_1_trace 17)) a!1)
                a!34)))
  (and a!3
       a!5
       a!7
       a!9
       a!11
       a!13
       a!15
       a!17
       a!19
       a!21
       a!23
       a!25
       a!27
       a!29
       a!31
       a!33
       a!35))))
(assert (let ((a!1 (= (__f11 (__f4 (select initial_1_trace 1)))
              (__f9 (__f1 (select initial_1_trace 1)))))
      (a!2 (= (__f11 (__f4 (select initial_1_trace 2)))
              (__f9 (__f1 (select initial_1_trace 2)))))
      (a!3 (= (__f11 (__f4 (select initial_1_trace 3)))
              (__f9 (__f1 (select initial_1_trace 3)))))
      (a!4 (= (__f11 (__f4 (select initial_1_trace 4)))
              (__f9 (__f1 (select initial_1_trace 4)))))
      (a!5 (= (__f11 (__f4 (select initial_1_trace 5)))
              (__f9 (__f1 (select initial_1_trace 5)))))
      (a!6 (= (__f11 (__f4 (select initial_1_trace 6)))
              (__f9 (__f1 (select initial_1_trace 6)))))
      (a!7 (= (__f11 (__f4 (select initial_1_trace 7)))
              (__f9 (__f1 (select initial_1_trace 7)))))
      (a!8 (= (__f11 (__f4 (select initial_1_trace 8)))
              (__f9 (__f1 (select initial_1_trace 8)))))
      (a!9 (= (__f11 (__f4 (select initial_1_trace 9)))
              (__f9 (__f1 (select initial_1_trace 9)))))
      (a!10 (= (__f11 (__f4 (select initial_1_trace 10)))
               (__f9 (__f1 (select initial_1_trace 10)))))
      (a!11 (= (__f11 (__f4 (select initial_1_trace 11)))
               (__f9 (__f1 (select initial_1_trace 11)))))
      (a!12 (= (__f11 (__f4 (select initial_1_trace 12)))
               (__f9 (__f1 (select initial_1_trace 12)))))
      (a!13 (= (__f11 (__f4 (select initial_1_trace 13)))
               (__f9 (__f1 (select initial_1_trace 13)))))
      (a!14 (= (__f11 (__f4 (select initial_1_trace 14)))
               (__f9 (__f1 (select initial_1_trace 14)))))
      (a!15 (= (__f11 (__f4 (select initial_1_trace 15)))
               (__f9 (__f1 (select initial_1_trace 15)))))
      (a!16 (= (__f11 (__f4 (select initial_1_trace 16)))
               (__f9 (__f1 (select initial_1_trace 16)))))
      (a!17 (= (__f11 (__f4 (select initial_1_trace 17)))
               (__f9 (__f1 (select initial_1_trace 17))))))
  (and a!1
       a!2
       a!3
       a!4
       a!5
       a!6
       a!7
       a!8
       a!9
       a!10
       a!11
       a!12
       a!13
       a!14
       a!15
       a!16
       a!17)))
(assert (let ((a!1 (= (__f4 (__f4 (select initial_1_trace 1)))
              (__f2 (__f1 (select initial_1_trace 1)))))
      (a!2 (= (__f4 (__f4 (select initial_1_trace 2)))
              (__f2 (__f1 (select initial_1_trace 2)))))
      (a!3 (= (__f4 (__f4 (select initial_1_trace 3)))
              (__f2 (__f1 (select initial_1_trace 3)))))
      (a!4 (= (__f4 (__f4 (select initial_1_trace 4)))
              (__f2 (__f1 (select initial_1_trace 4)))))
      (a!5 (= (__f4 (__f4 (select initial_1_trace 5)))
              (__f2 (__f1 (select initial_1_trace 5)))))
      (a!6 (= (__f4 (__f4 (select initial_1_trace 6)))
              (__f2 (__f1 (select initial_1_trace 6)))))
      (a!7 (= (__f4 (__f4 (select initial_1_trace 7)))
              (__f2 (__f1 (select initial_1_trace 7)))))
      (a!8 (= (__f4 (__f4 (select initial_1_trace 8)))
              (__f2 (__f1 (select initial_1_trace 8)))))
      (a!9 (= (__f4 (__f4 (select initial_1_trace 9)))
              (__f2 (__f1 (select initial_1_trace 9)))))
      (a!10 (= (__f4 (__f4 (select initial_1_trace 10)))
               (__f2 (__f1 (select initial_1_trace 10)))))
      (a!11 (= (__f4 (__f4 (select initial_1_trace 11)))
               (__f2 (__f1 (select initial_1_trace 11)))))
      (a!12 (= (__f4 (__f4 (select initial_1_trace 12)))
               (__f2 (__f1 (select initial_1_trace 12)))))
      (a!13 (= (__f4 (__f4 (select initial_1_trace 13)))
               (__f2 (__f1 (select initial_1_trace 13)))))
      (a!14 (= (__f4 (__f4 (select initial_1_trace 14)))
               (__f2 (__f1 (select initial_1_trace 14)))))
      (a!15 (= (__f4 (__f4 (select initial_1_trace 15)))
               (__f2 (__f1 (select initial_1_trace 15)))))
      (a!16 (= (__f4 (__f4 (select initial_1_trace 16)))
               (__f2 (__f1 (select initial_1_trace 16)))))
      (a!17 (= (__f4 (__f4 (select initial_1_trace 17)))
               (__f2 (__f1 (select initial_1_trace 17))))))
  (and a!1
       a!2
       a!3
       a!4
       a!5
       a!6
       a!7
       a!8
       a!9
       a!10
       a!11
       a!12
       a!13
       a!14
       a!15
       a!16
       a!17)))
(assert (let ((a!1 (+ 11000000 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!2 (= (__f6 (__f3 (select initial_1_trace 2))) 0))
      (a!4 (= (__f6 (__f3 (select initial_1_trace 3))) 0))
      (a!6 (= (__f6 (__f3 (select initial_1_trace 4))) 0))
      (a!8 (= (__f6 (__f3 (select initial_1_trace 5))) 0))
      (a!10 (= (__f6 (__f3 (select initial_1_trace 6))) 0))
      (a!12 (= (__f6 (__f3 (select initial_1_trace 7))) 0))
      (a!14 (= (__f6 (__f3 (select initial_1_trace 8))) 0))
      (a!16 (= (__f6 (__f3 (select initial_1_trace 9))) 0))
      (a!18 (= (__f6 (__f3 (select initial_1_trace 10))) 0))
      (a!20 (= (__f6 (__f3 (select initial_1_trace 11))) 0))
      (a!22 (= (__f6 (__f3 (select initial_1_trace 12))) 0))
      (a!24 (= (__f6 (__f3 (select initial_1_trace 13))) 0))
      (a!26 (= (__f6 (__f3 (select initial_1_trace 14))) 0))
      (a!28 (= (__f6 (__f3 (select initial_1_trace 15))) 0))
      (a!30 (= (__f6 (__f3 (select initial_1_trace 16))) 0))
      (a!32 (= (__f6 (__f3 (select initial_1_trace 17))) 0))
      (a!34 (= (__f1 (__f3 (select initial_1_trace 1)))
               (__f1 (__f3 (select initial_1_trace 0)))))
      (a!35 (= (__f2 (__f3 (select initial_1_trace 1)))
               (__f2 (__f3 (select initial_1_trace 0)))))
      (a!36 (= (__f3 (__f3 (select initial_1_trace 1)))
               (__f3 (__f3 (select initial_1_trace 0)))))
      (a!37 (= (__f4 (__f3 (select initial_1_trace 1)))
               (__f4 (__f3 (select initial_1_trace 0)))))
      (a!38 (= (__f7 (__f3 (select initial_1_trace 1))) 0))
      (a!39 (not (__f3 (__f4 (select initial_1_trace 1)))))
      (a!40 (= (__f9 (__f3 (select initial_1_trace 1))) 0))
      (a!41 (not (__f5 (__f4 (select initial_1_trace 1)))))
      (a!42 (= (__f11 (__f3 (select initial_1_trace 1))) 0))
      (a!43 (not (__f7 (__f4 (select initial_1_trace 1)))))
      (a!44 (= (__f12 (__f3 (select initial_1_trace 1))) 0))
      (a!45 (not (__f8 (__f4 (select initial_1_trace 1)))))
      (a!46 (not (__f1 (__f5 (select initial_1_trace 1)))))
      (a!48 (not (__f5 (__f1 (select initial_1_trace 1)))))
      (a!49 (+ 11000000 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!65 (= (__f1 (__f3 (select initial_1_trace 2)))
               (__f1 (__f3 (select initial_1_trace 1)))))
      (a!66 (= (__f2 (__f3 (select initial_1_trace 2)))
               (__f2 (__f3 (select initial_1_trace 1)))))
      (a!67 (= (__f3 (__f3 (select initial_1_trace 2)))
               (__f3 (__f3 (select initial_1_trace 1)))))
      (a!68 (= (__f4 (__f3 (select initial_1_trace 2)))
               (__f4 (__f3 (select initial_1_trace 1)))))
      (a!69 (= (__f7 (__f3 (select initial_1_trace 2))) 0))
      (a!70 (not (__f3 (__f4 (select initial_1_trace 2)))))
      (a!71 (= (__f9 (__f3 (select initial_1_trace 2))) 0))
      (a!72 (not (__f5 (__f4 (select initial_1_trace 2)))))
      (a!73 (= (__f11 (__f3 (select initial_1_trace 2))) 0))
      (a!74 (not (__f7 (__f4 (select initial_1_trace 2)))))
      (a!75 (= (__f12 (__f3 (select initial_1_trace 2))) 0))
      (a!76 (not (__f8 (__f4 (select initial_1_trace 2)))))
      (a!77 (not (__f1 (__f5 (select initial_1_trace 2)))))
      (a!79 (not (__f5 (__f1 (select initial_1_trace 2)))))
      (a!80 (+ 11000000 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!95 (= (__f1 (__f3 (select initial_1_trace 3)))
               (__f1 (__f3 (select initial_1_trace 2)))))
      (a!96 (= (__f2 (__f3 (select initial_1_trace 3)))
               (__f2 (__f3 (select initial_1_trace 2)))))
      (a!97 (= (__f3 (__f3 (select initial_1_trace 3)))
               (__f3 (__f3 (select initial_1_trace 2)))))
      (a!98 (= (__f4 (__f3 (select initial_1_trace 3)))
               (__f4 (__f3 (select initial_1_trace 2)))))
      (a!99 (= (__f7 (__f3 (select initial_1_trace 3))) 0))
      (a!100 (not (__f3 (__f4 (select initial_1_trace 3)))))
      (a!101 (= (__f9 (__f3 (select initial_1_trace 3))) 0))
      (a!102 (not (__f5 (__f4 (select initial_1_trace 3)))))
      (a!103 (= (__f11 (__f3 (select initial_1_trace 3))) 0))
      (a!104 (not (__f7 (__f4 (select initial_1_trace 3)))))
      (a!105 (= (__f12 (__f3 (select initial_1_trace 3))) 0))
      (a!106 (not (__f8 (__f4 (select initial_1_trace 3)))))
      (a!107 (not (__f1 (__f5 (select initial_1_trace 3)))))
      (a!109 (not (__f5 (__f1 (select initial_1_trace 3)))))
      (a!110 (+ 11000000 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!124 (= (__f1 (__f3 (select initial_1_trace 4)))
                (__f1 (__f3 (select initial_1_trace 3)))))
      (a!125 (= (__f2 (__f3 (select initial_1_trace 4)))
                (__f2 (__f3 (select initial_1_trace 3)))))
      (a!126 (= (__f3 (__f3 (select initial_1_trace 4)))
                (__f3 (__f3 (select initial_1_trace 3)))))
      (a!127 (= (__f4 (__f3 (select initial_1_trace 4)))
                (__f4 (__f3 (select initial_1_trace 3)))))
      (a!128 (= (__f7 (__f3 (select initial_1_trace 4))) 0))
      (a!129 (not (__f3 (__f4 (select initial_1_trace 4)))))
      (a!130 (= (__f9 (__f3 (select initial_1_trace 4))) 0))
      (a!131 (not (__f5 (__f4 (select initial_1_trace 4)))))
      (a!132 (= (__f11 (__f3 (select initial_1_trace 4))) 0))
      (a!133 (not (__f7 (__f4 (select initial_1_trace 4)))))
      (a!134 (= (__f12 (__f3 (select initial_1_trace 4))) 0))
      (a!135 (not (__f8 (__f4 (select initial_1_trace 4)))))
      (a!136 (not (__f1 (__f5 (select initial_1_trace 4)))))
      (a!138 (not (__f5 (__f1 (select initial_1_trace 4)))))
      (a!139 (+ 11000000 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!152 (= (__f1 (__f3 (select initial_1_trace 5)))
                (__f1 (__f3 (select initial_1_trace 4)))))
      (a!153 (= (__f2 (__f3 (select initial_1_trace 5)))
                (__f2 (__f3 (select initial_1_trace 4)))))
      (a!154 (= (__f3 (__f3 (select initial_1_trace 5)))
                (__f3 (__f3 (select initial_1_trace 4)))))
      (a!155 (= (__f4 (__f3 (select initial_1_trace 5)))
                (__f4 (__f3 (select initial_1_trace 4)))))
      (a!156 (= (__f7 (__f3 (select initial_1_trace 5))) 0))
      (a!157 (not (__f3 (__f4 (select initial_1_trace 5)))))
      (a!158 (= (__f9 (__f3 (select initial_1_trace 5))) 0))
      (a!159 (not (__f5 (__f4 (select initial_1_trace 5)))))
      (a!160 (= (__f11 (__f3 (select initial_1_trace 5))) 0))
      (a!161 (not (__f7 (__f4 (select initial_1_trace 5)))))
      (a!162 (= (__f12 (__f3 (select initial_1_trace 5))) 0))
      (a!163 (not (__f8 (__f4 (select initial_1_trace 5)))))
      (a!164 (not (__f1 (__f5 (select initial_1_trace 5)))))
      (a!166 (not (__f5 (__f1 (select initial_1_trace 5)))))
      (a!167 (+ 11000000 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!179 (= (__f1 (__f3 (select initial_1_trace 6)))
                (__f1 (__f3 (select initial_1_trace 5)))))
      (a!180 (= (__f2 (__f3 (select initial_1_trace 6)))
                (__f2 (__f3 (select initial_1_trace 5)))))
      (a!181 (= (__f3 (__f3 (select initial_1_trace 6)))
                (__f3 (__f3 (select initial_1_trace 5)))))
      (a!182 (= (__f4 (__f3 (select initial_1_trace 6)))
                (__f4 (__f3 (select initial_1_trace 5)))))
      (a!183 (= (__f7 (__f3 (select initial_1_trace 6))) 0))
      (a!184 (not (__f3 (__f4 (select initial_1_trace 6)))))
      (a!185 (= (__f9 (__f3 (select initial_1_trace 6))) 0))
      (a!186 (not (__f5 (__f4 (select initial_1_trace 6)))))
      (a!187 (= (__f11 (__f3 (select initial_1_trace 6))) 0))
      (a!188 (not (__f7 (__f4 (select initial_1_trace 6)))))
      (a!189 (= (__f12 (__f3 (select initial_1_trace 6))) 0))
      (a!190 (not (__f8 (__f4 (select initial_1_trace 6)))))
      (a!191 (not (__f1 (__f5 (select initial_1_trace 6)))))
      (a!193 (not (__f5 (__f1 (select initial_1_trace 6)))))
      (a!194 (+ 11000000 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!205 (= (__f1 (__f3 (select initial_1_trace 7)))
                (__f1 (__f3 (select initial_1_trace 6)))))
      (a!206 (= (__f2 (__f3 (select initial_1_trace 7)))
                (__f2 (__f3 (select initial_1_trace 6)))))
      (a!207 (= (__f3 (__f3 (select initial_1_trace 7)))
                (__f3 (__f3 (select initial_1_trace 6)))))
      (a!208 (= (__f4 (__f3 (select initial_1_trace 7)))
                (__f4 (__f3 (select initial_1_trace 6)))))
      (a!209 (= (__f7 (__f3 (select initial_1_trace 7))) 0))
      (a!210 (not (__f3 (__f4 (select initial_1_trace 7)))))
      (a!211 (= (__f9 (__f3 (select initial_1_trace 7))) 0))
      (a!212 (not (__f5 (__f4 (select initial_1_trace 7)))))
      (a!213 (= (__f11 (__f3 (select initial_1_trace 7))) 0))
      (a!214 (not (__f7 (__f4 (select initial_1_trace 7)))))
      (a!215 (= (__f12 (__f3 (select initial_1_trace 7))) 0))
      (a!216 (not (__f8 (__f4 (select initial_1_trace 7)))))
      (a!217 (not (__f1 (__f5 (select initial_1_trace 7)))))
      (a!219 (not (__f5 (__f1 (select initial_1_trace 7)))))
      (a!220 (+ 11000000 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!230 (= (__f1 (__f3 (select initial_1_trace 8)))
                (__f1 (__f3 (select initial_1_trace 7)))))
      (a!231 (= (__f2 (__f3 (select initial_1_trace 8)))
                (__f2 (__f3 (select initial_1_trace 7)))))
      (a!232 (= (__f3 (__f3 (select initial_1_trace 8)))
                (__f3 (__f3 (select initial_1_trace 7)))))
      (a!233 (= (__f4 (__f3 (select initial_1_trace 8)))
                (__f4 (__f3 (select initial_1_trace 7)))))
      (a!234 (= (__f7 (__f3 (select initial_1_trace 8))) 0))
      (a!235 (not (__f3 (__f4 (select initial_1_trace 8)))))
      (a!236 (= (__f9 (__f3 (select initial_1_trace 8))) 0))
      (a!237 (not (__f5 (__f4 (select initial_1_trace 8)))))
      (a!238 (= (__f11 (__f3 (select initial_1_trace 8))) 0))
      (a!239 (not (__f7 (__f4 (select initial_1_trace 8)))))
      (a!240 (= (__f12 (__f3 (select initial_1_trace 8))) 0))
      (a!241 (not (__f8 (__f4 (select initial_1_trace 8)))))
      (a!242 (not (__f1 (__f5 (select initial_1_trace 8)))))
      (a!244 (not (__f5 (__f1 (select initial_1_trace 8))))))
(let ((a!3 (and (__f2 (__f4 (select initial_1_trace 2)))
                (= (__f2 (select initial_1_trace 2)) (_tuple_2 a!1 0))
                a!2))
      (a!5 (and (__f2 (__f4 (select initial_1_trace 3)))
                (= (__f2 (select initial_1_trace 3)) (_tuple_2 a!1 0))
                a!4))
      (a!7 (and (__f2 (__f4 (select initial_1_trace 4)))
                (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!1 0))
                a!6))
      (a!9 (and (__f2 (__f4 (select initial_1_trace 5)))
                (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!1 0))
                a!8))
      (a!11 (and (__f2 (__f4 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!1 0))
                 a!10))
      (a!13 (and (__f2 (__f4 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!1 0))
                 a!12))
      (a!15 (and (__f2 (__f4 (select initial_1_trace 8)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!1 0))
                 a!14))
      (a!17 (and (__f2 (__f4 (select initial_1_trace 9)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!1 0))
                 a!16))
      (a!19 (and (__f2 (__f4 (select initial_1_trace 10)))
                 (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!1 0))
                 a!18))
      (a!21 (and (__f2 (__f4 (select initial_1_trace 11)))
                 (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!1 0))
                 a!20))
      (a!23 (and (__f2 (__f4 (select initial_1_trace 12)))
                 (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!1 0))
                 a!22))
      (a!25 (and (__f2 (__f4 (select initial_1_trace 13)))
                 (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!1 0))
                 a!24))
      (a!27 (and (__f2 (__f4 (select initial_1_trace 14)))
                 (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!1 0))
                 a!26))
      (a!29 (and (__f2 (__f4 (select initial_1_trace 15)))
                 (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!1 0))
                 a!28))
      (a!31 (and (__f2 (__f4 (select initial_1_trace 16)))
                 (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!1 0))
                 a!30))
      (a!33 (and (__f2 (__f4 (select initial_1_trace 17)))
                 (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!1 0))
                 a!32))
      (a!50 (and (__f2 (__f4 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 3)) (_tuple_2 a!49 0))
                 a!4))
      (a!51 (and (__f2 (__f4 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!49 0))
                 a!6))
      (a!52 (and (__f2 (__f4 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!49 0))
                 a!8))
      (a!53 (and (__f2 (__f4 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!49 0))
                 a!10))
      (a!54 (and (__f2 (__f4 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!49 0))
                 a!12))
      (a!55 (and (__f2 (__f4 (select initial_1_trace 8)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!49 0))
                 a!14))
      (a!56 (and (__f2 (__f4 (select initial_1_trace 9)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!49 0))
                 a!16))
      (a!57 (and (__f2 (__f4 (select initial_1_trace 10)))
                 (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!49 0))
                 a!18))
      (a!58 (and (__f2 (__f4 (select initial_1_trace 11)))
                 (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!49 0))
                 a!20))
      (a!59 (and (__f2 (__f4 (select initial_1_trace 12)))
                 (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!49 0))
                 a!22))
      (a!60 (and (__f2 (__f4 (select initial_1_trace 13)))
                 (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!49 0))
                 a!24))
      (a!61 (and (__f2 (__f4 (select initial_1_trace 14)))
                 (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!49 0))
                 a!26))
      (a!62 (and (__f2 (__f4 (select initial_1_trace 15)))
                 (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!49 0))
                 a!28))
      (a!63 (and (__f2 (__f4 (select initial_1_trace 16)))
                 (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!49 0))
                 a!30))
      (a!64 (and (__f2 (__f4 (select initial_1_trace 17)))
                 (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!49 0))
                 a!32))
      (a!81 (and (__f2 (__f4 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!80 0))
                 a!6))
      (a!82 (and (__f2 (__f4 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!80 0))
                 a!8))
      (a!83 (and (__f2 (__f4 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!80 0))
                 a!10))
      (a!84 (and (__f2 (__f4 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!80 0))
                 a!12))
      (a!85 (and (__f2 (__f4 (select initial_1_trace 8)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!80 0))
                 a!14))
      (a!86 (and (__f2 (__f4 (select initial_1_trace 9)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!80 0))
                 a!16))
      (a!87 (and (__f2 (__f4 (select initial_1_trace 10)))
                 (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!80 0))
                 a!18))
      (a!88 (and (__f2 (__f4 (select initial_1_trace 11)))
                 (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!80 0))
                 a!20))
      (a!89 (and (__f2 (__f4 (select initial_1_trace 12)))
                 (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!80 0))
                 a!22))
      (a!90 (and (__f2 (__f4 (select initial_1_trace 13)))
                 (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!80 0))
                 a!24))
      (a!91 (and (__f2 (__f4 (select initial_1_trace 14)))
                 (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!80 0))
                 a!26))
      (a!92 (and (__f2 (__f4 (select initial_1_trace 15)))
                 (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!80 0))
                 a!28))
      (a!93 (and (__f2 (__f4 (select initial_1_trace 16)))
                 (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!80 0))
                 a!30))
      (a!94 (and (__f2 (__f4 (select initial_1_trace 17)))
                 (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!80 0))
                 a!32))
      (a!111 (and (__f2 (__f4 (select initial_1_trace 5)))
                  (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!110 0))
                  a!8))
      (a!112 (and (__f2 (__f4 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!110 0))
                  a!10))
      (a!113 (and (__f2 (__f4 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!110 0))
                  a!12))
      (a!114 (and (__f2 (__f4 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!110 0))
                  a!14))
      (a!115 (and (__f2 (__f4 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!110 0))
                  a!16))
      (a!116 (and (__f2 (__f4 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!110 0))
                  a!18))
      (a!117 (and (__f2 (__f4 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!110 0))
                  a!20))
      (a!118 (and (__f2 (__f4 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!110 0))
                  a!22))
      (a!119 (and (__f2 (__f4 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!110 0))
                  a!24))
      (a!120 (and (__f2 (__f4 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!110 0))
                  a!26))
      (a!121 (and (__f2 (__f4 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!110 0))
                  a!28))
      (a!122 (and (__f2 (__f4 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!110 0))
                  a!30))
      (a!123 (and (__f2 (__f4 (select initial_1_trace 17)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!110 0))
                  a!32))
      (a!140 (and (__f2 (__f4 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!139 0))
                  a!10))
      (a!141 (and (__f2 (__f4 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!139 0))
                  a!12))
      (a!142 (and (__f2 (__f4 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!139 0))
                  a!14))
      (a!143 (and (__f2 (__f4 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!139 0))
                  a!16))
      (a!144 (and (__f2 (__f4 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!139 0))
                  a!18))
      (a!145 (and (__f2 (__f4 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!139 0))
                  a!20))
      (a!146 (and (__f2 (__f4 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!139 0))
                  a!22))
      (a!147 (and (__f2 (__f4 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!139 0))
                  a!24))
      (a!148 (and (__f2 (__f4 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!139 0))
                  a!26))
      (a!149 (and (__f2 (__f4 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!139 0))
                  a!28))
      (a!150 (and (__f2 (__f4 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!139 0))
                  a!30))
      (a!151 (and (__f2 (__f4 (select initial_1_trace 17)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!139 0))
                  a!32))
      (a!168 (and (__f2 (__f4 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!167 0))
                  a!12))
      (a!169 (and (__f2 (__f4 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!167 0))
                  a!14))
      (a!170 (and (__f2 (__f4 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!167 0))
                  a!16))
      (a!171 (and (__f2 (__f4 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!167 0))
                  a!18))
      (a!172 (and (__f2 (__f4 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!167 0))
                  a!20))
      (a!173 (and (__f2 (__f4 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!167 0))
                  a!22))
      (a!174 (and (__f2 (__f4 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!167 0))
                  a!24))
      (a!175 (and (__f2 (__f4 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!167 0))
                  a!26))
      (a!176 (and (__f2 (__f4 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!167 0))
                  a!28))
      (a!177 (and (__f2 (__f4 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!167 0))
                  a!30))
      (a!178 (and (__f2 (__f4 (select initial_1_trace 17)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!167 0))
                  a!32))
      (a!195 (and (__f2 (__f4 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!194 0))
                  a!14))
      (a!196 (and (__f2 (__f4 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!194 0))
                  a!16))
      (a!197 (and (__f2 (__f4 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!194 0))
                  a!18))
      (a!198 (and (__f2 (__f4 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!194 0))
                  a!20))
      (a!199 (and (__f2 (__f4 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!194 0))
                  a!22))
      (a!200 (and (__f2 (__f4 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!194 0))
                  a!24))
      (a!201 (and (__f2 (__f4 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!194 0))
                  a!26))
      (a!202 (and (__f2 (__f4 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!194 0))
                  a!28))
      (a!203 (and (__f2 (__f4 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!194 0))
                  a!30))
      (a!204 (and (__f2 (__f4 (select initial_1_trace 17)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!194 0))
                  a!32))
      (a!221 (and (__f2 (__f4 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!220 0))
                  a!16))
      (a!222 (and (__f2 (__f4 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!220 0))
                  a!18))
      (a!223 (and (__f2 (__f4 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!220 0))
                  a!20))
      (a!224 (and (__f2 (__f4 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!220 0))
                  a!22))
      (a!225 (and (__f2 (__f4 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!220 0))
                  a!24))
      (a!226 (and (__f2 (__f4 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!220 0))
                  a!26))
      (a!227 (and (__f2 (__f4 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!220 0))
                  a!28))
      (a!228 (and (__f2 (__f4 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!220 0))
                  a!30))
      (a!229 (and (__f2 (__f4 (select initial_1_trace 17)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!220 0))
                  a!32)))
(let ((a!47 (and (or a!3
                     a!5
                     a!7
                     a!9
                     a!11
                     a!13
                     a!15
                     a!17
                     a!19
                     a!21
                     a!23
                     a!25
                     a!27
                     a!29
                     a!31
                     a!33)
                 (__f2 (__f5 (select initial_1_trace 1)))
                 a!34
                 a!35
                 a!36
                 a!37
                 a!38
                 a!39
                 a!40
                 a!41
                 a!42
                 a!43
                 a!44
                 a!45
                 a!46))
      (a!78 (and (or a!50
                     a!51
                     a!52
                     a!53
                     a!54
                     a!55
                     a!56
                     a!57
                     a!58
                     a!59
                     a!60
                     a!61
                     a!62
                     a!63
                     a!64)
                 (__f2 (__f5 (select initial_1_trace 2)))
                 a!65
                 a!66
                 a!67
                 a!68
                 a!69
                 a!70
                 a!71
                 a!72
                 a!73
                 a!74
                 a!75
                 a!76
                 a!77))
      (a!108 (and (or a!81
                      a!82
                      a!83
                      a!84
                      a!85
                      a!86
                      a!87
                      a!88
                      a!89
                      a!90
                      a!91
                      a!92
                      a!93
                      a!94)
                  (__f2 (__f5 (select initial_1_trace 3)))
                  a!95
                  a!96
                  a!97
                  a!98
                  a!99
                  a!100
                  a!101
                  a!102
                  a!103
                  a!104
                  a!105
                  a!106
                  a!107))
      (a!137 (and (or a!111
                      a!112
                      a!113
                      a!114
                      a!115
                      a!116
                      a!117
                      a!118
                      a!119
                      a!120
                      a!121
                      a!122
                      a!123)
                  (__f2 (__f5 (select initial_1_trace 4)))
                  a!124
                  a!125
                  a!126
                  a!127
                  a!128
                  a!129
                  a!130
                  a!131
                  a!132
                  a!133
                  a!134
                  a!135
                  a!136))
      (a!165 (and (or a!140
                      a!141
                      a!142
                      a!143
                      a!144
                      a!145
                      a!146
                      a!147
                      a!148
                      a!149
                      a!150
                      a!151)
                  (__f2 (__f5 (select initial_1_trace 5)))
                  a!152
                  a!153
                  a!154
                  a!155
                  a!156
                  a!157
                  a!158
                  a!159
                  a!160
                  a!161
                  a!162
                  a!163
                  a!164))
      (a!192 (and (or a!168
                      a!169
                      a!170
                      a!171
                      a!172
                      a!173
                      a!174
                      a!175
                      a!176
                      a!177
                      a!178)
                  (__f2 (__f5 (select initial_1_trace 6)))
                  a!179
                  a!180
                  a!181
                  a!182
                  a!183
                  a!184
                  a!185
                  a!186
                  a!187
                  a!188
                  a!189
                  a!190
                  a!191))
      (a!218 (and (or a!195
                      a!196
                      a!197
                      a!198
                      a!199
                      a!200
                      a!201
                      a!202
                      a!203
                      a!204)
                  (__f2 (__f5 (select initial_1_trace 7)))
                  a!205
                  a!206
                  a!207
                  a!208
                  a!209
                  a!210
                  a!211
                  a!212
                  a!213
                  a!214
                  a!215
                  a!216
                  a!217))
      (a!243 (and (or a!221 a!222 a!223 a!224 a!225 a!226 a!227 a!228 a!229)
                  (__f2 (__f5 (select initial_1_trace 8)))
                  a!230
                  a!231
                  a!232
                  a!233
                  a!234
                  a!235
                  a!236
                  a!237
                  a!238
                  a!239
                  a!240
                  a!241
                  a!242)))
  (and (or a!47 a!48)
       (or a!78 a!79)
       (or a!108 a!109)
       (or a!137 a!138)
       (or a!165 a!166)
       (or a!192 a!193)
       (or a!218 a!219)
       (or a!243 a!244))))))
(assert (let ((a!1 (= (__f6 (__f4 (select initial_1_trace 1)))
              (__f4 (__f1 (select initial_1_trace 1)))))
      (a!2 (= (__f6 (__f4 (select initial_1_trace 2)))
              (__f4 (__f1 (select initial_1_trace 2)))))
      (a!3 (= (__f6 (__f4 (select initial_1_trace 3)))
              (__f4 (__f1 (select initial_1_trace 3)))))
      (a!4 (= (__f6 (__f4 (select initial_1_trace 4)))
              (__f4 (__f1 (select initial_1_trace 4)))))
      (a!5 (= (__f6 (__f4 (select initial_1_trace 5)))
              (__f4 (__f1 (select initial_1_trace 5)))))
      (a!6 (= (__f6 (__f4 (select initial_1_trace 6)))
              (__f4 (__f1 (select initial_1_trace 6)))))
      (a!7 (= (__f6 (__f4 (select initial_1_trace 7)))
              (__f4 (__f1 (select initial_1_trace 7)))))
      (a!8 (= (__f6 (__f4 (select initial_1_trace 8)))
              (__f4 (__f1 (select initial_1_trace 8)))))
      (a!9 (= (__f6 (__f4 (select initial_1_trace 9)))
              (__f4 (__f1 (select initial_1_trace 9)))))
      (a!10 (= (__f6 (__f4 (select initial_1_trace 10)))
               (__f4 (__f1 (select initial_1_trace 10)))))
      (a!11 (= (__f6 (__f4 (select initial_1_trace 11)))
               (__f4 (__f1 (select initial_1_trace 11)))))
      (a!12 (= (__f6 (__f4 (select initial_1_trace 12)))
               (__f4 (__f1 (select initial_1_trace 12)))))
      (a!13 (= (__f6 (__f4 (select initial_1_trace 13)))
               (__f4 (__f1 (select initial_1_trace 13)))))
      (a!14 (= (__f6 (__f4 (select initial_1_trace 14)))
               (__f4 (__f1 (select initial_1_trace 14)))))
      (a!15 (= (__f6 (__f4 (select initial_1_trace 15)))
               (__f4 (__f1 (select initial_1_trace 15)))))
      (a!16 (= (__f6 (__f4 (select initial_1_trace 16)))
               (__f4 (__f1 (select initial_1_trace 16)))))
      (a!17 (= (__f6 (__f4 (select initial_1_trace 17)))
               (__f4 (__f1 (select initial_1_trace 17))))))
  (and a!1
       a!2
       a!3
       a!4
       a!5
       a!6
       a!7
       a!8
       a!9
       a!10
       a!11
       a!12
       a!13
       a!14
       a!15
       a!16
       a!17)))
(assert (let ((a!1 (_tuple_0 false false false false false false false false false))
      (a!2 (_tuple_0 true false false false false false false false false))
      (a!3 (_tuple_0 false true false false false false false false false))
      (a!4 (_tuple_0 false false true false false false false false false))
      (a!5 (_tuple_0 false false false true false false false false false))
      (a!6 (_tuple_0 false false false false true false false false false))
      (a!7 (_tuple_0 false false false false false true false false false))
      (a!8 (_tuple_0 false false false false false false true false false))
      (a!9 (_tuple_0 false false false false false false false true false))
      (a!10 (_tuple_0 false false false false false false false false true)))
(let ((a!11 (or (= (__f1 (select initial_1_trace 0)) a!1)
                (= (__f1 (select initial_1_trace 0)) a!2)
                (= (__f1 (select initial_1_trace 0)) a!3)
                (= (__f1 (select initial_1_trace 0)) a!4)
                (= (__f1 (select initial_1_trace 0)) a!5)
                (= (__f1 (select initial_1_trace 0)) a!6)
                (= (__f1 (select initial_1_trace 0)) a!7)
                (= (__f1 (select initial_1_trace 0)) a!8)
                (= (__f1 (select initial_1_trace 0)) a!9)
                (= (__f1 (select initial_1_trace 0)) a!10)))
      (a!12 (or (= (__f1 (select initial_1_trace 1)) a!1)
                (= (__f1 (select initial_1_trace 1)) a!2)
                (= (__f1 (select initial_1_trace 1)) a!3)
                (= (__f1 (select initial_1_trace 1)) a!4)
                (= (__f1 (select initial_1_trace 1)) a!5)
                (= (__f1 (select initial_1_trace 1)) a!6)
                (= (__f1 (select initial_1_trace 1)) a!7)
                (= (__f1 (select initial_1_trace 1)) a!8)
                (= (__f1 (select initial_1_trace 1)) a!9)
                (= (__f1 (select initial_1_trace 1)) a!10)))
      (a!13 (or (= (__f1 (select initial_1_trace 2)) a!1)
                (= (__f1 (select initial_1_trace 2)) a!2)
                (= (__f1 (select initial_1_trace 2)) a!3)
                (= (__f1 (select initial_1_trace 2)) a!4)
                (= (__f1 (select initial_1_trace 2)) a!5)
                (= (__f1 (select initial_1_trace 2)) a!6)
                (= (__f1 (select initial_1_trace 2)) a!7)
                (= (__f1 (select initial_1_trace 2)) a!8)
                (= (__f1 (select initial_1_trace 2)) a!9)
                (= (__f1 (select initial_1_trace 2)) a!10)))
      (a!14 (or (= (__f1 (select initial_1_trace 3)) a!1)
                (= (__f1 (select initial_1_trace 3)) a!2)
                (= (__f1 (select initial_1_trace 3)) a!3)
                (= (__f1 (select initial_1_trace 3)) a!4)
                (= (__f1 (select initial_1_trace 3)) a!5)
                (= (__f1 (select initial_1_trace 3)) a!6)
                (= (__f1 (select initial_1_trace 3)) a!7)
                (= (__f1 (select initial_1_trace 3)) a!8)
                (= (__f1 (select initial_1_trace 3)) a!9)
                (= (__f1 (select initial_1_trace 3)) a!10)))
      (a!15 (or (= (__f1 (select initial_1_trace 4)) a!1)
                (= (__f1 (select initial_1_trace 4)) a!2)
                (= (__f1 (select initial_1_trace 4)) a!3)
                (= (__f1 (select initial_1_trace 4)) a!4)
                (= (__f1 (select initial_1_trace 4)) a!5)
                (= (__f1 (select initial_1_trace 4)) a!6)
                (= (__f1 (select initial_1_trace 4)) a!7)
                (= (__f1 (select initial_1_trace 4)) a!8)
                (= (__f1 (select initial_1_trace 4)) a!9)
                (= (__f1 (select initial_1_trace 4)) a!10)))
      (a!16 (or (= (__f1 (select initial_1_trace 5)) a!1)
                (= (__f1 (select initial_1_trace 5)) a!2)
                (= (__f1 (select initial_1_trace 5)) a!3)
                (= (__f1 (select initial_1_trace 5)) a!4)
                (= (__f1 (select initial_1_trace 5)) a!5)
                (= (__f1 (select initial_1_trace 5)) a!6)
                (= (__f1 (select initial_1_trace 5)) a!7)
                (= (__f1 (select initial_1_trace 5)) a!8)
                (= (__f1 (select initial_1_trace 5)) a!9)
                (= (__f1 (select initial_1_trace 5)) a!10)))
      (a!17 (or (= (__f1 (select initial_1_trace 6)) a!1)
                (= (__f1 (select initial_1_trace 6)) a!2)
                (= (__f1 (select initial_1_trace 6)) a!3)
                (= (__f1 (select initial_1_trace 6)) a!4)
                (= (__f1 (select initial_1_trace 6)) a!5)
                (= (__f1 (select initial_1_trace 6)) a!6)
                (= (__f1 (select initial_1_trace 6)) a!7)
                (= (__f1 (select initial_1_trace 6)) a!8)
                (= (__f1 (select initial_1_trace 6)) a!9)
                (= (__f1 (select initial_1_trace 6)) a!10)))
      (a!18 (or (= (__f1 (select initial_1_trace 7)) a!1)
                (= (__f1 (select initial_1_trace 7)) a!2)
                (= (__f1 (select initial_1_trace 7)) a!3)
                (= (__f1 (select initial_1_trace 7)) a!4)
                (= (__f1 (select initial_1_trace 7)) a!5)
                (= (__f1 (select initial_1_trace 7)) a!6)
                (= (__f1 (select initial_1_trace 7)) a!7)
                (= (__f1 (select initial_1_trace 7)) a!8)
                (= (__f1 (select initial_1_trace 7)) a!9)
                (= (__f1 (select initial_1_trace 7)) a!10)))
      (a!19 (or (= (__f1 (select initial_1_trace 8)) a!1)
                (= (__f1 (select initial_1_trace 8)) a!2)
                (= (__f1 (select initial_1_trace 8)) a!3)
                (= (__f1 (select initial_1_trace 8)) a!4)
                (= (__f1 (select initial_1_trace 8)) a!5)
                (= (__f1 (select initial_1_trace 8)) a!6)
                (= (__f1 (select initial_1_trace 8)) a!7)
                (= (__f1 (select initial_1_trace 8)) a!8)
                (= (__f1 (select initial_1_trace 8)) a!9)
                (= (__f1 (select initial_1_trace 8)) a!10)))
      (a!20 (or (= (__f1 (select initial_1_trace 9)) a!1)
                (= (__f1 (select initial_1_trace 9)) a!2)
                (= (__f1 (select initial_1_trace 9)) a!3)
                (= (__f1 (select initial_1_trace 9)) a!4)
                (= (__f1 (select initial_1_trace 9)) a!5)
                (= (__f1 (select initial_1_trace 9)) a!6)
                (= (__f1 (select initial_1_trace 9)) a!7)
                (= (__f1 (select initial_1_trace 9)) a!8)
                (= (__f1 (select initial_1_trace 9)) a!9)
                (= (__f1 (select initial_1_trace 9)) a!10)))
      (a!21 (or (= (__f1 (select initial_1_trace 10)) a!1)
                (= (__f1 (select initial_1_trace 10)) a!2)
                (= (__f1 (select initial_1_trace 10)) a!3)
                (= (__f1 (select initial_1_trace 10)) a!4)
                (= (__f1 (select initial_1_trace 10)) a!5)
                (= (__f1 (select initial_1_trace 10)) a!6)
                (= (__f1 (select initial_1_trace 10)) a!7)
                (= (__f1 (select initial_1_trace 10)) a!8)
                (= (__f1 (select initial_1_trace 10)) a!9)
                (= (__f1 (select initial_1_trace 10)) a!10)))
      (a!22 (or (= (__f1 (select initial_1_trace 11)) a!1)
                (= (__f1 (select initial_1_trace 11)) a!2)
                (= (__f1 (select initial_1_trace 11)) a!3)
                (= (__f1 (select initial_1_trace 11)) a!4)
                (= (__f1 (select initial_1_trace 11)) a!5)
                (= (__f1 (select initial_1_trace 11)) a!6)
                (= (__f1 (select initial_1_trace 11)) a!7)
                (= (__f1 (select initial_1_trace 11)) a!8)
                (= (__f1 (select initial_1_trace 11)) a!9)
                (= (__f1 (select initial_1_trace 11)) a!10)))
      (a!23 (or (= (__f1 (select initial_1_trace 12)) a!1)
                (= (__f1 (select initial_1_trace 12)) a!2)
                (= (__f1 (select initial_1_trace 12)) a!3)
                (= (__f1 (select initial_1_trace 12)) a!4)
                (= (__f1 (select initial_1_trace 12)) a!5)
                (= (__f1 (select initial_1_trace 12)) a!6)
                (= (__f1 (select initial_1_trace 12)) a!7)
                (= (__f1 (select initial_1_trace 12)) a!8)
                (= (__f1 (select initial_1_trace 12)) a!9)
                (= (__f1 (select initial_1_trace 12)) a!10)))
      (a!24 (or (= (__f1 (select initial_1_trace 13)) a!1)
                (= (__f1 (select initial_1_trace 13)) a!2)
                (= (__f1 (select initial_1_trace 13)) a!3)
                (= (__f1 (select initial_1_trace 13)) a!4)
                (= (__f1 (select initial_1_trace 13)) a!5)
                (= (__f1 (select initial_1_trace 13)) a!6)
                (= (__f1 (select initial_1_trace 13)) a!7)
                (= (__f1 (select initial_1_trace 13)) a!8)
                (= (__f1 (select initial_1_trace 13)) a!9)
                (= (__f1 (select initial_1_trace 13)) a!10)))
      (a!25 (or (= (__f1 (select initial_1_trace 14)) a!1)
                (= (__f1 (select initial_1_trace 14)) a!2)
                (= (__f1 (select initial_1_trace 14)) a!3)
                (= (__f1 (select initial_1_trace 14)) a!4)
                (= (__f1 (select initial_1_trace 14)) a!5)
                (= (__f1 (select initial_1_trace 14)) a!6)
                (= (__f1 (select initial_1_trace 14)) a!7)
                (= (__f1 (select initial_1_trace 14)) a!8)
                (= (__f1 (select initial_1_trace 14)) a!9)
                (= (__f1 (select initial_1_trace 14)) a!10)))
      (a!26 (or (= (__f1 (select initial_1_trace 15)) a!1)
                (= (__f1 (select initial_1_trace 15)) a!2)
                (= (__f1 (select initial_1_trace 15)) a!3)
                (= (__f1 (select initial_1_trace 15)) a!4)
                (= (__f1 (select initial_1_trace 15)) a!5)
                (= (__f1 (select initial_1_trace 15)) a!6)
                (= (__f1 (select initial_1_trace 15)) a!7)
                (= (__f1 (select initial_1_trace 15)) a!8)
                (= (__f1 (select initial_1_trace 15)) a!9)
                (= (__f1 (select initial_1_trace 15)) a!10)))
      (a!27 (or (= (__f1 (select initial_1_trace 16)) a!1)
                (= (__f1 (select initial_1_trace 16)) a!2)
                (= (__f1 (select initial_1_trace 16)) a!3)
                (= (__f1 (select initial_1_trace 16)) a!4)
                (= (__f1 (select initial_1_trace 16)) a!5)
                (= (__f1 (select initial_1_trace 16)) a!6)
                (= (__f1 (select initial_1_trace 16)) a!7)
                (= (__f1 (select initial_1_trace 16)) a!8)
                (= (__f1 (select initial_1_trace 16)) a!9)
                (= (__f1 (select initial_1_trace 16)) a!10)))
      (a!28 (or (= (__f1 (select initial_1_trace 17)) a!1)
                (= (__f1 (select initial_1_trace 17)) a!2)
                (= (__f1 (select initial_1_trace 17)) a!3)
                (= (__f1 (select initial_1_trace 17)) a!4)
                (= (__f1 (select initial_1_trace 17)) a!5)
                (= (__f1 (select initial_1_trace 17)) a!6)
                (= (__f1 (select initial_1_trace 17)) a!7)
                (= (__f1 (select initial_1_trace 17)) a!8)
                (= (__f1 (select initial_1_trace 17)) a!9)
                (= (__f1 (select initial_1_trace 17)) a!10))))
  (and a!11
       a!12
       a!13
       a!14
       a!15
       a!16
       a!17
       a!18
       a!19
       a!20
       a!21
       a!22
       a!23
       a!24
       a!25
       a!26
       a!27
       a!28))))
(assert (let ((a!1 (= (__f10 (__f4 (select initial_1_trace 1)))
              (__f7 (__f1 (select initial_1_trace 1)))))
      (a!2 (= (__f10 (__f4 (select initial_1_trace 2)))
              (__f7 (__f1 (select initial_1_trace 2)))))
      (a!3 (= (__f10 (__f4 (select initial_1_trace 3)))
              (__f7 (__f1 (select initial_1_trace 3)))))
      (a!4 (= (__f10 (__f4 (select initial_1_trace 4)))
              (__f7 (__f1 (select initial_1_trace 4)))))
      (a!5 (= (__f10 (__f4 (select initial_1_trace 5)))
              (__f7 (__f1 (select initial_1_trace 5)))))
      (a!6 (= (__f10 (__f4 (select initial_1_trace 6)))
              (__f7 (__f1 (select initial_1_trace 6)))))
      (a!7 (= (__f10 (__f4 (select initial_1_trace 7)))
              (__f7 (__f1 (select initial_1_trace 7)))))
      (a!8 (= (__f10 (__f4 (select initial_1_trace 8)))
              (__f7 (__f1 (select initial_1_trace 8)))))
      (a!9 (= (__f10 (__f4 (select initial_1_trace 9)))
              (__f7 (__f1 (select initial_1_trace 9)))))
      (a!10 (= (__f10 (__f4 (select initial_1_trace 10)))
               (__f7 (__f1 (select initial_1_trace 10)))))
      (a!11 (= (__f10 (__f4 (select initial_1_trace 11)))
               (__f7 (__f1 (select initial_1_trace 11)))))
      (a!12 (= (__f10 (__f4 (select initial_1_trace 12)))
               (__f7 (__f1 (select initial_1_trace 12)))))
      (a!13 (= (__f10 (__f4 (select initial_1_trace 13)))
               (__f7 (__f1 (select initial_1_trace 13)))))
      (a!14 (= (__f10 (__f4 (select initial_1_trace 14)))
               (__f7 (__f1 (select initial_1_trace 14)))))
      (a!15 (= (__f10 (__f4 (select initial_1_trace 15)))
               (__f7 (__f1 (select initial_1_trace 15)))))
      (a!16 (= (__f10 (__f4 (select initial_1_trace 16)))
               (__f7 (__f1 (select initial_1_trace 16)))))
      (a!17 (= (__f10 (__f4 (select initial_1_trace 17)))
               (__f7 (__f1 (select initial_1_trace 17))))))
  (and a!1
       a!2
       a!3
       a!4
       a!5
       a!6
       a!7
       a!8
       a!9
       a!10
       a!11
       a!12
       a!13
       a!14
       a!15
       a!16
       a!17)))
(assert (let ((a!1 (not (__f3 (__f4 (select initial_1_trace 1)))))
      (a!2 (= (__f8 (__f3 (select initial_1_trace 2)))
              (__f7 (__f3 (select initial_1_trace 1)))))
      (a!3 (_tuple_2 (__f1 (__f2 (select initial_1_trace 1)))
                     (__f2 (__f2 (select initial_1_trace 1)))))
      (a!5 (= (__f8 (__f3 (select initial_1_trace 3)))
              (__f7 (__f3 (select initial_1_trace 1)))))
      (a!7 (= (__f8 (__f3 (select initial_1_trace 4)))
              (__f7 (__f3 (select initial_1_trace 1)))))
      (a!9 (= (__f8 (__f3 (select initial_1_trace 5)))
              (__f7 (__f3 (select initial_1_trace 1)))))
      (a!11 (= (__f8 (__f3 (select initial_1_trace 6)))
               (__f7 (__f3 (select initial_1_trace 1)))))
      (a!13 (= (__f8 (__f3 (select initial_1_trace 7)))
               (__f7 (__f3 (select initial_1_trace 1)))))
      (a!15 (= (__f8 (__f3 (select initial_1_trace 8)))
               (__f7 (__f3 (select initial_1_trace 1)))))
      (a!17 (= (__f8 (__f3 (select initial_1_trace 9)))
               (__f7 (__f3 (select initial_1_trace 1)))))
      (a!19 (= (__f8 (__f3 (select initial_1_trace 10)))
               (__f7 (__f3 (select initial_1_trace 1)))))
      (a!21 (= (__f8 (__f3 (select initial_1_trace 11)))
               (__f7 (__f3 (select initial_1_trace 1)))))
      (a!23 (= (__f8 (__f3 (select initial_1_trace 12)))
               (__f7 (__f3 (select initial_1_trace 1)))))
      (a!25 (= (__f8 (__f3 (select initial_1_trace 13)))
               (__f7 (__f3 (select initial_1_trace 1)))))
      (a!27 (= (__f8 (__f3 (select initial_1_trace 14)))
               (__f7 (__f3 (select initial_1_trace 1)))))
      (a!29 (= (__f8 (__f3 (select initial_1_trace 15)))
               (__f7 (__f3 (select initial_1_trace 1)))))
      (a!31 (= (__f8 (__f3 (select initial_1_trace 16)))
               (__f7 (__f3 (select initial_1_trace 1)))))
      (a!33 (= (__f8 (__f3 (select initial_1_trace 17)))
               (__f7 (__f3 (select initial_1_trace 1)))))
      (a!35 (not (__f4 (__f4 (select initial_1_trace 1)))))
      (a!36 (= (__f7 (__f3 (select initial_1_trace 0)))
               (__f8 (__f3 (select initial_1_trace 1)))))
      (a!37 (_tuple_2 (__f1 (__f2 (select initial_1_trace 0)))
                      (__f2 (__f2 (select initial_1_trace 0)))))
      (a!39 (not (__f3 (__f4 (select initial_1_trace 2)))))
      (a!40 (= (__f8 (__f3 (select initial_1_trace 3)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!41 (_tuple_2 (__f1 (__f2 (select initial_1_trace 2)))
                      (__f2 (__f2 (select initial_1_trace 2)))))
      (a!43 (= (__f8 (__f3 (select initial_1_trace 4)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!45 (= (__f8 (__f3 (select initial_1_trace 5)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!47 (= (__f8 (__f3 (select initial_1_trace 6)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!49 (= (__f8 (__f3 (select initial_1_trace 7)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!51 (= (__f8 (__f3 (select initial_1_trace 8)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!53 (= (__f8 (__f3 (select initial_1_trace 9)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!55 (= (__f8 (__f3 (select initial_1_trace 10)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!57 (= (__f8 (__f3 (select initial_1_trace 11)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!59 (= (__f8 (__f3 (select initial_1_trace 12)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!61 (= (__f8 (__f3 (select initial_1_trace 13)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!63 (= (__f8 (__f3 (select initial_1_trace 14)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!65 (= (__f8 (__f3 (select initial_1_trace 15)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!67 (= (__f8 (__f3 (select initial_1_trace 16)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!69 (= (__f8 (__f3 (select initial_1_trace 17)))
               (__f7 (__f3 (select initial_1_trace 2)))))
      (a!71 (not (__f4 (__f4 (select initial_1_trace 2)))))
      (a!72 (= (__f7 (__f3 (select initial_1_trace 0)))
               (__f8 (__f3 (select initial_1_trace 2)))))
      (a!74 (= (__f7 (__f3 (select initial_1_trace 1)))
               (__f8 (__f3 (select initial_1_trace 2)))))
      (a!76 (not (__f3 (__f4 (select initial_1_trace 3)))))
      (a!77 (= (__f8 (__f3 (select initial_1_trace 4)))
               (__f7 (__f3 (select initial_1_trace 3)))))
      (a!78 (_tuple_2 (__f1 (__f2 (select initial_1_trace 3)))
                      (__f2 (__f2 (select initial_1_trace 3)))))
      (a!80 (= (__f8 (__f3 (select initial_1_trace 5)))
               (__f7 (__f3 (select initial_1_trace 3)))))
      (a!82 (= (__f8 (__f3 (select initial_1_trace 6)))
               (__f7 (__f3 (select initial_1_trace 3)))))
      (a!84 (= (__f8 (__f3 (select initial_1_trace 7)))
               (__f7 (__f3 (select initial_1_trace 3)))))
      (a!86 (= (__f8 (__f3 (select initial_1_trace 8)))
               (__f7 (__f3 (select initial_1_trace 3)))))
      (a!88 (= (__f8 (__f3 (select initial_1_trace 9)))
               (__f7 (__f3 (select initial_1_trace 3)))))
      (a!90 (= (__f8 (__f3 (select initial_1_trace 10)))
               (__f7 (__f3 (select initial_1_trace 3)))))
      (a!92 (= (__f8 (__f3 (select initial_1_trace 11)))
               (__f7 (__f3 (select initial_1_trace 3)))))
      (a!94 (= (__f8 (__f3 (select initial_1_trace 12)))
               (__f7 (__f3 (select initial_1_trace 3)))))
      (a!96 (= (__f8 (__f3 (select initial_1_trace 13)))
               (__f7 (__f3 (select initial_1_trace 3)))))
      (a!98 (= (__f8 (__f3 (select initial_1_trace 14)))
               (__f7 (__f3 (select initial_1_trace 3)))))
      (a!100 (= (__f8 (__f3 (select initial_1_trace 15)))
                (__f7 (__f3 (select initial_1_trace 3)))))
      (a!102 (= (__f8 (__f3 (select initial_1_trace 16)))
                (__f7 (__f3 (select initial_1_trace 3)))))
      (a!104 (= (__f8 (__f3 (select initial_1_trace 17)))
                (__f7 (__f3 (select initial_1_trace 3)))))
      (a!106 (not (__f4 (__f4 (select initial_1_trace 3)))))
      (a!107 (= (__f7 (__f3 (select initial_1_trace 0)))
                (__f8 (__f3 (select initial_1_trace 3)))))
      (a!109 (= (__f7 (__f3 (select initial_1_trace 1)))
                (__f8 (__f3 (select initial_1_trace 3)))))
      (a!111 (= (__f7 (__f3 (select initial_1_trace 2)))
                (__f8 (__f3 (select initial_1_trace 3)))))
      (a!113 (not (__f3 (__f4 (select initial_1_trace 4)))))
      (a!114 (= (__f8 (__f3 (select initial_1_trace 5)))
                (__f7 (__f3 (select initial_1_trace 4)))))
      (a!115 (_tuple_2 (__f1 (__f2 (select initial_1_trace 4)))
                       (__f2 (__f2 (select initial_1_trace 4)))))
      (a!117 (= (__f8 (__f3 (select initial_1_trace 6)))
                (__f7 (__f3 (select initial_1_trace 4)))))
      (a!119 (= (__f8 (__f3 (select initial_1_trace 7)))
                (__f7 (__f3 (select initial_1_trace 4)))))
      (a!121 (= (__f8 (__f3 (select initial_1_trace 8)))
                (__f7 (__f3 (select initial_1_trace 4)))))
      (a!123 (= (__f8 (__f3 (select initial_1_trace 9)))
                (__f7 (__f3 (select initial_1_trace 4)))))
      (a!125 (= (__f8 (__f3 (select initial_1_trace 10)))
                (__f7 (__f3 (select initial_1_trace 4)))))
      (a!127 (= (__f8 (__f3 (select initial_1_trace 11)))
                (__f7 (__f3 (select initial_1_trace 4)))))
      (a!129 (= (__f8 (__f3 (select initial_1_trace 12)))
                (__f7 (__f3 (select initial_1_trace 4)))))
      (a!131 (= (__f8 (__f3 (select initial_1_trace 13)))
                (__f7 (__f3 (select initial_1_trace 4)))))
      (a!133 (= (__f8 (__f3 (select initial_1_trace 14)))
                (__f7 (__f3 (select initial_1_trace 4)))))
      (a!135 (= (__f8 (__f3 (select initial_1_trace 15)))
                (__f7 (__f3 (select initial_1_trace 4)))))
      (a!137 (= (__f8 (__f3 (select initial_1_trace 16)))
                (__f7 (__f3 (select initial_1_trace 4)))))
      (a!139 (= (__f8 (__f3 (select initial_1_trace 17)))
                (__f7 (__f3 (select initial_1_trace 4)))))
      (a!141 (not (__f4 (__f4 (select initial_1_trace 4)))))
      (a!142 (= (__f7 (__f3 (select initial_1_trace 0)))
                (__f8 (__f3 (select initial_1_trace 4)))))
      (a!144 (= (__f7 (__f3 (select initial_1_trace 1)))
                (__f8 (__f3 (select initial_1_trace 4)))))
      (a!146 (= (__f7 (__f3 (select initial_1_trace 2)))
                (__f8 (__f3 (select initial_1_trace 4)))))
      (a!148 (= (__f7 (__f3 (select initial_1_trace 3)))
                (__f8 (__f3 (select initial_1_trace 4)))))
      (a!150 (not (__f3 (__f4 (select initial_1_trace 5)))))
      (a!151 (= (__f8 (__f3 (select initial_1_trace 6)))
                (__f7 (__f3 (select initial_1_trace 5)))))
      (a!152 (_tuple_2 (__f1 (__f2 (select initial_1_trace 5)))
                       (__f2 (__f2 (select initial_1_trace 5)))))
      (a!154 (= (__f8 (__f3 (select initial_1_trace 7)))
                (__f7 (__f3 (select initial_1_trace 5)))))
      (a!156 (= (__f8 (__f3 (select initial_1_trace 8)))
                (__f7 (__f3 (select initial_1_trace 5)))))
      (a!158 (= (__f8 (__f3 (select initial_1_trace 9)))
                (__f7 (__f3 (select initial_1_trace 5)))))
      (a!160 (= (__f8 (__f3 (select initial_1_trace 10)))
                (__f7 (__f3 (select initial_1_trace 5)))))
      (a!162 (= (__f8 (__f3 (select initial_1_trace 11)))
                (__f7 (__f3 (select initial_1_trace 5)))))
      (a!164 (= (__f8 (__f3 (select initial_1_trace 12)))
                (__f7 (__f3 (select initial_1_trace 5)))))
      (a!166 (= (__f8 (__f3 (select initial_1_trace 13)))
                (__f7 (__f3 (select initial_1_trace 5)))))
      (a!168 (= (__f8 (__f3 (select initial_1_trace 14)))
                (__f7 (__f3 (select initial_1_trace 5)))))
      (a!170 (= (__f8 (__f3 (select initial_1_trace 15)))
                (__f7 (__f3 (select initial_1_trace 5)))))
      (a!172 (= (__f8 (__f3 (select initial_1_trace 16)))
                (__f7 (__f3 (select initial_1_trace 5)))))
      (a!174 (= (__f8 (__f3 (select initial_1_trace 17)))
                (__f7 (__f3 (select initial_1_trace 5)))))
      (a!176 (not (__f4 (__f4 (select initial_1_trace 5)))))
      (a!177 (= (__f7 (__f3 (select initial_1_trace 0)))
                (__f8 (__f3 (select initial_1_trace 5)))))
      (a!179 (= (__f7 (__f3 (select initial_1_trace 1)))
                (__f8 (__f3 (select initial_1_trace 5)))))
      (a!181 (= (__f7 (__f3 (select initial_1_trace 2)))
                (__f8 (__f3 (select initial_1_trace 5)))))
      (a!183 (= (__f7 (__f3 (select initial_1_trace 3)))
                (__f8 (__f3 (select initial_1_trace 5)))))
      (a!185 (= (__f7 (__f3 (select initial_1_trace 4)))
                (__f8 (__f3 (select initial_1_trace 5)))))
      (a!187 (not (__f3 (__f4 (select initial_1_trace 6)))))
      (a!188 (= (__f8 (__f3 (select initial_1_trace 7)))
                (__f7 (__f3 (select initial_1_trace 6)))))
      (a!189 (_tuple_2 (__f1 (__f2 (select initial_1_trace 6)))
                       (__f2 (__f2 (select initial_1_trace 6)))))
      (a!191 (= (__f8 (__f3 (select initial_1_trace 8)))
                (__f7 (__f3 (select initial_1_trace 6)))))
      (a!193 (= (__f8 (__f3 (select initial_1_trace 9)))
                (__f7 (__f3 (select initial_1_trace 6)))))
      (a!195 (= (__f8 (__f3 (select initial_1_trace 10)))
                (__f7 (__f3 (select initial_1_trace 6)))))
      (a!197 (= (__f8 (__f3 (select initial_1_trace 11)))
                (__f7 (__f3 (select initial_1_trace 6)))))
      (a!199 (= (__f8 (__f3 (select initial_1_trace 12)))
                (__f7 (__f3 (select initial_1_trace 6)))))
      (a!201 (= (__f8 (__f3 (select initial_1_trace 13)))
                (__f7 (__f3 (select initial_1_trace 6)))))
      (a!203 (= (__f8 (__f3 (select initial_1_trace 14)))
                (__f7 (__f3 (select initial_1_trace 6)))))
      (a!205 (= (__f8 (__f3 (select initial_1_trace 15)))
                (__f7 (__f3 (select initial_1_trace 6)))))
      (a!207 (= (__f8 (__f3 (select initial_1_trace 16)))
                (__f7 (__f3 (select initial_1_trace 6)))))
      (a!209 (= (__f8 (__f3 (select initial_1_trace 17)))
                (__f7 (__f3 (select initial_1_trace 6)))))
      (a!211 (not (__f4 (__f4 (select initial_1_trace 6)))))
      (a!212 (= (__f7 (__f3 (select initial_1_trace 0)))
                (__f8 (__f3 (select initial_1_trace 6)))))
      (a!214 (= (__f7 (__f3 (select initial_1_trace 1)))
                (__f8 (__f3 (select initial_1_trace 6)))))
      (a!216 (= (__f7 (__f3 (select initial_1_trace 2)))
                (__f8 (__f3 (select initial_1_trace 6)))))
      (a!218 (= (__f7 (__f3 (select initial_1_trace 3)))
                (__f8 (__f3 (select initial_1_trace 6)))))
      (a!220 (= (__f7 (__f3 (select initial_1_trace 4)))
                (__f8 (__f3 (select initial_1_trace 6)))))
      (a!222 (= (__f7 (__f3 (select initial_1_trace 5)))
                (__f8 (__f3 (select initial_1_trace 6)))))
      (a!224 (not (__f3 (__f4 (select initial_1_trace 7)))))
      (a!225 (= (__f8 (__f3 (select initial_1_trace 8)))
                (__f7 (__f3 (select initial_1_trace 7)))))
      (a!226 (_tuple_2 (__f1 (__f2 (select initial_1_trace 7)))
                       (__f2 (__f2 (select initial_1_trace 7)))))
      (a!228 (= (__f8 (__f3 (select initial_1_trace 9)))
                (__f7 (__f3 (select initial_1_trace 7)))))
      (a!230 (= (__f8 (__f3 (select initial_1_trace 10)))
                (__f7 (__f3 (select initial_1_trace 7)))))
      (a!232 (= (__f8 (__f3 (select initial_1_trace 11)))
                (__f7 (__f3 (select initial_1_trace 7)))))
      (a!234 (= (__f8 (__f3 (select initial_1_trace 12)))
                (__f7 (__f3 (select initial_1_trace 7)))))
      (a!236 (= (__f8 (__f3 (select initial_1_trace 13)))
                (__f7 (__f3 (select initial_1_trace 7)))))
      (a!238 (= (__f8 (__f3 (select initial_1_trace 14)))
                (__f7 (__f3 (select initial_1_trace 7)))))
      (a!240 (= (__f8 (__f3 (select initial_1_trace 15)))
                (__f7 (__f3 (select initial_1_trace 7)))))
      (a!242 (= (__f8 (__f3 (select initial_1_trace 16)))
                (__f7 (__f3 (select initial_1_trace 7)))))
      (a!244 (= (__f8 (__f3 (select initial_1_trace 17)))
                (__f7 (__f3 (select initial_1_trace 7)))))
      (a!246 (not (__f4 (__f4 (select initial_1_trace 7)))))
      (a!247 (= (__f7 (__f3 (select initial_1_trace 0)))
                (__f8 (__f3 (select initial_1_trace 7)))))
      (a!249 (= (__f7 (__f3 (select initial_1_trace 1)))
                (__f8 (__f3 (select initial_1_trace 7)))))
      (a!251 (= (__f7 (__f3 (select initial_1_trace 2)))
                (__f8 (__f3 (select initial_1_trace 7)))))
      (a!253 (= (__f7 (__f3 (select initial_1_trace 3)))
                (__f8 (__f3 (select initial_1_trace 7)))))
      (a!255 (= (__f7 (__f3 (select initial_1_trace 4)))
                (__f8 (__f3 (select initial_1_trace 7)))))
      (a!257 (= (__f7 (__f3 (select initial_1_trace 5)))
                (__f8 (__f3 (select initial_1_trace 7)))))
      (a!259 (= (__f7 (__f3 (select initial_1_trace 6)))
                (__f8 (__f3 (select initial_1_trace 7)))))
      (a!261 (not (__f3 (__f4 (select initial_1_trace 8)))))
      (a!262 (= (__f8 (__f3 (select initial_1_trace 9)))
                (__f7 (__f3 (select initial_1_trace 8)))))
      (a!263 (_tuple_2 (__f1 (__f2 (select initial_1_trace 8)))
                       (__f2 (__f2 (select initial_1_trace 8)))))
      (a!265 (= (__f8 (__f3 (select initial_1_trace 10)))
                (__f7 (__f3 (select initial_1_trace 8)))))
      (a!267 (= (__f8 (__f3 (select initial_1_trace 11)))
                (__f7 (__f3 (select initial_1_trace 8)))))
      (a!269 (= (__f8 (__f3 (select initial_1_trace 12)))
                (__f7 (__f3 (select initial_1_trace 8)))))
      (a!271 (= (__f8 (__f3 (select initial_1_trace 13)))
                (__f7 (__f3 (select initial_1_trace 8)))))
      (a!273 (= (__f8 (__f3 (select initial_1_trace 14)))
                (__f7 (__f3 (select initial_1_trace 8)))))
      (a!275 (= (__f8 (__f3 (select initial_1_trace 15)))
                (__f7 (__f3 (select initial_1_trace 8)))))
      (a!277 (= (__f8 (__f3 (select initial_1_trace 16)))
                (__f7 (__f3 (select initial_1_trace 8)))))
      (a!279 (= (__f8 (__f3 (select initial_1_trace 17)))
                (__f7 (__f3 (select initial_1_trace 8)))))
      (a!281 (not (__f4 (__f4 (select initial_1_trace 8)))))
      (a!282 (= (__f7 (__f3 (select initial_1_trace 0)))
                (__f8 (__f3 (select initial_1_trace 8)))))
      (a!284 (= (__f7 (__f3 (select initial_1_trace 1)))
                (__f8 (__f3 (select initial_1_trace 8)))))
      (a!286 (= (__f7 (__f3 (select initial_1_trace 2)))
                (__f8 (__f3 (select initial_1_trace 8)))))
      (a!288 (= (__f7 (__f3 (select initial_1_trace 3)))
                (__f8 (__f3 (select initial_1_trace 8)))))
      (a!290 (= (__f7 (__f3 (select initial_1_trace 4)))
                (__f8 (__f3 (select initial_1_trace 8)))))
      (a!292 (= (__f7 (__f3 (select initial_1_trace 5)))
                (__f8 (__f3 (select initial_1_trace 8)))))
      (a!294 (= (__f7 (__f3 (select initial_1_trace 6)))
                (__f8 (__f3 (select initial_1_trace 8)))))
      (a!296 (= (__f7 (__f3 (select initial_1_trace 7)))
                (__f8 (__f3 (select initial_1_trace 8))))))
(let ((a!4 (and (__f4 (__f4 (select initial_1_trace 2)))
                a!2
                (= (__f2 (select initial_1_trace 2)) a!3)))
      (a!6 (and (__f4 (__f4 (select initial_1_trace 3)))
                a!5
                (= (__f2 (select initial_1_trace 3)) a!3)))
      (a!8 (and (__f4 (__f4 (select initial_1_trace 4)))
                a!7
                (= (__f2 (select initial_1_trace 4)) a!3)))
      (a!10 (and (__f4 (__f4 (select initial_1_trace 5)))
                 a!9
                 (= (__f2 (select initial_1_trace 5)) a!3)))
      (a!12 (and (__f4 (__f4 (select initial_1_trace 6)))
                 a!11
                 (= (__f2 (select initial_1_trace 6)) a!3)))
      (a!14 (and (__f4 (__f4 (select initial_1_trace 7)))
                 a!13
                 (= (__f2 (select initial_1_trace 7)) a!3)))
      (a!16 (and (__f4 (__f4 (select initial_1_trace 8)))
                 a!15
                 (= (__f2 (select initial_1_trace 8)) a!3)))
      (a!18 (and (__f4 (__f4 (select initial_1_trace 9)))
                 a!17
                 (= (__f2 (select initial_1_trace 9)) a!3)))
      (a!20 (and (__f4 (__f4 (select initial_1_trace 10)))
                 a!19
                 (= (__f2 (select initial_1_trace 10)) a!3)))
      (a!22 (and (__f4 (__f4 (select initial_1_trace 11)))
                 a!21
                 (= (__f2 (select initial_1_trace 11)) a!3)))
      (a!24 (and (__f4 (__f4 (select initial_1_trace 12)))
                 a!23
                 (= (__f2 (select initial_1_trace 12)) a!3)))
      (a!26 (and (__f4 (__f4 (select initial_1_trace 13)))
                 a!25
                 (= (__f2 (select initial_1_trace 13)) a!3)))
      (a!28 (and (__f4 (__f4 (select initial_1_trace 14)))
                 a!27
                 (= (__f2 (select initial_1_trace 14)) a!3)))
      (a!30 (and (__f4 (__f4 (select initial_1_trace 15)))
                 a!29
                 (= (__f2 (select initial_1_trace 15)) a!3)))
      (a!32 (and (__f4 (__f4 (select initial_1_trace 16)))
                 a!31
                 (= (__f2 (select initial_1_trace 16)) a!3)))
      (a!34 (and (__f4 (__f4 (select initial_1_trace 17)))
                 a!33
                 (= (__f2 (select initial_1_trace 17)) a!3)))
      (a!38 (and (__f3 (__f4 (select initial_1_trace 0)))
                 a!36
                 (= (__f2 (select initial_1_trace 1)) a!37)))
      (a!42 (and (__f4 (__f4 (select initial_1_trace 3)))
                 a!40
                 (= (__f2 (select initial_1_trace 3)) a!41)))
      (a!44 (and (__f4 (__f4 (select initial_1_trace 4)))
                 a!43
                 (= (__f2 (select initial_1_trace 4)) a!41)))
      (a!46 (and (__f4 (__f4 (select initial_1_trace 5)))
                 a!45
                 (= (__f2 (select initial_1_trace 5)) a!41)))
      (a!48 (and (__f4 (__f4 (select initial_1_trace 6)))
                 a!47
                 (= (__f2 (select initial_1_trace 6)) a!41)))
      (a!50 (and (__f4 (__f4 (select initial_1_trace 7)))
                 a!49
                 (= (__f2 (select initial_1_trace 7)) a!41)))
      (a!52 (and (__f4 (__f4 (select initial_1_trace 8)))
                 a!51
                 (= (__f2 (select initial_1_trace 8)) a!41)))
      (a!54 (and (__f4 (__f4 (select initial_1_trace 9)))
                 a!53
                 (= (__f2 (select initial_1_trace 9)) a!41)))
      (a!56 (and (__f4 (__f4 (select initial_1_trace 10)))
                 a!55
                 (= (__f2 (select initial_1_trace 10)) a!41)))
      (a!58 (and (__f4 (__f4 (select initial_1_trace 11)))
                 a!57
                 (= (__f2 (select initial_1_trace 11)) a!41)))
      (a!60 (and (__f4 (__f4 (select initial_1_trace 12)))
                 a!59
                 (= (__f2 (select initial_1_trace 12)) a!41)))
      (a!62 (and (__f4 (__f4 (select initial_1_trace 13)))
                 a!61
                 (= (__f2 (select initial_1_trace 13)) a!41)))
      (a!64 (and (__f4 (__f4 (select initial_1_trace 14)))
                 a!63
                 (= (__f2 (select initial_1_trace 14)) a!41)))
      (a!66 (and (__f4 (__f4 (select initial_1_trace 15)))
                 a!65
                 (= (__f2 (select initial_1_trace 15)) a!41)))
      (a!68 (and (__f4 (__f4 (select initial_1_trace 16)))
                 a!67
                 (= (__f2 (select initial_1_trace 16)) a!41)))
      (a!70 (and (__f4 (__f4 (select initial_1_trace 17)))
                 a!69
                 (= (__f2 (select initial_1_trace 17)) a!41)))
      (a!73 (and (__f3 (__f4 (select initial_1_trace 0)))
                 a!72
                 (= (__f2 (select initial_1_trace 2)) a!37)))
      (a!75 (and (__f3 (__f4 (select initial_1_trace 1)))
                 a!74
                 (= (__f2 (select initial_1_trace 2)) a!3)))
      (a!79 (and (__f4 (__f4 (select initial_1_trace 4)))
                 a!77
                 (= (__f2 (select initial_1_trace 4)) a!78)))
      (a!81 (and (__f4 (__f4 (select initial_1_trace 5)))
                 a!80
                 (= (__f2 (select initial_1_trace 5)) a!78)))
      (a!83 (and (__f4 (__f4 (select initial_1_trace 6)))
                 a!82
                 (= (__f2 (select initial_1_trace 6)) a!78)))
      (a!85 (and (__f4 (__f4 (select initial_1_trace 7)))
                 a!84
                 (= (__f2 (select initial_1_trace 7)) a!78)))
      (a!87 (and (__f4 (__f4 (select initial_1_trace 8)))
                 a!86
                 (= (__f2 (select initial_1_trace 8)) a!78)))
      (a!89 (and (__f4 (__f4 (select initial_1_trace 9)))
                 a!88
                 (= (__f2 (select initial_1_trace 9)) a!78)))
      (a!91 (and (__f4 (__f4 (select initial_1_trace 10)))
                 a!90
                 (= (__f2 (select initial_1_trace 10)) a!78)))
      (a!93 (and (__f4 (__f4 (select initial_1_trace 11)))
                 a!92
                 (= (__f2 (select initial_1_trace 11)) a!78)))
      (a!95 (and (__f4 (__f4 (select initial_1_trace 12)))
                 a!94
                 (= (__f2 (select initial_1_trace 12)) a!78)))
      (a!97 (and (__f4 (__f4 (select initial_1_trace 13)))
                 a!96
                 (= (__f2 (select initial_1_trace 13)) a!78)))
      (a!99 (and (__f4 (__f4 (select initial_1_trace 14)))
                 a!98
                 (= (__f2 (select initial_1_trace 14)) a!78)))
      (a!101 (and (__f4 (__f4 (select initial_1_trace 15)))
                  a!100
                  (= (__f2 (select initial_1_trace 15)) a!78)))
      (a!103 (and (__f4 (__f4 (select initial_1_trace 16)))
                  a!102
                  (= (__f2 (select initial_1_trace 16)) a!78)))
      (a!105 (and (__f4 (__f4 (select initial_1_trace 17)))
                  a!104
                  (= (__f2 (select initial_1_trace 17)) a!78)))
      (a!108 (and (__f3 (__f4 (select initial_1_trace 0)))
                  a!107
                  (= (__f2 (select initial_1_trace 3)) a!37)))
      (a!110 (and (__f3 (__f4 (select initial_1_trace 1)))
                  a!109
                  (= (__f2 (select initial_1_trace 3)) a!3)))
      (a!112 (and (__f3 (__f4 (select initial_1_trace 2)))
                  a!111
                  (= (__f2 (select initial_1_trace 3)) a!41)))
      (a!116 (and (__f4 (__f4 (select initial_1_trace 5)))
                  a!114
                  (= (__f2 (select initial_1_trace 5)) a!115)))
      (a!118 (and (__f4 (__f4 (select initial_1_trace 6)))
                  a!117
                  (= (__f2 (select initial_1_trace 6)) a!115)))
      (a!120 (and (__f4 (__f4 (select initial_1_trace 7)))
                  a!119
                  (= (__f2 (select initial_1_trace 7)) a!115)))
      (a!122 (and (__f4 (__f4 (select initial_1_trace 8)))
                  a!121
                  (= (__f2 (select initial_1_trace 8)) a!115)))
      (a!124 (and (__f4 (__f4 (select initial_1_trace 9)))
                  a!123
                  (= (__f2 (select initial_1_trace 9)) a!115)))
      (a!126 (and (__f4 (__f4 (select initial_1_trace 10)))
                  a!125
                  (= (__f2 (select initial_1_trace 10)) a!115)))
      (a!128 (and (__f4 (__f4 (select initial_1_trace 11)))
                  a!127
                  (= (__f2 (select initial_1_trace 11)) a!115)))
      (a!130 (and (__f4 (__f4 (select initial_1_trace 12)))
                  a!129
                  (= (__f2 (select initial_1_trace 12)) a!115)))
      (a!132 (and (__f4 (__f4 (select initial_1_trace 13)))
                  a!131
                  (= (__f2 (select initial_1_trace 13)) a!115)))
      (a!134 (and (__f4 (__f4 (select initial_1_trace 14)))
                  a!133
                  (= (__f2 (select initial_1_trace 14)) a!115)))
      (a!136 (and (__f4 (__f4 (select initial_1_trace 15)))
                  a!135
                  (= (__f2 (select initial_1_trace 15)) a!115)))
      (a!138 (and (__f4 (__f4 (select initial_1_trace 16)))
                  a!137
                  (= (__f2 (select initial_1_trace 16)) a!115)))
      (a!140 (and (__f4 (__f4 (select initial_1_trace 17)))
                  a!139
                  (= (__f2 (select initial_1_trace 17)) a!115)))
      (a!143 (and (__f3 (__f4 (select initial_1_trace 0)))
                  a!142
                  (= (__f2 (select initial_1_trace 4)) a!37)))
      (a!145 (and (__f3 (__f4 (select initial_1_trace 1)))
                  a!144
                  (= (__f2 (select initial_1_trace 4)) a!3)))
      (a!147 (and (__f3 (__f4 (select initial_1_trace 2)))
                  a!146
                  (= (__f2 (select initial_1_trace 4)) a!41)))
      (a!149 (and (__f3 (__f4 (select initial_1_trace 3)))
                  a!148
                  (= (__f2 (select initial_1_trace 4)) a!78)))
      (a!153 (and (__f4 (__f4 (select initial_1_trace 6)))
                  a!151
                  (= (__f2 (select initial_1_trace 6)) a!152)))
      (a!155 (and (__f4 (__f4 (select initial_1_trace 7)))
                  a!154
                  (= (__f2 (select initial_1_trace 7)) a!152)))
      (a!157 (and (__f4 (__f4 (select initial_1_trace 8)))
                  a!156
                  (= (__f2 (select initial_1_trace 8)) a!152)))
      (a!159 (and (__f4 (__f4 (select initial_1_trace 9)))
                  a!158
                  (= (__f2 (select initial_1_trace 9)) a!152)))
      (a!161 (and (__f4 (__f4 (select initial_1_trace 10)))
                  a!160
                  (= (__f2 (select initial_1_trace 10)) a!152)))
      (a!163 (and (__f4 (__f4 (select initial_1_trace 11)))
                  a!162
                  (= (__f2 (select initial_1_trace 11)) a!152)))
      (a!165 (and (__f4 (__f4 (select initial_1_trace 12)))
                  a!164
                  (= (__f2 (select initial_1_trace 12)) a!152)))
      (a!167 (and (__f4 (__f4 (select initial_1_trace 13)))
                  a!166
                  (= (__f2 (select initial_1_trace 13)) a!152)))
      (a!169 (and (__f4 (__f4 (select initial_1_trace 14)))
                  a!168
                  (= (__f2 (select initial_1_trace 14)) a!152)))
      (a!171 (and (__f4 (__f4 (select initial_1_trace 15)))
                  a!170
                  (= (__f2 (select initial_1_trace 15)) a!152)))
      (a!173 (and (__f4 (__f4 (select initial_1_trace 16)))
                  a!172
                  (= (__f2 (select initial_1_trace 16)) a!152)))
      (a!175 (and (__f4 (__f4 (select initial_1_trace 17)))
                  a!174
                  (= (__f2 (select initial_1_trace 17)) a!152)))
      (a!178 (and (__f3 (__f4 (select initial_1_trace 0)))
                  a!177
                  (= (__f2 (select initial_1_trace 5)) a!37)))
      (a!180 (and (__f3 (__f4 (select initial_1_trace 1)))
                  a!179
                  (= (__f2 (select initial_1_trace 5)) a!3)))
      (a!182 (and (__f3 (__f4 (select initial_1_trace 2)))
                  a!181
                  (= (__f2 (select initial_1_trace 5)) a!41)))
      (a!184 (and (__f3 (__f4 (select initial_1_trace 3)))
                  a!183
                  (= (__f2 (select initial_1_trace 5)) a!78)))
      (a!186 (and (__f3 (__f4 (select initial_1_trace 4)))
                  a!185
                  (= (__f2 (select initial_1_trace 5)) a!115)))
      (a!190 (and (__f4 (__f4 (select initial_1_trace 7)))
                  a!188
                  (= (__f2 (select initial_1_trace 7)) a!189)))
      (a!192 (and (__f4 (__f4 (select initial_1_trace 8)))
                  a!191
                  (= (__f2 (select initial_1_trace 8)) a!189)))
      (a!194 (and (__f4 (__f4 (select initial_1_trace 9)))
                  a!193
                  (= (__f2 (select initial_1_trace 9)) a!189)))
      (a!196 (and (__f4 (__f4 (select initial_1_trace 10)))
                  a!195
                  (= (__f2 (select initial_1_trace 10)) a!189)))
      (a!198 (and (__f4 (__f4 (select initial_1_trace 11)))
                  a!197
                  (= (__f2 (select initial_1_trace 11)) a!189)))
      (a!200 (and (__f4 (__f4 (select initial_1_trace 12)))
                  a!199
                  (= (__f2 (select initial_1_trace 12)) a!189)))
      (a!202 (and (__f4 (__f4 (select initial_1_trace 13)))
                  a!201
                  (= (__f2 (select initial_1_trace 13)) a!189)))
      (a!204 (and (__f4 (__f4 (select initial_1_trace 14)))
                  a!203
                  (= (__f2 (select initial_1_trace 14)) a!189)))
      (a!206 (and (__f4 (__f4 (select initial_1_trace 15)))
                  a!205
                  (= (__f2 (select initial_1_trace 15)) a!189)))
      (a!208 (and (__f4 (__f4 (select initial_1_trace 16)))
                  a!207
                  (= (__f2 (select initial_1_trace 16)) a!189)))
      (a!210 (and (__f4 (__f4 (select initial_1_trace 17)))
                  a!209
                  (= (__f2 (select initial_1_trace 17)) a!189)))
      (a!213 (and (__f3 (__f4 (select initial_1_trace 0)))
                  a!212
                  (= (__f2 (select initial_1_trace 6)) a!37)))
      (a!215 (and (__f3 (__f4 (select initial_1_trace 1)))
                  a!214
                  (= (__f2 (select initial_1_trace 6)) a!3)))
      (a!217 (and (__f3 (__f4 (select initial_1_trace 2)))
                  a!216
                  (= (__f2 (select initial_1_trace 6)) a!41)))
      (a!219 (and (__f3 (__f4 (select initial_1_trace 3)))
                  a!218
                  (= (__f2 (select initial_1_trace 6)) a!78)))
      (a!221 (and (__f3 (__f4 (select initial_1_trace 4)))
                  a!220
                  (= (__f2 (select initial_1_trace 6)) a!115)))
      (a!223 (and (__f3 (__f4 (select initial_1_trace 5)))
                  a!222
                  (= (__f2 (select initial_1_trace 6)) a!152)))
      (a!227 (and (__f4 (__f4 (select initial_1_trace 8)))
                  a!225
                  (= (__f2 (select initial_1_trace 8)) a!226)))
      (a!229 (and (__f4 (__f4 (select initial_1_trace 9)))
                  a!228
                  (= (__f2 (select initial_1_trace 9)) a!226)))
      (a!231 (and (__f4 (__f4 (select initial_1_trace 10)))
                  a!230
                  (= (__f2 (select initial_1_trace 10)) a!226)))
      (a!233 (and (__f4 (__f4 (select initial_1_trace 11)))
                  a!232
                  (= (__f2 (select initial_1_trace 11)) a!226)))
      (a!235 (and (__f4 (__f4 (select initial_1_trace 12)))
                  a!234
                  (= (__f2 (select initial_1_trace 12)) a!226)))
      (a!237 (and (__f4 (__f4 (select initial_1_trace 13)))
                  a!236
                  (= (__f2 (select initial_1_trace 13)) a!226)))
      (a!239 (and (__f4 (__f4 (select initial_1_trace 14)))
                  a!238
                  (= (__f2 (select initial_1_trace 14)) a!226)))
      (a!241 (and (__f4 (__f4 (select initial_1_trace 15)))
                  a!240
                  (= (__f2 (select initial_1_trace 15)) a!226)))
      (a!243 (and (__f4 (__f4 (select initial_1_trace 16)))
                  a!242
                  (= (__f2 (select initial_1_trace 16)) a!226)))
      (a!245 (and (__f4 (__f4 (select initial_1_trace 17)))
                  a!244
                  (= (__f2 (select initial_1_trace 17)) a!226)))
      (a!248 (and (__f3 (__f4 (select initial_1_trace 0)))
                  a!247
                  (= (__f2 (select initial_1_trace 7)) a!37)))
      (a!250 (and (__f3 (__f4 (select initial_1_trace 1)))
                  a!249
                  (= (__f2 (select initial_1_trace 7)) a!3)))
      (a!252 (and (__f3 (__f4 (select initial_1_trace 2)))
                  a!251
                  (= (__f2 (select initial_1_trace 7)) a!41)))
      (a!254 (and (__f3 (__f4 (select initial_1_trace 3)))
                  a!253
                  (= (__f2 (select initial_1_trace 7)) a!78)))
      (a!256 (and (__f3 (__f4 (select initial_1_trace 4)))
                  a!255
                  (= (__f2 (select initial_1_trace 7)) a!115)))
      (a!258 (and (__f3 (__f4 (select initial_1_trace 5)))
                  a!257
                  (= (__f2 (select initial_1_trace 7)) a!152)))
      (a!260 (and (__f3 (__f4 (select initial_1_trace 6)))
                  a!259
                  (= (__f2 (select initial_1_trace 7)) a!189)))
      (a!264 (and (__f4 (__f4 (select initial_1_trace 9)))
                  a!262
                  (= (__f2 (select initial_1_trace 9)) a!263)))
      (a!266 (and (__f4 (__f4 (select initial_1_trace 10)))
                  a!265
                  (= (__f2 (select initial_1_trace 10)) a!263)))
      (a!268 (and (__f4 (__f4 (select initial_1_trace 11)))
                  a!267
                  (= (__f2 (select initial_1_trace 11)) a!263)))
      (a!270 (and (__f4 (__f4 (select initial_1_trace 12)))
                  a!269
                  (= (__f2 (select initial_1_trace 12)) a!263)))
      (a!272 (and (__f4 (__f4 (select initial_1_trace 13)))
                  a!271
                  (= (__f2 (select initial_1_trace 13)) a!263)))
      (a!274 (and (__f4 (__f4 (select initial_1_trace 14)))
                  a!273
                  (= (__f2 (select initial_1_trace 14)) a!263)))
      (a!276 (and (__f4 (__f4 (select initial_1_trace 15)))
                  a!275
                  (= (__f2 (select initial_1_trace 15)) a!263)))
      (a!278 (and (__f4 (__f4 (select initial_1_trace 16)))
                  a!277
                  (= (__f2 (select initial_1_trace 16)) a!263)))
      (a!280 (and (__f4 (__f4 (select initial_1_trace 17)))
                  a!279
                  (= (__f2 (select initial_1_trace 17)) a!263)))
      (a!283 (and (__f3 (__f4 (select initial_1_trace 0)))
                  a!282
                  (= (__f2 (select initial_1_trace 8)) a!37)))
      (a!285 (and (__f3 (__f4 (select initial_1_trace 1)))
                  a!284
                  (= (__f2 (select initial_1_trace 8)) a!3)))
      (a!287 (and (__f3 (__f4 (select initial_1_trace 2)))
                  a!286
                  (= (__f2 (select initial_1_trace 8)) a!41)))
      (a!289 (and (__f3 (__f4 (select initial_1_trace 3)))
                  a!288
                  (= (__f2 (select initial_1_trace 8)) a!78)))
      (a!291 (and (__f3 (__f4 (select initial_1_trace 4)))
                  a!290
                  (= (__f2 (select initial_1_trace 8)) a!115)))
      (a!293 (and (__f3 (__f4 (select initial_1_trace 5)))
                  a!292
                  (= (__f2 (select initial_1_trace 8)) a!152)))
      (a!295 (and (__f3 (__f4 (select initial_1_trace 6)))
                  a!294
                  (= (__f2 (select initial_1_trace 8)) a!189)))
      (a!297 (and (__f3 (__f4 (select initial_1_trace 7)))
                  a!296
                  (= (__f2 (select initial_1_trace 8)) a!226))))
  (and (or a!1
           a!4
           a!6
           a!8
           a!10
           a!12
           a!14
           a!16
           a!18
           a!20
           a!22
           a!24
           a!26
           a!28
           a!30
           a!32
           a!34)
       (or a!35 a!38)
       (or a!39
           a!42
           a!44
           a!46
           a!48
           a!50
           a!52
           a!54
           a!56
           a!58
           a!60
           a!62
           a!64
           a!66
           a!68
           a!70)
       (or a!71 a!73 a!75)
       (or a!76
           a!79
           a!81
           a!83
           a!85
           a!87
           a!89
           a!91
           a!93
           a!95
           a!97
           a!99
           a!101
           a!103
           a!105)
       (or a!106 a!108 a!110 a!112)
       (or a!113
           a!116
           a!118
           a!120
           a!122
           a!124
           a!126
           a!128
           a!130
           a!132
           a!134
           a!136
           a!138
           a!140)
       (or a!141 a!143 a!145 a!147 a!149)
       (or a!150
           a!153
           a!155
           a!157
           a!159
           a!161
           a!163
           a!165
           a!167
           a!169
           a!171
           a!173
           a!175)
       (or a!176 a!178 a!180 a!182 a!184 a!186)
       (or a!187
           a!190
           a!192
           a!194
           a!196
           a!198
           a!200
           a!202
           a!204
           a!206
           a!208
           a!210)
       (or a!211 a!213 a!215 a!217 a!219 a!221 a!223)
       (or a!224 a!227 a!229 a!231 a!233 a!235 a!237 a!239 a!241 a!243 a!245)
       (or a!246 a!248 a!250 a!252 a!254 a!256 a!258 a!260)
       (or a!261 a!264 a!266 a!268 a!270 a!272 a!274 a!276 a!278 a!280)
       (or a!281 a!283 a!285 a!287 a!289 a!291 a!293 a!295 a!297)))))
(assert (let ((a!1 (= (__f9 (__f3 (select initial_1_trace 1)))
              (__f5 (__f3 (select initial_1_trace 1)))))
      (a!2 (= (__f1 (__f3 (select initial_1_trace 1)))
              (__f1 (__f3 (select initial_1_trace 0)))))
      (a!3 (= (__f2 (__f3 (select initial_1_trace 1)))
              (__f2 (__f3 (select initial_1_trace 0)))))
      (a!4 (= (__f3 (__f3 (select initial_1_trace 1)))
              (__f3 (__f3 (select initial_1_trace 0)))))
      (a!5 (= (__f4 (__f3 (select initial_1_trace 1)))
              (__f4 (__f3 (select initial_1_trace 0)))))
      (a!6 (= (__f7 (__f3 (select initial_1_trace 1))) 0))
      (a!7 (not (__f3 (__f4 (select initial_1_trace 1)))))
      (a!8 (= (__f11 (__f3 (select initial_1_trace 1))) 0))
      (a!9 (not (__f7 (__f4 (select initial_1_trace 1)))))
      (a!10 (= (__f12 (__f3 (select initial_1_trace 1))) 0))
      (a!11 (not (__f8 (__f4 (select initial_1_trace 1)))))
      (a!12 (not (__f1 (__f5 (select initial_1_trace 1)))))
      (a!13 (not (__f2 (__f5 (select initial_1_trace 1)))))
      (a!15 (not (__f3 (__f1 (select initial_1_trace 1)))))
      (a!16 (= (__f9 (__f3 (select initial_1_trace 2)))
               (__f5 (__f3 (select initial_1_trace 2)))))
      (a!17 (= (__f1 (__f3 (select initial_1_trace 2)))
               (__f1 (__f3 (select initial_1_trace 1)))))
      (a!18 (= (__f2 (__f3 (select initial_1_trace 2)))
               (__f2 (__f3 (select initial_1_trace 1)))))
      (a!19 (= (__f3 (__f3 (select initial_1_trace 2)))
               (__f3 (__f3 (select initial_1_trace 1)))))
      (a!20 (= (__f4 (__f3 (select initial_1_trace 2)))
               (__f4 (__f3 (select initial_1_trace 1)))))
      (a!21 (= (__f7 (__f3 (select initial_1_trace 2))) 0))
      (a!22 (not (__f3 (__f4 (select initial_1_trace 2)))))
      (a!23 (= (__f11 (__f3 (select initial_1_trace 2))) 0))
      (a!24 (not (__f7 (__f4 (select initial_1_trace 2)))))
      (a!25 (= (__f12 (__f3 (select initial_1_trace 2))) 0))
      (a!26 (not (__f8 (__f4 (select initial_1_trace 2)))))
      (a!27 (not (__f1 (__f5 (select initial_1_trace 2)))))
      (a!28 (not (__f2 (__f5 (select initial_1_trace 2)))))
      (a!30 (not (__f3 (__f1 (select initial_1_trace 2)))))
      (a!31 (= (__f9 (__f3 (select initial_1_trace 3)))
               (__f5 (__f3 (select initial_1_trace 3)))))
      (a!32 (= (__f1 (__f3 (select initial_1_trace 3)))
               (__f1 (__f3 (select initial_1_trace 2)))))
      (a!33 (= (__f2 (__f3 (select initial_1_trace 3)))
               (__f2 (__f3 (select initial_1_trace 2)))))
      (a!34 (= (__f3 (__f3 (select initial_1_trace 3)))
               (__f3 (__f3 (select initial_1_trace 2)))))
      (a!35 (= (__f4 (__f3 (select initial_1_trace 3)))
               (__f4 (__f3 (select initial_1_trace 2)))))
      (a!36 (= (__f7 (__f3 (select initial_1_trace 3))) 0))
      (a!37 (not (__f3 (__f4 (select initial_1_trace 3)))))
      (a!38 (= (__f11 (__f3 (select initial_1_trace 3))) 0))
      (a!39 (not (__f7 (__f4 (select initial_1_trace 3)))))
      (a!40 (= (__f12 (__f3 (select initial_1_trace 3))) 0))
      (a!41 (not (__f8 (__f4 (select initial_1_trace 3)))))
      (a!42 (not (__f1 (__f5 (select initial_1_trace 3)))))
      (a!43 (not (__f2 (__f5 (select initial_1_trace 3)))))
      (a!45 (not (__f3 (__f1 (select initial_1_trace 3)))))
      (a!46 (= (__f9 (__f3 (select initial_1_trace 4)))
               (__f5 (__f3 (select initial_1_trace 4)))))
      (a!47 (= (__f1 (__f3 (select initial_1_trace 4)))
               (__f1 (__f3 (select initial_1_trace 3)))))
      (a!48 (= (__f2 (__f3 (select initial_1_trace 4)))
               (__f2 (__f3 (select initial_1_trace 3)))))
      (a!49 (= (__f3 (__f3 (select initial_1_trace 4)))
               (__f3 (__f3 (select initial_1_trace 3)))))
      (a!50 (= (__f4 (__f3 (select initial_1_trace 4)))
               (__f4 (__f3 (select initial_1_trace 3)))))
      (a!51 (= (__f7 (__f3 (select initial_1_trace 4))) 0))
      (a!52 (not (__f3 (__f4 (select initial_1_trace 4)))))
      (a!53 (= (__f11 (__f3 (select initial_1_trace 4))) 0))
      (a!54 (not (__f7 (__f4 (select initial_1_trace 4)))))
      (a!55 (= (__f12 (__f3 (select initial_1_trace 4))) 0))
      (a!56 (not (__f8 (__f4 (select initial_1_trace 4)))))
      (a!57 (not (__f1 (__f5 (select initial_1_trace 4)))))
      (a!58 (not (__f2 (__f5 (select initial_1_trace 4)))))
      (a!60 (not (__f3 (__f1 (select initial_1_trace 4)))))
      (a!61 (= (__f9 (__f3 (select initial_1_trace 5)))
               (__f5 (__f3 (select initial_1_trace 5)))))
      (a!62 (= (__f1 (__f3 (select initial_1_trace 5)))
               (__f1 (__f3 (select initial_1_trace 4)))))
      (a!63 (= (__f2 (__f3 (select initial_1_trace 5)))
               (__f2 (__f3 (select initial_1_trace 4)))))
      (a!64 (= (__f3 (__f3 (select initial_1_trace 5)))
               (__f3 (__f3 (select initial_1_trace 4)))))
      (a!65 (= (__f4 (__f3 (select initial_1_trace 5)))
               (__f4 (__f3 (select initial_1_trace 4)))))
      (a!66 (= (__f7 (__f3 (select initial_1_trace 5))) 0))
      (a!67 (not (__f3 (__f4 (select initial_1_trace 5)))))
      (a!68 (= (__f11 (__f3 (select initial_1_trace 5))) 0))
      (a!69 (not (__f7 (__f4 (select initial_1_trace 5)))))
      (a!70 (= (__f12 (__f3 (select initial_1_trace 5))) 0))
      (a!71 (not (__f8 (__f4 (select initial_1_trace 5)))))
      (a!72 (not (__f1 (__f5 (select initial_1_trace 5)))))
      (a!73 (not (__f2 (__f5 (select initial_1_trace 5)))))
      (a!75 (not (__f3 (__f1 (select initial_1_trace 5)))))
      (a!76 (= (__f9 (__f3 (select initial_1_trace 6)))
               (__f5 (__f3 (select initial_1_trace 6)))))
      (a!77 (= (__f1 (__f3 (select initial_1_trace 6)))
               (__f1 (__f3 (select initial_1_trace 5)))))
      (a!78 (= (__f2 (__f3 (select initial_1_trace 6)))
               (__f2 (__f3 (select initial_1_trace 5)))))
      (a!79 (= (__f3 (__f3 (select initial_1_trace 6)))
               (__f3 (__f3 (select initial_1_trace 5)))))
      (a!80 (= (__f4 (__f3 (select initial_1_trace 6)))
               (__f4 (__f3 (select initial_1_trace 5)))))
      (a!81 (= (__f7 (__f3 (select initial_1_trace 6))) 0))
      (a!82 (not (__f3 (__f4 (select initial_1_trace 6)))))
      (a!83 (= (__f11 (__f3 (select initial_1_trace 6))) 0))
      (a!84 (not (__f7 (__f4 (select initial_1_trace 6)))))
      (a!85 (= (__f12 (__f3 (select initial_1_trace 6))) 0))
      (a!86 (not (__f8 (__f4 (select initial_1_trace 6)))))
      (a!87 (not (__f1 (__f5 (select initial_1_trace 6)))))
      (a!88 (not (__f2 (__f5 (select initial_1_trace 6)))))
      (a!90 (not (__f3 (__f1 (select initial_1_trace 6)))))
      (a!91 (= (__f9 (__f3 (select initial_1_trace 7)))
               (__f5 (__f3 (select initial_1_trace 7)))))
      (a!92 (= (__f1 (__f3 (select initial_1_trace 7)))
               (__f1 (__f3 (select initial_1_trace 6)))))
      (a!93 (= (__f2 (__f3 (select initial_1_trace 7)))
               (__f2 (__f3 (select initial_1_trace 6)))))
      (a!94 (= (__f3 (__f3 (select initial_1_trace 7)))
               (__f3 (__f3 (select initial_1_trace 6)))))
      (a!95 (= (__f4 (__f3 (select initial_1_trace 7)))
               (__f4 (__f3 (select initial_1_trace 6)))))
      (a!96 (= (__f7 (__f3 (select initial_1_trace 7))) 0))
      (a!97 (not (__f3 (__f4 (select initial_1_trace 7)))))
      (a!98 (= (__f11 (__f3 (select initial_1_trace 7))) 0))
      (a!99 (not (__f7 (__f4 (select initial_1_trace 7)))))
      (a!100 (= (__f12 (__f3 (select initial_1_trace 7))) 0))
      (a!101 (not (__f8 (__f4 (select initial_1_trace 7)))))
      (a!102 (not (__f1 (__f5 (select initial_1_trace 7)))))
      (a!103 (not (__f2 (__f5 (select initial_1_trace 7)))))
      (a!105 (not (__f3 (__f1 (select initial_1_trace 7)))))
      (a!106 (= (__f9 (__f3 (select initial_1_trace 8)))
                (__f5 (__f3 (select initial_1_trace 8)))))
      (a!107 (= (__f1 (__f3 (select initial_1_trace 8)))
                (__f1 (__f3 (select initial_1_trace 7)))))
      (a!108 (= (__f2 (__f3 (select initial_1_trace 8)))
                (__f2 (__f3 (select initial_1_trace 7)))))
      (a!109 (= (__f3 (__f3 (select initial_1_trace 8)))
                (__f3 (__f3 (select initial_1_trace 7)))))
      (a!110 (= (__f4 (__f3 (select initial_1_trace 8)))
                (__f4 (__f3 (select initial_1_trace 7)))))
      (a!111 (= (__f7 (__f3 (select initial_1_trace 8))) 0))
      (a!112 (not (__f3 (__f4 (select initial_1_trace 8)))))
      (a!113 (= (__f11 (__f3 (select initial_1_trace 8))) 0))
      (a!114 (not (__f7 (__f4 (select initial_1_trace 8)))))
      (a!115 (= (__f12 (__f3 (select initial_1_trace 8))) 0))
      (a!116 (not (__f8 (__f4 (select initial_1_trace 8)))))
      (a!117 (not (__f1 (__f5 (select initial_1_trace 8)))))
      (a!118 (not (__f2 (__f5 (select initial_1_trace 8)))))
      (a!120 (not (__f3 (__f1 (select initial_1_trace 8))))))
(let ((a!14 (and a!1
                 (__f5 (__f4 (select initial_1_trace 1)))
                 a!2
                 a!3
                 a!4
                 a!5
                 a!6
                 a!7
                 a!8
                 a!9
                 a!10
                 a!11
                 a!12
                 a!13))
      (a!29 (and a!16
                 (__f5 (__f4 (select initial_1_trace 2)))
                 a!17
                 a!18
                 a!19
                 a!20
                 a!21
                 a!22
                 a!23
                 a!24
                 a!25
                 a!26
                 a!27
                 a!28))
      (a!44 (and a!31
                 (__f5 (__f4 (select initial_1_trace 3)))
                 a!32
                 a!33
                 a!34
                 a!35
                 a!36
                 a!37
                 a!38
                 a!39
                 a!40
                 a!41
                 a!42
                 a!43))
      (a!59 (and a!46
                 (__f5 (__f4 (select initial_1_trace 4)))
                 a!47
                 a!48
                 a!49
                 a!50
                 a!51
                 a!52
                 a!53
                 a!54
                 a!55
                 a!56
                 a!57
                 a!58))
      (a!74 (and a!61
                 (__f5 (__f4 (select initial_1_trace 5)))
                 a!62
                 a!63
                 a!64
                 a!65
                 a!66
                 a!67
                 a!68
                 a!69
                 a!70
                 a!71
                 a!72
                 a!73))
      (a!89 (and a!76
                 (__f5 (__f4 (select initial_1_trace 6)))
                 a!77
                 a!78
                 a!79
                 a!80
                 a!81
                 a!82
                 a!83
                 a!84
                 a!85
                 a!86
                 a!87
                 a!88))
      (a!104 (and a!91
                  (__f5 (__f4 (select initial_1_trace 7)))
                  a!92
                  a!93
                  a!94
                  a!95
                  a!96
                  a!97
                  a!98
                  a!99
                  a!100
                  a!101
                  a!102
                  a!103))
      (a!119 (and a!106
                  (__f5 (__f4 (select initial_1_trace 8)))
                  a!107
                  a!108
                  a!109
                  a!110
                  a!111
                  a!112
                  a!113
                  a!114
                  a!115
                  a!116
                  a!117
                  a!118)))
  (and (or a!14 a!15)
       (or a!29 a!30)
       (or a!44 a!45)
       (or a!59 a!60)
       (or a!74 a!75)
       (or a!89 a!90)
       (or a!104 a!105)
       (or a!119 a!120)))))
(assert (let ((a!1 (_tuple_0 false false false false false false false false false))
      (a!2 (= (__f14 (__f3 (select initial_1_trace 1))) 0))
      (a!4 (= (__f14 (__f3 (select initial_1_trace 2))) 0))
      (a!6 (= (__f14 (__f3 (select initial_1_trace 3))) 0))
      (a!8 (= (__f14 (__f3 (select initial_1_trace 4))) 0))
      (a!10 (= (__f14 (__f3 (select initial_1_trace 5))) 0))
      (a!12 (= (__f14 (__f3 (select initial_1_trace 6))) 0))
      (a!14 (= (__f14 (__f3 (select initial_1_trace 7))) 0))
      (a!16 (= (__f14 (__f3 (select initial_1_trace 8))) 0))
      (a!18 (= (__f14 (__f3 (select initial_1_trace 9))) 0))
      (a!20 (= (__f14 (__f3 (select initial_1_trace 10))) 0))
      (a!22 (= (__f14 (__f3 (select initial_1_trace 11))) 0))
      (a!24 (= (__f14 (__f3 (select initial_1_trace 12))) 0))
      (a!26 (= (__f14 (__f3 (select initial_1_trace 13))) 0))
      (a!28 (= (__f14 (__f3 (select initial_1_trace 14))) 0))
      (a!30 (= (__f14 (__f3 (select initial_1_trace 15))) 0))
      (a!32 (= (__f14 (__f3 (select initial_1_trace 16))) 0))
      (a!34 (= (__f14 (__f3 (select initial_1_trace 17))) 0)))
(let ((a!3 (or (__f10 (__f4 (select initial_1_trace 1)))
               (= (__f1 (select initial_1_trace 1)) a!1)
               a!2))
      (a!5 (or (__f10 (__f4 (select initial_1_trace 2)))
               (= (__f1 (select initial_1_trace 2)) a!1)
               a!4))
      (a!7 (or (__f10 (__f4 (select initial_1_trace 3)))
               (= (__f1 (select initial_1_trace 3)) a!1)
               a!6))
      (a!9 (or (__f10 (__f4 (select initial_1_trace 4)))
               (= (__f1 (select initial_1_trace 4)) a!1)
               a!8))
      (a!11 (or (__f10 (__f4 (select initial_1_trace 5)))
                (= (__f1 (select initial_1_trace 5)) a!1)
                a!10))
      (a!13 (or (__f10 (__f4 (select initial_1_trace 6)))
                (= (__f1 (select initial_1_trace 6)) a!1)
                a!12))
      (a!15 (or (__f10 (__f4 (select initial_1_trace 7)))
                (= (__f1 (select initial_1_trace 7)) a!1)
                a!14))
      (a!17 (or (__f10 (__f4 (select initial_1_trace 8)))
                (= (__f1 (select initial_1_trace 8)) a!1)
                a!16))
      (a!19 (or (__f10 (__f4 (select initial_1_trace 9)))
                (= (__f1 (select initial_1_trace 9)) a!1)
                a!18))
      (a!21 (or (__f10 (__f4 (select initial_1_trace 10)))
                (= (__f1 (select initial_1_trace 10)) a!1)
                a!20))
      (a!23 (or (__f10 (__f4 (select initial_1_trace 11)))
                (= (__f1 (select initial_1_trace 11)) a!1)
                a!22))
      (a!25 (or (__f10 (__f4 (select initial_1_trace 12)))
                (= (__f1 (select initial_1_trace 12)) a!1)
                a!24))
      (a!27 (or (__f10 (__f4 (select initial_1_trace 13)))
                (= (__f1 (select initial_1_trace 13)) a!1)
                a!26))
      (a!29 (or (__f10 (__f4 (select initial_1_trace 14)))
                (= (__f1 (select initial_1_trace 14)) a!1)
                a!28))
      (a!31 (or (__f10 (__f4 (select initial_1_trace 15)))
                (= (__f1 (select initial_1_trace 15)) a!1)
                a!30))
      (a!33 (or (__f10 (__f4 (select initial_1_trace 16)))
                (= (__f1 (select initial_1_trace 16)) a!1)
                a!32))
      (a!35 (or (__f10 (__f4 (select initial_1_trace 17)))
                (= (__f1 (select initial_1_trace 17)) a!1)
                a!34)))
  (and a!3
       a!5
       a!7
       a!9
       a!11
       a!13
       a!15
       a!17
       a!19
       a!21
       a!23
       a!25
       a!27
       a!29
       a!31
       a!33
       a!35))))
(assert (let ((a!1 (_tuple_0 false false false false false false false false false))
      (a!2 (= (__f6 (__f3 (select initial_1_trace 1))) 0))
      (a!4 (= (__f6 (__f3 (select initial_1_trace 2))) 0))
      (a!6 (= (__f6 (__f3 (select initial_1_trace 3))) 0))
      (a!8 (= (__f6 (__f3 (select initial_1_trace 4))) 0))
      (a!10 (= (__f6 (__f3 (select initial_1_trace 5))) 0))
      (a!12 (= (__f6 (__f3 (select initial_1_trace 6))) 0))
      (a!14 (= (__f6 (__f3 (select initial_1_trace 7))) 0))
      (a!16 (= (__f6 (__f3 (select initial_1_trace 8))) 0))
      (a!18 (= (__f6 (__f3 (select initial_1_trace 9))) 0))
      (a!20 (= (__f6 (__f3 (select initial_1_trace 10))) 0))
      (a!22 (= (__f6 (__f3 (select initial_1_trace 11))) 0))
      (a!24 (= (__f6 (__f3 (select initial_1_trace 12))) 0))
      (a!26 (= (__f6 (__f3 (select initial_1_trace 13))) 0))
      (a!28 (= (__f6 (__f3 (select initial_1_trace 14))) 0))
      (a!30 (= (__f6 (__f3 (select initial_1_trace 15))) 0))
      (a!32 (= (__f6 (__f3 (select initial_1_trace 16))) 0))
      (a!34 (= (__f6 (__f3 (select initial_1_trace 17))) 0)))
(let ((a!3 (or (= (__f1 (select initial_1_trace 1)) a!1)
               (__f2 (__f4 (select initial_1_trace 1)))
               a!2))
      (a!5 (or (__f2 (__f4 (select initial_1_trace 2)))
               (= (__f1 (select initial_1_trace 2)) a!1)
               a!4))
      (a!7 (or (__f2 (__f4 (select initial_1_trace 3)))
               (= (__f1 (select initial_1_trace 3)) a!1)
               a!6))
      (a!9 (or (__f2 (__f4 (select initial_1_trace 4)))
               (= (__f1 (select initial_1_trace 4)) a!1)
               a!8))
      (a!11 (or (__f2 (__f4 (select initial_1_trace 5)))
                (= (__f1 (select initial_1_trace 5)) a!1)
                a!10))
      (a!13 (or (__f2 (__f4 (select initial_1_trace 6)))
                (= (__f1 (select initial_1_trace 6)) a!1)
                a!12))
      (a!15 (or (__f2 (__f4 (select initial_1_trace 7)))
                (= (__f1 (select initial_1_trace 7)) a!1)
                a!14))
      (a!17 (or (__f2 (__f4 (select initial_1_trace 8)))
                (= (__f1 (select initial_1_trace 8)) a!1)
                a!16))
      (a!19 (or (__f2 (__f4 (select initial_1_trace 9)))
                (= (__f1 (select initial_1_trace 9)) a!1)
                a!18))
      (a!21 (or (__f2 (__f4 (select initial_1_trace 10)))
                (= (__f1 (select initial_1_trace 10)) a!1)
                a!20))
      (a!23 (or (__f2 (__f4 (select initial_1_trace 11)))
                (= (__f1 (select initial_1_trace 11)) a!1)
                a!22))
      (a!25 (or (__f2 (__f4 (select initial_1_trace 12)))
                (= (__f1 (select initial_1_trace 12)) a!1)
                a!24))
      (a!27 (or (__f2 (__f4 (select initial_1_trace 13)))
                (= (__f1 (select initial_1_trace 13)) a!1)
                a!26))
      (a!29 (or (__f2 (__f4 (select initial_1_trace 14)))
                (= (__f1 (select initial_1_trace 14)) a!1)
                a!28))
      (a!31 (or (__f2 (__f4 (select initial_1_trace 15)))
                (= (__f1 (select initial_1_trace 15)) a!1)
                a!30))
      (a!33 (or (__f2 (__f4 (select initial_1_trace 16)))
                (= (__f1 (select initial_1_trace 16)) a!1)
                a!32))
      (a!35 (or (__f2 (__f4 (select initial_1_trace 17)))
                (= (__f1 (select initial_1_trace 17)) a!1)
                a!34)))
  (and a!3
       a!5
       a!7
       a!9
       a!11
       a!13
       a!15
       a!17
       a!19
       a!21
       a!23
       a!25
       a!27
       a!29
       a!31
       a!33
       a!35))))
(assert (let ((a!1 (= (__f11 (__f3 (select initial_1_trace 1)))
              (__f10 (__f3 (select initial_1_trace 1)))))
      (a!2 (= (__f12 (__f3 (select initial_1_trace 1))) 1))
      (a!3 (= (__f1 (__f3 (select initial_1_trace 1)))
              (__f1 (__f3 (select initial_1_trace 0)))))
      (a!4 (= (__f2 (__f3 (select initial_1_trace 1)))
              (__f2 (__f3 (select initial_1_trace 0)))))
      (a!5 (= (__f3 (__f3 (select initial_1_trace 1)))
              (__f3 (__f3 (select initial_1_trace 0)))))
      (a!6 (= (__f4 (__f3 (select initial_1_trace 1)))
              (__f4 (__f3 (select initial_1_trace 0)))))
      (a!7 (= (__f7 (__f3 (select initial_1_trace 1))) 0))
      (a!8 (not (__f3 (__f4 (select initial_1_trace 1)))))
      (a!9 (= (__f9 (__f3 (select initial_1_trace 1))) 0))
      (a!10 (not (__f5 (__f4 (select initial_1_trace 1)))))
      (a!11 (not (__f1 (__f5 (select initial_1_trace 1)))))
      (a!12 (not (__f2 (__f5 (select initial_1_trace 1)))))
      (a!14 (not (__f4 (__f1 (select initial_1_trace 1)))))
      (a!15 (= (__f11 (__f3 (select initial_1_trace 2)))
               (__f10 (__f3 (select initial_1_trace 2)))))
      (a!16 (= (__f12 (__f3 (select initial_1_trace 2))) 1))
      (a!17 (= (__f1 (__f3 (select initial_1_trace 2)))
               (__f1 (__f3 (select initial_1_trace 1)))))
      (a!18 (= (__f2 (__f3 (select initial_1_trace 2)))
               (__f2 (__f3 (select initial_1_trace 1)))))
      (a!19 (= (__f3 (__f3 (select initial_1_trace 2)))
               (__f3 (__f3 (select initial_1_trace 1)))))
      (a!20 (= (__f4 (__f3 (select initial_1_trace 2)))
               (__f4 (__f3 (select initial_1_trace 1)))))
      (a!21 (= (__f7 (__f3 (select initial_1_trace 2))) 0))
      (a!22 (not (__f3 (__f4 (select initial_1_trace 2)))))
      (a!23 (= (__f9 (__f3 (select initial_1_trace 2))) 0))
      (a!24 (not (__f5 (__f4 (select initial_1_trace 2)))))
      (a!25 (not (__f1 (__f5 (select initial_1_trace 2)))))
      (a!26 (not (__f2 (__f5 (select initial_1_trace 2)))))
      (a!28 (not (__f4 (__f1 (select initial_1_trace 2)))))
      (a!29 (= (__f11 (__f3 (select initial_1_trace 3)))
               (__f10 (__f3 (select initial_1_trace 3)))))
      (a!30 (= (__f12 (__f3 (select initial_1_trace 3))) 1))
      (a!31 (= (__f1 (__f3 (select initial_1_trace 3)))
               (__f1 (__f3 (select initial_1_trace 2)))))
      (a!32 (= (__f2 (__f3 (select initial_1_trace 3)))
               (__f2 (__f3 (select initial_1_trace 2)))))
      (a!33 (= (__f3 (__f3 (select initial_1_trace 3)))
               (__f3 (__f3 (select initial_1_trace 2)))))
      (a!34 (= (__f4 (__f3 (select initial_1_trace 3)))
               (__f4 (__f3 (select initial_1_trace 2)))))
      (a!35 (= (__f7 (__f3 (select initial_1_trace 3))) 0))
      (a!36 (not (__f3 (__f4 (select initial_1_trace 3)))))
      (a!37 (= (__f9 (__f3 (select initial_1_trace 3))) 0))
      (a!38 (not (__f5 (__f4 (select initial_1_trace 3)))))
      (a!39 (not (__f1 (__f5 (select initial_1_trace 3)))))
      (a!40 (not (__f2 (__f5 (select initial_1_trace 3)))))
      (a!42 (not (__f4 (__f1 (select initial_1_trace 3)))))
      (a!43 (= (__f11 (__f3 (select initial_1_trace 4)))
               (__f10 (__f3 (select initial_1_trace 4)))))
      (a!44 (= (__f12 (__f3 (select initial_1_trace 4))) 1))
      (a!45 (= (__f1 (__f3 (select initial_1_trace 4)))
               (__f1 (__f3 (select initial_1_trace 3)))))
      (a!46 (= (__f2 (__f3 (select initial_1_trace 4)))
               (__f2 (__f3 (select initial_1_trace 3)))))
      (a!47 (= (__f3 (__f3 (select initial_1_trace 4)))
               (__f3 (__f3 (select initial_1_trace 3)))))
      (a!48 (= (__f4 (__f3 (select initial_1_trace 4)))
               (__f4 (__f3 (select initial_1_trace 3)))))
      (a!49 (= (__f7 (__f3 (select initial_1_trace 4))) 0))
      (a!50 (not (__f3 (__f4 (select initial_1_trace 4)))))
      (a!51 (= (__f9 (__f3 (select initial_1_trace 4))) 0))
      (a!52 (not (__f5 (__f4 (select initial_1_trace 4)))))
      (a!53 (not (__f1 (__f5 (select initial_1_trace 4)))))
      (a!54 (not (__f2 (__f5 (select initial_1_trace 4)))))
      (a!56 (not (__f4 (__f1 (select initial_1_trace 4)))))
      (a!57 (= (__f11 (__f3 (select initial_1_trace 5)))
               (__f10 (__f3 (select initial_1_trace 5)))))
      (a!58 (= (__f12 (__f3 (select initial_1_trace 5))) 1))
      (a!59 (= (__f1 (__f3 (select initial_1_trace 5)))
               (__f1 (__f3 (select initial_1_trace 4)))))
      (a!60 (= (__f2 (__f3 (select initial_1_trace 5)))
               (__f2 (__f3 (select initial_1_trace 4)))))
      (a!61 (= (__f3 (__f3 (select initial_1_trace 5)))
               (__f3 (__f3 (select initial_1_trace 4)))))
      (a!62 (= (__f4 (__f3 (select initial_1_trace 5)))
               (__f4 (__f3 (select initial_1_trace 4)))))
      (a!63 (= (__f7 (__f3 (select initial_1_trace 5))) 0))
      (a!64 (not (__f3 (__f4 (select initial_1_trace 5)))))
      (a!65 (= (__f9 (__f3 (select initial_1_trace 5))) 0))
      (a!66 (not (__f5 (__f4 (select initial_1_trace 5)))))
      (a!67 (not (__f1 (__f5 (select initial_1_trace 5)))))
      (a!68 (not (__f2 (__f5 (select initial_1_trace 5)))))
      (a!70 (not (__f4 (__f1 (select initial_1_trace 5)))))
      (a!71 (= (__f11 (__f3 (select initial_1_trace 6)))
               (__f10 (__f3 (select initial_1_trace 6)))))
      (a!72 (= (__f12 (__f3 (select initial_1_trace 6))) 1))
      (a!73 (= (__f1 (__f3 (select initial_1_trace 6)))
               (__f1 (__f3 (select initial_1_trace 5)))))
      (a!74 (= (__f2 (__f3 (select initial_1_trace 6)))
               (__f2 (__f3 (select initial_1_trace 5)))))
      (a!75 (= (__f3 (__f3 (select initial_1_trace 6)))
               (__f3 (__f3 (select initial_1_trace 5)))))
      (a!76 (= (__f4 (__f3 (select initial_1_trace 6)))
               (__f4 (__f3 (select initial_1_trace 5)))))
      (a!77 (= (__f7 (__f3 (select initial_1_trace 6))) 0))
      (a!78 (not (__f3 (__f4 (select initial_1_trace 6)))))
      (a!79 (= (__f9 (__f3 (select initial_1_trace 6))) 0))
      (a!80 (not (__f5 (__f4 (select initial_1_trace 6)))))
      (a!81 (not (__f1 (__f5 (select initial_1_trace 6)))))
      (a!82 (not (__f2 (__f5 (select initial_1_trace 6)))))
      (a!84 (not (__f4 (__f1 (select initial_1_trace 6)))))
      (a!85 (= (__f11 (__f3 (select initial_1_trace 7)))
               (__f10 (__f3 (select initial_1_trace 7)))))
      (a!86 (= (__f12 (__f3 (select initial_1_trace 7))) 1))
      (a!87 (= (__f1 (__f3 (select initial_1_trace 7)))
               (__f1 (__f3 (select initial_1_trace 6)))))
      (a!88 (= (__f2 (__f3 (select initial_1_trace 7)))
               (__f2 (__f3 (select initial_1_trace 6)))))
      (a!89 (= (__f3 (__f3 (select initial_1_trace 7)))
               (__f3 (__f3 (select initial_1_trace 6)))))
      (a!90 (= (__f4 (__f3 (select initial_1_trace 7)))
               (__f4 (__f3 (select initial_1_trace 6)))))
      (a!91 (= (__f7 (__f3 (select initial_1_trace 7))) 0))
      (a!92 (not (__f3 (__f4 (select initial_1_trace 7)))))
      (a!93 (= (__f9 (__f3 (select initial_1_trace 7))) 0))
      (a!94 (not (__f5 (__f4 (select initial_1_trace 7)))))
      (a!95 (not (__f1 (__f5 (select initial_1_trace 7)))))
      (a!96 (not (__f2 (__f5 (select initial_1_trace 7)))))
      (a!98 (not (__f4 (__f1 (select initial_1_trace 7)))))
      (a!99 (= (__f11 (__f3 (select initial_1_trace 8)))
               (__f10 (__f3 (select initial_1_trace 8)))))
      (a!100 (= (__f12 (__f3 (select initial_1_trace 8))) 1))
      (a!101 (= (__f1 (__f3 (select initial_1_trace 8)))
                (__f1 (__f3 (select initial_1_trace 7)))))
      (a!102 (= (__f2 (__f3 (select initial_1_trace 8)))
                (__f2 (__f3 (select initial_1_trace 7)))))
      (a!103 (= (__f3 (__f3 (select initial_1_trace 8)))
                (__f3 (__f3 (select initial_1_trace 7)))))
      (a!104 (= (__f4 (__f3 (select initial_1_trace 8)))
                (__f4 (__f3 (select initial_1_trace 7)))))
      (a!105 (= (__f7 (__f3 (select initial_1_trace 8))) 0))
      (a!106 (not (__f3 (__f4 (select initial_1_trace 8)))))
      (a!107 (= (__f9 (__f3 (select initial_1_trace 8))) 0))
      (a!108 (not (__f5 (__f4 (select initial_1_trace 8)))))
      (a!109 (not (__f1 (__f5 (select initial_1_trace 8)))))
      (a!110 (not (__f2 (__f5 (select initial_1_trace 8)))))
      (a!112 (not (__f4 (__f1 (select initial_1_trace 8))))))
(let ((a!13 (and a!1
                 (__f7 (__f4 (select initial_1_trace 1)))
                 a!2
                 (__f8 (__f4 (select initial_1_trace 1)))
                 a!3
                 a!4
                 a!5
                 a!6
                 a!7
                 a!8
                 a!9
                 a!10
                 a!11
                 a!12))
      (a!27 (and a!15
                 (__f7 (__f4 (select initial_1_trace 2)))
                 a!16
                 (__f8 (__f4 (select initial_1_trace 2)))
                 a!17
                 a!18
                 a!19
                 a!20
                 a!21
                 a!22
                 a!23
                 a!24
                 a!25
                 a!26))
      (a!41 (and a!29
                 (__f7 (__f4 (select initial_1_trace 3)))
                 a!30
                 (__f8 (__f4 (select initial_1_trace 3)))
                 a!31
                 a!32
                 a!33
                 a!34
                 a!35
                 a!36
                 a!37
                 a!38
                 a!39
                 a!40))
      (a!55 (and a!43
                 (__f7 (__f4 (select initial_1_trace 4)))
                 a!44
                 (__f8 (__f4 (select initial_1_trace 4)))
                 a!45
                 a!46
                 a!47
                 a!48
                 a!49
                 a!50
                 a!51
                 a!52
                 a!53
                 a!54))
      (a!69 (and a!57
                 (__f7 (__f4 (select initial_1_trace 5)))
                 a!58
                 (__f8 (__f4 (select initial_1_trace 5)))
                 a!59
                 a!60
                 a!61
                 a!62
                 a!63
                 a!64
                 a!65
                 a!66
                 a!67
                 a!68))
      (a!83 (and a!71
                 (__f7 (__f4 (select initial_1_trace 6)))
                 a!72
                 (__f8 (__f4 (select initial_1_trace 6)))
                 a!73
                 a!74
                 a!75
                 a!76
                 a!77
                 a!78
                 a!79
                 a!80
                 a!81
                 a!82))
      (a!97 (and a!85
                 (__f7 (__f4 (select initial_1_trace 7)))
                 a!86
                 (__f8 (__f4 (select initial_1_trace 7)))
                 a!87
                 a!88
                 a!89
                 a!90
                 a!91
                 a!92
                 a!93
                 a!94
                 a!95
                 a!96))
      (a!111 (and a!99
                  (__f7 (__f4 (select initial_1_trace 8)))
                  a!100
                  (__f8 (__f4 (select initial_1_trace 8)))
                  a!101
                  a!102
                  a!103
                  a!104
                  a!105
                  a!106
                  a!107
                  a!108
                  a!109
                  a!110)))
  (and (or a!13 a!14)
       (or a!27 a!28)
       (or a!41 a!42)
       (or a!55 a!56)
       (or a!69 a!70)
       (or a!83 a!84)
       (or a!97 a!98)
       (or a!111 a!112)))))
(assert (let ((a!1 (+ 10000000 (__f1 (__f2 (select initial_1_trace 1)))))
      (a!18 (= (__f1 (__f6 (select initial_1_trace 1)))
               (__f8 (__f3 (select initial_1_trace 1)))))
      (a!19 (= (__f1 (__f3 (select initial_1_trace 1)))
               (__f1 (__f3 (select initial_1_trace 0)))))
      (a!20 (= (__f2 (__f3 (select initial_1_trace 1)))
               (__f2 (__f3 (select initial_1_trace 0)))))
      (a!21 (= (__f3 (__f3 (select initial_1_trace 1)))
               (__f3 (__f3 (select initial_1_trace 0)))))
      (a!22 (= (__f4 (__f3 (select initial_1_trace 1)))
               (__f4 (__f3 (select initial_1_trace 0)))))
      (a!23 (= (__f7 (__f3 (select initial_1_trace 1))) 0))
      (a!24 (not (__f3 (__f4 (select initial_1_trace 1)))))
      (a!25 (= (__f9 (__f3 (select initial_1_trace 1))) 0))
      (a!26 (not (__f5 (__f4 (select initial_1_trace 1)))))
      (a!27 (= (__f11 (__f3 (select initial_1_trace 1))) 0))
      (a!28 (not (__f7 (__f4 (select initial_1_trace 1)))))
      (a!29 (= (__f12 (__f3 (select initial_1_trace 1))) 0))
      (a!30 (not (__f8 (__f4 (select initial_1_trace 1)))))
      (a!31 (not (__f2 (__f5 (select initial_1_trace 1)))))
      (a!33 (not (__f2 (__f1 (select initial_1_trace 1)))))
      (a!34 (+ 10000000 (__f1 (__f2 (select initial_1_trace 2)))))
      (a!50 (= (__f1 (__f6 (select initial_1_trace 2)))
               (__f8 (__f3 (select initial_1_trace 2)))))
      (a!51 (= (__f1 (__f3 (select initial_1_trace 2)))
               (__f1 (__f3 (select initial_1_trace 1)))))
      (a!52 (= (__f2 (__f3 (select initial_1_trace 2)))
               (__f2 (__f3 (select initial_1_trace 1)))))
      (a!53 (= (__f3 (__f3 (select initial_1_trace 2)))
               (__f3 (__f3 (select initial_1_trace 1)))))
      (a!54 (= (__f4 (__f3 (select initial_1_trace 2)))
               (__f4 (__f3 (select initial_1_trace 1)))))
      (a!55 (= (__f7 (__f3 (select initial_1_trace 2))) 0))
      (a!56 (not (__f3 (__f4 (select initial_1_trace 2)))))
      (a!57 (= (__f9 (__f3 (select initial_1_trace 2))) 0))
      (a!58 (not (__f5 (__f4 (select initial_1_trace 2)))))
      (a!59 (= (__f11 (__f3 (select initial_1_trace 2))) 0))
      (a!60 (not (__f7 (__f4 (select initial_1_trace 2)))))
      (a!61 (= (__f12 (__f3 (select initial_1_trace 2))) 0))
      (a!62 (not (__f8 (__f4 (select initial_1_trace 2)))))
      (a!63 (not (__f2 (__f5 (select initial_1_trace 2)))))
      (a!65 (not (__f2 (__f1 (select initial_1_trace 2)))))
      (a!66 (+ 10000000 (__f1 (__f2 (select initial_1_trace 3)))))
      (a!81 (= (__f1 (__f6 (select initial_1_trace 3)))
               (__f8 (__f3 (select initial_1_trace 3)))))
      (a!82 (= (__f1 (__f3 (select initial_1_trace 3)))
               (__f1 (__f3 (select initial_1_trace 2)))))
      (a!83 (= (__f2 (__f3 (select initial_1_trace 3)))
               (__f2 (__f3 (select initial_1_trace 2)))))
      (a!84 (= (__f3 (__f3 (select initial_1_trace 3)))
               (__f3 (__f3 (select initial_1_trace 2)))))
      (a!85 (= (__f4 (__f3 (select initial_1_trace 3)))
               (__f4 (__f3 (select initial_1_trace 2)))))
      (a!86 (= (__f7 (__f3 (select initial_1_trace 3))) 0))
      (a!87 (not (__f3 (__f4 (select initial_1_trace 3)))))
      (a!88 (= (__f9 (__f3 (select initial_1_trace 3))) 0))
      (a!89 (not (__f5 (__f4 (select initial_1_trace 3)))))
      (a!90 (= (__f11 (__f3 (select initial_1_trace 3))) 0))
      (a!91 (not (__f7 (__f4 (select initial_1_trace 3)))))
      (a!92 (= (__f12 (__f3 (select initial_1_trace 3))) 0))
      (a!93 (not (__f8 (__f4 (select initial_1_trace 3)))))
      (a!94 (not (__f2 (__f5 (select initial_1_trace 3)))))
      (a!96 (not (__f2 (__f1 (select initial_1_trace 3)))))
      (a!97 (+ 10000000 (__f1 (__f2 (select initial_1_trace 4)))))
      (a!111 (= (__f1 (__f6 (select initial_1_trace 4)))
                (__f8 (__f3 (select initial_1_trace 4)))))
      (a!112 (= (__f1 (__f3 (select initial_1_trace 4)))
                (__f1 (__f3 (select initial_1_trace 3)))))
      (a!113 (= (__f2 (__f3 (select initial_1_trace 4)))
                (__f2 (__f3 (select initial_1_trace 3)))))
      (a!114 (= (__f3 (__f3 (select initial_1_trace 4)))
                (__f3 (__f3 (select initial_1_trace 3)))))
      (a!115 (= (__f4 (__f3 (select initial_1_trace 4)))
                (__f4 (__f3 (select initial_1_trace 3)))))
      (a!116 (= (__f7 (__f3 (select initial_1_trace 4))) 0))
      (a!117 (not (__f3 (__f4 (select initial_1_trace 4)))))
      (a!118 (= (__f9 (__f3 (select initial_1_trace 4))) 0))
      (a!119 (not (__f5 (__f4 (select initial_1_trace 4)))))
      (a!120 (= (__f11 (__f3 (select initial_1_trace 4))) 0))
      (a!121 (not (__f7 (__f4 (select initial_1_trace 4)))))
      (a!122 (= (__f12 (__f3 (select initial_1_trace 4))) 0))
      (a!123 (not (__f8 (__f4 (select initial_1_trace 4)))))
      (a!124 (not (__f2 (__f5 (select initial_1_trace 4)))))
      (a!126 (not (__f2 (__f1 (select initial_1_trace 4)))))
      (a!127 (+ 10000000 (__f1 (__f2 (select initial_1_trace 5)))))
      (a!140 (= (__f1 (__f6 (select initial_1_trace 5)))
                (__f8 (__f3 (select initial_1_trace 5)))))
      (a!141 (= (__f1 (__f3 (select initial_1_trace 5)))
                (__f1 (__f3 (select initial_1_trace 4)))))
      (a!142 (= (__f2 (__f3 (select initial_1_trace 5)))
                (__f2 (__f3 (select initial_1_trace 4)))))
      (a!143 (= (__f3 (__f3 (select initial_1_trace 5)))
                (__f3 (__f3 (select initial_1_trace 4)))))
      (a!144 (= (__f4 (__f3 (select initial_1_trace 5)))
                (__f4 (__f3 (select initial_1_trace 4)))))
      (a!145 (= (__f7 (__f3 (select initial_1_trace 5))) 0))
      (a!146 (not (__f3 (__f4 (select initial_1_trace 5)))))
      (a!147 (= (__f9 (__f3 (select initial_1_trace 5))) 0))
      (a!148 (not (__f5 (__f4 (select initial_1_trace 5)))))
      (a!149 (= (__f11 (__f3 (select initial_1_trace 5))) 0))
      (a!150 (not (__f7 (__f4 (select initial_1_trace 5)))))
      (a!151 (= (__f12 (__f3 (select initial_1_trace 5))) 0))
      (a!152 (not (__f8 (__f4 (select initial_1_trace 5)))))
      (a!153 (not (__f2 (__f5 (select initial_1_trace 5)))))
      (a!155 (not (__f2 (__f1 (select initial_1_trace 5)))))
      (a!156 (+ 10000000 (__f1 (__f2 (select initial_1_trace 6)))))
      (a!168 (= (__f1 (__f6 (select initial_1_trace 6)))
                (__f8 (__f3 (select initial_1_trace 6)))))
      (a!169 (= (__f1 (__f3 (select initial_1_trace 6)))
                (__f1 (__f3 (select initial_1_trace 5)))))
      (a!170 (= (__f2 (__f3 (select initial_1_trace 6)))
                (__f2 (__f3 (select initial_1_trace 5)))))
      (a!171 (= (__f3 (__f3 (select initial_1_trace 6)))
                (__f3 (__f3 (select initial_1_trace 5)))))
      (a!172 (= (__f4 (__f3 (select initial_1_trace 6)))
                (__f4 (__f3 (select initial_1_trace 5)))))
      (a!173 (= (__f7 (__f3 (select initial_1_trace 6))) 0))
      (a!174 (not (__f3 (__f4 (select initial_1_trace 6)))))
      (a!175 (= (__f9 (__f3 (select initial_1_trace 6))) 0))
      (a!176 (not (__f5 (__f4 (select initial_1_trace 6)))))
      (a!177 (= (__f11 (__f3 (select initial_1_trace 6))) 0))
      (a!178 (not (__f7 (__f4 (select initial_1_trace 6)))))
      (a!179 (= (__f12 (__f3 (select initial_1_trace 6))) 0))
      (a!180 (not (__f8 (__f4 (select initial_1_trace 6)))))
      (a!181 (not (__f2 (__f5 (select initial_1_trace 6)))))
      (a!183 (not (__f2 (__f1 (select initial_1_trace 6)))))
      (a!184 (+ 10000000 (__f1 (__f2 (select initial_1_trace 7)))))
      (a!195 (= (__f1 (__f6 (select initial_1_trace 7)))
                (__f8 (__f3 (select initial_1_trace 7)))))
      (a!196 (= (__f1 (__f3 (select initial_1_trace 7)))
                (__f1 (__f3 (select initial_1_trace 6)))))
      (a!197 (= (__f2 (__f3 (select initial_1_trace 7)))
                (__f2 (__f3 (select initial_1_trace 6)))))
      (a!198 (= (__f3 (__f3 (select initial_1_trace 7)))
                (__f3 (__f3 (select initial_1_trace 6)))))
      (a!199 (= (__f4 (__f3 (select initial_1_trace 7)))
                (__f4 (__f3 (select initial_1_trace 6)))))
      (a!200 (= (__f7 (__f3 (select initial_1_trace 7))) 0))
      (a!201 (not (__f3 (__f4 (select initial_1_trace 7)))))
      (a!202 (= (__f9 (__f3 (select initial_1_trace 7))) 0))
      (a!203 (not (__f5 (__f4 (select initial_1_trace 7)))))
      (a!204 (= (__f11 (__f3 (select initial_1_trace 7))) 0))
      (a!205 (not (__f7 (__f4 (select initial_1_trace 7)))))
      (a!206 (= (__f12 (__f3 (select initial_1_trace 7))) 0))
      (a!207 (not (__f8 (__f4 (select initial_1_trace 7)))))
      (a!208 (not (__f2 (__f5 (select initial_1_trace 7)))))
      (a!210 (not (__f2 (__f1 (select initial_1_trace 7)))))
      (a!211 (+ 10000000 (__f1 (__f2 (select initial_1_trace 8)))))
      (a!221 (= (__f1 (__f6 (select initial_1_trace 8)))
                (__f8 (__f3 (select initial_1_trace 8)))))
      (a!222 (= (__f1 (__f3 (select initial_1_trace 8)))
                (__f1 (__f3 (select initial_1_trace 7)))))
      (a!223 (= (__f2 (__f3 (select initial_1_trace 8)))
                (__f2 (__f3 (select initial_1_trace 7)))))
      (a!224 (= (__f3 (__f3 (select initial_1_trace 8)))
                (__f3 (__f3 (select initial_1_trace 7)))))
      (a!225 (= (__f4 (__f3 (select initial_1_trace 8)))
                (__f4 (__f3 (select initial_1_trace 7)))))
      (a!226 (= (__f7 (__f3 (select initial_1_trace 8))) 0))
      (a!227 (not (__f3 (__f4 (select initial_1_trace 8)))))
      (a!228 (= (__f9 (__f3 (select initial_1_trace 8))) 0))
      (a!229 (not (__f5 (__f4 (select initial_1_trace 8)))))
      (a!230 (= (__f11 (__f3 (select initial_1_trace 8))) 0))
      (a!231 (not (__f7 (__f4 (select initial_1_trace 8)))))
      (a!232 (= (__f12 (__f3 (select initial_1_trace 8))) 0))
      (a!233 (not (__f8 (__f4 (select initial_1_trace 8)))))
      (a!234 (not (__f2 (__f5 (select initial_1_trace 8)))))
      (a!236 (not (__f2 (__f1 (select initial_1_trace 8))))))
(let ((a!2 (and (__f1 (__f4 (select initial_1_trace 2)))
                (= (__f2 (select initial_1_trace 2)) (_tuple_2 a!1 0))))
      (a!3 (and (__f1 (__f4 (select initial_1_trace 3)))
                (= (__f2 (select initial_1_trace 3)) (_tuple_2 a!1 0))))
      (a!4 (and (__f1 (__f4 (select initial_1_trace 4)))
                (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!1 0))))
      (a!5 (and (__f1 (__f4 (select initial_1_trace 5)))
                (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!1 0))))
      (a!6 (and (__f1 (__f4 (select initial_1_trace 6)))
                (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!1 0))))
      (a!7 (and (__f1 (__f4 (select initial_1_trace 7)))
                (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!1 0))))
      (a!8 (and (__f1 (__f4 (select initial_1_trace 8)))
                (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!1 0))))
      (a!9 (and (__f1 (__f4 (select initial_1_trace 9)))
                (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!1 0))))
      (a!10 (and (__f1 (__f4 (select initial_1_trace 10)))
                 (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!1 0))))
      (a!11 (and (__f1 (__f4 (select initial_1_trace 11)))
                 (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!1 0))))
      (a!12 (and (__f1 (__f4 (select initial_1_trace 12)))
                 (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!1 0))))
      (a!13 (and (__f1 (__f4 (select initial_1_trace 13)))
                 (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!1 0))))
      (a!14 (and (__f1 (__f4 (select initial_1_trace 14)))
                 (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!1 0))))
      (a!15 (and (__f1 (__f4 (select initial_1_trace 15)))
                 (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!1 0))))
      (a!16 (and (__f1 (__f4 (select initial_1_trace 16)))
                 (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!1 0))))
      (a!17 (and (__f1 (__f4 (select initial_1_trace 17)))
                 (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!1 0))))
      (a!35 (and (__f1 (__f4 (select initial_1_trace 3)))
                 (= (__f2 (select initial_1_trace 3)) (_tuple_2 a!34 0))))
      (a!36 (and (__f1 (__f4 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!34 0))))
      (a!37 (and (__f1 (__f4 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!34 0))))
      (a!38 (and (__f1 (__f4 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!34 0))))
      (a!39 (and (__f1 (__f4 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!34 0))))
      (a!40 (and (__f1 (__f4 (select initial_1_trace 8)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!34 0))))
      (a!41 (and (__f1 (__f4 (select initial_1_trace 9)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!34 0))))
      (a!42 (and (__f1 (__f4 (select initial_1_trace 10)))
                 (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!34 0))))
      (a!43 (and (__f1 (__f4 (select initial_1_trace 11)))
                 (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!34 0))))
      (a!44 (and (__f1 (__f4 (select initial_1_trace 12)))
                 (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!34 0))))
      (a!45 (and (__f1 (__f4 (select initial_1_trace 13)))
                 (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!34 0))))
      (a!46 (and (__f1 (__f4 (select initial_1_trace 14)))
                 (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!34 0))))
      (a!47 (and (__f1 (__f4 (select initial_1_trace 15)))
                 (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!34 0))))
      (a!48 (and (__f1 (__f4 (select initial_1_trace 16)))
                 (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!34 0))))
      (a!49 (and (__f1 (__f4 (select initial_1_trace 17)))
                 (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!34 0))))
      (a!67 (and (__f1 (__f4 (select initial_1_trace 4)))
                 (= (__f2 (select initial_1_trace 4)) (_tuple_2 a!66 0))))
      (a!68 (and (__f1 (__f4 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!66 0))))
      (a!69 (and (__f1 (__f4 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!66 0))))
      (a!70 (and (__f1 (__f4 (select initial_1_trace 7)))
                 (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!66 0))))
      (a!71 (and (__f1 (__f4 (select initial_1_trace 8)))
                 (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!66 0))))
      (a!72 (and (__f1 (__f4 (select initial_1_trace 9)))
                 (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!66 0))))
      (a!73 (and (__f1 (__f4 (select initial_1_trace 10)))
                 (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!66 0))))
      (a!74 (and (__f1 (__f4 (select initial_1_trace 11)))
                 (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!66 0))))
      (a!75 (and (__f1 (__f4 (select initial_1_trace 12)))
                 (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!66 0))))
      (a!76 (and (__f1 (__f4 (select initial_1_trace 13)))
                 (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!66 0))))
      (a!77 (and (__f1 (__f4 (select initial_1_trace 14)))
                 (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!66 0))))
      (a!78 (and (__f1 (__f4 (select initial_1_trace 15)))
                 (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!66 0))))
      (a!79 (and (__f1 (__f4 (select initial_1_trace 16)))
                 (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!66 0))))
      (a!80 (and (__f1 (__f4 (select initial_1_trace 17)))
                 (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!66 0))))
      (a!98 (and (__f1 (__f4 (select initial_1_trace 5)))
                 (= (__f2 (select initial_1_trace 5)) (_tuple_2 a!97 0))))
      (a!99 (and (__f1 (__f4 (select initial_1_trace 6)))
                 (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!97 0))))
      (a!100 (and (__f1 (__f4 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!97 0))))
      (a!101 (and (__f1 (__f4 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!97 0))))
      (a!102 (and (__f1 (__f4 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!97 0))))
      (a!103 (and (__f1 (__f4 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!97 0))))
      (a!104 (and (__f1 (__f4 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!97 0))))
      (a!105 (and (__f1 (__f4 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!97 0))))
      (a!106 (and (__f1 (__f4 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!97 0))))
      (a!107 (and (__f1 (__f4 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!97 0))))
      (a!108 (and (__f1 (__f4 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!97 0))))
      (a!109 (and (__f1 (__f4 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!97 0))))
      (a!110 (and (__f1 (__f4 (select initial_1_trace 17)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!97 0))))
      (a!128 (and (__f1 (__f4 (select initial_1_trace 6)))
                  (= (__f2 (select initial_1_trace 6)) (_tuple_2 a!127 0))))
      (a!129 (and (__f1 (__f4 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!127 0))))
      (a!130 (and (__f1 (__f4 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!127 0))))
      (a!131 (and (__f1 (__f4 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!127 0))))
      (a!132 (and (__f1 (__f4 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!127 0))))
      (a!133 (and (__f1 (__f4 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!127 0))))
      (a!134 (and (__f1 (__f4 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!127 0))))
      (a!135 (and (__f1 (__f4 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!127 0))))
      (a!136 (and (__f1 (__f4 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!127 0))))
      (a!137 (and (__f1 (__f4 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!127 0))))
      (a!138 (and (__f1 (__f4 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!127 0))))
      (a!139 (and (__f1 (__f4 (select initial_1_trace 17)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!127 0))))
      (a!157 (and (__f1 (__f4 (select initial_1_trace 7)))
                  (= (__f2 (select initial_1_trace 7)) (_tuple_2 a!156 0))))
      (a!158 (and (__f1 (__f4 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!156 0))))
      (a!159 (and (__f1 (__f4 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!156 0))))
      (a!160 (and (__f1 (__f4 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!156 0))))
      (a!161 (and (__f1 (__f4 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!156 0))))
      (a!162 (and (__f1 (__f4 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!156 0))))
      (a!163 (and (__f1 (__f4 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!156 0))))
      (a!164 (and (__f1 (__f4 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!156 0))))
      (a!165 (and (__f1 (__f4 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!156 0))))
      (a!166 (and (__f1 (__f4 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!156 0))))
      (a!167 (and (__f1 (__f4 (select initial_1_trace 17)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!156 0))))
      (a!185 (and (__f1 (__f4 (select initial_1_trace 8)))
                  (= (__f2 (select initial_1_trace 8)) (_tuple_2 a!184 0))))
      (a!186 (and (__f1 (__f4 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!184 0))))
      (a!187 (and (__f1 (__f4 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!184 0))))
      (a!188 (and (__f1 (__f4 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!184 0))))
      (a!189 (and (__f1 (__f4 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!184 0))))
      (a!190 (and (__f1 (__f4 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!184 0))))
      (a!191 (and (__f1 (__f4 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!184 0))))
      (a!192 (and (__f1 (__f4 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!184 0))))
      (a!193 (and (__f1 (__f4 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!184 0))))
      (a!194 (and (__f1 (__f4 (select initial_1_trace 17)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!184 0))))
      (a!212 (and (__f1 (__f4 (select initial_1_trace 9)))
                  (= (__f2 (select initial_1_trace 9)) (_tuple_2 a!211 0))))
      (a!213 (and (__f1 (__f4 (select initial_1_trace 10)))
                  (= (__f2 (select initial_1_trace 10)) (_tuple_2 a!211 0))))
      (a!214 (and (__f1 (__f4 (select initial_1_trace 11)))
                  (= (__f2 (select initial_1_trace 11)) (_tuple_2 a!211 0))))
      (a!215 (and (__f1 (__f4 (select initial_1_trace 12)))
                  (= (__f2 (select initial_1_trace 12)) (_tuple_2 a!211 0))))
      (a!216 (and (__f1 (__f4 (select initial_1_trace 13)))
                  (= (__f2 (select initial_1_trace 13)) (_tuple_2 a!211 0))))
      (a!217 (and (__f1 (__f4 (select initial_1_trace 14)))
                  (= (__f2 (select initial_1_trace 14)) (_tuple_2 a!211 0))))
      (a!218 (and (__f1 (__f4 (select initial_1_trace 15)))
                  (= (__f2 (select initial_1_trace 15)) (_tuple_2 a!211 0))))
      (a!219 (and (__f1 (__f4 (select initial_1_trace 16)))
                  (= (__f2 (select initial_1_trace 16)) (_tuple_2 a!211 0))))
      (a!220 (and (__f1 (__f4 (select initial_1_trace 17)))
                  (= (__f2 (select initial_1_trace 17)) (_tuple_2 a!211 0)))))
(let ((a!32 (and (or a!2
                     a!3
                     a!4
                     a!5
                     a!6
                     a!7
                     a!8
                     a!9
                     a!10
                     a!11
                     a!12
                     a!13
                     a!14
                     a!15
                     a!16
                     a!17)
                 (__f1 (__f5 (select initial_1_trace 1)))
                 a!18
                 a!19
                 a!20
                 a!21
                 a!22
                 a!23
                 a!24
                 a!25
                 a!26
                 a!27
                 a!28
                 a!29
                 a!30
                 a!31))
      (a!64 (and (or a!35
                     a!36
                     a!37
                     a!38
                     a!39
                     a!40
                     a!41
                     a!42
                     a!43
                     a!44
                     a!45
                     a!46
                     a!47
                     a!48
                     a!49)
                 (__f1 (__f5 (select initial_1_trace 2)))
                 a!50
                 a!51
                 a!52
                 a!53
                 a!54
                 a!55
                 a!56
                 a!57
                 a!58
                 a!59
                 a!60
                 a!61
                 a!62
                 a!63))
      (a!95 (and (or a!67
                     a!68
                     a!69
                     a!70
                     a!71
                     a!72
                     a!73
                     a!74
                     a!75
                     a!76
                     a!77
                     a!78
                     a!79
                     a!80)
                 (__f1 (__f5 (select initial_1_trace 3)))
                 a!81
                 a!82
                 a!83
                 a!84
                 a!85
                 a!86
                 a!87
                 a!88
                 a!89
                 a!90
                 a!91
                 a!92
                 a!93
                 a!94))
      (a!125 (and (or a!98
                      a!99
                      a!100
                      a!101
                      a!102
                      a!103
                      a!104
                      a!105
                      a!106
                      a!107
                      a!108
                      a!109
                      a!110)
                  (__f1 (__f5 (select initial_1_trace 4)))
                  a!111
                  a!112
                  a!113
                  a!114
                  a!115
                  a!116
                  a!117
                  a!118
                  a!119
                  a!120
                  a!121
                  a!122
                  a!123
                  a!124))
      (a!154 (and (or a!128
                      a!129
                      a!130
                      a!131
                      a!132
                      a!133
                      a!134
                      a!135
                      a!136
                      a!137
                      a!138
                      a!139)
                  (__f1 (__f5 (select initial_1_trace 5)))
                  a!140
                  a!141
                  a!142
                  a!143
                  a!144
                  a!145
                  a!146
                  a!147
                  a!148
                  a!149
                  a!150
                  a!151
                  a!152
                  a!153))
      (a!182 (and (or a!157
                      a!158
                      a!159
                      a!160
                      a!161
                      a!162
                      a!163
                      a!164
                      a!165
                      a!166
                      a!167)
                  (__f1 (__f5 (select initial_1_trace 6)))
                  a!168
                  a!169
                  a!170
                  a!171
                  a!172
                  a!173
                  a!174
                  a!175
                  a!176
                  a!177
                  a!178
                  a!179
                  a!180
                  a!181))
      (a!209 (and (or a!185
                      a!186
                      a!187
                      a!188
                      a!189
                      a!190
                      a!191
                      a!192
                      a!193
                      a!194)
                  (__f1 (__f5 (select initial_1_trace 7)))
                  a!195
                  a!196
                  a!197
                  a!198
                  a!199
                  a!200
                  a!201
                  a!202
                  a!203
                  a!204
                  a!205
                  a!206
                  a!207
                  a!208))
      (a!235 (and (or a!212 a!213 a!214 a!215 a!216 a!217 a!218 a!219 a!220)
                  (__f1 (__f5 (select initial_1_trace 8)))
                  a!221
                  a!222
                  a!223
                  a!224
                  a!225
                  a!226
                  a!227
                  a!228
                  a!229
                  a!230
                  a!231
                  a!232
                  a!233
                  a!234)))
  (and (or a!32 a!33)
       (or a!64 a!65)
       (or a!95 a!96)
       (or a!125 a!126)
       (or a!154 a!155)
       (or a!182 a!183)
       (or a!209 a!210)
       (or a!235 a!236))))))
(assert (let ((a!1 (_tuple_0 false false false false false false false false false))
      (a!2 (= (__f1 (__f3 (select initial_1_trace 0))) 0))
      (a!3 (= (__f2 (__f3 (select initial_1_trace 0))) 0))
      (a!4 (= (__f3 (__f3 (select initial_1_trace 0))) 0))
      (a!5 (= (__f4 (__f3 (select initial_1_trace 0))) 0))
      (a!6 (= (__f5 (__f3 (select initial_1_trace 0))) 0))
      (a!7 (= (__f6 (__f3 (select initial_1_trace 0))) 0))
      (a!8 (= (__f7 (__f3 (select initial_1_trace 0))) 0))
      (a!9 (= (__f8 (__f3 (select initial_1_trace 0))) 0))
      (a!10 (= (__f9 (__f3 (select initial_1_trace 0))) 0))
      (a!11 (= (__f10 (__f3 (select initial_1_trace 0))) 0))
      (a!12 (= (__f11 (__f3 (select initial_1_trace 0))) 0))
      (a!13 (= (__f12 (__f3 (select initial_1_trace 0))) 0))
      (a!14 (= (__f13 (__f3 (select initial_1_trace 0))) 0))
      (a!15 (= (__f14 (__f3 (select initial_1_trace 0))) 0))
      (a!16 (= (__f15 (__f3 (select initial_1_trace 0))) 0))
      (a!17 (not (__f1 (__f4 (select initial_1_trace 0)))))
      (a!18 (not (__f2 (__f4 (select initial_1_trace 0)))))
      (a!19 (not (__f3 (__f4 (select initial_1_trace 0)))))
      (a!20 (not (__f4 (__f4 (select initial_1_trace 0)))))
      (a!21 (not (__f5 (__f4 (select initial_1_trace 0)))))
      (a!22 (not (__f6 (__f4 (select initial_1_trace 0)))))
      (a!23 (not (__f7 (__f4 (select initial_1_trace 0)))))
      (a!24 (not (__f8 (__f4 (select initial_1_trace 0)))))
      (a!25 (not (__f9 (__f4 (select initial_1_trace 0)))))
      (a!26 (not (__f10 (__f4 (select initial_1_trace 0)))))
      (a!27 (not (__f11 (__f4 (select initial_1_trace 0)))))
      (a!28 (not (__f1 (__f5 (select initial_1_trace 0)))))
      (a!29 (not (__f2 (__f5 (select initial_1_trace 0)))))
      (a!33 (>= (__f1 (__f2 (select initial_1_trace 1)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!34 (+ 12000000 (__f1 (__f2 (select initial_1_trace 0)))))
      (a!36 (= (__f3 (__f3 (select initial_1_trace 1))) 0))
      (a!38 (>= (__f1 (__f2 (select initial_1_trace 2)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!40 (= (__f3 (__f3 (select initial_1_trace 2))) 0))
      (a!42 (>= (__f1 (__f2 (select initial_1_trace 3)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!44 (= (__f3 (__f3 (select initial_1_trace 3))) 0))
      (a!46 (>= (__f1 (__f2 (select initial_1_trace 4)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!48 (= (__f3 (__f3 (select initial_1_trace 4))) 0))
      (a!50 (>= (__f1 (__f2 (select initial_1_trace 5)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!52 (= (__f3 (__f3 (select initial_1_trace 5))) 0))
      (a!54 (>= (__f1 (__f2 (select initial_1_trace 6)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!56 (= (__f3 (__f3 (select initial_1_trace 6))) 0))
      (a!58 (>= (__f1 (__f2 (select initial_1_trace 7)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!60 (= (__f3 (__f3 (select initial_1_trace 7))) 0))
      (a!62 (>= (__f1 (__f2 (select initial_1_trace 8)))
                (__f1 (__f2 (select initial_1_trace 0)))))
      (a!64 (= (__f3 (__f3 (select initial_1_trace 8))) 0)))
(let ((a!30 (and (= initial_2_start_time 0)
                 (= (__f1 (select initial_1_trace 0)) a!1)
                 (= (__f2 (select initial_1_trace 0)) (_tuple_2 0 0))
                 a!2
                 a!3
                 a!4
                 a!5
                 a!6
                 a!7
                 a!8
                 a!9
                 a!10
                 a!11
                 a!12
                 a!13
                 a!14
                 a!15
                 a!16
                 a!17
                 a!18
                 a!19
                 a!20
                 a!21
                 a!22
                 a!23
                 a!24
                 a!25
                 a!26
                 a!27
                 a!28
                 a!29))
      (a!31 (or (= (__f1 (select initial_1_trace 0)) a!1) a!4))
      (a!32 (not (= (__f1 (select initial_1_trace 1)) a!1)))
      (a!35 (<= (__f1 (__f2 (select initial_1_trace 1))) a!34))
      (a!37 (not (= (__f1 (select initial_1_trace 2)) a!1)))
      (a!39 (<= (__f1 (__f2 (select initial_1_trace 2))) a!34))
      (a!41 (not (= (__f1 (select initial_1_trace 3)) a!1)))
      (a!43 (<= (__f1 (__f2 (select initial_1_trace 3))) a!34))
      (a!45 (not (= (__f1 (select initial_1_trace 4)) a!1)))
      (a!47 (<= (__f1 (__f2 (select initial_1_trace 4))) a!34))
      (a!49 (not (= (__f1 (select initial_1_trace 5)) a!1)))
      (a!51 (<= (__f1 (__f2 (select initial_1_trace 5))) a!34))
      (a!53 (not (= (__f1 (select initial_1_trace 6)) a!1)))
      (a!55 (<= (__f1 (__f2 (select initial_1_trace 6))) a!34))
      (a!57 (not (= (__f1 (select initial_1_trace 7)) a!1)))
      (a!59 (<= (__f1 (__f2 (select initial_1_trace 7))) a!34))
      (a!61 (not (= (__f1 (select initial_1_trace 8)) a!1)))
      (a!63 (<= (__f1 (__f2 (select initial_1_trace 8))) a!34)))
(let ((a!65 (and a!31
                 (or (not (and a!32 a!33 a!35)) a!36)
                 (or (not (and a!37 a!38 a!39)) a!40)
                 (or (not (and a!41 a!42 a!43)) a!44)
                 (or (not (and a!45 a!46 a!47)) a!48)
                 (or (not (and a!49 a!50 a!51)) a!52)
                 (or (not (and a!53 a!54 a!55)) a!56)
                 (or (not (and a!57 a!58 a!59)) a!60)
                 (or (not (and a!61 a!62 a!63)) a!64))))
  (not (or (not a!30) a!65))))))


(check-sat)
(get-info :all-statistics)
