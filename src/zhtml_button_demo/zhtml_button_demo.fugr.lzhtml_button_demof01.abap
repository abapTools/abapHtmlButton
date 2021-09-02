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

  ls_btn-btn_type = 'LOCK'.
  ls_btn-cc_name = 'CONT_01'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'DECLINE'.
  ls_btn-cc_name = 'CONT_02'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'OK'.
  ls_btn-cc_name = 'CONT_03'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  ls_btn-btn_type = 'SAVE'.
  ls_btn-cc_name = 'CONT_04'.
  mo_btn_cntl->create_btn( ls_btn ).
  CLEAR ls_btn.

  created = abap_true.

ENDFORM.
