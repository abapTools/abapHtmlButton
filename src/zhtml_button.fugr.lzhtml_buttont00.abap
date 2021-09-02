*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 30.08.2021 at 11:01:38
*   view maintenance generator version: #001407#
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
