CLASS z15_dove DEFINITION INHERITING FROM z15_Bird
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  PRIVATE SECTION.

  DATA volume TYPE i.

  Methods:

    shit
        IMPORTING
            person TYPE REF TO z15_person,

    curr
        RETURNING VALUE(l_curr) TYPE STRING.





ENDCLASS.



CLASS z15_dove IMPLEMENTATION.


  METHOD curr.
        DO volume TIMES.
            WRITE 'Gurrr'.
        ENDDO.
  ENDMETHOD.

  METHOD shit.
        WRITE:  'nperson',
                'wird schmutzig',
                'nperson',
                'ist jetzt angepisst.'.

        person->set_is_pissed( abap_true ).
  ENDMETHOD.



ENDCLASS.
