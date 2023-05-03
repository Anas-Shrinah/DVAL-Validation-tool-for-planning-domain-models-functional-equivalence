;Scanalyzer with random invalid macro ## Add invalid macro ## Yes ## The invalid macro operator ``analyze-2-analyze-4-rotate-2'' is added to this domain. This invalid macro is produced from a valid macro by swapping the add effect (analyzed ?x5) from the original valid macro by the precondition (on ?x6 ?x2) from the same valid macro.
 
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
 
  (:action analyze-2_M
    :parameters (?s1 - segment ?s2 - segment ?c1 - car ?c2 - car )
    :precondition (and (cycle-2-with-analysis_M ?s1 ?s2 ) (on_M ?c1 ?s1 ) (on_M ?c2 ?s2 ) )
    :effect (and (on_M ?c1 ?s2 ) (on_M ?c2 ?s1 ) (analyzed_M ?c1 ) (not (on_M ?c1 ?s1 )) (not (on_M ?c2 ?s2 )) 
 )
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
  (:action analyze-2-analyze-4-rotate-2_M
    :parameters (?x1 - segment ?x2 - segment ?x5 - car ?x6 - car ?x4 - segment ?x3 - segment ?x8 - car ?x7 - car )
    :precondition (and (cycle-2-with-analysis_M ?x1 ?x2 ) (on_M ?x5 ?x1 ) (cycle-4-with-analysis_M ?x4 ?x3 ?x2 ?x1 ) (on_M ?x8 ?x4 ) (on_M ?x7 ?x3 ) (cycle-2_M ?x3 ?x2 ) (analyzed_M ?x5 ) )
    :effect (and (on_M ?x8 ?x1 ) (on_M ?x7 ?x4 ) (analyzed_M ?x8 ) (on_M ?x5 ?x2 ) (on_M ?x6 ?x3 ) (on_M ?x6 ?x2 ) (not (on_M ?x5 ?x1 )) (not (on_M ?x8 ?x4 )) (not (on_M ?x7 ?x3 )) (not (on_M ?x6 ?x1 )) (not (on_M ?x5 ?x3 )) (not (on_M ?x6 ?x2 )) 
 )
  )
)
