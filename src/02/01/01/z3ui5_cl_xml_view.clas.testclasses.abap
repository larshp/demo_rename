CLASS ltcl_unit_test DEFINITION FINAL FOR TESTING
  DURATION MEDIUM
  RISK LEVEL DANGEROUS.

  PRIVATE SECTION.
    METHODS test_create     FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltcl_unit_test IMPLEMENTATION.

  METHOD test_create.

    DATA(lo_view) = z3ui5_cl_xml_view=>factory( ).
    DATA(lv_xml) = lo_view->page( `test` )->stringify( ).

    IF lv_xml IS INITIAL.
      cl_abap_unit_assert=>fail( quit = 5 ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
