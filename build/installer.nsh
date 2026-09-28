; Custom NSIS include shared by the Mutantcat Working Group installers.
; electron-builder's common.nsh already brands the bottom-left corner, but re-asserting
; it from customHeader (which runs after common.nsh) keeps the installer chrome carrying
; the product name and version instead of the default "Nullsoft Install System" text.
!macro customHeader
  BrandingText "${PRODUCT_NAME} v${VERSION}"
!macroend
