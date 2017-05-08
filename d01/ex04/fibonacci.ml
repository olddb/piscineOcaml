(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   fibonacci.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/04 11:58:30 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/04 14:12:10 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let fibonacci n =
    let rec fib x x_1 x_2 =
        if x < 0 then -1
        else if x = 0 then x_1
        else fib (x - 1) x_2 (x_1 + x_2)
    in
    fib n 0 1

let () =
    print_int (fibonacci (-42));
    print_char '\n';
    print_int (fibonacci 7);
    print_char '\n';
    print_int (fibonacci 0);
    print_char '\n';
    print_int (fibonacci 42);
    print_char '\n';
