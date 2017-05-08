
type t = {
    config: Config.t;
    x:      string;
    o:      string;
}

let get_no_img self =
    Config.get_no_img self.config

let get_conf self = self.config
let getX self = self.x
let getO self = self.o

let getConfig self = self.config

let newGc _config = 
    {
        config = _config;
        x= String.make 1 (Config.get_blaz 1 _config).[0];
        o= String.make 1 (Config.get_blaz 2 _config).[0];
    }
