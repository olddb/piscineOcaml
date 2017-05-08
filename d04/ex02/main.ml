(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/07 23:03:43 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/07 23:03:44 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
    List.iter print_endline (List.map Card.toStringVerbose Card.allSpades);
    List.iter print_endline (List.map Card.toString Card.allHearts);
    List.iter print_endline (List.map Card.toString
    Card.allDiamonds);
    List.iter print_endline (List.map Card.toString
    Card.allClubs);
    print_endline "";
    List.iter print_endline (List.map Card.toString
    Card.all);
    print_endline "";
    print_endline (Card.toString (Card.best
    Card.all))
