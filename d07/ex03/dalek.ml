(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   dalek.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/12 18:04:20 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/12 19:11:39 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class dalek =
    object (self)

        val name = Random.self_init ();"Dalek" ^ (String.make 1 (char_of_int((Random.int 15) + 65))) ^ (String.make 1 (char_of_int((Random.int 12) + 97))) ^ (String.make 1 (char_of_int((Random.int 11) + 97)))

        val mutable hp:int = 100
        val mutable shield:bool = true
        method to_string = "My name is " ^ name ^ ", my hp are " ^
        (string_of_int hp) ^ " and my shield is " ^ (string_of_bool shield)

        method get_name = print_endline @@ "my name is " ^ name
        method talk = 
            let ar = [|"Explain! Explain!";"Exterminate! Exterminate!";"I obey!";"You are the Doctor! You are the enemy of the Daleks!"|] in
            let st = Array.get ar (Random.int 3) in
            print_endline st
        method exterminate (p:People.people) = p#die
        method die = print_endline "Emergency Temporal Shift!"
    end
