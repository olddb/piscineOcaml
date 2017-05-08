
(*
let rec dis l = match l with
    |hd::tl -> print_endline hd; dis tl
    |_      -> print_endline "list is over"; []
    if (String.compare(Config.get_blaz 1 config)(Config.get_blaz 9 config)) = 0 then print_endline "GOOD NAME";
*)


let main argc argv = 
    let config = Config.newConfig argc argv in
    Core.runTicTacToe config

let _ =
    let argv = Array.to_list Sys.argv in
    main (List.length argv) argv
