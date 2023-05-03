;Elevator with swapped variables ## Swap positions of two variables in an atom ## Yes ## The variable ?f1 in the parameters of the add effect (above ?f1 ?f2) in the operator ``down'' in the original domain is swapped with the variable ?f2 from the parameters of the same add effect of the same operator in the original domain.
 
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
    :precondition (and (lift-at_M ?f1 ) (lift-at_M ?f2 ) )
    :effect (and (above_M ?f1 ?f2 ) (not (lift-at_M ?f1 )) 
 )
  )
)
