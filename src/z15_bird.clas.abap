CLASS z15_bird DEFINITION
  ABSTRACT
  PUBLIC.

  PUBLIC SECTION.
    INTERFACES z15_animal.

    METHODS:
        constructor
        IMPORTING span_temp TYPE p height_temp TYPE i name TYPE c color TYPE c gender TYPE c,
        fly_Down
        Importing change TYPE i
        EXCEPTIONS died negative_change too_hungry,
        fly_Up
        Importing change TYPE i
        EXCEPTIONS died negative_change too_hungry.

  PROTECTED SECTION.
    DATA:
            span TYPE p LENGTH 6 DECIMALS 2,
            height TYPE i.

  PRIVATE SECTION.
ENDCLASS.

CLASS z15_bird IMPLEMENTATION.

  METHOD fly_Up.
    IF height + change > 20000.
        RAISE died.
        RETURN.
    ENDIF.

    IF change < 0.
        RAISE negative_change.
        RETURN.
    ENDIF.

    IF z15_animal~is_hungry = abap_true.
        RAISE too_hungry.
        RETURN.
    ENDIF.

    ADD change TO height.
  ENDMETHOD.

  METHOD fly_Down.
    IF height - change < 0.
        RAISE died.
        RETURN.
    ENDIF.

    IF change < 0.
        RAISE negative_change.
        RETURN.
    ENDIF.

    IF z15_animal~is_hungry = abap_true.
        RAISE too_hungry.
        RETURN.
    ENDIF.

    SUBTRACT change FROM height.
  ENDMETHOD.

  METHOD z15_animal~eat.
    z15_animal~food_eaten = VALUE #( BASE z15_animal~food_eaten ( food ) ).
    z15_animal~is_hungry = abap_false.
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

  METHOD constructor.
    z15_animal~name = name.
    z15_animal~gender = gender.
    z15_animal~color = color.
    span = span_temp.
    height = height_temp.

  ENDMETHOD.

ENDCLASS.
