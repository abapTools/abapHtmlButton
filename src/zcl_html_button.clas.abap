"! <p class="shorttext synchronized" lang="en">HTML Button</p>
CLASS zcl_html_button DEFINITION
  PUBLIC
  CREATE PUBLIC .

PUBLIC SECTION.

  INTERFACES zif_html_button .

  ALIASES get_btn_fields
    FOR zif_html_button~get_btn_fields .
  ALIASES get_btn_type
    FOR zif_html_button~get_btn_type .
  ALIASES set_active
    FOR zif_html_button~set_active .

  TYPES:
    ty_html_table TYPE STANDARD TABLE OF text1000 .

    "! <p class="shorttext synchronized" lang="en">CONSTRUCTOR</p>
  METHODS constructor
    IMPORTING
      !i_btn TYPE zhtml_button .
  PROTECTED SECTION.
PRIVATE SECTION.

  DATA mt_events TYPE cntl_simple_events .
  DATA:
    ms_event       LIKE LINE OF mt_events .
  DATA:
    mt_html        TYPE STANDARD TABLE OF text1000
                                   WITH NON-UNIQUE DEFAULT KEY .
  DATA:
    mv_html        LIKE LINE OF mt_html .
  DATA mv_url TYPE text1000 .
  DATA mv_color TYPE string .
  DATA mo_container TYPE REF TO cl_gui_container .
  DATA mo_html TYPE REF TO cl_gui_html_viewer .
  DATA mv_inactive TYPE char01 .
  "! <p class="shorttext synchronized" lang="en">HTML Button</p>
  DATA s_btn TYPE zhtml_button .
  "! <p class="shorttext synchronized" lang="en">HTML Button Fields</p>
  DATA s_btn_fields TYPE zhtml_button_fields .

  METHODS handle_sapevent
    FOR EVENT sapevent OF cl_gui_html_viewer
    IMPORTING
      !action
      !frame
      !getdata
      !postdata
      !query_table .
  METHODS build_html_code
    IMPORTING
      !iv_text TYPE clike
      !iv_color TYPE clike
      !iv_ok_code TYPE clike
    CHANGING
      !ct_html TYPE ty_html_table .
  METHODS read_btn_db
    IMPORTING
      !i_btn_type TYPE zhtml_button-btn_type .
  METHODS set_controls .
  METHODS set_btn_color .
ENDCLASS.



CLASS ZCL_HTML_BUTTON IMPLEMENTATION.


  METHOD build_html_code.
    DATA lv_html LIKE LINE OF ct_html.

    CONCATENATE
        '<html>'
        '<head><title>BUTTON</title>'
        '<style type="text/css">'
        'body {overflow:hidden; margin:0; }'
        'input.bgcolor { background-color:'
        iv_color
        '; width: 100%; height: 100%; font-size:large; }'
        '</style>'
        '</head>'
        '<body>'
        '<input class="bgcolor" type="button" value="'
        iv_text'" onclick="location.href=''SAPEVENT:'
        iv_ok_code'''"></body>'
        '</html>'
        INTO lv_html.
    APPEND lv_html TO ct_html.

  ENDMETHOD.


  METHOD constructor.

    DATA: lt_events TYPE cntl_simple_events,
          ls_event  LIKE LINE OF lt_events,
          lt_html   TYPE ty_html_table,
          lv_url    TYPE text1000.

    s_btn = i_btn.

    set_controls( ).


*== check if container is bound
    CHECK s_btn-container IS BOUND.

    read_btn_db( i_btn-btn_type ).

    set_btn_color( ).

**== create HTML control
    CREATE OBJECT mo_html
      EXPORTING
        parent = s_btn-container.

    CHECK mo_html IS BOUND.

*== Register SAPEVENT
    CALL METHOD mo_html->get_registered_events
      IMPORTING
        events = lt_events.
    ls_event-eventid    = cl_gui_html_viewer=>m_id_sapevent.
    ls_event-appl_event = ' '.
    READ TABLE lt_events TRANSPORTING NO FIELDS WITH KEY eventid = ls_event-eventid.
    IF sy-subrc <> 0.
      APPEND ls_event TO lt_events.
      mo_html->set_registered_events( lt_events ).
    ENDIF.

    SET HANDLER handle_sapevent FOR mo_html.

*== build HTML code for Button
    CALL METHOD build_html_code
      EXPORTING
        iv_text    = s_btn_fields-btn_text
        iv_color   = s_btn_fields-btn_color
        iv_ok_code = s_btn_fields-ok_code
      CHANGING
        ct_html    = lt_html.

*== load created HTML code into HTML control
    CALL METHOD mo_html->load_data
      IMPORTING
        assigned_url = lv_url
      CHANGING
        data_table   = lt_html.

*== show HTML page
    mo_html->show_url( lv_url ).

  ENDMETHOD.


  METHOD handle_sapevent.
*== data
    DATA ucomm TYPE syucomm.

*== button active?
    CHECK mv_inactive = space.

*== cast user command
    ucomm = action.
*== set user command
    cl_gui_cfw=>set_new_ok_code( ucomm ).
  ENDMETHOD.


  METHOD read_btn_db.
    SELECT SINGLE * FROM zhtml_btn_types INTO CORRESPONDING FIELDS OF s_btn_fields WHERE type EQ i_btn_type.
  ENDMETHOD.


  METHOD set_btn_color.

    IF s_btn_fields-btn_color IS INITIAL.
*== set default color
      s_btn_fields-btn_color = '#F2E1AF'.
    ENDIF.

  ENDMETHOD.


  METHOD set_controls.

*    DATA lr_container TYPE REF TO cl_gui_container.

    IF s_btn-cc_name <> space AND s_btn-container IS INITIAL.
*== create custom container
      CREATE OBJECT s_btn-container
        TYPE
        cl_gui_custom_container
        EXPORTING
          container_name = s_btn-cc_name.
*    ELSE.
**== use given container
*      lr_container = s_btn-container.
    ENDIF.
  ENDMETHOD.


  METHOD zif_html_button~get_btn_fields.

  ENDMETHOD.


  METHOD zif_html_button~get_btn_type.

  ENDMETHOD.


  METHOD zif_html_button~set_active.

    DATA lt_html             TYPE ty_html_table.
    DATA lv_url              TYPE text1000.

*== set flag for handler
    mv_inactive = ''.

*== build HTML code for Button
    CALL METHOD build_html_code
      EXPORTING
        iv_text    = s_btn_fields-btn_text
        iv_color   = 'grey'
        iv_ok_code = s_btn_fields-ok_code
      CHANGING
        ct_html    = lt_html.

*== load created HTML code into HTML control
    CALL METHOD mo_html->load_data
      IMPORTING
        assigned_url = lv_url
      CHANGING
        data_table   = lt_html.

*== show HTML page
    mo_html->show_url( lv_url ).
  ENDMETHOD.


  method ZIF_HTML_BUTTON~SET_INACTIVE.
      DATA lt_html             TYPE ty_html_table.
    DATA lv_url              TYPE text1000.

*== set flag for handler
    mv_inactive = 'X'.

*== build HTML code for Button
    CALL METHOD build_html_code
      EXPORTING
        iv_text    = s_btn_fields-btn_text
        iv_color   = 'grey'
        iv_ok_code = s_btn_fields-ok_code
      CHANGING
        ct_html    = lt_html.

*== load created HTML code into HTML control
    CALL METHOD mo_html->load_data
      IMPORTING
        assigned_url = lv_url
      CHANGING
        data_table   = lt_html.

*== show HTML page
    mo_html->show_url( lv_url ).
  endmethod.
ENDCLASS.
