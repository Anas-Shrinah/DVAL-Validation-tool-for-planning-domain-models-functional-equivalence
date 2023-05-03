;Child-snack with deleted operator ## Delete operator ## Yes ## The operator ``put_on_tray'' is removed from this modified domain, this operator exists in the original domain.
 
(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
 
  (:types
    child
    bread-portion
    content-portion
    sandwich
    tray
    place
  )
 
  (:predicates
    (at_kitchen_bread_M ?b - bread-portion )
    (at_kitchen_content_M ?c - content-portion )
    (at_kitchen_sandwich_M ?s - sandwich )
    (at_kitchen_tray_M ?t - tray )
    (no_gluten_bread_M ?b - bread-portion )
    (no_gluten_content_M ?c - content-portion )
    (ontray_M ?s - sandwich ?t - tray )
    (no_gluten_sandwich_M ?s - sandwich )
    (allergic_gluten_M ?c - child )
    (not_allergic_gluten_M ?c - child )
    (served_M ?c - child )
    (waiting_M ?c - child ?p - place )
    (at_M ?t - tray ?p - place )
    (notexist_M ?s - sandwich )
  )
 
  (:action make_sandwich_no_gluten_M
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion )
    :precondition (and (at_kitchen_bread_M ?b ) (at_kitchen_content_M ?c ) (no_gluten_bread_M ?b ) (no_gluten_content_M ?c ) (notexist_M ?s ) )
    :effect (and (at_kitchen_sandwich_M ?s ) (no_gluten_sandwich_M ?s ) (not (at_kitchen_bread_M ?b )) (not (at_kitchen_content_M ?c )) (not (notexist_M ?s )) 
 )
  )
  (:action make_sandwich_M
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion )
    :precondition (and (at_kitchen_bread_M ?b ) (at_kitchen_content_M ?c ) (notexist_M ?s ) )
    :effect (and (at_kitchen_sandwich_M ?s ) (not (at_kitchen_bread_M ?b )) (not (at_kitchen_content_M ?c )) (not (notexist_M ?s )) 
 )
  )
  (:action serve_sandwich_no_gluten_M
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place )
    :precondition (and (allergic_gluten_M ?c ) (ontray_M ?s ?t ) (waiting_M ?c ?p ) (no_gluten_sandwich_M ?s ) (at_M ?t ?p ) )
    :effect (and (served_M ?c ) (not (ontray_M ?s ?t )) 
 )
  )
  (:action serve_sandwich_M
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place )
    :precondition (and (not_allergic_gluten_M ?c ) (waiting_M ?c ?p ) (ontray_M ?s ?t ) (at_M ?t ?p ) )
    :effect (and (served_M ?c ) (not (ontray_M ?s ?t )) 
 )
  )
  (:action move_tray_M
    :parameters (?t - tray ?p1 - place ?p2 - place )
    :precondition (and (at_M ?t ?p1 ) )
    :effect (and (at_M ?t ?p2 ) (not (at_M ?t ?p1 )) 
 )
  )
)
