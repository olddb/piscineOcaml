(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_string.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/04 10:50:09 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/04 17:27:46 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec repeat_string ?(str = "x") n =
    if n < 0 then "Error"
    else if n = 0 then ""
    else str ^ (repeat_string ~str (n -1))
;;

print_endline (repeat_string (-1));
print_endline (repeat_string ~str:"what" 42);
print_endline (repeat_string 42);
print_endline (repeat_string 0);
