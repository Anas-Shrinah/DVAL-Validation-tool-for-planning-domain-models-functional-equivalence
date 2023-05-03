;Gripper with random valid macro ## Add valid macro ## No ## The valid macro operator ``move-pick-drop'' is added to this domain.
 
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
  (:action drop_M
    :parameters (?obj - ball ?room - room ?gripper - gripper )
    :precondition (and (carry_M ?obj ?gripper ) (at-robby_M ?room ) )
    :effect (and (at_M ?obj ?room ) (free_M ?gripper ) (not (carry_M ?obj ?gripper )) 
 )
  )
  (:action move-pick-drop_M
    :parameters (?x1 - room ?x2 - room ?x3 - ball ?x4 - gripper )
    :precondition (and (at-robby_M ?x1 ) (at_M ?x3 ?x2 ) (free_M ?x4 ) )
    :effect (and (at-robby_M ?x2 ) (not (at-robby_M ?x1 )) (not (carry_M ?x3 ?x4 )) 
 )
  )
)
