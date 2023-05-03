;Gripper with deleted operator ## Delete operator ## Yes ## The operator ``drop'' is removed from this modified domain, this operator exists in the original domain.
 
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
    :precondition (and (at-robby_M ?from ) )
    :effect (and (at-robby_M ?to ) (not (at-robby_M ?from )) 
 )
  )
  (:action pick_M
    :parameters (?obj - ball ?room - room ?gripper - gripper )
    :precondition (and (at_M ?obj ?room ) (at-robby_M ?room ) (free_M ?gripper ) )
    :effect (and (carry_M ?obj ?gripper ) (not (at_M ?obj ?room )) (not (free_M ?gripper )) 
 )
  )
)
