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
  ls_btn-cc_name  = 'CONT_01'.
  ls_btn-ok_code  = 'DEMO1'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'DEMO2'.
  ls_btn-cc_name = 'CONT_02'.
  ls_btn-ok_code  = 'DEMO2'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'DEMO3'.
  ls_btn-cc_name = 'CONT_03'.
  ls_btn-ok_code  = 'DEMO3'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'DEMO4'.
  ls_btn-cc_name = 'CONT_04'.
  ls_btn-ok_code  = 'DEMO4'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'DEMO5'.
  ls_btn-cc_name = 'CONT_05'.
  ls_btn-ok_code  = 'DEMO5'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'DEMO6'.
  ls_btn-cc_name = 'CONT_06'.
  ls_btn-ok_code  = 'DEMO6'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'DEMO7'.
  ls_btn-cc_name = 'CONT_07'.
  ls_btn-ok_code  = 'DEMO7'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  created = abap_true.

ENDFORM.
