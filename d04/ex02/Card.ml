(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Card.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: vpailhe <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/10/07 23:03:36 by vpailhe           #+#    #+#             *)
(*   Updated: 2016/10/08 12:24:58 by vpailhe          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Color = 
 struct 
    type t = Spade | Heart | Diamond | Club

    let all = Spade :: Heart :: Diamond :: Club :: []

    let toString = function
        | Spade -> "S"
        | Heart -> "H"
        | Diamond -> "D"
        | Club -> "C"

    let toStringVerbose = function
        | Spade -> "Spade"
        | Heart -> "Heart"
        | Diamond -> "Diamond"
        | Club -> "Club"
 end 

module Value =
 struct
    type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As

    let all = [T2 ; T3 ; T4 ; T5 ; T6 ; T7 ; T8 ; T9 ; T10 ; Jack ; Queen ; King ; As]

    let toInt c = match c with
        | T2 -> 1
        | T3 -> 2
        | T4 -> 3
        | T5 -> 4
        | T6 -> 5
        | T7 -> 6
        | T8 -> 7
        | T9 -> 8
        | T10 -> 9
        | Jack -> 10
        | Queen -> 11
        | King -> 12
        | As -> 13
    ;;

    let toString c = match c with
        | T2 -> "2"
        | T3 -> "3"
        | T4 -> "4"
        | T5 -> "5"
        | T6 -> "6"
        | T7 -> "7"
        | T8 -> "8"
        | T9 -> "9"
        | T10 -> "10"
        | Jack -> "J"
        | Queen -> "Q"
        | King -> "K"
        | As -> "A"
    ;;

    let toStringVerbose c = match c with
        | T2 -> "2"
        | T3 -> "3"
        | T4 -> "4"
        | T5 -> "5"
        | T6 -> "6"
        | T7 -> "7"
        | T8 -> "8"
        | T9 -> "9"
        | T10 -> "10"
        | Jack -> "Jack"
        | Queen -> "Queen"
        | King -> "King"
        | As -> "As"
    ;;

    let next c = match c with
        | T2 -> T3
        | T3 -> T4
        | T4 -> T5
        | T5 -> T6
        | T6 -> T7
        | T7 -> T8
        | T8 -> T9
        | T9 -> T10
        | T10 -> Jack
        | Jack -> Queen
        | Queen -> King
        | King -> As
        | As -> invalid_arg "Couldn't find given elem in array"
    ;;

    let previous c = match c with
        | T2 -> invalid_arg "Couldn't find given elem in array"
        | T3 -> T2
        | T4 -> T3
        | T5 -> T4
        | T6 -> T5
        | T7 -> T6
        | T8 -> T7
        | T9 -> T8
        | T10 -> T9
        | Jack -> T10
        | Queen -> Jack
        | King -> Queen
        | As -> King
    ;;
 end
;;

type t = Value.t * Color.t;;

let newCard v c = (v, c)

let allSpades   = List.map (fun x -> newCard x Color.Spade  ) Value.all;;
let allHearts   = List.map (fun x -> newCard x Color.Heart  ) Value.all;;
let allDiamonds = List.map (fun x -> newCard x Color.Diamond) Value.all;;
let allClubs    = List.map (fun x -> newCard x Color.Club   ) Value.all;;
let all         = allSpades @ allHearts @ allDiamonds @ allClubs;;

let getValue (v, _) = v
let getColor (_, c) = c
let toString (v, c) = "Card(" ^ (Value.toString v) ^ ", " ^ (Color.toString c) ^ ")"
let toStringVerbose (v, c) = "Card(" ^ (Value.toStringVerbose v) ^ ", " ^ (Color.toStringVerbose c) ^ ")"


let compare  (v1, _) (v2, _) = (Value.toInt v2) - (Value.toInt v1)
let max      c1 c2  = if compare c1 c2 <= 0 then c1 else c2
let min      c1 c2  = if compare c1 c2 >= 0 then c1 else c2
let rec best l = match l with
    | hd::[]  -> hd
    | hd::tl -> max hd (best tl)
    | []     -> invalid_arg "Empty list"


let isOf (_, c) c_test = c == c_test
let isSpade   c = isOf c Color.Spade
let isHeart   c = isOf c Color.Heart
let isDiamond c = isOf c Color.Diamond
let isClub    c = isOf c Color.Club


