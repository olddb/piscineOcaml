
#load "unix.cma";;

let with_cbreak f x =
    let term_init = Unix.tcgetattr Unix.stdin in
    let term_cbreak = { term_init with Unix.c_icanon = false } in
    Unix.tcsetattr Unix.stdin Unix.TCSANOW term_cbreak;
    try
        let result = f x in
        Unix.tcsetattr Unix.stdin Unix.TCSADRAIN term_init;
        result
                              with e ->
                                  Unix.tcsetattr Unix.stdin Unix.TCSADRAIN
                                  term_init;
                                  raise e
;;
let rec loop a = 
    try
        let char = with_cbreak input_char stdin in
        Printf.printf "input was %c" char;
        (* input was waiting and it was char *)
        ()
    with Sys_blocked_io ->
        print_endline "--" ; loop a
;;

let _ = 
    Unix.set_nonblock Unix.stdin; print_endline "asda"; loop "a"
