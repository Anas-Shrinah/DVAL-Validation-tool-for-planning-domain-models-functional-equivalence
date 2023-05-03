;Logistics with crafted valid macro ## Add crafted valid macro ## No ## The valid macro operator ``load-fly-unload-airplane'' is added to this domain.
;; logistics domain Typed version.
;;

(define (domain logistics)
  (:requirements :strips :typing) 
  (:types truck
          airplane 
          package
         
          airport
          location
          city
           )
  
  (:predicates 	(location-in-city ?loc - location ?city - city)
                (airport-in-city ?airport - airport ?city - city)
		
    (at-truck-location ?truck - truck ?loc - location)
    (at-truck-airport ?truck - truck ?loc - airport)
    (at-package-location ?pkg - package ?loc - location)
    (at-package-airport ?pkg - package ?loc - airport)
    (at-airplane-airport ?airplane - airplane ?loc - airport)
    (atpackage-airport ?pkg - package ?loc - airport)

		(in-airplane ?pkg - package ?airplane - airplane)
    (in-truck ?pkg - package ?truck - truck)


    )
  
(:action LOAD-TRUCK-LOCATION
   :parameters    (?pkg - package ?truck - truck ?loc - location)
   :precondition  (and (at-truck-location ?truck ?loc) (at-package-location ?pkg ?loc))
   :effect        (and (not (at-package-location ?pkg ?loc)) (in-truck ?pkg ?truck)))

(:action LOAD-TRUCK-AIRPORT
   :parameters    (?pkg - package ?truck - truck ?loc - airport)
   :precondition  (and (at-truck-airport ?truck ?loc) (at-package-airport ?pkg ?loc))
   :effect        (and (not (at-package-airport ?pkg ?loc)) (in-truck ?pkg ?truck)))


(:action LOAD-AIRPLANE
  :parameters   (?pkg - package ?airplane - airplane ?loc - airport)
  :precondition (and (at-package-airport ?pkg ?loc) (at-airplane-airport ?airplane ?loc))
  :effect       (and (not (at-package-airport ?pkg ?loc)) (in-airplane ?pkg ?airplane)))

(:action UNLOAD-TRUCK-LOCATION
  :parameters   (?pkg - package ?truck - truck ?loc - location)
  :precondition (and (at-truck-location ?truck ?loc) (in-truck ?pkg ?truck))
  :effect       (and (not (in-truck ?pkg ?truck)) (at-package-location ?pkg ?loc)))

(:action UNLOAD-TRUCK-AIRPORT
  :parameters   (?pkg - package ?truck - truck ?loc - airport)
  :precondition (and (at-truck-airport ?truck ?loc) (in-truck ?pkg ?truck))
  :effect       (and (not (in-truck ?pkg ?truck)) (at-package-airport ?pkg ?loc)))


(:action UNLOAD-AIRPLANE
  :parameters    (?pkg - package ?airplane - airplane ?loc - airport)
  :precondition  (and (in-airplane ?pkg ?airplane) (at-airplane-airport ?airplane ?loc))
  :effect        (and (not (in-airplane ?pkg ?airplane)) (at-package-airport ?pkg ?loc)))

(:action DRIVE-TRUCK-LOCATION-LOCATION
  :parameters (?truck - truck ?loc-from - location ?loc-to - location ?city - city)
  :precondition
   (and (at-truck-location ?truck ?loc-from) (location-in-city ?loc-from ?city) (location-in-city ?loc-to ?city))
  :effect
   (and (not (at-truck-location ?truck ?loc-from)) (at-truck-location ?truck ?loc-to)))

(:action DRIVE-TRUCK-LOCATION-AIRPORT
  :parameters (?truck - truck ?loc-from - location ?loc-to - airport ?city - city)
  :precondition
   (and (at-truck-location ?truck ?loc-from) (location-in-city ?loc-from ?city) (airport-in-city ?loc-to ?city))
  :effect
   (and (not (at-truck-location ?truck ?loc-from)) (at-truck-airport ?truck ?loc-to)))

(:action DRIVE-TRUCK-AIRPORT-LOCATION
  :parameters (?truck - truck ?loc-from - airport ?loc-to - location ?city - city)
  :precondition
   (and (at-truck-airport ?truck ?loc-from) (airport-in-city ?loc-from ?city) (location-in-city ?loc-to ?city))
  :effect
   (and (not (at-truck-airport ?truck ?loc-from)) (at-truck-location ?truck ?loc-to)))

(:action DRIVE-TRUCK-AIRPORT-AIRPORT
  :parameters (?truck - truck ?loc-from - airport ?loc-to - airport ?city - city)
  :precondition
   (and (at-truck-airport ?truck ?loc-from) (airport-in-city ?loc-from ?city) (airport-in-city ?loc-to ?city))
  :effect
   (and (not (at-truck-airport ?truck ?loc-from)) (at-truck-airport ?truck ?loc-to)))

(:action FLY-AIRPLANE
  :parameters (?airplane - airplane ?loc-from - airport ?loc-to - airport)
  :precondition
   (at-airplane-airport ?airplane ?loc-from)
  :effect
   (and (not (at-airplane-airport ?airplane ?loc-from)) (at-airplane-airport ?airplane ?loc-to)))

  (:action load-fly-unload-airplane_M
    :parameters (?pkg - package ?airplane - airplane ?loc-from - airport ?loc-to - airport )
    :precondition (and (at-package-airport ?pkg ?loc-from  ) 
      (at-airplane-airport ?airplane ?loc-from  ) )
    :effect (and  (not (at-package-airport ?pkg ?loc-from  ))
      (at-airplane-airport ?airplane ?loc-to ) (not (at-airplane-airport ?airplane ?loc-from ))
      (not (in-airplane ?pkg ?airplane ))(at-package-airport ?pkg ?loc-to )


      )) 

)
