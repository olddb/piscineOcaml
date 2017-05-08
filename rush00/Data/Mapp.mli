type case = int
type t

val putCase:  t -> int -> int -> case -> t

val genCoord: t -> int list

val isValide:   t -> int -> int -> bool
val isPlayable: t -> int -> int -> bool

val getGame:  t -> int -> int -> case list

val isCrossWinZ: t -> int -> int -> int -> bool
val isCirclWinZ: t -> int -> int -> int -> bool
val isCrossWin: t -> int -> int -> bool
val isCirclWin: t -> int -> int -> bool

val this_game_is_win: case list -> case

val newMapp: Config.t -> t
val getCase: t -> int -> int -> case
val getWidthByZ: int -> int
val getWidth: t -> int
