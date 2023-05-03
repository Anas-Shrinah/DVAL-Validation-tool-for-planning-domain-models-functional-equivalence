;Hiking with random valid macro ## Add valid macro ## No ## The valid macro operator ``put_down-put_up-drive_passenger'' is added to this domain.
 
(define (domain hiking)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    car
    tent
    person
    couple
    place
  )
 
  (:predicates
    (at_tent_M ?x1 - tent ?x2 - place )
    (at_person_M ?x1 - person ?x2 - place )
    (at_car_M ?x1 - car ?x2 - place )
    (partners_M ?x1 - couple ?x2 - person ?x3 - person )
    (up_M ?x1 - tent )
    (down_M ?x1 - tent )
    (walked_M ?x1 - couple ?x2 - place )
    (next_M ?x1 - place ?x2 - place )
  )
 
  (:action put_down_M
    :parameters (?x1 - person ?x2 - place ?x3 - tent )
    :precondition (and (at_person_M ?x1 ?x2 ) (at_tent_M ?x3 ?x2 ) (up_M ?x3 ) )
    :effect (and (down_M ?x3 ) (not (up_M ?x3 )) 
 )
  )
  (:action put_up_M
    :parameters (?x1 - person ?x2 - place ?x3 - tent )
    :precondition (and (at_person_M ?x1 ?x2 ) (at_tent_M ?x3 ?x2 ) (down_M ?x3 ) )
    :effect (and (up_M ?x3 ) (not (down_M ?x3 )) 
 )
  )
  (:action drive_passenger_M
    :parameters (?x1 - person ?x2 - place ?x3 - place ?x4 - car ?x5 - person )
    :precondition (and (at_person_M ?x1 ?x2 ) (at_car_M ?x4 ?x2 ) (at_person_M ?x5 ?x2 ) )
    :effect (and (at_person_M ?x1 ?x3 ) (at_car_M ?x4 ?x3 ) (at_person_M ?x5 ?x3 ) (not (at_person_M ?x1 ?x2 )) (not (at_car_M ?x4 ?x2 )) (not (at_person_M ?x5 ?x2 )) 
 )
  )
  (:action drive_M
    :parameters (?x1 - person ?x2 - place ?x3 - place ?x4 - car )
    :precondition (and (at_person_M ?x1 ?x2 ) (at_car_M ?x4 ?x2 ) )
    :effect (and (at_person_M ?x1 ?x3 ) (at_car_M ?x4 ?x3 ) (not (at_person_M ?x1 ?x2 )) (not (at_car_M ?x4 ?x2 )) 
 )
  )
  (:action drive_tent_M
    :parameters (?x1 - person ?x2 - place ?x3 - place ?x4 - car ?x5 - tent )
    :precondition (and (at_person_M ?x1 ?x2 ) (at_car_M ?x4 ?x2 ) (at_tent_M ?x5 ?x2 ) (down_M ?x5 ) )
    :effect (and (at_person_M ?x1 ?x3 ) (at_car_M ?x4 ?x3 ) (at_tent_M ?x5 ?x3 ) (not (at_person_M ?x1 ?x2 )) (not (at_car_M ?x4 ?x2 )) (not (at_tent_M ?x5 ?x2 )) 
 )
  )
  (:action drive_tent_passenger_M
    :parameters (?x1 - person ?x2 - place ?x3 - place ?x4 - car ?x5 - tent ?x6 - person )
    :precondition (and (at_person_M ?x1 ?x2 ) (at_car_M ?x4 ?x2 ) (at_tent_M ?x5 ?x2 ) (down_M ?x5 ) (at_person_M ?x6 ?x2 ) (not (= ?x1 ?x6 )) )
    :effect (and (at_person_M ?x1 ?x3 ) (at_car_M ?x4 ?x3 ) (at_tent_M ?x5 ?x3 ) (at_person_M ?x6 ?x3 ) (not (at_person_M ?x1 ?x2 )) (not (at_car_M ?x4 ?x2 )) (not (at_tent_M ?x5 ?x2 )) (not (at_person_M ?x6 ?x2 )) 
 )
  )
  (:action walk_together_M
    :parameters (?x1 - tent ?x2 - place ?x3 - person ?x4 - place ?x5 - person ?x6 - couple )
    :precondition (and (at_tent_M ?x1 ?x2 ) (up_M ?x1 ) (at_person_M ?x3 ?x4 ) (next_M ?x4 ?x2 ) (at_person_M ?x5 ?x4 ) (walked_M ?x6 ?x4 ) (partners_M ?x6 ?x3 ?x5 ) (not (= ?x3 ?x5 )) )
    :effect (and (at_person_M ?x3 ?x2 ) (at_person_M ?x5 ?x2 ) (walked_M ?x6 ?x2 ) (not (at_person_M ?x3 ?x4 )) (not (at_person_M ?x5 ?x4 )) (not (walked_M ?x6 ?x4 )) 
 )
  )
  (:action put_down-put_up-drive_passenger_M
    :parameters (?x1 - person ?x3 - place ?x5 - tent ?x2 - person ?x4 - place ?x6 - car )
    :precondition (and (at_person_M ?x1 ?x3 ) (at_tent_M ?x5 ?x3 ) (up_M ?x5 ) (at_person_M ?x2 ?x3 ) (at_car_M ?x6 ?x3 ) (not (= ?x3 ?x5 )) )
    :effect (and (at_person_M ?x2 ?x4 ) (at_car_M ?x6 ?x4 ) (at_person_M ?x1 ?x4 ) (not (down_M ?x5 )) (not (at_person_M ?x2 ?x3 )) (not (at_car_M ?x6 ?x3 )) (not (at_person_M ?x1 ?x3 )) 
 )
  )
)
