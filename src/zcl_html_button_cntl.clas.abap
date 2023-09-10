"! <p class="shorttext synchronized" lang="en">HTML Button CNTL</p>
CLASS zcl_html_button_cntl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_appl_object .
    INTERFACES zif_html_button_cntl .

    ALIASES appl_type
      FOR zif_appl_object~appl_type .
    ALIASES o_appl_message
      FOR zif_appl_object~o_appl_message .
    ALIASES create_btn
      FOR zif_html_button_cntl~create_btn .
    ALIASES get_appl_type
      FOR zif_appl_object~get_appl_type .
    ALIASES get_btn_by_guid
      FOR zif_html_button_cntl~get_btn_by_guid .
    ALIASES set_appl_type
      FOR zif_appl_object~set_appl_type .

    "! <p class="shorttext synchronized" lang="en">CONSTRUCTOR</p>
    METHODS constructor .
  PROTECTED SECTION.
  PRIVATE SECTION.

    "! <p class="shorttext synchronized" lang="en">Button Pointer</p>
    DATA t_pointer TYPE zhtml_btn_pointer_tt .
    DATA o_btn_db TYPE REF TO zif_appl_object_db .

    METHODS get_obj_btn
      IMPORTING
        !i_btn           TYPE zhtml_button
      RETURNING
        VALUE(ro_button) TYPE REF TO zif_html_button .
ENDCLASS.



CLASS ZCL_HTML_BUTTON_CNTL IMPLEMENTATION.


  METHOD constructor.

    o_appl_message = zcl_appl_cntl=>get_appl_message( ).

    o_btn_db ?= zcl_appl_cntl=>get_single_obj( 'HTML_BUTTON_DB' ).

  ENDMETHOD.


  METHOD get_obj_btn.
    DATA: lo_button  TYPE REF TO zif_html_button,
          ls_btn     TYPE zhtml_button,
          lt_param   TYPE abap_parmbind_tab,
          ls_param   TYPE abap_parmbind,
          ls_pointer TYPE zhtml_btn_pointer,
          lv_index   TYPE sytabix.

    ls_btn = i_btn.

    TRY.
        ls_btn-guid = cl_system_uuid=>create_uuid_x16_static( ).
      CATCH cx_uuid_error INTO DATA(e_txt).
    ENDTRY.

    " Prepare parameter table
    ls_param-name = 'I_BTN'.
    ls_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF ls_btn INTO ls_param-value.
    INSERT ls_param INTO TABLE lt_param.

    TRY.
        CREATE OBJECT lo_button
            TYPE ('ZCL_HTML_BUTTON')
            PARAMETER-TABLE lt_param.
      CATCH cx_sy_create_object_error.
    ENDTRY.

    READ TABLE t_pointer ASSIGNING FIELD-SYMBOL(<pointer>) WITH KEY guid = ls_btn-guid.
    IF sy-subrc <> 0.
      lv_index = sy-tabix.
      IF lv_index EQ 0.
        lv_index = 1.
      ENDIF.
      ls_pointer-guid   = ls_btn-guid.
      ls_pointer-object = lo_button.
      INSERT ls_pointer INTO t_pointer INDEX lv_index.
    ENDIF.

    ro_button = ls_pointer-object.

  ENDMETHOD.


  METHOD zif_html_button_cntl~create_btn.

    DATA: lo_button TYPE REF TO zif_html_button.

    lo_button = get_obj_btn( im_btn ).


  ENDMETHOD.


  METHOD zif_html_button_cntl~get_btn_by_guid.


  ENDMETHOD.
ENDCLASS.
