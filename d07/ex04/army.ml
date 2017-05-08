(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   army.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/12 19:12:41 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/12 21:52:26 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class ['a] army (lst:'a list) =
    object
        val mutable lst = lst

        method add a = lst <- a :: lst
        method delete = match lst with
            | [] -> 
                    lst <- []; print_endline "This army has been destroy"
            | head::tail -> 
                    lst <- tail
    end
