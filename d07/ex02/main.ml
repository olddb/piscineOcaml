(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/12 16:26:29 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/12 19:11:29 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let _ = 
    let rose = new People.people "Rose" in
    let n = new Doctor.doctor "David" rose in
    let d = new Dalek.dalek in
    d#exterminate rose;
    n#use_sonic_screwdriver;
    d#die
