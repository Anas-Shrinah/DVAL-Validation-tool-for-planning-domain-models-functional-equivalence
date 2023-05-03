;Elevator with random invalid macro ## Add invalid macro ## Yes ## The invalid macro operator ``board-depart-up'' is added to this domain. This invalid macro is produced from a valid macro by swapping the add effect (served ?x3) from the original valid macro by the precondition (origin ?x3 ?x1) from the same valid macro.
 
(define (domain elevator)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    passenger
    floor
  )
 
  (:predicates
    (origin_M ?person - passenger ?floor - floor )
    (destin_M ?person - passenger ?floor - floor )
    (above_M ?floor1 - floor ?floor2 - floor )
    (boarded_M ?person - passenger )
    (not-boarded_M ?person - passenger )
    (served_M ?person - passenger )
    (not-served_M ?person - passenger )
    (lift-at_M ?floor - floor )
  )
 
  (:action board_M
    :parameters (?f - floor ?p - passenger )
    :precondition (and (lift-at_M ?f ) (origin_M ?p ?f ) )
    :effect (and (boarded_M ?p ) 
 )
  )
  (:action depart_M
    :parameters (?f - floor ?p - passenger )
    :precondition (and (lift-at_M ?f ) (destin_M ?p ?f ) (boarded_M ?p ) )
    :effect (and (served_M ?p ) (not (boarded_M ?p )) 
 )
  )
  (:action up_M
    :parameters (?f1 - floor ?f2 - floor )
    :precondition (and (lift-at_M ?f1 ) (above_M ?f1 ?f2 ) )
    :effect (and (lift-at_M ?f2 ) (not (lift-at_M ?f1 )) 
 )
  )
  (:action down_M
    :parameters (?f1 - floor ?f2 - floor )
    :precondition (and (lift-at_M ?f1 ) (above_M ?f2 ?f1 ) )
    :effect (and (lift-at_M ?f2 ) (not (lift-at_M ?f1 )) 
 )
  )
  (:action board-depart-up_M
    :parameters (?x1 - floor ?x3 - passenger ?x2 - floor )
    :precondition (and (lift-at_M ?x1 ) (served_M ?x3 ) (destin_M ?x3 ?x1 ) (above_M ?x1 ?x2 ) )
    :effect (and (lift-at_M ?x2 ) (origin_M ?x3 ?x1 ) (not (lift-at_M ?x1 )) (not (boarded_M ?x3 ) ) 
 )
  )
)
