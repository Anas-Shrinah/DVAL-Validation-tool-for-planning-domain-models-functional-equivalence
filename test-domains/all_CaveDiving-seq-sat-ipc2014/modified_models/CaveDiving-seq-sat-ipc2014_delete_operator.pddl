;Cave-diving with deleted operator ## Delete operator ## Yes ## The operator ``prepare-tank'' is removed from this modified domain, this operator exists in the original domain.
 
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
)
