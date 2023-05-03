;Elevator with crafted valid macro ## Add crafted valid macro ## No ## The valid macro operator ``board-up-depart'' is added to this domain.
(define (domain miconic_M)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    passenger
    
    floor
    
  )
 
  (:constants
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


  (:action board-up-depart_M
    :parameters (?f1 - floor ?f2 - floor ?p - passenger )
    :precondition (and (lift-at_M ?f1 ) (origin_M ?p ?f1 ) (above_M ?f1 ?f2 ) (destin_M ?p ?f2 ))
    :effect (and  (lift-at_M ?f2 ) (not (lift-at_M ?f1 ))(not (boarded_M ?p )) (served_M ?p )
 )
  )

  

)
