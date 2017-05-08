(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/07 23:03:25 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/07 23:03:27 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec print_games l = match l with
| hd::tl   ->  print_string (Value.toString hd); print_string ": ";
               print_endline (Value.toStringVerbose hd); print_games tl
| _ -> ()
in
print_games Value.all
;;

print_string "Next of " ; print_string (Value.toStringVerbose Value.T2) ; print_string " is "; print_string (Value.toStringVerbose (Value.next Value.T2)); print_char '\n';
print_string "Next of " ; print_string (Value.toStringVerbose Value.King) ; print_string " is "; print_string (Value.toStringVerbose (Value.next Value.King)); print_char '\n';
print_string "Previous of " ; print_string (Value.toStringVerbose Value.Jack) ; print_string " is "; print_string (Value.toStringVerbose (Value.previous Value.Jack)); print_char '\n';
print_string "Previous of " ; print_string (Value.toStringVerbose Value.T2) ; print_string " is "; print_string (Value.toStringVerbose (Value.previous Value.T2)); print_char '\n'
