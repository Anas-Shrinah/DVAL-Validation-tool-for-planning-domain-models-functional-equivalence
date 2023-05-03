;Blocksworld with crafted valid macro ## Add crafted valid macro ## No ## The valid macro operator ``pick-up-stack'' is added to this domain.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain BLOCKS)
  (:requirements :strips :typing)
  (:types block)
  (:predicates (on ?x - block ?y - block)
	       (ontable_M ?x - block)
	       (clear_M ?x - block)
	       (handempty_M)
	       (holding_M ?x - block)
	       )

  (:action pick-up_M
	     :parameters (?x - block)
	     :precondition (and (clear_M ?x) (ontable_M ?x) (handempty_M))
	     :effect
	     (and (not (ontable_M ?x))
		   (not (clear_M ?x))
		   (not (handempty_M))
		   (holding_M ?x)))

  (:action put-down_M
	     :parameters (?x - block)
	     :precondition (holding_M ?x)
	     :effect
	     (and (not (holding_M ?x))
		   (clear_M ?x)
		   (handempty_M)
		   (ontable_M ?x)))
  (:action stack_M
	     :parameters (?x - block ?y - block)
	     :precondition (and (holding_M ?x) (clear_M ?y))
	     :effect
	     (and (not (holding_M ?x))
		   (not (clear_M ?y))
		   (clear_M ?x)
		   (handempty_M)
		   (on ?x ?y)))
  (:action unstack_M
	     :parameters (?x - block ?y - block)
	     :precondition (and (on ?x ?y) (clear_M ?x) (handempty_M))
	     :effect
	     (and (holding_M ?x)
		   (clear_M ?y)
		   (not (clear_M ?x))
		   (not (handempty_M))
		   (not (on ?x ?y))))



  (:action pick-up-stack_M
	     :parameters (?x ?y - block)
	     :precondition (and (clear_M ?x) (ontable_M ?x) (handempty_M) (clear_M ?y))
	     :effect
	     (and (not (ontable_M ?x))
		   (not (holding_M ?x))
		   (not (clear_M ?y))
		   (on ?x ?y)

		   )






  )
  )
