CLASS zcl_test_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT a~*
    FROM ztable_01 as a
    into TABLE @DATA(ls_rs).

    DATA(lv_data) = utclong_current(  ).

    out->write( lv_data ).
    out->write( ls_rs ).

  ENDMETHOD.
ENDCLASS.
