CLASS zcl_test_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    READ ENTITIES OF i_producttp_2
        ENTITY product
            ALL FIELDS WITH VALUE #( (  %key-product = 'W399211111069' ) )
            RESULT DATA(lt_result)
        ENTITY ProductDescription
            ALL FIELDS WITH VALUE #( ( %key-product = 'W399211111069' Language = sy-langu ) )
            RESULT DATA(lt_rs_text)


    FAILED DATA(lt_failed)

    .

   DATA lv_order TYPE VBELN VALUE '00001234'.
   DATA LV_AUFNR TYPE aufnr VALUE '12345'.

   lv_order = |{ lv_order ALPHA = OUT }|.

   LV_AUFNR = |{ LV_AUFNR ALPHA = IN }|.

   DATA(lv_order_number) = CONV aufnr( 12345 ).



    IF lt_result IS NOT INITIAL.

      LOOP AT lt_result ASSIGNING FIELD-SYMBOL(<ls_result>).

        "APPEND VALUE #( %tky = <ls_result>-%tky

        "%param = CORRESPONDING #( <ls_result> ) ) TO DATA(rs).

      ENDLOOP.
    ENDIF.



  ENDMETHOD.
ENDCLASS.
