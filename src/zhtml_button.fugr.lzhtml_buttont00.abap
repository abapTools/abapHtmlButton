*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZHTML_BTN_TYPES.................................*
DATA:  BEGIN OF STATUS_ZHTML_BTN_TYPES               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZHTML_BTN_TYPES               .
CONTROLS: TCTRL_ZHTML_BTN_TYPES
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: ZHTML_COLORS....................................*
DATA:  BEGIN OF STATUS_ZHTML_COLORS                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZHTML_COLORS                  .
CONTROLS: TCTRL_ZHTML_COLORS
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZHTML_BTN_TYPES               .
TABLES: *ZHTML_COLORS                  .
TABLES: ZHTML_BTN_TYPES                .
TABLES: ZHTML_COLORS                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
