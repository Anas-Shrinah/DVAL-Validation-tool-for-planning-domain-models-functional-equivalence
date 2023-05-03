;Scanalyzer with deleted operator ## Delete operator ## Yes ## The operator ``analyze-2'' is removed from this modified domain, this operator exists in the original domain.
 
(define (domain scanalyzer3d)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    segment
    car
  )
 
  (:predicates
    (on_M ?c - car ?s - segment )
    (analyzed_M ?c - car )
    (cycle-2_M ?s1 - segment ?s2 - segment )
    (cycle-4_M ?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment )
    (cycle-2-with-analysis_M ?s1 - segment ?s2 - segment )
    (cycle-4-with-analysis_M ?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment )
  )
 
  (:action analyze-4_M
    :parameters (?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment ?c1 - car ?c2 - car ?c3 - car ?c4 - car )
    :precondition (and (cycle-4-with-analysis_M ?s1 ?s2 ?s3 ?s4 ) (on_M ?c1 ?s1 ) (on_M ?c2 ?s2 ) (on_M ?c3 ?s3 ) (on_M ?c4 ?s4 ) )
    :effect (and (on_M ?c1 ?s4 ) (on_M ?c2 ?s1 ) (on_M ?c3 ?s2 ) (on_M ?c4 ?s3 ) (analyzed_M ?c1 ) (not (on_M ?c1 ?s1 )) (not (on_M ?c2 ?s2 )) (not (on_M ?c3 ?s3 )) (not (on_M ?c4 ?s4 )) 
 )
  )
  (:action rotate-2_M
    :parameters (?s1 - segment ?s2 - segment ?c1 - car ?c2 - car )
    :precondition (and (cycle-2_M ?s1 ?s2 ) (on_M ?c1 ?s1 ) (on_M ?c2 ?s2 ) )
    :effect (and (on_M ?c1 ?s2 ) (on_M ?c2 ?s1 ) (not (on_M ?c1 ?s1 )) (not (on_M ?c2 ?s2 )) 
 )
  )
  (:action rotate-4_M
    :parameters (?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment ?c1 - car ?c2 - car ?c3 - car ?c4 - car )
    :precondition (and (cycle-4_M ?s1 ?s2 ?s3 ?s4 ) (on_M ?c1 ?s1 ) (on_M ?c2 ?s2 ) (on_M ?c3 ?s3 ) (on_M ?c4 ?s4 ) )
    :effect (and (on_M ?c1 ?s4 ) (on_M ?c2 ?s1 ) (on_M ?c3 ?s2 ) (on_M ?c4 ?s3 ) (not (on_M ?c1 ?s1 )) (not (on_M ?c2 ?s2 )) (not (on_M ?c3 ?s3 )) (not (on_M ?c4 ?s4 )) 
 )
  )
)
