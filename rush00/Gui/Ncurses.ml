
let t_up    = "\x1b\x5b\x41"
let t_down  = "\x1b\x5b\x42"
let t_right = "\x1b\x5b\x43"
let t_left  = "\x1b\x5b\x44"
let t_home  = "\x1b\x5b\x48"
let t_clear = "\x1b\x5b\x32\x4a"

let c_no     = "\x1b\x5b0;m"
let c_white  = "\x1b\x5b0;31m"
let c_green  = "\x1b\x5b0;32m"
let c_orange  = "\x1b\x5b0;33m"
let c_cyan   = "\x1b\x5b0;36m"
let c_white  = "\x1b\x5b0;37m"

let getJumpX x =
             if x mod 27 == 0 then (t_right ^ t_right)
        else if x mod  9 == 0 then t_right
        else ""

let getJumpXX x =
            t_right

let getJumpY y = 
    if y mod 27 == 0      then "\n\n\n"
    else if y mod  9 == 0 then "\n\n"
    else if y mod  3 == 0 then "\n"
    else ""

let getSpriteRow ?(color=c_white) src y =
    let fd = open_in ("Assets/" ^ src) in
    let rec loop y = match y with
        | 0 -> let res = input_line fd in close_in fd ; print_string color ; res
        | _ -> input_line fd ; loop (y - 1)
    in loop (y) 

let rec print_sequence l = match l with
    | (s, 0)::tl -> print_sequence tl
    | (s, c)::tl -> print_string s ; print_sequence ((s, c - 1)::tl)
    | []         -> ()

let displaySprite src =
    let fd = open_in ("Assets/" ^ src) in

    let rec loop () = 
        let res = input_line fd in
        if String.length res <= 0 then (ignore ( close_in fd ) ; 0)
                                  else (
                                      print_sequence [(res, 1);(t_left,
                                      String.length res); (t_down, 1)];
                                      1 + loop ()
                                      )
    in print_sequence [(t_up, loop ())]


let get_image gui_conf mapp x y = 
    let v = Mapp.getCase mapp x y in
    let c = if v == 0 then "." else if v == 1
                then c_cyan  ^ (Gconf.getX gui_conf)
                else c_green ^ (Gconf.getO gui_conf)
    in
    let jX = if x > 0 && x mod 3 = 0 then getJumpX x else "" in
    let res = (1, jX ^ c ^ (getJumpXX x))
    in
    let bigPicture =
        if (x mod 9 == 0 && y mod 9 == 0)
        then begin
            if Mapp.getWidth mapp > 4 then (
                (if x > 0 then print_string t_right);
                print_string c_orange ;
                displaySprite "grid_9_9" ;
                print_string c_no;
                (if x > 0 then print_string t_left);
            )
        end else begin end;
        if (x mod 3 == 0)
            then match x with
                | _ when x mod 9 == 0 && Mapp.isCrossWinZ mapp x y 2 ->
                (Mapp.getWidthByZ 2, (jX ^ getSpriteRow ~color:c_cyan "x_9_9" (y mod 9)) ^ (getJumpXX x))
                | _ when x mod 9 == 0 && Mapp.isCirclWinZ mapp x y 2 ->
                (Mapp.getWidthByZ 2, (jX ^ getSpriteRow ~color:c_green "y_9_9" (y mod 9)) ^ (getJumpXX x))
                | _ when Mapp.isCrossWinZ mapp x y 1 ->
                (Mapp.getWidthByZ 1, (jX ^ getSpriteRow ~color:c_cyan "x_3_3" (y mod 3)) ^ (getJumpXX x))
                | _ when Mapp.isCirclWinZ mapp x y 1 ->
                (Mapp.getWidthByZ 1, (jX ^ getSpriteRow ~color:c_green "y_3_3" (y mod 3)) ^ (getJumpXX x))
                | _ -> res
            else res
    in bigPicture 
;;

let drawMap gui_conf mapp =
    print_string (t_home ^ t_clear) ; print_string c_orange ; 
    print_string (Config.get_blaz 1 (Gconf.getConfig gui_conf));
    print_string " VS ";
    print_endline (Config.get_blaz 2 (Gconf.getConfig gui_conf));
    let width = Mapp.getWidth mapp in
    let rec loopX x y = match x with
        | _x when _x = width    ->
                print_endline ""
        | _                     ->
                let (move, s) = get_image gui_conf mapp x y in
                print_string s;print_string c_no; 
                loopX (x + move) y
    in
    let rec loopY y = match y with
        | _y when _y = width    -> print_endline "OK"
        | _                     ->
                if y > 0 && y mod 3 == 0 then 
                    print_string (getJumpY y);
                (loopX 0 y) ; loopY (y + 1)
    in loopY 0
