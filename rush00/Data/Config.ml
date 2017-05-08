let is_int s =
    try ignore (int_of_string s); true
    with _ -> false

type t = {
    argc    : int;
    argv    : string list;
    depth   : int;
    ai_on   : bool;
    no_img  : bool;
    pl1     : string;
    pl2     : string;
    show    : bool;
}

let rec parse_no_img argv = match argv with
    |[]         -> false
    |h::t       -> begin
        if (String.compare h "--no-img") = 0 then true
        else parse_no_img t;
    end

let rec is_ai argv = match argv with
    |[]         -> false
    |h::t       -> begin
        if (String.compare h "--ai") = 0 then true
        else is_ai t;
    end

let rec get_player_two argv  = match argv with
    |[]         -> "X"
    |h::t       -> begin
        let extract_blaz t = match t with
        |[]         -> "X"
        |h::t       ->  h in
        if (String.compare h "--name2") = 0 then extract_blaz t
        else get_player_two t;
    end

let rec get_player_one argv = match argv with
    |[]         -> "O"
    |h::t       -> begin
        let extract_blaz t = match t with
        |[]         -> "0"
        |h::t       ->  h in
        if (String.compare h "--name1") = 0 then extract_blaz t
        else get_player_one t;
    end

let rec parse_depth argv = match argv with
    |[]         -> 2
    |h::t       -> begin
        let extract_depth t = match t with
        |[]         -> 2
        |h::t       -> begin 
            if is_int h
            then
                let res = int_of_string h in
                (
                    if 0 < res && res < 4
                        then res
                        else invalid_arg "Depth must be between 1 and 3"
                )
                else 2
        end
        in
        if (String.compare h "--depth") = 0 then extract_depth t
        else parse_depth t;
    end

let rec is_ai argv = match argv with
    |[]         -> false
    |h::t       -> begin
        if (String.compare h "--ai") = 0 then true
        else is_ai t;
    end


let get_blaz n self =
    if n = 1 then self.pl1
    else self.pl2

let get_show self =
    self.show

let get_ai self =
    self.ai_on

let get_no_img self = 
    self.no_img

let get_depth self =
    self.depth

let rec create_show _argv = match _argv with
    |[]         -> false
    |h::t       -> begin
        if (String.compare h "--show") = 0 then true
        else create_show t;
    end

let newConfig _argc _argv =
    let _pl1 = get_player_one _argv in
    let _pl2 = get_player_two _argv in
    if String.length _pl1 = 0 || String.length _pl2 = 0
    then invalid_arg "Invalide name"
    else
    {
        argc    = _argc;
        argv    = _argv;
        depth   = parse_depth _argv;
        ai_on   = is_ai _argv;
        no_img  = parse_no_img _argv;
        pl1     = _pl1;
        pl2     = _pl2;
        show    = create_show _argv;
    }
