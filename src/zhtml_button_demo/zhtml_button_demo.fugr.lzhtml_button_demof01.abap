*----------------------------------------------------------------------*
***INCLUDE LZHTML_BUTTON_DEMOF01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form init_html_buttons
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM init_html_buttons .
  DATA: ls_btn TYPE zhtml_button .
  STATICS created.

  CHECK created IS INITIAL.


  IF mo_btn_cntl IS NOT BOUND.
    CREATE OBJECT mo_btn_cntl.
  ENDIF.

  ls_btn-btn_type = 'DEMO1'.
  ls_btn-cc_name = 'CONT_01'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'DEMO2'.
  ls_btn-cc_name = 'CONT_02'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'DEMO3'.
  ls_btn-cc_name = 'CONT_03'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'DEMO4'.
  ls_btn-cc_name = 'CONT_04'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'DEMO5'.
  ls_btn-cc_name = 'CONT_05'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'DEMO6'.
  ls_btn-cc_name = 'CONT_06'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'DEMO7'.
  ls_btn-cc_name = 'CONT_07'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  created = abap_true.

ENDFORM.
