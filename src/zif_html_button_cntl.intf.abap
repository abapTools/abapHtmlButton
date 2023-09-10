"! <p class="shorttext synchronized" lang="en">HTML Button Cntl</p>
INTERFACE zif_html_button_cntl
  PUBLIC .


  INTERFACES zif_appl_object .

  METHODS create_btn
    IMPORTING
      !im_btn           TYPE zhtml_button
    RETURNING
      VALUE(ro_button) TYPE REF TO zif_html_button .
  METHODS delete_btn
    IMPORTING
      !im_btn           TYPE zhtml_button.
  METHODS get_btn_by_guid
    IMPORTING
      !im_guid          TYPE zhtml_guid
    RETURNING
      VALUE(ro_button) TYPE REF TO zif_html_button .
  METHODS get_btn_by_type .
ENDINTERFACE.
