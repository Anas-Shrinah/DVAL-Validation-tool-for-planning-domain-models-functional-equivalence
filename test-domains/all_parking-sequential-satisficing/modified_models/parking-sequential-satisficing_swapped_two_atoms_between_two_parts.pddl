;Parking with swapped atoms ## Swap between add effect and delete effect ## Yes ## The atom (at-curb ?car) in the add effects of the operator ``move-car-to-curb'' in the original domain is swapped with the atom (behind-car ?car ?carsrc) from the preconditions from the same operator in the original domain.
 
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
    :precondition (and (car-clear_M ?car ) (curb-clear_M ?curbdest )(at-curb_M ?car ) )
    :effect (and (car-clear_M ?carsrc ) (behind-car_M ?car ?carsrc ) (at-curb-num_M ?car ?curbdest )  (not (behind-car_M ?car ?carsrc )) (not (curb-clear_M ?curbdest )) 
 )
  )
  (:action move-car-to-car_M
    :parameters (?car - car ?carsrc - car ?cardest - car )
    :precondition (and (car-clear_M ?car ) (car-clear_M ?cardest ) (behind-car_M ?car ?carsrc ) (at-curb_M ?cardest ) )
    :effect (and (car-clear_M ?carsrc ) (behind-car_M ?car ?cardest ) (not (car-clear_M ?cardest )) (not (behind-car_M ?car ?carsrc )) 
 )
  )
)
