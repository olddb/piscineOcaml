(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_sum.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/04 16:01:34 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/04 17:32:17 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec sum ?(acc = 0.0) f i k =
    if i > k then 0.0
    else if i == k then ((f i) +. acc)
    else sum ~acc:(acc +. (f i)) f (i + 1) k 

let () =
    let f i = float_of_int (i * i) in
    print_string (string_of_float (sum f 1 10));
