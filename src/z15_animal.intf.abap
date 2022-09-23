interface Z15_ANIMAL
  public .
  DATA:
    name TYPE C LENGTH 20,
    is_hungry TYPE abap_bool,
    gender TYPE C LENGTH 1,
    color TYPE C LENGTH 20,
    food_eaten TYPE TABLE OF string.
  METHODS:
    eat
        IMPORTING food TYPE string
        EXCEPTIONS food_invalid,
    move
        EXCEPTIONS too_hungry,
    sleep
        EXCEPTIONS died.

endinterface.
