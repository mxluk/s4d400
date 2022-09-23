CLASS z15_shark DEFINITION INHERITING FROM z15_fish
  PUBLIC

    .

  PUBLIC SECTION.
    METHODS:
    constructor
        IMPORTING
            name TYPE C
            gender TYPE C
            color TYPE C
            teeth TYPE I.
  PRIVATE SECTION.

    DATA: teeth TYPE i.


    METHODS bite
      IMPORTING
        person TYPE REF TO z15_person
        animal TYPE REF TO z15_animal.

ENDCLASS.

CLASS z15_shark IMPLEMENTATION.

  METHOD bite.

    IF person->get_is_pissed( ) EQ abap_false AND z15_animal~is_hungry EQ abap_true.
      WRITE: 'nperson',
             'wird gebissen',
             'nperson',
             'ist jetzt pissed',
             'der Hai ist nicht mehr hungrig.'.
        z15_animal~is_hungry = abap_false.
        person->set_is_pissed( abap_true ).
    ENDIF.

  ENDMETHOD.

  METHOD constructor.
    super->constructor( name = name gender = gender color = color ).
    me->teeth = teeth.

  ENDMETHOD.

ENDCLASS.

