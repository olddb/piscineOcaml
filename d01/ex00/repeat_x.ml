(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_x.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/04 10:00:29 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/04 10:49:25 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec repeat_x n =
    if n < 0 then "Error"
    else if n = 0 then ""
    else "x" ^ (repeat_x (n -1))
;;

print_endline (repeat_x (-1));
print_endline (repeat_x 42);
print_endline (repeat_x 0);
