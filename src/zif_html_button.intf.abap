"! <p class="shorttext synchronized" lang="en">HTML Button</p>
INTERFACE zif_html_button
  PUBLIC .

  METHODS set_active .
  METHODS set_inactive .
  METHODS get_btn_fields
    RETURNING
      VALUE(re_btn_fields) TYPE zhtml_button .
  METHODS get_btn_type
    RETURNING
      VALUE(re_btn_type) TYPE zhtml_btn_type .
ENDINTERFACE.
