;Logistics with deleted operator ## Delete operator ## Yes ## The operator ``fly-airplane'' is removed from this modified domain, this operator exists in the original domain.
 
(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    truck
    airplane
    package
    airport
    location
    city
  )
 
  (:predicates
    (location-in-city_M ?loc - location ?city - city )
    (airport-in-city_M ?airport - airport ?city - city )
    (at-truck-location_M ?truck - truck ?loc - location )
    (at-truck-airport_M ?truck - truck ?loc - airport )
    (at-package-location_M ?pkg - package ?loc - location )
    (at-package-airport_M ?pkg - package ?loc - airport )
    (at-airplane-airport_M ?airplane - airplane ?loc - airport )
    (atpackage-airport_M ?pkg - package ?loc - airport )
    (in-airplane_M ?pkg - package ?airplane - airplane )
    (in-truck_M ?pkg - package ?truck - truck )
  )
 
  (:action load-truck-location_M
    :parameters (?pkg - package ?truck - truck ?loc - location )
    :precondition (and (at-truck-location_M ?truck ?loc ) (at-package-location_M ?pkg ?loc ) )
    :effect (and (in-truck_M ?pkg ?truck ) (not (at-package-location_M ?pkg ?loc )) 
 )
  )
  (:action load-truck-airport_M
    :parameters (?pkg - package ?truck - truck ?loc - airport )
    :precondition (and (at-truck-airport_M ?truck ?loc ) (at-package-airport_M ?pkg ?loc ) )
    :effect (and (in-truck_M ?pkg ?truck ) (not (at-package-airport_M ?pkg ?loc )) 
 )
  )
  (:action load-airplane_M
    :parameters (?pkg - package ?airplane - airplane ?loc - airport )
    :precondition (and (at-package-airport_M ?pkg ?loc ) (at-airplane-airport_M ?airplane ?loc ) )
    :effect (and (in-airplane_M ?pkg ?airplane ) (not (at-package-airport_M ?pkg ?loc )) 
 )
  )
  (:action unload-truck-location_M
    :parameters (?pkg - package ?truck - truck ?loc - location )
    :precondition (and (at-truck-location_M ?truck ?loc ) (in-truck_M ?pkg ?truck ) )
    :effect (and (at-package-location_M ?pkg ?loc ) (not (in-truck_M ?pkg ?truck )) 
 )
  )
  (:action unload-truck-airport_M
    :parameters (?pkg - package ?truck - truck ?loc - airport )
    :precondition (and (at-truck-airport_M ?truck ?loc ) (in-truck_M ?pkg ?truck ) )
    :effect (and (at-package-airport_M ?pkg ?loc ) (not (in-truck_M ?pkg ?truck )) 
 )
  )
  (:action unload-airplane_M
    :parameters (?pkg - package ?airplane - airplane ?loc - airport )
    :precondition (and (in-airplane_M ?pkg ?airplane ) (at-airplane-airport_M ?airplane ?loc ) )
    :effect (and (at-package-airport_M ?pkg ?loc ) (not (in-airplane_M ?pkg ?airplane )) 
 )
  )
  (:action drive-truck-location-location_M
    :parameters (?truck - truck ?loc-from - location ?loc-to - location ?city - city )
    :precondition (and (at-truck-location_M ?truck ?loc-from ) (location-in-city_M ?loc-from ?city ) (location-in-city_M ?loc-to ?city ) )
    :effect (and (at-truck-location_M ?truck ?loc-to ) (not (at-truck-location_M ?truck ?loc-from )) 
 )
  )
  (:action drive-truck-location-airport_M
    :parameters (?truck - truck ?loc-from - location ?loc-to - airport ?city - city )
    :precondition (and (at-truck-location_M ?truck ?loc-from ) (location-in-city_M ?loc-from ?city ) (airport-in-city_M ?loc-to ?city ) )
    :effect (and (at-truck-airport_M ?truck ?loc-to ) (not (at-truck-location_M ?truck ?loc-from )) 
 )
  )
  (:action drive-truck-airport-location_M
    :parameters (?truck - truck ?loc-from - airport ?loc-to - location ?city - city )
    :precondition (and (at-truck-airport_M ?truck ?loc-from ) (airport-in-city_M ?loc-from ?city ) (location-in-city_M ?loc-to ?city ) )
    :effect (and (at-truck-location_M ?truck ?loc-to ) (not (at-truck-airport_M ?truck ?loc-from )) 
 )
  )
  (:action drive-truck-airport-airport_M
    :parameters (?truck - truck ?loc-from - airport ?loc-to - airport ?city - city )
    :precondition (and (at-truck-airport_M ?truck ?loc-from ) (airport-in-city_M ?loc-from ?city ) (airport-in-city_M ?loc-to ?city ) )
    :effect (and (at-truck-airport_M ?truck ?loc-to ) (not (at-truck-airport_M ?truck ?loc-from )) 
 )
  )
)
