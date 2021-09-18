*----------------------------------------------------------------------*
***INCLUDE LZHTML_BUTTON_DEMOI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
CASE sy-ucomm.
  WHEN 'DEMO1'.
    CALL FUNCTION 'POPUP_TO_INFORM'
      EXPORTING
        titel         = 'HTML Button'
        txt1          = 'pressed button'
        txt2          = 'DEMO1'.
  WHEN 'DEMO2'.
  WHEN OTHERS.
ENDCASE.
ENDMODULE.
