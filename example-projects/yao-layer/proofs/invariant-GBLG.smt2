(define-fun randomness-mapping-GETAOUT
  ((base-ctr-0 Int)
   (base-ctr-1 Int)
   (id-0  Int)
   (id-1  Int)
   (scr-0 Int)
   (scr-1 Int))
  Bool
  (and
   ;;(= base-ctr-0 scr-0)
   ;;(= base-ctr-1 scr-1)
   (= id-0 id-1)))

(define-fun randomness-mapping-SETBIT
  ((base-ctr-0 Int)
   (base-ctr-1 Int)
   (id-0  Int)
   (id-1  Int)
   (scr-0 Int)
   (scr-1 Int))
  Bool
  false)

(define-fun randomness-mapping-GBLG
  ((base-ctr-0 Int)
   (base-ctr-1 Int)
   (id-0  Int)
   (id-1  Int)
   (scr-0 Int)
   (scr-1 Int))
  Bool
  false)

(define-fun randomness-mapping-GETKEYSIN
  ((base-ctr-0 Int)
   (base-ctr-1 Int)
   (id-0  Int)
   (id-1  Int)
   (scr-0 Int)
   (scr-1 Int))
  Bool
  false)


(define-fun <relation-aborts-Left_inst-Right_inst-GBLG>
    ((State-Left  <GameState_Left_<$<!n!><!m!><!p!>$>>)
     (State-Right <GameState_Right_<$<!n!><!m!><!p!>$>>)
     (Return-Left  <OracleReturn_Left_<$<!n!><!m!><!p!>$>_Gate_<$<!0!><!m!><!n!><!p!>$>_GBLG>)
     (Return-Right <OracleReturn_Right_<$<!n!><!m!><!p!>$>_Simgate_<$<!m!><!n!><!p!>$>_GBLG>)
     (l Int)
     (r Int)
     (op (Array (Tuple2 Bool Bool) (Maybe Bool)))
     (j Int))
  Bool
  (let ((Return-Value-Left (<oracle-return-Left-<$<!n!><!m!><!p!>$>-Gate-<$<!0!><!m!><!n!><!p!>$>-GBLG-return-value-or-abort> Return-Left))
        (Return-Value-Right (<oracle-return-Right-<$<!n!><!m!><!p!>$>-Simgate-<$<!m!><!n!><!p!>$>-GBLG-return-value-or-abort> Return-Right)))
    (let ((Pkg-Left-Keys-Top (<game-Left-<$<!n!><!m!><!p!>$>-pkgstate-keys_top> State-Left))
          (Pkg-Left-Keys-Bottom (<game-Left-<$<!n!><!m!><!p!>$>-pkgstate-keys_bottom> State-Left))
          (Pkg-Right-Keys-Top (<game-Right-<$<!n!><!m!><!p!>$>-pkgstate-keys_top> State-Right))
          (Pkg-Right-Keys-Bottom (<game-Right-<$<!n!><!m!><!p!>$>-pkgstate-keys_bottom> State-Right)))
      (let ((Left-Top-T (<pkg-state-GenericKeys-<$<!n!>$>-T> Pkg-Left-Keys-Top))
            (Left-Top-z (<pkg-state-GenericKeys-<$<!n!>$>-z> Pkg-Left-Keys-Top))
            (Left-Top-flag (<pkg-state-GenericKeys-<$<!n!>$>-flag> Pkg-Left-Keys-Top))
            (Left-Bottom-T (<pkg-state-Keys-<$<!n!>$>-T> Pkg-Left-Keys-Bottom))
            (Left-Bottom-z (<pkg-state-Keys-<$<!n!>$>-z> Pkg-Left-Keys-Bottom))
            (Left-Bottom-flag (<pkg-state-Keys-<$<!n!>$>-flag> Pkg-Left-Keys-Bottom))
            (Right-Top-T (<pkg-state-GenericKeys-<$<!n!>$>-T> Pkg-Right-Keys-Top))
            (Right-Top-z (<pkg-state-GenericKeys-<$<!n!>$>-z> Pkg-Right-Keys-Top))
            (Right-Top-flag (<pkg-state-GenericKeys-<$<!n!>$>-flag> Pkg-Right-Keys-Top))
            (Right-Bottom-T (<pkg-state-Keys-<$<!n!>$>-T> Pkg-Right-Keys-Bottom))
            (Right-Bottom-z (<pkg-state-Keys-<$<!n!>$>-z> Pkg-Right-Keys-Bottom))
            (Right-Bottom-flag (<pkg-state-Keys-<$<!n!>$>-flag> Pkg-Right-Keys-Bottom)))
        (and
         (= (or (is-mk-none (select Left-Top-T r))
                (is-mk-none (select Left-Top-T l))
                (= (select Left-Bottom-flag j) (mk-some true))
                (exists ((left Bool) (right Bool)) (is-mk-none (select op (mk-tuple2 left right)))))
            (is-mk-abort Return-Value-Left))
         (= (or (is-mk-none (select Right-Top-T r))
                (is-mk-none (select Right-Top-T l))
                (not (is-mk-none (select Right-Bottom-z j)))
                (exists ((left Bool) (right Bool)) (is-mk-none (select op (mk-tuple2 left right)))))
            (is-mk-abort Return-Value-Right)))))))



(define-fun aout-key-package
    ((T (Array Int (Maybe (Array Bool (Maybe Bits_n)))))
     (z (Array Int (Maybe Bool)))
     (flag (Array Int (Maybe Bool))))
  Bool
  (forall ((i Int))
          (=> (not (is-mk-none (select T i)))
              (and (not (is-mk-none (select z i)))
                   (= (select flag i) (mk-some true))))))



(define-fun wellformed-T
    ((T (Array Int (Maybe (Array Bool (Maybe Bits_n))))))
  Bool
  (forall ((i Int) (b Bool))
          (=> (not (is-mk-none (select T i)))
              (not (is-mk-none (select (maybe-get (select T i)) b))))))


(define-fun invariant
    ((left-game <GameState_Left_<$<!n!><!m!><!p!>$>>)
     (right-game <GameState_Right_<$<!n!><!m!><!p!>$>>))
  Bool
  (let ((Pkg-Left-Keys-Top (<game-Left-<$<!n!><!m!><!p!>$>-pkgstate-keys_top> left-game))
        (Pkg-Right-Keys-Top  (<game-Right-<$<!n!><!m!><!p!>$>-pkgstate-keys_top> right-game))
        (Pkg-Left-Keys-Bottom  (<game-Left-<$<!n!><!m!><!p!>$>-pkgstate-keys_bottom> left-game))
        (Pkg-Right-Keys-Bottom  (<game-Right-<$<!n!><!m!><!p!>$>-pkgstate-keys_bottom> right-game)))
          (let ((Left-Top-T (<pkg-state-GenericKeys-<$<!n!>$>-T> Pkg-Left-Keys-Top))
            (Left-Top-z (<pkg-state-GenericKeys-<$<!n!>$>-z> Pkg-Left-Keys-Top))
            (Left-Top-flag (<pkg-state-GenericKeys-<$<!n!>$>-flag> Pkg-Left-Keys-Top))
            (Left-Bottom-T (<pkg-state-Keys-<$<!n!>$>-T> Pkg-Left-Keys-Bottom))
            (Left-Bottom-z (<pkg-state-Keys-<$<!n!>$>-z> Pkg-Left-Keys-Bottom))
            (Left-Bottom-flag (<pkg-state-Keys-<$<!n!>$>-flag> Pkg-Left-Keys-Bottom))
            (Right-Top-T (<pkg-state-GenericKeys-<$<!n!>$>-T> Pkg-Right-Keys-Top))
            (Right-Top-z (<pkg-state-GenericKeys-<$<!n!>$>-z> Pkg-Right-Keys-Top))
            (Right-Top-flag (<pkg-state-GenericKeys-<$<!n!>$>-flag> Pkg-Right-Keys-Top))
            (Right-Bottom-T (<pkg-state-Keys-<$<!n!>$>-T> Pkg-Right-Keys-Bottom))
            (Right-Bottom-z (<pkg-state-Keys-<$<!n!>$>-z> Pkg-Right-Keys-Bottom))
            (Right-Bottom-flag (<pkg-state-Keys-<$<!n!>$>-flag> Pkg-Right-Keys-Bottom)))

    (and
     (= Pkg-Left-Keys-Top Pkg-Right-Keys-Top)
     (= Pkg-Left-Keys-Bottom Pkg-Right-Keys-Bottom)

     (wellformed-T Left-Top-T)
     (wellformed-T Right-Top-T)
     (wellformed-T Left-Bottom-T)
     (wellformed-T Right-Bottom-T)

     (aout-key-package Left-Top-T Left-Top-z Left-Top-flag)
     (aout-key-package Left-Bottom-T Left-Bottom-flag Left-Bottom-flag) ; z might not be set but flag is so cheating :-)
     (aout-key-package Right-Top-T Right-Top-z Right-Top-flag)
     (aout-key-package Right-Bottom-T Right-Bottom-z Right-Bottom-flag)

     (forall ((i Int)) (= (is-mk-none (select Right-Bottom-z i)) (not (= (mk-some true) (select Left-Bottom-flag i)))))))))
