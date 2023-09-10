class ZCX_DPG_HTML_BTN_NOT_EXISTS definition
  public
  inheriting from CX_STATIC_CHECK
  final
  create public .

public section.

  interfaces IF_T100_DYN_MSG .
  interfaces IF_T100_MESSAGE .

  constants:
    begin of ZCX_DPG_HTML_BTN_NOT_EXISTS,
      msgid type symsgid value 'ZHTML_BUTTON',
      msgno type symsgno value '001',
      attr1 type scx_attrname value 'HTML_BTN',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of ZCX_DPG_HTML_BTN_NOT_EXISTS .
  data HTML_BTN type ZHTML_BTN_TYPE .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !HTML_BTN type ZHTML_BTN_TYPE optional .
protected section.
private section.
ENDCLASS.



CLASS ZCX_DPG_HTML_BTN_NOT_EXISTS IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
.
me->HTML_BTN = HTML_BTN .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = ZCX_DPG_HTML_BTN_NOT_EXISTS .
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.
ENDCLASS.
