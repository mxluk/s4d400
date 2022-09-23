CLASS z15_person DEFINITION
  PUBLIC.

  PUBLIC SECTION.

    METHODS:
     stumble
        IMPORTING wasPushed TYPE abap_bool,
     get_is_pissed
        RETURNING VALUE(is_pissed_temp) TYPE abap_bool,
     set_is_pissed
        IMPORTING is_pissed_temp TYPE abap_bool.

*      feed
*
*      curse

  PROTECTED SECTION.
     DATA: name TYPE c LENGTH 20,
           is_pissed TYPE abap_bool,
           items TYPE TABLE OF string.

  PRIVATE SECTION.
ENDCLASS.

CLASS z15_person IMPLEMENTATION.



  METHOD stumble.
    is_pissed = abap_true.
    WRITE 'Ouch D:'.
    IF wasPushed = abap_true.
        WRITE 'Fuck Off!'.
    ENDIF.
  ENDMETHOD.

  METHOD get_is_pissed.
    is_pissed_temp = is_pissed.
  ENDMETHOD.

  METHOD set_is_pissed.
    is_pissed = is_pissed_temp.
  ENDMETHOD.

ENDCLASS.
