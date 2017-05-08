(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   doctor.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/12 16:38:40 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/12 18:03:16 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class doctor _name _sidekick =
    object 
        initializer print_endline @@ "The object Doctor has been created"

        val name:string = _name
        val age:int = 0
        val sidekick:People.people = _sidekick
        val mutable hp:int = 100

        method private regenerate = hp <- 100
        method to_string = "My name is " ^ name ^ ", my hp are " ^ (string_of_int hp)
        method talk = print_endline "Hi! I'm the Doctor!"
        method use_sonic_screwdriver = print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"
        method travel_in_time (start:int) (arrival:int) = print_endline  @@ "From " ^ (string_of_int start) ^ " to " ^ (string_of_int arrival) ^ "\n" ^
"\027[34m        _____ _(_@_)_______
        | POLICE      BOX |
        |_________________|
         | _____ | _____ |
         | |###| | |###| |
         | |###| | |###| | 
         | _____ | _____ |
         | || || | || || |
         | ||_|| | ||_|| |
         | _____ |$_____ |
         | || || | || || |
         | ||_|| | ||_|| |
         | _____ | _____ |
         | || || | || || | 
         | ||_|| | ||_|| | 
         |       |       | 
         *****************\027[37m"
    end
