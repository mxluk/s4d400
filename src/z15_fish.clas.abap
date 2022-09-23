CLASS z15_fish DEFINITION
    PUBLIC
  ABSTRACT.

  PUBLIC SECTION.
  INTERFACES z15_animal.

  METHODS:
    dive
        IMPORTING change TYPE I
        EXCEPTIONS died negative_change too_hungry,
    dive_up
        IMPORTING change TYPE I
        EXCEPTIONS died negative_change too_hungry,
    constructor
        IMPORTING
            name TYPE C
            gender TYPE C
            color TYPE C.
  PROTECTED SECTION.
  DATA:
    vegetarian TYPE abap_bool,
    depth TYPE I.
ENDCLASS.



CLASS z15_fish IMPLEMENTATION.
  METHOD dive.
    IF depth + change > 200.
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

    ADD change TO depth.
  ENDMETHOD.

  METHOD dive_up.
    IF depth - change < 0.
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

    SUBTRACT change FROM depth.
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
    z15_animal~color = color.
    z15_animal~name = name.
    z15_animal~gender = gender.
    z15_animal~is_hungry = abap_true.

  ENDMETHOD.

ENDCLASS.
