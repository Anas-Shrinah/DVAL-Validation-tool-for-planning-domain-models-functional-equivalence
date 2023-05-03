;Parking with swapped variables ## Swap positions of two variables in an atom ## Yes ## The variable ?car in the parameters of the add effect (behind-car ?cardest ?car) in the operator ``move-curb-to-car'' in the original domain is swapped with the variable ?cardest from the parameters of the same add effect of the same operator in the original domain.
 
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
    :effect (and (curb-clear_M ?curbsrc ) (behind-car_M ?cardest ?car ) (not (car-clear_M ?cardest )) (not (at-curb-num_M ?car ?curbsrc )) (not (at-curb_M ?car )) 
 )
  )
  (:action move-car-to-curb_M
    :parameters (?car - car ?carsrc - car ?curbdest - curb )
    :precondition (and (car-clear_M ?car ) (curb-clear_M ?curbdest ) (behind-car_M ?car ?carsrc ) )
    :effect (and (car-clear_M ?carsrc ) (at-curb-num_M ?car ?curbdest ) (curb-clear_M ?curbdest ) (not (behind-car_M ?car ?carsrc )) (not (at-curb_M ?car )) 
 )
  )
  (:action move-car-to-car_M
    :parameters (?car - car ?carsrc - car ?cardest - car )
    :precondition (and (car-clear_M ?car ) (car-clear_M ?cardest ) (behind-car_M ?car ?carsrc ) (at-curb_M ?cardest ) )
    :effect (and (car-clear_M ?carsrc ) (behind-car_M ?car ?cardest ) (not (car-clear_M ?cardest )) (not (behind-car_M ?car ?carsrc )) 
 )
  )
)
