;Blocksworld with random valid macro ## Add valid macro ## No ## The valid macro operator ``pick-up-put-down-stack'' is added to this domain.
 
(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    block
  )
 
  (:predicates
    (on_M ?x - block ?y - block )
    (ontable_M ?x - block )
    (clear_M ?x - block )
    (handempty_M )
    (holding_M ?x - block )
  )
 
  (:action pick-up_M
    :parameters (?x - block )
    :precondition (and (clear_M ?x ) (ontable_M ?x ) (handempty_M ) )
    :effect (and (holding_M ?x ) (not (ontable_M ?x )) (not (clear_M ?x )) (not (handempty_M )) 
 )
  )
  (:action put-down_M
    :parameters (?x - block )
    :precondition (and (holding_M ?x ) )
    :effect (and (clear_M ?x ) (handempty_M ) (ontable_M ?x ) (not (holding_M ?x )) 
 )
  )
  (:action stack_M
    :parameters (?x - block ?y - block )
    :precondition (and (holding_M ?x ) (clear_M ?y ) )
    :effect (and (clear_M ?x ) (handempty_M ) (on_M ?x ?y ) (not (holding_M ?x )) (not (clear_M ?y )) 
 )
  )
  (:action unstack_M
    :parameters (?x - block ?y - block )
    :precondition (and (on_M ?x ?y ) (clear_M ?x ) (handempty_M ) )
    :effect (and (holding_M ?x ) (clear_M ?y ) (not (clear_M ?x )) (not (handempty_M )) (not (on_M ?x ?y )) 
 )
  )
  (:action pick-up-put-down-stack_M
    :parameters (?x1 - block ?x2 - block )
    :precondition (and (clear_M ?x1 ) (ontable_M ?x1 ) (handempty_M ) (holding_M ?x2 ) )
    :effect (and (clear_M ?x2 ) (on_M ?x2 ?x1 ) (not (holding_M ?x1 )) (not (holding_M ?x2 )) (not (clear_M ?x1 )) 
 )
  )
)
