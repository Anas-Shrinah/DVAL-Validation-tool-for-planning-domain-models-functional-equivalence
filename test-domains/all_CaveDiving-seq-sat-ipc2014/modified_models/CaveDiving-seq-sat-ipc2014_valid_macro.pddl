;Cave-diving with random valid macro ## Add valid macro ## No ## The valid macro operator ``prepare-tank-enter-water-pickup-tank'' is added to this domain.
 
(define (domain cave-diving)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    location
    diver
    tank
    quantity
  )
 
  (:predicates
    (at-tank_M ?t - tank ?l - location )
    (in-storage_M ?t - tank )
    (full_M ?t - tank )
    (next-tank_M ?t1 - tank ?t2 - tank )
    (at-diver_M ?d - diver ?l - location )
    (available_M ?d - diver )
    (at-surface_M ?d - diver )
    (decompressing_M ?d - diver )
    (cave-entrance_M ?l - location )
    (connected_M ?l1 - location ?l2 - location )
    (next-quantity_M ?q1 - quantity ?q2 - quantity )
    (holding_M ?d - diver ?t - tank )
    (capacity_M ?d - diver ?q - quantity )
    (have-photo_M ?l - location )
    (in-water_M )
  )
 
  (:action prepare-tank_M
    :parameters (?d - diver ?t1 - tank ?t2 - tank ?q1 - quantity ?q2 - quantity )
    :precondition (and (at-surface_M ?d ) (in-storage_M ?t1 ) (next-quantity_M ?q1 ?q2 ) (capacity_M ?d ?q2 ) (next-tank_M ?t1 ?t2 ) )
    :effect (and (in-storage_M ?t2 ) (full_M ?t1 ) (capacity_M ?d ?q1 ) (holding_M ?d ?t1 ) (not (in-storage_M ?t1 )) (not (capacity_M ?d ?q2 )) 
 )
  )
  (:action enter-water_M
    :parameters (?d - diver ?l - location )
    :precondition (and (at-surface_M ?d ) (cave-entrance_M ?l ) )
    :effect (and (at-diver_M ?d ?l ) (not (at-surface_M ?d )) 
 )
  )
  (:action pickup-tank_M
    :parameters (?d - diver ?t - tank ?l - location ?q1 - quantity ?q2 - quantity )
    :precondition (and (at-diver_M ?d ?l ) (at-tank_M ?t ?l ) (next-quantity_M ?q1 ?q2 ) (capacity_M ?d ?q2 ) )
    :effect (and (holding_M ?d ?t ) (capacity_M ?d ?q1 ) (not (at-tank_M ?t ?l )) (not (capacity_M ?d ?q2 )) 
 )
  )
  (:action drop-tank_M
    :parameters (?d - diver ?t - tank ?l - location ?q1 - quantity ?q2 - quantity )
    :precondition (and (at-diver_M ?d ?l ) (holding_M ?d ?t ) (next-quantity_M ?q1 ?q2 ) (capacity_M ?d ?q1 ) )
    :effect (and (at-tank_M ?t ?l ) (capacity_M ?d ?q2 ) (not (holding_M ?d ?t )) (not (capacity_M ?d ?q1 )) 
 )
  )
  (:action swim_M
    :parameters (?d - diver ?t - tank ?l1 - location ?l2 - location )
    :precondition (and (at-diver_M ?d ?l1 ) (holding_M ?d ?t ) (full_M ?t ) (connected_M ?l1 ?l2 ) )
    :effect (and (at-diver_M ?d ?l2 ) (not (at-diver_M ?d ?l1 )) (not (full_M ?t )) 
 )
  )
  (:action photograph_M
    :parameters (?d - diver ?l - location ?t - tank )
    :precondition (and (at-diver_M ?d ?l ) (holding_M ?d ?t ) (full_M ?t ) )
    :effect (and (have-photo_M ?l ) (not (full_M ?t )) 
 )
  )
  (:action decompress_M
    :parameters (?d - diver ?l - location )
    :precondition (and (at-diver_M ?d ?l ) (cave-entrance_M ?l ) )
    :effect (and (decompressing_M ?d ) (not (at-diver_M ?d ?l )) 
 )
  )
  (:action prepare-tank-enter-water-pickup-tank_M
    :parameters (?x1 - diver ?x2 - tank ?x3 - tank ?x4 - quantity ?x5 - quantity ?x6 - location )
    :precondition (and (at-surface_M ?x1 ) (in-storage_M ?x2 ) (next-quantity_M ?x4 ?x5 ) (capacity_M ?x1 ?x5 ) (next-tank_M ?x2 ?x3 ) (cave-entrance_M ?x6 ) (at-tank_M ?x2 ?x6 ) (next-quantity_M ?x5 ?x4 ) )
    :effect (and (in-storage_M ?x3 ) (full_M ?x2 ) (holding_M ?x1 ?x2 ) (at-diver_M ?x1 ?x6 ) (not (in-storage_M ?x2 )) (not (at-surface_M ?x1 )) (not (at-tank_M ?x2 ?x6 )) (not (capacity_M ?x1 ?x4 )) 
 )
  )
)
