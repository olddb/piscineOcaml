

type t

val newConfig   : int               -> string list -> t
val get_ai      : t                 -> bool
val get_no_img  : t                 -> bool
val get_blaz    : int -> t          -> string
val get_depth   : t                 -> int
val get_show    : t                 -> bool
