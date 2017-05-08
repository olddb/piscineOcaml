(*\\\\\\\\\\\ TOOL ///////////*)
let is_even n = 
    n mod 2 = 0

let rec isqrt n =
    if n = 1 then 1
    else let n' = isqrt (n - 1) in
    (n' + (n / n')) / 2

let pow base exponent =
    let rec aux accumulator base = function
        | 0 -> accumulator
        | 1 -> base * accumulator
        | e when is_even e -> aux accumulator (base * base)
        (e / 2)
        | e -> aux (base * accumulator) (base * base)
        ((e - 1) / 2) in
    aux 1 base exponent

(*\\\\\\\\\\\ MAPP ///////////*)

(*          N | C | S *)
(*          0 | 1 | 2 *)
type case = int
type cell = int * int * int
type t =
    {
        z:  int;
        map: cell list;
    }

let getWidthByZ z = isqrt (pow 9 z)
let getWidth self = getWidthByZ self.z

let getCase self x y =
    let rec loop l = match l with
        | (v, _x, _y)::_ when _x = x && _y = y -> v
        | _::tl                                -> loop tl
        | []                                   -> invalid_arg "Invalide arg x y"
    in loop self.map

let updateMap self map =
    {
        z   = self.z;
        map = map;
    }
        

let getGame   self _x _y =
    let xs = _x - (_x mod 3) in
    let ys = _y - (_y mod 3) in
    let xe = xs + 3 in
    let ye = ys + 3 in
    let rec loopX x y l =
        if x == xe then [] else
        match l with
            | (v, __x, __y)::tl when __x == x && __y == y -> v :: loopX (x + 1) y tl
            | hd::tl                                      -> loopX x y tl
            | []                                          -> []
    in
    let rec loopY y =
        if y == ye then []
        else loopX xs y self.map @ loopY (y + 1)
    in loopY ys

let this_game_is_win game = match game with
        |[2;_;_; _;2;_ ;_;_;2]  -> 2
        |[_;_;2; _;2;_ ;2;_;_]  -> 2

        |[1;_;_; _;1;_ ;_;_;1]  -> 1
        |[_;_;1; _;1;_ ;1;_;_]  -> 1

        |[2;2;2; _;_;_ ;_;_;_]  -> 2
        |[_;_;_; 2;2;2 ;_;_;_]  -> 2
        |[_;_;_; _;_;_ ;2;2;2]  -> 2
        |[2;_;_; 2;_;_ ;2;_;_]  -> 2
        |[_;2;_; _;2;_ ;_;2;_]  -> 2
        |[_;_;2; _;_;2 ;_;_;2]  -> 2

        |[1;1;1; _;_;_ ;_;_;_]  -> 1
        |[_;_;_; 1;1;1 ;_;_;_]  -> 1
        |[_;_;_; _;_;_ ;1;1;1]  -> 1
        |[1;_;_; 1;_;_ ;1;_;_]  -> 1
        |[_;1;_; _;1;_ ;_;1;_]  -> 1
        |[_;_;1; _;_;1 ;_;_;1]  -> 1

        |_                      -> (0)

let rec mapZtoGame self _x _y z =
    let widthZ = getWidthByZ z in
    let move = widthZ / 3 in
    let xs = _x - (_x mod widthZ) in
    let ys = _y - (_y mod widthZ) in
    if z == 1
    then getGame self _x _y
    else
        [
            this_game_is_win (mapZtoGame self (xs + move * 0) (ys + move * 0) (z - 1));
            this_game_is_win (mapZtoGame self (xs + move * 1) (ys + move * 0) (z - 1));
            this_game_is_win (mapZtoGame self (xs + move * 2) (ys + move * 0) (z - 1));

            this_game_is_win (mapZtoGame self (xs + move * 0) (ys + move * 1) (z - 1));
            this_game_is_win (mapZtoGame self (xs + move * 1) (ys + move * 1) (z - 1));
            this_game_is_win (mapZtoGame self (xs + move * 2) (ys + move * 1) (z - 1));

            this_game_is_win (mapZtoGame self (xs + move * 0) (ys + move * 2) (z - 1));
            this_game_is_win (mapZtoGame self (xs + move * 1) (ys + move * 2) (z - 1));
            this_game_is_win (mapZtoGame self (xs + move * 2) (ys + move * 2) (z - 1))
        ]

let isPlayable self x y = let width = (getWidth self) in 0 <= x && x < width
                                                      && 0 <= y && y < width
                                                      && (this_game_is_win (getGame self x y)) = 0
                                                      && getCase self x y = 0
let isValide   self x y = let width = (getWidth self) in 0 <= x && x < width
                                                      && 0 <= y && y < width
let rec isFulll l = match l with
    | []    -> true
    | 0::tl -> false
    | _::tl -> isFulll tl

let putCase2  self x y c = 
    let width = getWidth self in
    if x >= width || y >= width then invalid_arg "Pti Segv des famille ;)";
    let rec loop l = match l with 
        | (_, _x, _y)::tl when _x = x && _y = y -> (c, x, y) :: (loop tl)
        | hd::tl                                -> hd :: loop tl
        | []                                    -> []
    in updateMap self (loop self.map) 

let makeItWin _self _x _y z p =
    let widthZ = getWidthByZ z in
    let xs = _x - (_x mod widthZ) in
    let xe = xs + widthZ in
    let rec loopX self x =
        if x == xe then self
        else loopX (putCase2 self x _y p) (x + 1)
    in
        loopX _self xs

let captureFull self _x _y =
    let player = getCase self _x _y in
    let rec loop _self _z =
        let map = mapZtoGame _self _x _y _z
        in
            if (isFulll map) && ((this_game_is_win map) = 0)
                then begin loop (makeItWin _self _x _y _z player) _z end
                else begin 
                    if _z < _self.z then loop _self (_z + 1) else _self
                end
    in loop self 1

let genCoord self =
    let rec loop l = match l with
        | (0, x, y)::_  -> x :: y :: []
        | hd::tl        -> loop tl
        | []            -> invalid_arg "SUPER GAME OVER"
    in loop self.map

let putCase   self x y c =
    captureFull (putCase2 self x y c) x y

let rec isCaseWin self _x _y z v =
    (this_game_is_win (mapZtoGame self _x _y z)) = v

let isCrossWinZ self x y z = isCaseWin self x y z 1
let isCirclWinZ self x y z = isCaseWin self x y z 2

let isCrossWin self x y = isCrossWinZ self x y self.z
let isCirclWin self x y = isCirclWinZ self x y self.z

let genMap z = 
    let width = getWidthByZ z in
    let rec loopX x y = match x with
        | _y when _y = width    -> []
        | _                     -> (0, x, y) :: (loopX (x + 1) y)
    in
    let rec loopY y = match y with
        | _y when _y = width    -> []
        | _                     -> (loopX 0 y) @ loopY (y + 1)
    in loopY 0
       

let newMapp config =
    let _z = Config.get_depth config in
    {
        z      = _z;
        map    = genMap _z;
    }

