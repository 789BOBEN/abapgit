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


    " Create an additional component assigned to an operation:

    MODIFY ENTITIES OF i_productionordertp
    ENTITY productionorderoperation
    CREATE BY \_operationcomponent
    AUTO FILL CID
    FIELDS (
    material
    billofmaterialitemcategory
    requiredquantity
    baseunit
    )
    WITH VALUE #(
    (
    %key-orderinternalid = '0000000761'
    %key-orderoperationinternalid = '00000001'
    %target = VALUE #(
    (
    %data-material = 'W141999999015'
    %data-billofmaterialitemcategory = 'L'
    %data-requiredquantity = 10
    %data-baseunit = 'KG'
    )
    (
    %data-material = 'W141999999014'
    %data-billofmaterialitemcategory = 'L'
    %data-requiredquantity = 5
    %data-baseunit = 'KG'
    )

    )
    )
    )
    FAILED DATA(failed)
    REPORTED DATA(reported)
    MAPPED DATA(mapped).

    IF failed IS INITIAL.
      COMMIT ENTITIES
   RESPONSES
   FAILED DATA(failed_commit22)
   REPORTED DATA(reported_commit22).
    ELSE.
      ROLLBACK ENTITIES.
    ENDIF.


    " Update the required quantity of a component:
*
*
*    MODIFY ENTITIES OF i_productionordertp
*    ENTITY productionordercomponent
*    UPDATE FIELDS ( requiredquantity )
*    WITH VALUE #(
*    (
*    %key-reservation = '0012345678'
*    %key-reservationitem = '0001'
*    %key-reservationrecordtype = ''
*    %data-requiredquantity = 100
*    )
*    )
*    FAILED DATA(failed12)
*    REPORTED DATA(reported12)
*    MAPPED DATA(mapped12).
*
*    IF failed IS INITIAL.
*      " No errors occurred
*      COMMIT ENTITIES
*      RESPONSES
*      FAILED DATA(failed_commit)
*      REPORTED DATA(reported_commit).
*    ELSE.
*      ROLLBACK ENTITIES.
*    ENDIF.

    READ ENTITIES OF i_producttp_2
        ENTITY product
            ALL FIELDS WITH VALUE #( (  %key-product = 'TEST_PRODUCT' ) )"W399211111069 TEST_PRODUCT
            RESULT DATA(lt_result)
        ENTITY ProductDescription
            ALL FIELDS WITH VALUE #( ( %key-product = 'TEST_PRODUCT22' Language = sy-langu ) )
            RESULT DATA(lt_rs_text)


    FAILED DATA(lt_failed)
    .

    IF lt_failed IS NOT INITIAL.

      LOOP AT lt_failed-product ASSIGNING FIELD-SYMBOL(<fs_fail>).

        DATA(va)  = <fs_fail>-%fail.
        out->write( va-cause ).

      ENDLOOP.

      LOOP AT lt_failed-ProductDescription ASSIGNING FIELD-SYMBOL(<fs_fail1>).

        DATA(va1)  = <fs_fail1>-%fail.
        out->write( va1-cause ).

      ENDLOOP.


    ENDIF.

    DATA lv_order TYPE vbeln VALUE '00001234'.
    DATA lv_aufnr TYPE aufnr VALUE '12345'.

    lv_order = |{ lv_order ALPHA = OUT }|.

    lv_aufnr = |{ lv_aufnr ALPHA = IN }|.

    DATA(lv_order_number) = CONV aufnr( 12345 ).



    IF lt_result IS NOT INITIAL.

      LOOP AT lt_result ASSIGNING FIELD-SYMBOL(<ls_result>).

        "APPEND VALUE #( %tky = <ls_result>-%tky

        "%param = CORRESPONDING #( <ls_result> ) ) TO DATA(rs).

      ENDLOOP.
    ENDIF.



  ENDMETHOD.
ENDCLASS.
