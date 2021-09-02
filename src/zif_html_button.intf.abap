interface ZIF_HTML_BUTTON
  public .


  methods SET_INACTIVE .
  methods SET_ACTIVE .
  methods GET_BTN_FIELDS
    returning
      value(RE_BTN_FIELDS) type ZHTML_BUTTON .
  methods GET_BTN_TYPE
    returning
      value(RE_BTN_TYPE) type ZHTML_BTN_TYPE .
endinterface.
