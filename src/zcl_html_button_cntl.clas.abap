CLASS zcl_html_button_cntl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_html_button_cntl .

    ALIASES create_btn
      FOR zif_html_button_cntl~create_btn .
    ALIASES get_btn_by_guid
      FOR zif_html_button_cntl~get_btn_by_guid .
    ALIASES get_instance
      FOR zif_html_button_cntl~get_instance .


    CLASS-METHODS class_constructor .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA t_pointer TYPE zhtml_btn_pointer_tt.
    "! <p class="shorttext synchronized" lang="en">instance</p>
    CLASS-DATA o_instance TYPE REF TO zcl_html_button_cntl.
    METHODS get_obj_btn
      IMPORTING
        i_btn         TYPE zhtml_button
      RETURNING
        VALUE(result) TYPE REF TO zif_html_button.

ENDCLASS.


CLASS zcl_html_button_cntl IMPLEMENTATION.


  METHOD class_constructor.
    o_instance = NEW #(  ).
  ENDMETHOD.

  METHOD get_obj_btn.
    DATA: l_button   TYPE REF TO zif_html_button,
          l_btn      TYPE zhtml_button,
          l_paramtab TYPE abap_parmbind_tab,
          l_param    TYPE abap_parmbind,
          l_pointer  TYPE zhtml_btn_pointer,
          l_index    TYPE sytabix.

    l_btn = i_btn.

    TRY.
        l_btn-guid = cl_system_uuid=>create_uuid_x16_static( ).
      CATCH cx_uuid_error INTO DATA(e_txt).
    ENDTRY.

    " Prepare parameter table
    l_param-name = 'I_BTN'.
    l_param-kind = cl_abap_objectdescr=>exporting.
    GET REFERENCE OF l_btn INTO l_param-value.
    INSERT l_param INTO TABLE l_paramtab.

    TRY.
        CREATE OBJECT l_button
            TYPE ('ZCL_HTML_BUTTON')
            PARAMETER-TABLE l_paramtab.
      CATCH cx_sy_create_object_error.
    ENDTRY.

    READ TABLE t_pointer ASSIGNING FIELD-SYMBOL(<pointer>) WITH KEY guid = l_btn-guid.
    IF sy-subrc <> 0.
      l_index = sy-tabix.
      IF l_index = 0.
        l_index = 1.
      ENDIF.
      l_pointer-guid   = l_btn-guid.
      l_pointer-object = l_button.
      INSERT l_pointer INTO t_pointer INDEX l_index.
    ENDIF.

    result = l_pointer-object.

  ENDMETHOD.


  METHOD zif_html_button_cntl~create_btn.

    result = get_obj_btn( i_btn ).

  ENDMETHOD.


  METHOD zif_html_button_cntl~get_btn_by_guid.
    READ TABLE t_pointer ASSIGNING FIELD-SYMBOL(<pointer>) WITH KEY guid = i_guid.
    IF sy-subrc = 0.
      result = <pointer>-object.
    ENDIF.
  ENDMETHOD.


  METHOD zif_html_button_cntl~get_instance.
    result = o_instance.
  ENDMETHOD.
ENDCLASS.
