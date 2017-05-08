(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/07 23:04:01 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/07 23:04:02 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
    let rec empty_deck deck =
        let (card, deck) = Deck.drawCard deck in
        print_endline (Deck.Card.toString card);
        empty_deck deck
    in
    let deck = Deck.newDeck() in
    List.iter print_endline (Deck.toStringList deck);
    print_endline "";
    List.iter print_endline (Deck.toStringListVerbose deck);
    print_endline "";
    empty_deck deck;
