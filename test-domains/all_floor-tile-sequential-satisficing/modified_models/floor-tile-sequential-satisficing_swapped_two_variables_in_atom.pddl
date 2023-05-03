;Floor-tile with swapped variables ## Swap positions of two variables in an atom ## Yes ## The variable ?x in the parameters of the precondition (right_M ?y ?x ) in the operator ``right'' in the original domain is swapped with the variable ?y from the parameters of the same precondition of the same operator in the original domain.
 
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
    :precondition (and (robot-at_M ?r ?x ) (right_M ?x ?y ) (clear_M ?y ) )
    :effect (and (robot-at_M ?r ?y ) (clear_M ?x ) (not (robot-at_M ?r ?x )) (not (clear_M ?y )) 
 )
  )
  (:action left_M
    :parameters (?r - robot ?x - tile ?y - tile )
    :precondition (and (robot-at_M ?r ?x ) (left_M ?y ?x ) (clear_M ?y ) )
    :effect (and (robot-at_M ?r ?y ) (clear_M ?x ) (not (robot-at_M ?r ?x )) (not (clear_M ?y )) 
 )
  )
)
