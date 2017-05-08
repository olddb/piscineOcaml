
let is_int s =
      try ignore (int_of_string s); true
      with _ -> false

let split_on_char sep s =
    let r = ref [] in
    let j = ref (String.length s) in
    for i = String.length s - 1 downto 0 do
        if s.[i] = sep then begin
            r := String.sub s (i + 1) (!j - i - 1) :: !r;
            j := i
        end
    done;
    String.sub s 0 !j :: !r

let get_coord line =
    let a = split_on_char ' ' line in
    let rec int_list a = match a with
    |h::t       -> 
            begin
                if is_int h then [(int_of_string h)]@(int_list t)
                else int_list t
            end
    |_          -> []
    in
    let the_good_list = int_list a in
    if ((List.length ( the_good_list )) <> 2) then begin 
        print_endline "\027[31m[Error] : Bad coordonates, are you slow ?\027[37m";
        []
    end
    else the_good_list

let display a =
    let rec d a = match a with
    |h::t        -> print_int h; print_char '\n' ;d t
    |[]          -> ()
    in 
    d a

let annonce i config = 
    print_string "\027[33m It's ";
    if (String.compare(Config.get_blaz 2 config)(Config.get_blaz 1 config)) = 0
        then begin
            let x = "n°2" in
            if (i > 0) then begin print_endline((Config.get_blaz 1 config)^" turn :\027[37m"); end
            else begin print_endline((Config.get_blaz 2 config)^x^" turn :\027[37m"); end
        end
    else begin 
        if (i > 0) then begin print_endline((Config.get_blaz 1 config)^" turn :\027[37m"); end
        else begin print_endline((Config.get_blaz 2 config)^" turn :\027[37m"); end
    end

let apply_choice mapp coord i =
    let hd = List.hd coord in
    let tl = List.nth coord ((List.length coord) - 1) in
    if Mapp.isPlayable mapp hd tl then
       if i > 0 then Mapp.putCase mapp hd tl 1 (* Cross *)
                else Mapp.putCase mapp hd tl 2 (* Case  *)
    else begin
        print_endline "\027[31m[Error] : Bad coordonates, this case is not valid \027[37m";
        mapp
    end
;;


let rec d m =  match m with
| h::t -> print_char '>'; print_int h; print_endline "<"; d t
|_ -> ()

let isvalideList mapp coord = 
    let index_x = (List.hd coord) in
    let index_y = (List.nth coord ((List.length coord) - 1)) in
    Mapp.isPlayable mapp index_x index_y

let remap n x y =
    let startX  =  x - (x mod 3) in
    let startY  =  y - (y mod 3) in
    let goodX   = (n mod 3) + startX in
    let goodY   = (n / 3)  + startY in
    [goodX; goodY]

let close_to_winADV game =
    let check_diagonale game = match game with
        |[0;_;_; _;2;_ ;_;_;2]  -> 0
        |[_;_;0; _;2;_ ;2;_;_]  -> 2
        |[2;_;_; _;0;_ ;_;_;2]  -> 4
        |[_;_;2; _;0;_ ;2;_;_]  -> 4
        |[_;_;2; _;2;_ ;0;_;_]  -> 6
        |[2;_;_; _;2;_ ;_;_;0]  -> 8
        |_                      -> (-1)
    in
    let check_line game = match game with
        |[0;2;2; _;_;_ ;_;_;_]  -> 0
        |[2;0;2; _;_;_ ;_;_;_]  -> 1
        |[2;2;0; _;_;_ ;_;_;_]  -> 2

        |[_;_;_; 0;2;2 ;_;_;_]  -> 3
        |[_;_;_; 2;0;2 ;_;_;_]  -> 4
        |[_;_;_; 2;2;0 ;_;_;_]  -> 5

        |[_;_;_; _;_;_ ;0;2;2]  -> 6
        |[_;_;_; _;_;_ ;2;0;2]  -> 7
        |[_;_;_; _;_;_ ;2;2;0]  -> 8

        |[0;_;_; 2;_;_ ;2;_;_]  -> 0
        |[_;0;_; _;2;_ ;_;2;_]  -> 1
        |[_;_;0; _;_;2 ;_;_;2]  -> 2

        |[2;_;_; 0;_;_ ;2;_;_]  -> 3
        |[_;2;_; _;0;_ ;_;2;_]  -> 4
        |[_;_;2; _;_;0 ;_;_;2]  -> 5

        |[2;_;_; 2;_;_ ;0;_;_]  -> 6
        |[_;2;_; _;2;_ ;_;0;_]  -> 7
        |[_;_;2; _;_;2 ;_;_;0]  -> 8
        |_                      -> (-1)
    in
    if (check_diagonale game) >= 0 then check_diagonale game
    else if (check_line game) >= 0 then check_line game
    else (-1)

let close_to_win game =
    let check_diagonale game = match game with
        |[0;_;_; _;1;_ ;_;_;1]  -> 0
        |[_;_;0; _;1;_ ;1;_;_]  -> 2
        |[1;_;_; _;0;_ ;_;_;1]  -> 4
        |[_;_;1; _;0;_ ;1;_;_]  -> 4
        |[_;_;1; _;1;_ ;0;_;_]  -> 6
        |[1;_;_; _;1;_ ;_;_;0]  -> 8

        |_                      -> (-1)
    in
    let check_line game = match game with
        |[0;1;1; _;_;_ ;_;_;_]  -> 0
        |[1;0;1; _;_;_ ;_;_;_]  -> 1
        |[1;1;0; _;_;_ ;_;_;_]  -> 2

        |[_;_;_; 0;1;1 ;_;_;_]  -> 3
        |[_;_;_; 1;0;1 ;_;_;_]  -> 4
        |[_;_;_; 1;1;0 ;_;_;_]  -> 5

        |[_;_;_; _;_;_ ;0;1;1]  -> 6
        |[_;_;_; _;_;_ ;1;0;1]  -> 7
        |[_;_;_; _;_;_ ;1;1;0]  -> 8

        |[0;_;_; 1;_;_ ;1;_;_]  -> 0
        |[_;0;_; _;1;_ ;_;1;_]  -> 1
        |[_;_;0; _;_;1 ;_;_;1]  -> 2

        |[1;_;_; 0;_;_ ;1;_;_]  -> 3
        |[_;1;_; _;0;_ ;_;1;_]  -> 4
        |[_;_;1; _;_;0 ;_;_;1]  -> 5

        |[1;_;_; 1;_;_ ;0;_;_]  -> 6
        |[_;1;_; _;1;_ ;_;0;_]  -> 7
        |_                      -> (-1)
    in
    if (check_diagonale game) >= 0 then check_diagonale game
    else if (check_line game) >= 0 then check_line game
    else (-1)



let rec find_valid n game mapp =
    if List.nth game ( n ) = 0 then n
    else if ( n + 1 ) >= 9 then begin 
        let [x;y] = Mapp.genCoord mapp in
        print_endline "qweqwekjqwe qwuhebqweb"; Printf.printf "[%d %d]\n" x y;
        find_valid 0 (Mapp.getGame mapp x y) mapp
    end
    else find_valid ( n + 1 ) game mapp


let rec beat_the_noob coord mapp =
    let [x;y] = coord in
    if (Mapp.this_game_is_win (Mapp.getGame mapp x y) <> 0)
        then beat_the_noob (Mapp.genCoord mapp) mapp
        else begin 
            let index_x = x in
            let index_y = y in
            let best_choice = remap 4 index_x index_y in
            let game = Mapp.getGame mapp index_x index_y in
            if (close_to_win game) >= 0 then begin remap (close_to_win game) index_x index_y end
            else if (close_to_winADV game) >= 0 then begin remap (close_to_winADV game) index_x index_y end
            else if isvalideList mapp best_choice then begin best_choice end
            else begin remap (find_valid 0 game mapp) index_x index_y end
        end
;;

let isWinner mapp lol config = match lol with
    | [x;y] ->
            if Mapp.isValide mapp x y then
                let xWin = Mapp.isCrossWin mapp x y in
                let yWin = Mapp.isCirclWin mapp x y in
                if xWin then
                    (print_endline (Config.get_blaz 1 config ^ " win !"); true)
                else if yWin then
                    (print_endline (Config.get_blaz 2 config ^ " win !"); true)
                else false
            else false
    | _ -> false

let runGame config =
    let gui = Gui.newGui config in
    let mapp = Mapp.newMapp config in
    let rec loop ?(before = [0;0]) continue mapp player = match continue with
    | false -> print_endline "Game is over"
    | true  ->
        begin
            Gui.drawMap gui mapp;
            if isWinner mapp before config then loop false mapp player
            else begin
                print_endline "\027[32m /(¯`·._.·(¯`·._.· Let's get Bored ! ·._.·´¯)·._.·´¯)\\\027[37m";
                if Config.get_ai config && player = (-1) then begin 
                    print_endline "\027[33m My turn ! \027[37m";
                    Unix.sleep 1 ;
                    let coord = beat_the_noob before mapp in
                    let newmapp = apply_choice mapp coord (-1) in
                    loop ~before:coord true newmapp (player * (-1));
                end
                else begin
                    annonce player config;
                    let coord = get_coord(read_line ())  in
                    if (coord = []) || isvalideList mapp coord = false then begin 
                        print_endline "\027[31m[Error]: Bad coordonates, are you slow ?\027[37m";
                        loop ~before:coord true mapp player
                    end
                    else begin
                        let newmapp = apply_choice mapp coord player in
                        loop ~before:coord true newmapp (player * (-1))
                    end
                end
            end; ()
        end;
    in 
    loop true mapp 1

let battle_of_titan config =
    let gui = Gui.newGui config in
    let mapp = Mapp.newMapp config in

    let rec loop ?(before = [0;0]) continue mapp player = match continue with 
    | false -> print_endline "[GAME OVER]"
    | true -> 
        Gui.drawMap gui mapp;
        Unix.sleep 1 ;
        print_endline "Welcome to the BATTLE OF TITANS";
        let coord = beat_the_noob before mapp in
        let newmapp = apply_choice mapp coord player in
        loop ~before:coord true newmapp (player * (-1));
    in
    let coord = [4;4] in
    loop ~before:coord true mapp 1





let runTicTacToe config =
    if Config.get_show config then battle_of_titan config
    else begin
        let rec loop () =
            runGame config;
            print_endline ("You really want to play again ?... (please say no, you could say yes but please, really, say no)");
            let line = read_line () in
            if (String.compare line "yes") = 0 then begin loop () end
        in
        loop ();
        print_endline "We hope you had fun like we do, actually we dont. Like 'at all'."; ()
    end

