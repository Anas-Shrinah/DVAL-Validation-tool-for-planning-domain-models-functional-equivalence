;Parking with random invalid macro ## Add invalid macro ## Yes ## The invalid macro operator ``move-curb-to-curb-move-curb-to-car-move-car-to-curb'' is added to this domain. This invalid macro is produced from a valid macro by swapping the add effect (at-curb ?x1) from the original valid macro by the precondition (at-curb-num ?x1 ?x4) from the same valid macro.
 
(define (domain parking)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    car
    curb
  )
 
  (:predicates
    (at-curb_M ?car - car )
    (at-curb-num_M ?car - car ?curb - curb )
    (behind-car_M ?car - car ?front-car - car )
    (car-clear_M ?car - car )
    (curb-clear_M ?curb - curb )
  )
 
  (:action move-curb-to-curb_M
    :parameters (?car - car ?curbsrc - curb ?curbdest - curb )
    :precondition (and (car-clear_M ?car ) (curb-clear_M ?curbdest ) (at-curb-num_M ?car ?curbsrc ) )
    :effect (and (curb-clear_M ?curbsrc ) (at-curb-num_M ?car ?curbdest ) (not (curb-clear_M ?curbdest )) (not (at-curb-num_M ?car ?curbsrc )) 
 )
  )
  (:action move-curb-to-car_M
    :parameters (?car - car ?curbsrc - curb ?cardest - car )
    :precondition (and (car-clear_M ?car ) (car-clear_M ?cardest ) (at-curb-num_M ?car ?curbsrc ) (at-curb_M ?cardest ) )
    :effect (and (curb-clear_M ?curbsrc ) (behind-car_M ?car ?cardest ) (not (car-clear_M ?cardest )) (not (at-curb-num_M ?car ?curbsrc )) (not (at-curb_M ?car )) 
 )
  )
  (:action move-car-to-curb_M
    :parameters (?car - car ?carsrc - car ?curbdest - curb )
    :precondition (and (car-clear_M ?car ) (curb-clear_M ?curbdest ) (behind-car_M ?car ?carsrc ) )
    :effect (and (car-clear_M ?carsrc ) (at-curb-num_M ?car ?curbdest ) (at-curb_M ?car ) (not (curb-clear_M ?curbdest )) (not (behind-car_M ?car ?carsrc )) 
 )
  )
  (:action move-car-to-car_M
    :parameters (?car - car ?carsrc - car ?cardest - car )
    :precondition (and (car-clear_M ?car ) (car-clear_M ?cardest ) (behind-car_M ?car ?carsrc ) (at-curb_M ?cardest ) )
    :effect (and (car-clear_M ?carsrc ) (behind-car_M ?car ?cardest ) (not (car-clear_M ?cardest )) (not (behind-car_M ?car ?carsrc )) 
 )
  )
  (:action move-curb-to-curb-move-curb-to-car-move-car-to-curb_M
    :parameters (?x1 - car ?x4 - curb ?x5 - curb ?x2 - car )
    :precondition (and (car-clear_M ?x1 ) (curb-clear_M ?x5 ) (car-clear_M ?x2 ) (at-curb_M ?x2 ) (at-curb_M ?x1 ) )
    :effect (and (at-curb-num_M ?x1 ?x4 ) (not (at-curb-num_M ?x1 ?x5 )) (not (curb-clear_M ?x4 )) (not (behind-car_M ?x1 ?x2 )) 
 )
  )
)
