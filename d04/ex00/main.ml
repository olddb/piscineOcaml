(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/07 23:03:02 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/07 23:03:03 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec print_games l = match l with
| hd::tl   ->  print_string (Color.toString hd); print_string ": ";
               print_endline (Color.toStringVerbose hd); print_games tl
| _ -> ()
in
print_games Color.all
