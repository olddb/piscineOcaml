(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/12 16:26:29 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/12 16:30:06 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () = 
    let n = new People.people "Vince" in
    print_endline n#to_string;
    n#talk;
    n#die;