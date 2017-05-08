

type t =
    {
        gc: Gconf.t;
    }

let newGui _config =
    let _gc = Gconf.newGc _config in 
    {
        gc = _gc;
    }

let drawMap gui_conf map = 
    Ncurses.drawMap gui_conf.gc map
