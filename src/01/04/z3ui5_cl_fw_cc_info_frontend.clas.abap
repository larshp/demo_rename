CLASS z3ui5_cl_fw_cc_info_frontend DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS get_js
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z3ui5_cl_fw_cc_info_frontend IMPLEMENTATION.


  METHOD get_js.

    result  = ` ` &&
      ` sap.ui.require([` && |\n|  &&
      `    "sap/ui/VersionInfo",` && |\n|  &&
      `    "sap/base/util/Version"` && |\n|  &&
      `], function(VersionInfo, VersionUtil) {` && |\n|  &&
      `    //access the OpenUI5 version at runtime` && |\n|  &&
      `    VersionInfo.load().then(function(oCurrentVersionInfo) {` && |\n|  &&
      `        sap.z2ui5.oCurrentVersionInfo = oCurrentVersionInfo;` && |\n|  &&
      `    });` && |\n|  &&
      `});` && |\n| &&
      ` sap.ui.define("z2ui5/Info",[` && |\n| &&
      `   "sap/ui/core/Control"` && |\n| &&
      `], (Control ) => {` && |\n| &&
      `   "use strict";` && |\n| &&
      |\n| &&
      `   return Control.extend("z2ui5.Info", {` && |\n| &&
      `       metadata : {` && |\n| &&
      `           properties: {` && |\n| &&
      `                ui5_version: {` && |\n| &&
      `                    type: "string"` && |\n| &&
      `                },` && |\n| &&
      `                ui5_gav: {` && |\n| &&
      `                    type: "string"` && |\n| &&
      `                },` && |\n| &&
      `                ui5_theme: {` && |\n| &&
      `                    type: "string"` && |\n| &&
      `                },` && |\n| &&
      `                device_os: {` && |\n| &&
      `                    type: "string"` && |\n| &&
      `                },` && |\n| &&
      `                device_systemtype: {` && |\n| &&
      `                    type: "string"` && |\n| &&
      `                },` && |\n| &&
      `                device_browser: {` && |\n| &&
      `                    type: "string"` && |\n| &&
      `                },` && |\n| &&
      `            },` && |\n| &&
      `            events: {` && |\n| &&
      `                 "finished": { ` && |\n| &&
      `                        allowPreventDefault: true,` && |\n| &&
      `                        parameters: {},` && |\n| &&
      `                 }` && |\n| &&
      `            }` && |\n| &&
      `       },` && |\n| &&
      |\n| &&
      `       init () {  },` && |\n| &&
      |\n| &&
      `       onAfterRendering() {` && |\n| &&
      |\n| &&
      `       },` && |\n| &&
      `      onEvent(oControl) { oControl.fireFinished( );  }, ` && |\n| &&
      `       renderer(oRm, oControl) {` && |\n| &&
      |\n| &&
      `            oControl.setProperty( "ui5_version" , sap.z2ui5.oCurrentVersionInfo.version );` && |\n| &&
      `            oControl.setProperty( "ui5_gav" ,  sap.z2ui5.oCurrentVersionInfo.gav  );` && |\n| &&
      `            oControl.setProperty( "device_os" ,  sap.ui.Device.os.name );` && |\n| &&
      `          oControl.setProperty( "device_browser" ,  sap.ui.Device.browser.name );` && |\n| &&
      `          setTimeout( oControl.onEvent , 1000 , oControl );` && |\n| &&
      `            ` && |\n| &&
      `        }` && |\n| &&
      `   });` && |\n| &&
      `});`.

  ENDMETHOD.

ENDCLASS.
