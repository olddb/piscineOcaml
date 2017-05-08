(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/12 16:26:29 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/12 22:04:56 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let _ = 
    let human_army      = new Army.army [(new People.people "Garen2")] in
    let dalek_army      = new Army.army [(new Dalek.dalek)] in
    let timeLord_army   = new Army.army [(new Doctor.doctor "David")] in
    human_army#add (new People.people "Garen3");
    human_army#delete;
    human_army#delete;
    human_army#delete;
    dalek_army#add (new Dalek.dalek);
    dalek_army#delete;
    dalek_army#delete;
    dalek_army#delete;
    timeLord_army#add (new Doctor.doctor "Peter Capaldi");
    timeLord_army#delete;
    timeLord_army#delete;
    timeLord_army#delete;
