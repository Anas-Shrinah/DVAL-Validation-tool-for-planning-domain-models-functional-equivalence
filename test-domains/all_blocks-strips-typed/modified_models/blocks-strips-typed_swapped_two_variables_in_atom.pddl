;Blocksworld with swapped variables ## Swap positions of two variables in an atom ## Yes ## The variable ?x in the parameters of the add effect (on ?y ?x) in the operator ``stack'' in the original domain is swapped with the variable ?y from the parameters of the same add effect of the same operator in the original domain.
 
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
    :effect (and (clear_M ?x ) (handempty_M ) (on_M ?y ?x ) (not (holding_M ?x )) (not (clear_M ?y )) 
 )
  )
  (:action unstack_M
    :parameters (?x - block ?y - block )
    :precondition (and (on_M ?x ?y ) (clear_M ?x ) (handempty_M ) )
    :effect (and (holding_M ?x ) (clear_M ?y ) (not (clear_M ?x )) (not (handempty_M )) (not (on_M ?x ?y )) 
 )
  )
)
