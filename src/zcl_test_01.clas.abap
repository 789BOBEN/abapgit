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

    SELECT
    a~*
""""""""CDS的association默认是left outer join ,但是可以指定inner join"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ,\_pro[ INNER ]-product
    ,\_pro-productType
""""CDS的association可以传入参数""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ,\_pro\_ProductTypeName[ language = 'E' AND producttype = 'MAT' ]-MaterialTypeName
    ,\_pro\_MaterialText[ language = @sy-langu ]-ProductDescription
    FROM ZI_table_01 as a
    INTO TABLE @DATA(ls_rs).

""""获取当前日期""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA(lv_data) = utclong_current(  ).
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    GET TIME STAMP FIELD DATA(lv_time).

    out->write( ls_rs ).

  ENDMETHOD.
ENDCLASS.
