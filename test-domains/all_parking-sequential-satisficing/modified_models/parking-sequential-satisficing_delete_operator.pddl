;Parking with deleted operator ## Delete operator ## Yes ## The operator ``move-curb-to-car'' is removed from this modified domain, this operator exists in the original domain.
 
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
)
