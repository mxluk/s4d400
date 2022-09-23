CLASS z15_mammal DEFINITION
  PUBLIC
  ABSTRACT
   .

  PUBLIC SECTION.
    INTERFACES z15_animal.
  METHODS:
    feed_offspring
        IMPORTING
            food TYPE string
        EXCEPTIONS food_invalid,
    make_new ABSTRACT
        RETURNING VALUE(a) TYPE REF TO z15_mammal.
  CLASS-METHODS:
    make_child
        IMPORTING
            mammal1 TYPE REF TO z15_mammal
            mammal2 TYPE REF TO z15_mammal
        EXCEPTIONS unsuccessful same_sex,
    give_birth
        IMPORTING
            mammal1 TYPE REF TO z15_mammal
            mammal2 TYPE REF TO z15_mammal
        EXCEPTIONS too_hungry not_pregnant.
  PROTECTED SECTION.
  DATA:
    blood_temperature TYPE I,
    mother TYPE REF TO z15_mammal,
    father TYPE REF TO z15_mammal,
    children TYPE TABLE OF REF TO z15_mammal,
    is_pregnant TYPE abap_bool.

ENDCLASS.



CLASS z15_mammal IMPLEMENTATION.
  METHOD z15_animal~eat.
    z15_animal~food_eaten = VALUE #( BASE z15_animal~food_eaten ( food ) ).
    z15_animal~is_hungry = abap_false.
  ENDMETHOD.

  METHOD feed_offspring.
    DATA child TYPE REF TO z15_animal.
    LOOP AT children INTO child.
        child->eat( food ).
    ENDLOOP.
  ENDMETHOD.

  METHOD give_birth.
    DATA mother TYPE REF TO z15_mammal.
    IF mammal1->z15_animal~gender = 'F'.
        mother = mammal1.
    ELSE.
        mother = mammal2.
    ENDIF.
    IF mother->is_pregnant = abap_false.
        RAISE not_pregnant.
        RETURN.
    ENDIF.
    DATA(child) = mother->make_new(  ).
    child->mother = mother.
    child->father = mammal2.
    mother->children = VALUE #( BASE mother->children ( child ) ).
    mammal2->children = VALUE #( BASE mammal2->children ( child ) ).
    """"""""""""""""""""""""""""""""""""""""""""""""""""
  ENDMETHOD.

  METHOD make_child.
    IF mammal1->z15_animal~gender = mammal2->z15_animal~gender.
        RAISE same_sex.
        RETURN.
    ENDIF.
    IF mammal1->z15_animal~gender = 'F'.
        mammal1->is_pregnant = abap_true.
    ELSE.
        mammal2->is_pregnant = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD z15_animal~move.
    IF z15_animal~is_hungry = abap_true.
        RAISE too_hungry.
        RETURN.
    ENDIF.
    z15_animal~is_hungry = abap_true.
  ENDMETHOD.

  METHOD z15_animal~sleep.
    IF z15_animal~is_hungry = abap_true.
        RAISE died.
        RETURN.
    ENDIF.
    z15_animal~is_hungry = abap_true.
  ENDMETHOD.

ENDCLASS.
