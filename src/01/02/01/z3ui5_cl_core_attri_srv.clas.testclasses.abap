
CLASS ltcl_test_app2 DEFINITION FINAL FOR TESTING
  DURATION MEDIUM
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.

    DATA mv_value TYPE string ##NEEDED.
    DATA mr_value TYPE REF TO data.
    DATA mr_value2 TYPE REF TO data.
    DATA mo_app TYPE REF TO ltcl_test_app2.

    DATA xx TYPE string ##NEEDED.
    METHODS constructor.
ENDCLASS.

CLASS ltcl_test_app2 IMPLEMENTATION.

  METHOD constructor.

  ENDMETHOD.

ENDCLASS.



CLASS ltcl_test_search_attri DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS first_test FOR TESTING RAISING cx_static_check.
    METHODS second_test FOR TESTING RAISING cx_static_check.
    METHODS third_test FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS z3ui5_cl_core_attri_srv DEFINITION LOCAL FRIENDS ltcl_test_search_attri.

CLASS ltcl_test_search_attri IMPLEMENTATION.

  METHOD first_test.

    DATA(lo_app_client) = NEW ltcl_test_app2( ).
    DATA lr_value TYPE REF TO data.
    GET REFERENCE OF lo_app_client->mv_value INTO lr_value.

    DATA(lt_attri) = VALUE z3ui5_if_core_types=>ty_t_attri( (
        r_ref = lr_value
        o_typedescr = cl_abap_datadescr=>describe_by_data_ref( lr_value )
         ) ).

    DATA(lo_model) = NEW z3ui5_cl_core_attri_srv(
      attri = REF #( lt_attri )
      app   = lo_app_client ).

    DATA(lr_attri) = lo_model->attri_search_a_dissolve( REF #( lo_app_client->mv_value ) ).

    IF lr_attri->r_ref <> lr_value.
      cl_abap_unit_assert=>abort( ).
    ENDIF.

  ENDMETHOD.

  METHOD second_test.

    DATA(lo_app_client) = NEW ltcl_test_app2( ).
    DATA lr_value TYPE REF TO data.
    GET REFERENCE OF lo_app_client->mv_value INTO lr_value.

    DATA(lt_attri) = VALUE z3ui5_if_core_types=>ty_t_attri( (
         r_ref = REF #( lo_app_client->mv_value )
          o_typedescr = cl_abap_datadescr=>describe_by_data_ref( lr_value )
         ) ).

    DATA(lo_model) = NEW z3ui5_cl_core_attri_srv(
      attri = REF #( lt_attri )
      app   = lo_app_client ).

    DATA(lr_attri) = lo_model->attri_search_a_dissolve( REF #( lo_app_client->mv_value ) ).

    IF lr_attri->r_ref <> lr_value.
      cl_abap_unit_assert=>abort( ).
    ENDIF.

  ENDMETHOD.

  METHOD third_test.

    DATA(lo_app_client) = NEW ltcl_test_app2( ).
    DATA lr_value TYPE REF TO data.
    GET REFERENCE OF lo_app_client->mv_value INTO lr_value.

    lo_app_client->mo_app = NEW #( ).

    DATA(lt_attri) = VALUE z3ui5_if_core_types=>ty_t_attri(
       ( name = `1` r_ref = REF #( lo_app_client->mr_value ) )
       ( name = `4` r_ref = REF #( lo_app_client->mr_value2 ) )
       ( name = `2` r_ref = REF #( lo_app_client->mo_app  ) )
       ( name = `3` r_ref = REF #( lo_app_client->mv_value ) ) ).

    DATA(lr_attri) = REF #( lt_attri[ r_ref = lr_value ] ).
    IF lr_attri->r_ref <> lr_value.
      cl_abap_unit_assert=>abort( ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.


CLASS ltcl_test_app_sub DEFINITION FINAL FOR TESTING
  DURATION MEDIUM
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.

    DATA mv_value TYPE string ##NEEDED.
    DATA mr_value TYPE REF TO string.
*    DATA mr_value2 TYPE REF TO data.

    METHODS constructor.
ENDCLASS.

CLASS ltcl_test_app_sub IMPLEMENTATION.

  METHOD constructor.

  ENDMETHOD.

ENDCLASS.

CLASS ltcl_test_app3 DEFINITION FINAL FOR TESTING
  DURATION MEDIUM
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.

    DATA mv_value TYPE string ##NEEDED.
    DATA mr_value TYPE REF TO string.
*    DATA mr_value2 TYPE REF TO data.
    DATA mo_app TYPE REF TO ltcl_test_app_sub.

    METHODS constructor.
ENDCLASS.

CLASS ltcl_test_app3 IMPLEMENTATION.

  METHOD constructor.
    mo_app = NEW #( ).
  ENDMETHOD.

ENDCLASS.

CLASS ltcl_test_get_attri DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS first_test FOR TESTING RAISING cx_static_check.
    METHODS second_test FOR TESTING RAISING cx_static_check.
    METHODS third_test FOR TESTING RAISING cx_static_check.
    METHODS test4 FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltcl_test_get_attri IMPLEMENTATION.

  METHOD first_test.

    DATA(lo_app_client) = NEW ltcl_test_app3( ).
    DATA lr_value TYPE REF TO data.
    GET REFERENCE OF lo_app_client->mv_value INTO lr_value.

    DATA(lt_attri) = VALUE z3ui5_if_core_types=>ty_t_attri( ).

    DATA(lo_model) = NEW z3ui5_cl_core_attri_srv(
      attri = REF #( lt_attri )
      app   = lo_app_client ).

    DATA(lr_attri) = lo_model->attri_get_val_ref( `MV_VALUE` ).

    IF REF #( lo_app_client->mv_value ) <> lr_attri.
      cl_abap_unit_assert=>abort( ).
    ENDIF.

  ENDMETHOD.

  METHOD second_test.

    DATA(lo_app_client) = NEW ltcl_test_app3( ).
    CREATE DATA lo_app_client->mr_value.

    DATA(lt_attri) = VALUE z3ui5_if_core_types=>ty_t_attri( ).
    DATA(lo_model) = NEW z3ui5_cl_core_attri_srv(
      attri = REF #( lt_attri )
      app   = lo_app_client ).

    DATA(lr_attri) = lo_model->attri_get_val_ref( `MR_VALUE->*` ).

    IF lr_attri <> lo_app_client->mr_value.
      cl_abap_unit_assert=>abort( ).
    ENDIF.

  ENDMETHOD.

  METHOD third_test.

    DATA(lo_app_client) = NEW ltcl_test_app3( ).

    DATA(lt_attri) = VALUE z3ui5_if_core_types=>ty_t_attri( ).
    DATA(lo_model) = NEW z3ui5_cl_core_attri_srv(
      attri = REF #( lt_attri )
      app   = lo_app_client ).

    DATA(lr_attri) = lo_model->attri_get_val_ref( `MO_APP->MV_VALUE` ).

    IF REF #( lo_app_client->mo_app->mv_value ) <> lr_attri.
      cl_abap_unit_assert=>abort( ).
    ENDIF.

  ENDMETHOD.

  METHOD test4.

    DATA(lo_app_client) = NEW ltcl_test_app3( ).
    CREATE DATA lo_app_client->mo_app->mr_value.

    DATA(lt_attri) = VALUE z3ui5_if_core_types=>ty_t_attri( ).
    DATA(lo_model) = NEW z3ui5_cl_core_attri_srv(
      attri = REF #( lt_attri )
      app   = lo_app_client ).

    DATA(lr_attri) = lo_model->attri_get_val_ref( `MO_APP->MR_VALUE->*` ).

    IF lr_attri <> lo_app_client->mo_app->mr_value.
      cl_abap_unit_assert=>abort( ).
    ENDIF.

  ENDMETHOD.


ENDCLASS.
