;Pipesworld with random invalid macro ## Add invalid macro ## Yes ## The invalid macro operator ``push-start-push-end-pop-start'' is added to this domain. This invalid macro is produced from a valid macro by swapping the add effect (pop-updating ?x1) from the original valid macro by the precondition (last ?x2 ?x1) from the same valid macro.
 
(define (domain pipesworld)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    pipe
    area
    product
    batch-atom
  )
 
  (:predicates
    (connect_M ?from - area ?to - area ?pipe - pipe )
    (unitary_M ?pipe - pipe )
    (not-unitary_M ?pipe - pipe )
    (last_M ?batch-atom - batch-atom ?pipe - pipe )
    (first_M ?batch-atom - batch-atom ?pipe - pipe )
    (follow_M ?next - batch-atom ?previous - batch-atom )
    (is-product_M ?batch-atom - batch-atom ?product - product )
    (on_M ?batch-atom - batch-atom ?area - area )
    (may-interface_M ?product-a - product ?product-b - product )
    (normal_M ?pipe - pipe )
    (push-updating_M ?pipe - pipe )
    (pop-updating_M ?pipe - pipe )
  )
 
  (:action push-start_M
    :parameters (?pipe - pipe ?batch-atom-in - batch-atom ?from-area - area ?to-area - area ?first-batch-atom - batch-atom ?product-batch-atom-in - product ?product-first-batch - product )
    :precondition (and (normal_M ?pipe ) (first_M ?first-batch-atom ?pipe ) (connect_M ?from-area ?to-area ?pipe ) (on_M ?batch-atom-in ?from-area ) (not-unitary_M ?pipe ) (is-product_M ?batch-atom-in ?product-batch-atom-in ) (is-product_M ?first-batch-atom ?product-first-batch ) (may-interface_M ?product-batch-atom-in ?product-first-batch ) )
    :effect (and (push-updating_M ?pipe ) (first_M ?batch-atom-in ?pipe ) (follow_M ?first-batch-atom ?batch-atom-in ) (not (normal_M ?pipe )) (not (first_M ?first-batch-atom ?pipe )) (not (on_M ?batch-atom-in ?from-area )) 
 )
  )
  (:action push-end_M
    :parameters (?pipe - pipe ?from-area - area ?to-area - area ?last-batch-atom - batch-atom ?next-last-batch-atom - batch-atom )
    :precondition (and (push-updating_M ?pipe ) (last_M ?last-batch-atom ?pipe ) (connect_M ?from-area ?to-area ?pipe ) (not-unitary_M ?pipe ) (follow_M ?last-batch-atom ?next-last-batch-atom ) )
    :effect (and (normal_M ?pipe ) (last_M ?next-last-batch-atom ?pipe ) (on_M ?last-batch-atom ?to-area ) (not (push-updating_M ?pipe )) (not (follow_M ?last-batch-atom ?next-last-batch-atom )) (not (last_M ?last-batch-atom ?pipe )) 
 )
  )
  (:action pop-start_M
    :parameters (?pipe - pipe ?batch-atom-in - batch-atom ?from-area - area ?to-area - area ?last-batch-atom - batch-atom ?product-batch-atom-in - product ?product-last-batch - product )
    :precondition (and (normal_M ?pipe ) (last_M ?last-batch-atom ?pipe ) (connect_M ?from-area ?to-area ?pipe ) (on_M ?batch-atom-in ?to-area ) (not-unitary_M ?pipe ) (is-product_M ?batch-atom-in ?product-batch-atom-in ) (is-product_M ?last-batch-atom ?product-last-batch ) (may-interface_M ?product-batch-atom-in ?product-last-batch ) )
    :effect (and (pop-updating_M ?pipe ) (last_M ?batch-atom-in ?pipe ) (follow_M ?batch-atom-in ?last-batch-atom ) (not (normal_M ?pipe )) (not (last_M ?last-batch-atom ?pipe )) (not (on_M ?batch-atom-in ?to-area )) 
 )
  )
  (:action pop-end_M
    :parameters (?pipe - pipe ?from-area - area ?to-area - area ?first-batch-atom - batch-atom ?next-first-batch-atom - batch-atom )
    :precondition (and (pop-updating_M ?pipe ) (first_M ?first-batch-atom ?pipe ) (connect_M ?from-area ?to-area ?pipe ) (not-unitary_M ?pipe ) (follow_M ?next-first-batch-atom ?first-batch-atom ) )
    :effect (and (normal_M ?pipe ) (first_M ?next-first-batch-atom ?pipe ) (on_M ?first-batch-atom ?from-area ) (not (pop-updating_M ?pipe )) (not (follow_M ?next-first-batch-atom ?first-batch-atom )) (not (first_M ?first-batch-atom ?pipe )) 
 )
  )
  (:action push-unitarypipe_M
    :parameters (?pipe - pipe ?batch-atom-in - batch-atom ?from-area - area ?to-area - area ?first-batch-atom - batch-atom ?product-batch-atom-in - product ?product-first-batch - product )
    :precondition (and (first_M ?first-batch-atom ?pipe ) (connect_M ?from-area ?to-area ?pipe ) (on_M ?batch-atom-in ?from-area ) (unitary_M ?pipe ) (is-product_M ?batch-atom-in ?product-batch-atom-in ) (is-product_M ?first-batch-atom ?product-first-batch ) (may-interface_M ?product-batch-atom-in ?product-first-batch ) )
    :effect (and (first_M ?batch-atom-in ?pipe ) (last_M ?batch-atom-in ?pipe ) (on_M ?first-batch-atom ?to-area ) (not (first_M ?first-batch-atom ?pipe )) (not (last_M ?first-batch-atom ?pipe )) (not (on_M ?batch-atom-in ?from-area )) 
 )
  )
  (:action pop-unitarypipe_M
    :parameters (?pipe - pipe ?batch-atom-in - batch-atom ?from-area - area ?to-area - area ?last-batch-atom - batch-atom ?product-batch-atom-in - product ?product-last-batch - product )
    :precondition (and (last_M ?last-batch-atom ?pipe ) (connect_M ?from-area ?to-area ?pipe ) (on_M ?batch-atom-in ?to-area ) (unitary_M ?pipe ) (is-product_M ?batch-atom-in ?product-batch-atom-in ) (is-product_M ?last-batch-atom ?product-last-batch ) (may-interface_M ?product-batch-atom-in ?product-last-batch ) )
    :effect (and (last_M ?batch-atom-in ?pipe ) (first_M ?batch-atom-in ?pipe ) (on_M ?last-batch-atom ?from-area ) (not (last_M ?last-batch-atom ?pipe )) (not (first_M ?last-batch-atom ?pipe )) (not (on_M ?batch-atom-in ?to-area )) 
 )
  )
  (:action push-start-push-end-pop-start_M
    :parameters (?x1 - pipe ?x2 - batch-atom ?x4 - area ?x5 - area ?x3 - batch-atom ?x6 - product ?x7 - product )
    :precondition (and (normal_M ?x1 ) (first_M ?x3 ?x1 ) (connect_M ?x4 ?x5 ?x1 ) (on_M ?x2 ?x4 ) (not-unitary_M ?x1 ) (is-product_M ?x2 ?x6 ) (is-product_M ?x3 ?x7 ) (may-interface_M ?x6 ?x7 ) (follow_M ?x2 ?x3 ) (pop-updating_M ?x1 ) )
    :effect (and (first_M ?x2 ?x1 ) (follow_M ?x3 ?x2 ) (last_M ?x2 ?x1 ) (not (first_M ?x3 ?x1 )) (not (on_M ?x2 ?x4 )) (not (push-updating_M ?x1 )) (not (normal_M ?x1 )) (not (last_M ?x3 ?x1 )) (not (on_M ?x2 ?x5 )) 
 )
  )
)
