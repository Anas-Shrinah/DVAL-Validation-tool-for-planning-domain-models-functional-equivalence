;Rover with crafted valid macro ## Add crafted valid macro ## No ## The valid macro operator ``calibrate_take_image'' is added to this domain.
(define (domain rover_M)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    rover
    waypoint
    store
    camera
    mode
    lander
    objective
  )
 
  (:constants
  )
 
  (:predicates
    (at_M ?x - rover ?y - waypoint )
    (at_lander_M ?x - lander ?y - waypoint )
    (can_traverse_M ?r - rover ?x - waypoint ?y - waypoint )
    (equipped_for_soil_analysis_M ?r - rover )
    (equipped_for_rock_analysis_M ?r - rover )
    (equipped_for_imaging_M ?r - rover )
    (empty_M ?s - store )
    (have_rock_analysis_M ?r - rover ?w - waypoint )
    (have_soil_analysis_M ?r - rover ?w - waypoint )
    (full_M ?s - store )
    (calibrated_M ?c - camera ?r - rover )
    (supports_M ?c - camera ?m - mode )
    (available_M ?r - rover )
    (visible_M ?w - waypoint ?p - waypoint )
    (have_image_M ?r - rover ?o - objective ?m - mode )
    (communicated_soil_data_M ?w - waypoint )
    (communicated_rock_data_M ?w - waypoint )
    (communicated_image_data_M ?o - objective ?m - mode )
    (at_soil_sample_M ?w - waypoint )
    (at_rock_sample_M ?w - waypoint )
    (visible_from_M ?o - objective ?w - waypoint )
    (store_of_M ?s - store ?r - rover )
    (calibration_target_M ?i - camera ?o - objective )
    (on_board_M ?i - camera ?r - rover )
    (channel_free_M ?l - lander )
  )
 
(:functions 
(prem-count) 
(addm-count) 
(delm-not-prem-count) 
(delm-prem-count)) 
 
  (:action navigate_M
    :parameters (?x - rover ?y - waypoint ?z - waypoint )
    :precondition (and (can_traverse_M ?x ?y ?z ) (available_M ?x ) (at_M ?x ?y ) (visible_M ?y ?z ) )
    :effect (and (at_M ?x ?z ) (not (at_M ?x ?y )) 
 )
  )
  (:action sample_soil_M
    :parameters (?x - rover ?s - store ?p - waypoint )
    :precondition (and (at_M ?x ?p ) (at_soil_sample_M ?p ) (equipped_for_soil_analysis_M ?x ) (store_of_M ?s ?x ) (empty_M ?s ) )
    :effect (and (full_M ?s ) (have_soil_analysis_M ?x ?p ) (not (empty_M ?s )) (not (at_soil_sample_M ?p )) 
 )
  )
  (:action sample_rock_M
    :parameters (?x - rover ?s - store ?p - waypoint )
    :precondition (and (at_M ?x ?p ) (at_rock_sample_M ?p ) (equipped_for_rock_analysis_M ?x ) (store_of_M ?s ?x ) (empty_M ?s ) )
    :effect (and (full_M ?s ) (have_rock_analysis_M ?x ?p ) (not (empty_M ?s )) (not (at_rock_sample_M ?p )) 
 )
  )
  (:action drop_M
    :parameters (?x - rover ?y - store )
    :precondition (and (store_of_M ?y ?x ) (full_M ?y ) )
    :effect (and (empty_M ?y ) (not (full_M ?y )) 
 )
  )
  (:action calibrate_M
    :parameters (?r - rover ?i - camera ?t - objective ?w - waypoint )
    :precondition (and (equipped_for_imaging_M ?r ) (calibration_target_M ?i ?t ) (at_M ?r ?w ) (visible_from_M ?t ?w ) (on_board_M ?i ?r ) )
    :effect (and (calibrated_M ?i ?r ) 
 )
  )
  (:action take_image_M
    :parameters (?r - rover ?p - waypoint ?o - objective ?i - camera ?m - mode )
    :precondition (and (calibrated_M ?i ?r ) (on_board_M ?i ?r ) (equipped_for_imaging_M ?r ) (supports_M ?i ?m ) (visible_from_M ?o ?p ) (at_M ?r ?p ) )
    :effect (and (have_image_M ?r ?o ?m ) (not (calibrated_M ?i ?r )) 
 )
  )
  (:action communicate_soil_data_M
    :parameters (?r - rover ?l - lander ?p - waypoint ?x - waypoint ?y - waypoint )
    :precondition (and (at_M ?r ?x ) (at_lander_M ?l ?y ) (have_soil_analysis_M ?r ?p ) (visible_M ?x ?y ) (available_M ?r ) (channel_free_M ?l ) )
    :effect (and (channel_free_M ?l ) (communicated_soil_data_M ?p ) (available_M ?r ) (not (available_M ?r )) (not (channel_free_M ?l )) 
 )
  )
  (:action communicate_rock_data_M
    :parameters (?r - rover ?l - lander ?p - waypoint ?x - waypoint ?y - waypoint )
    :precondition (and (at_M ?r ?x ) (at_lander_M ?l ?y ) (have_rock_analysis_M ?r ?p ) (visible_M ?x ?y ) (available_M ?r ) (channel_free_M ?l ) )
    :effect (and (channel_free_M ?l ) (communicated_rock_data_M ?p ) (available_M ?r ) (not (available_M ?r )) (not (channel_free_M ?l )) 
 )
  )
  (:action communicate_image_data_M
    :parameters (?r - rover ?l - lander ?o - objective ?m - mode ?x - waypoint ?y - waypoint )
    :precondition (and (at_M ?r ?x ) (at_lander_M ?l ?y ) (have_image_M ?r ?o ?m ) (visible_M ?x ?y ) (available_M ?r ) (channel_free_M ?l ) )
    :effect (and (channel_free_M ?l ) (communicated_image_data_M ?o ?m ) (available_M ?r ) (not (available_M ?r )) (not (channel_free_M ?l )) 
 )
  )

  (:action calibrate_take_image_M
 :parameters (?r - rover ?p - waypoint ?o - objective ?i - camera ?m - mode)
 :precondition (and
        (calibration_target_M ?i ?o) 
       (on_board_M ?i ?r)
                      (equipped_for_imaging_M ?r)
                      (supports_M ?i ?m)
        (visible_from_M ?o ?p)
                     (at_M ?r ?p)
               )
 :effect (and (have_image_M ?r ?o ?m)(not (calibrated_M ?i ?r))
    )
)

)
