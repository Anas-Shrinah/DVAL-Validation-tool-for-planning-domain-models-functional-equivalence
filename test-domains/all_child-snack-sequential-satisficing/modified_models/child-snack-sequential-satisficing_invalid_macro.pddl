;Child-snack with random invalid macro ## Add invalid macro ## Yes ## The invalid macro operator ``make_sandwich_no_gluten-put_on_tray-serve_sandwich_no_gluten'' is added to this domain. This invalid macro is produced from a valid macro by swapping the add effect (no_gluten_sandwich ?x3) from the original valid macro by the precondition (allergic_gluten_M ?x7) from the same valid macro.
 
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
  (:action put_on_tray_M
    :parameters (?s - sandwich ?t - tray )
    :precondition (and (at_kitchen_sandwich_M ?s ) (at_kitchen_tray_M ?t ) )
    :effect (and (ontray_M ?s ?t ) (not (at_kitchen_sandwich_M ?s )) 
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
  (:action make_sandwich_no_gluten-put_on_tray-serve_sandwich_no_gluten_M
    :parameters (?x3 - sandwich ?x2 - bread-portion ?x1 - content-portion ?x4 - tray ?x7 - child ?x5 - place )
    :precondition (and (at_kitchen_bread_M ?x2 ) (at_kitchen_content_M ?x1 ) (no_gluten_bread_M ?x2 ) (no_gluten_content_M ?x1 ) (notexist_M ?x3 ) (at_kitchen_tray_M ?x4 ) (no_gluten_sandwich_M ?x3 )  (waiting_M ?x7 ?x5 ) (at_M ?x4 ?x5 ) )
    :effect (and (served_M ?x7 ) (allergic_gluten_M ?x7 ) (not (at_kitchen_content_M ?x1 )) (not (notexist_M ?x3 )) (not (at_kitchen_sandwich_M ?x3 )) (not (ontray_M ?x3 ?x4 )) (not (at_kitchen_bread_M ?x2 ) ) 
 )
  )
)
