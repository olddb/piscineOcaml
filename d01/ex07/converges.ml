(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   converges.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/04 15:23:44 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/04 16:01:11 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec converges f x n =
    if n = 0 then false
    else if n < 0 then false
    else if f x = x then true
    else converges f (f x) (n - 1)

let () =
    let f x = x * x in
    print_string (string_of_bool (converges f 1 4));
    print_char '\n';

    print_string (string_of_bool (converges ( fun x -> x / 2) 2 2));
    print_char '\n';
