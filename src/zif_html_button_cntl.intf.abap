INTERFACE zif_html_button_cntl
  PUBLIC .

  INTERFACES zif_appl_object.

  METHODS create_btn
    IMPORTING
      !i_btn           TYPE zhtml_button
    RETURNING
      VALUE(ro_button) TYPE REF TO zif_html_button .
  METHODS get_btn_by_guid
    IMPORTING
      !i_guid          TYPE zhtml_guid
    RETURNING
      VALUE(ro_button) TYPE REF TO zif_html_button .

ENDINTERFACE.
