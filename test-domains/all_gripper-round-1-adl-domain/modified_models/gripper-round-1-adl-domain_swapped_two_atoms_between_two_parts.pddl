;Gripper with swapped atoms ## Swap between add effect and precondition ## Yes ## The atom (at-robby ?to) in the add effects of the operator ``move'' in the original domain is swapped with the atom (at-robby ?from) from the preconditions from the same operator in the original domain.
 
(define (domain gripper)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    room
    ball
    gripper
  )
 
  (:predicates
    (at-robby_M ?r - room )
    (at_M ?b - ball ?r - room )
    (free_M ?g - gripper )
    (carry_M ?o - ball ?g - gripper )
  )
 
  (:action move_M
    :parameters (?from - room ?to - room )
    :precondition (and (at-robby_M ?to ) )
    :effect (and  (at-robby_M ?from ) (not (at-robby_M ?from ) ) 
 )
  )
  (:action pick_M
    :parameters (?obj - ball ?room - room ?gripper - gripper )
    :precondition (and (at_M ?obj ?room ) (at-robby_M ?room ) (free_M ?gripper ) )
    :effect (and (carry_M ?obj ?gripper ) (not (at_M ?obj ?room )) (not (free_M ?gripper )) 
 )
  )
  (:action drop_M
    :parameters (?obj - ball ?room - room ?gripper - gripper )
    :precondition (and (carry_M ?obj ?gripper ) (at-robby_M ?room ) )
    :effect (and (at_M ?obj ?room ) (free_M ?gripper ) (not (carry_M ?obj ?gripper )) 
 )
  )
)
