(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   iter.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/04 14:49:21 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/04 15:23:23 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec iter f x n =
    if n = 0 then x
    else if n < 0 then -1
    else iter f (f x) (n - 1)

let () =
    let f x = x * x in
    print_int (iter f 2 4);
    print_char '\n';
    let f x = x * 2 in
    print_int (iter f 2 4);
    print_char '\n';
