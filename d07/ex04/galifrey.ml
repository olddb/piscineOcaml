(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   galifrey.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/12 22:00:40 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/13 00:26:35 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class galifrey =
    object (self)

        val dalek_lst = [(new Dalek.dalek);(new Dalek.dalek);(new Dalek.dalek);(new Dalek.dalek);(new Dalek.dalek);(new Dalek.dalek)]
        val people_lst = [(new People.people "Louise");(new People.people "Vince");(new People.people "Eric");(new People.people "La victime");(new People.people "Le limier");(new People.people "Cersei")]
        val doctor_lst = [(new Doctor.doctor "gwrergege" (new People.people "Louise"));(new Doctor.doctor "Salut"(new People.people "Vince"))]

        method dalek_attack d =
            let rec blabla d = match d with
                | []    -> print_endline "\027[31mAll the Dalek has attack\027[37m"
                | h::t  -> h#talk; blabla t
            in
            blabla d

        method people_die_all d =
            let rec qwer d = match d with
                | []    -> print_endline "\027[31mAll the humans was gone, the time Lords has failed\027[37m"
                | h::t  -> h#die; qwer t
            in
            qwer d

        method doc_run d =
            let rec qwer d = match d with
                | []    -> print_endline "\027[31mDoctor run away and find the origin of Daleks\027[37m"
                | h::t  -> h#travel_in_time 2345 (-10345); qwer t
            in
            qwer d

        method doc_fix d =
            let rec qwer d = match d with
                | []    -> print_endline "\027[31mHere we go, Time lords save the wolrd again !\027[37m"
                | h::t  -> h#use_sonic_screwdriver; qwer t
            in
            qwer d

        method do_time_war = 
            self#dalek_attack dalek_lst;
            self#people_die_all people_lst;
            self#doc_run doctor_lst;
            self#doc_fix doctor_lst;


    end
