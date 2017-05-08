(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   hofstadter_mf.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/04 14:21:01 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/04 14:48:50 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec hfs_f n =
    if n = 0 then 1
    else if n < 0 then -1
    else n - hfs_m(hfs_f (n - 1))
and hfs_m n =
    if n = 0 then 0
    else if n < 0 then -1
    else n - hfs_f(hfs_m (n - 1))
;;

let () = 
    print_int (hfs_m 0);
    print_char '\n';
    print_int (hfs_m (-10));
    print_char '\n';
    print_int (hfs_m 42);
    print_char '\n'
