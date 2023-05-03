;Floor-tile with random invalid macro ## Add invalid macro ## Yes ## The invalid macro operator ``change-color-paint-up-paint-down'' is added to this domain. This invalid macro is produced from a valid macro by swapping the add effect (robot-has ?x1 ?x3) from the original valid macro by the precondition (available-color ?x3) from the same valid macro.
 
(define (domain floor-tile)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    robot
    tile
    color
  )
 
  (:predicates
    (robot-at_M ?r - robot ?x - tile )
    (up_M ?x - tile ?y - tile )
    (down_M ?x - tile ?y - tile )
    (right_M ?x - tile ?y - tile )
    (left_M ?x - tile ?y - tile )
    (clear_M ?x - tile )
    (painted_M ?x - tile ?c - color )
    (robot-has_M ?r - robot ?c - color )
    (available-color_M ?c - color )
    (free-color_M ?r - robot )
  )
 
  (:action change-color_M
    :parameters (?r - robot ?c - color ?c2 - color )
    :precondition (and (robot-has_M ?r ?c ) (available-color_M ?c2 ) )
    :effect (and (robot-has_M ?r ?c2 ) (not (robot-has_M ?r ?c )) 
 )
  )
  (:action paint-up_M
    :parameters (?r - robot ?y - tile ?x - tile ?c - color )
    :precondition (and (robot-has_M ?r ?c ) (robot-at_M ?r ?x ) (up_M ?y ?x ) (clear_M ?y ) )
    :effect (and (painted_M ?y ?c ) (not (clear_M ?y )) 
 )
  )
  (:action paint-down_M
    :parameters (?r - robot ?y - tile ?x - tile ?c - color )
    :precondition (and (robot-has_M ?r ?c ) (robot-at_M ?r ?x ) (down_M ?y ?x ) (clear_M ?y ) )
    :effect (and (painted_M ?y ?c ) (not (clear_M ?y )) 
 )
  )
  (:action up_M
    :parameters (?r - robot ?x - tile ?y - tile )
    :precondition (and (robot-at_M ?r ?x ) (up_M ?y ?x ) (clear_M ?y ) )
    :effect (and (robot-at_M ?r ?y ) (clear_M ?x ) (not (robot-at_M ?r ?x )) (not (clear_M ?y )) 
 )
  )
  (:action down_M
    :parameters (?r - robot ?x - tile ?y - tile )
    :precondition (and (robot-at_M ?r ?x ) (down_M ?y ?x ) (clear_M ?y ) )
    :effect (and (robot-at_M ?r ?y ) (clear_M ?x ) (not (robot-at_M ?r ?x )) (not (clear_M ?y )) 
 )
  )
  (:action right_M
    :parameters (?r - robot ?x - tile ?y - tile )
    :precondition (and (robot-at_M ?r ?x ) (right_M ?y ?x ) (clear_M ?y ) )
    :effect (and (robot-at_M ?r ?y ) (clear_M ?x ) (not (robot-at_M ?r ?x )) (not (clear_M ?y )) 
 )
  )
  (:action left_M
    :parameters (?r - robot ?x - tile ?y - tile )
    :precondition (and (robot-at_M ?r ?x ) (left_M ?y ?x ) (clear_M ?y ) )
    :effect (and (robot-at_M ?r ?y ) (clear_M ?x ) (not (robot-at_M ?r ?x )) (not (clear_M ?y )) 
 )
  )
  (:action change-color-paint-up-paint-down_M
    :parameters (?x1 - robot ?x2 - color ?x3 - color ?x4 - tile ?x5 - tile )
    :precondition (and (robot-has_M ?x1 ?x2 )(robot-has_M ?x1 ?x3 ) (robot-at_M ?x1 ?x5 ) (up_M ?x4 ?x5 ) (clear_M ?x4 ) (robot-at_M ?x1 ?x4 ) (down_M ?x5 ?x4 ) (clear_M ?x5 ) )
    :effect (and (painted_M ?x4 ?x3 ) (painted_M ?x5 ?x3 ) (available-color_M ?x3 )   (not (robot-has_M ?x1 ?x2 )) (not (clear_M ?x4 )) (not (clear_M ?x5 ) ) 
 )
  )
)
