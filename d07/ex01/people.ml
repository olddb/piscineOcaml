(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   people.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/12 16:32:38 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/12 18:03:25 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class people _name =
    object 
        initializer print_endline "The object people has been created"
        val name:string = _name
        val hp:int   = 100

        method to_string = "My name is " ^ name ^ ", my hp are " ^ (string_of_int hp)
        method talk = print_endline @@ "I'm " ^ name ^ "! Do you know the Doctor ?"
        method die = print_endline "Aaaarghh!"
    end
