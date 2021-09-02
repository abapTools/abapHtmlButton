interface ZIF_HTML_BUTTON_CNTL
  public .


  methods CREATE_BTN
    importing
      !I_BTN type ZHTML_BUTTON
    returning
      value(RO_BUTTON) type ref to ZIF_HTML_BUTTON .
  methods GET_BTN_BY_GUID
    importing
      !I_GUID type ZHTML_GUID
    returning
      value(RO_BUTTON) type ref to ZIF_HTML_BUTTON .
endinterface.
