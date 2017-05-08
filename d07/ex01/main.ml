(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/12 16:26:29 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/12 18:02:24 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let _ = 
    let rose = new People.people "Rose" in
    let n = new Doctor.doctor "David" rose in
    print_endline n#to_string;
    n#talk;
    n#use_sonic_screwdriver;
    (*n#regenerate;*)
    n#travel_in_time 5046 1987
