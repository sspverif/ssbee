(define-fun invariant
    ((state-left  <GameState_KX_<$<!n!>$>>)
     (state-right <GameState_H1_<$<!n!>$>>))
  Bool
  (= (<game-KX-<$<!n!>$>-pkgstate-Game> state-left)    
     (<game-H1-<$<!n!>$>-pkgstate-Game> state-right)))
