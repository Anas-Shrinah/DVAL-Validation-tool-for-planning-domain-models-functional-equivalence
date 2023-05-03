;Freecell with random invalid macro ## Add invalid macro ## Yes ## The invalid macro operator ``move-move-b-sendtofree'' is added to this domain. This invalid macro is produced from a valid macro by swapping the add effect (cellspace ?x5) from the original valid macro by the precondition (canstack ?x3 ?x2) from the same valid macro.
 
(define (domain freecell)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    card
    num
    suit
  )
 
  (:predicates
    (on_M ?c1 - card ?c2 - card )
    (incell_M ?c - card )
    (clear_M ?c - card )
    (cellspace_M ?n - num )
    (colspace_M ?n - num )
    (home_M ?c - card )
    (bottomcol_M ?c - card )
    (canstack_M ?c1 - card ?c2 - card )
    (suit_M ?c - card ?s - suit )
    (value_M ?c - card ?v - num )
    (successor_M ?n1 - num ?n0 - num )
  )
 
  (:action move_M
    :parameters (?card - card ?oldcard - card ?newcard - card )
    :precondition (and (clear_M ?card ) (clear_M ?newcard ) (canstack_M ?card ?newcard ) (on_M ?card ?oldcard ) )
    :effect (and (on_M ?card ?newcard ) (clear_M ?oldcard ) (not (on_M ?card ?oldcard )) (not (clear_M ?newcard )) 
 )
  )
  (:action move-b_M
    :parameters (?card - card ?newcard - card ?cols - num ?ncols - num )
    :precondition (and (clear_M ?card ) (bottomcol_M ?card ) (clear_M ?newcard ) (canstack_M ?card ?newcard ) (colspace_M ?cols ) (successor_M ?ncols ?cols ) )
    :effect (and (on_M ?card ?newcard ) (colspace_M ?ncols ) (not (bottomcol_M ?card )) (not (clear_M ?newcard )) (not (colspace_M ?cols )) 
 )
  )
  (:action sendtofree_M
    :parameters (?card - card ?oldcard - card ?cells - num ?ncells - num )
    :precondition (and (clear_M ?card ) (on_M ?card ?oldcard ) (cellspace_M ?cells ) (successor_M ?cells ?ncells ) )
    :effect (and (incell_M ?card ) (clear_M ?oldcard ) (cellspace_M ?ncells ) (not (on_M ?card ?oldcard )) (not (clear_M ?card )) (not (cellspace_M ?cells )) 
 )
  )
  (:action sendtofree-b_M
    :parameters (?card - card ?cells - num ?ncells - num ?cols - num ?ncols - num )
    :precondition (and (clear_M ?card ) (bottomcol_M ?card ) (cellspace_M ?cells ) (successor_M ?cells ?ncells ) (colspace_M ?cols ) (successor_M ?ncols ?cols ) )
    :effect (and (incell_M ?card ) (colspace_M ?ncols ) (cellspace_M ?ncells ) (not (bottomcol_M ?card )) (not (clear_M ?card )) (not (colspace_M ?cols )) (not (cellspace_M ?cells )) 
 )
  )
  (:action sendtonewcol_M
    :parameters (?card - card ?oldcard - card ?cols - num ?ncols - num )
    :precondition (and (clear_M ?card ) (colspace_M ?cols ) (successor_M ?cols ?ncols ) (on_M ?card ?oldcard ) )
    :effect (and (bottomcol_M ?card ) (clear_M ?oldcard ) (colspace_M ?ncols ) (not (on_M ?card ?oldcard )) (not (colspace_M ?cols )) 
 )
  )
  (:action sendtohome_M
    :parameters (?card - card ?oldcard - card ?suit - suit ?vcard - num ?homecard - card ?vhomecard - num )
    :precondition (and (clear_M ?card ) (on_M ?card ?oldcard ) (home_M ?homecard ) (suit_M ?card ?suit ) (suit_M ?homecard ?suit ) (value_M ?card ?vcard ) (value_M ?homecard ?vhomecard ) (successor_M ?vcard ?vhomecard ) )
    :effect (and (home_M ?card ) (clear_M ?oldcard ) (not (on_M ?card ?oldcard )) (not (home_M ?homecard )) (not (clear_M ?card )) 
 )
  )
  (:action sendtohome-b_M
    :parameters (?card - card ?suit - suit ?vcard - num ?homecard - card ?vhomecard - num ?cols - num ?ncols - num )
    :precondition (and (clear_M ?card ) (bottomcol_M ?card ) (home_M ?homecard ) (suit_M ?card ?suit ) (suit_M ?homecard ?suit ) (value_M ?card ?vcard ) (value_M ?homecard ?vhomecard ) (successor_M ?vcard ?vhomecard ) (colspace_M ?cols ) (successor_M ?ncols ?cols ) )
    :effect (and (home_M ?card ) (colspace_M ?ncols ) (not (home_M ?homecard )) (not (clear_M ?card )) (not (bottomcol_M ?card )) (not (colspace_M ?cols )) 
 )
  )
  (:action homefromfreecell_M
    :parameters (?card - card ?suit - suit ?vcard - num ?homecard - card ?vhomecard - num ?cells - num ?ncells - num )
    :precondition (and (incell_M ?card ) (home_M ?homecard ) (suit_M ?card ?suit ) (suit_M ?homecard ?suit ) (value_M ?card ?vcard ) (value_M ?homecard ?vhomecard ) (successor_M ?vcard ?vhomecard ) (cellspace_M ?cells ) (successor_M ?ncells ?cells ) )
    :effect (and (home_M ?card ) (cellspace_M ?ncells ) (not (incell_M ?card )) (not (cellspace_M ?cells )) (not (home_M ?homecard )) 
 )
  )
  (:action colfromfreecell_M
    :parameters (?card - card ?newcard - card ?cells - num ?ncells - num )
    :precondition (and (incell_M ?card ) (clear_M ?newcard ) (canstack_M ?card ?newcard ) (cellspace_M ?cells ) (successor_M ?ncells ?cells ) )
    :effect (and (cellspace_M ?ncells ) (clear_M ?card ) (on_M ?card ?newcard ) (not (incell_M ?card )) (not (cellspace_M ?cells )) (not (clear_M ?newcard )) 
 )
  )
  (:action newcolfromfreecell_M
    :parameters (?card - card ?cols - num ?ncols - num ?cells - num ?ncells - num )
    :precondition (and (incell_M ?card ) (colspace_M ?cols ) (cellspace_M ?cells ) (successor_M ?cols ?ncols ) (successor_M ?ncells ?cells ) )
    :effect (and (bottomcol_M ?card ) (clear_M ?card ) (colspace_M ?ncols ) (cellspace_M ?ncells ) (not (incell_M ?card )) (not (colspace_M ?cols )) (not (cellspace_M ?cells )) 
 )
  )
  (:action move-move-b-sendtofree_M
    :parameters (?x3 - card ?x1 - card ?x2 - card ?x4 - num ?x5 - num )
    :precondition (and (clear_M ?x3 ) (clear_M ?x2 )  (cellspace_M ?x5 ) (on_M ?x3 ?x1 ) (bottomcol_M ?x1 ) (canstack_M ?x1 ?x3 ) (colspace_M ?x4 ) (successor_M ?x5 ?x4 ) (on_M ?x1 ?x2 ) (cellspace_M ?x4 ) (successor_M ?x4 ?x5 ) )
    :effect (and (on_M ?x3 ?x2 ) (on_M ?x1 ?x3 ) (canstack_M ?x3 ?x2 ) (colspace_M ?x5 ) (incell_M ?x1 )  (not (on_M ?x3 ?x1 )) (not (bottomcol_M ?x1 )) (not (clear_M ?x3 )) (not (colspace_M ?x4 )) (not (on_M ?x1 ?x2 )) (not (cellspace_M ?x4 )) (not (clear_M ?x1 ) ) 
 )
  )
)
