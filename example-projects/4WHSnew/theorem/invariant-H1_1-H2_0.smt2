(define-fun invariant
    ((state-left  <GameState_H1_<$<!n!>$>>)
     (state-right <GameState_H2_<$<!n!>$>>))
  Bool
  (let ((pkg-state-Game-left (<game-H1-<$<!n!>$>-pkgstate-Game> state-left))
        (pkg-state-Game-right (<game-H2-<$<!n!>$>-pkgstate-Game> state-right))
        (pkg-state-Nonces-left (<game-H1-<$<!n!>$>-pkgstate-Nonces> state-left))
        (pkg-state-Nonces-right (<game-H2-<$<!n!>$>-pkgstate-Nonces> state-right)))
    (and (= pkg-state-Game-left pkg-state-Game-right)
         (= pkg-state-Nonces-left pkg-state-Nonces-right))))
