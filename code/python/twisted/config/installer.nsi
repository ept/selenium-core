; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Selenium"
!define PRODUCT_VERSION "0.2"
!define PRODUCT_PUBLISHER "ThoughtWorks, Inc."
!define PRODUCT_WEB_SITE "http://selenium.thoughtworks.com"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\selenium_server.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "..\..\..\license\selenium_license.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Start menu page
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "Selenium"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\selenium_server.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Setup.exe"
InstallDir "$PROGRAMFILES\Selenium"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "SeleniumServer" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite try
  File "..\dist\cBanana.pyd"
  SetOutPath "$INSTDIR\cgi-bin"
  File "..\dist\cgi-bin\nph-proxy.cgi"
  File "..\dist\cgi-bin\README"
  SetOutPath "$INSTDIR"
  File "..\dist\datetime.pyd"
  File "..\dist\library.zip"
  File "..\dist\pyexpat.pyd"
  File "..\dist\python23.dll"
  File "..\dist\pywintypes23.dll"
  File "..\dist\select.pyd"
  SetOutPath "$INSTDIR\selenium_driver"
  File "..\dist\selenium_driver\.cvsignore"
  File "..\dist\selenium_driver\build.xml"
  File "..\dist\selenium_driver\driver.rpy"
  SetOutPath "$INSTDIR\selenium_driver\Embedded-WEB-INF"
  File "..\dist\selenium_driver\Embedded-WEB-INF\web.xml"
  SetOutPath "$INSTDIR\selenium_driver\html-xpath"
  File "..\dist\selenium_driver\html-xpath\carnation.jpg"
  File "..\dist\selenium_driver\html-xpath\example.html"
  File "..\dist\selenium_driver\html-xpath\html-xpath-patched.js"
  File "..\dist\selenium_driver\html-xpath\html-xpath.js"
  File "..\dist\selenium_driver\html-xpath\license.txt"
  File "..\dist\selenium_driver\html-xpath\rainbow.jpg"
  SetOutPath "$INSTDIR\selenium_driver"
  File "..\dist\selenium_driver\htmlutils.js"
  SetOutPath "$INSTDIR\selenium_driver\jsmock"
  File "..\dist\selenium_driver\jsmock\mock-tests.html"
  File "..\dist\selenium_driver\jsmock\mock.js"
  SetOutPath "$INSTDIR\selenium_driver\jsunit\app\css"
  File "..\dist\selenium_driver\jsunit\app\css\jsUnitStyle.css"
  File "..\dist\selenium_driver\jsunit\app\css\readme"
  SetOutPath "$INSTDIR\selenium_driver\jsunit\app"
  File "..\dist\selenium_driver\jsunit\app\emptyPage.html"
  File "..\dist\selenium_driver\jsunit\app\jsUnitCore.js"
  File "..\dist\selenium_driver\jsunit\app\jsUnitTestManager.js"
  File "..\dist\selenium_driver\jsunit\app\jsUnitTestSuite.js"
  File "..\dist\selenium_driver\jsunit\app\jsUnitTracer.js"
  File "..\dist\selenium_driver\jsunit\app\main-counts-errors.html"
  File "..\dist\selenium_driver\jsunit\app\main-counts-failures.html"
  File "..\dist\selenium_driver\jsunit\app\main-counts-runs.html"
  File "..\dist\selenium_driver\jsunit\app\main-counts.html"
  File "..\dist\selenium_driver\jsunit\app\main-data.html"
  File "..\dist\selenium_driver\jsunit\app\main-errors.html"
  File "..\dist\selenium_driver\jsunit\app\main-frame.html"
  File "..\dist\selenium_driver\jsunit\app\main-loader.html"
  File "..\dist\selenium_driver\jsunit\app\main-progress.html"
  File "..\dist\selenium_driver\jsunit\app\main-results.html"
  File "..\dist\selenium_driver\jsunit\app\main-status.html"
  File "..\dist\selenium_driver\jsunit\app\testContainer.html"
  File "..\dist\selenium_driver\jsunit\app\testContainerController.html"
  File "..\dist\selenium_driver\jsunit\app\xbDebug.js"
  SetOutPath "$INSTDIR\selenium_driver\jsunit"
  File "..\dist\selenium_driver\jsunit\build.xml"
  File "..\dist\selenium_driver\jsunit\changelist.txt"
  SetOutPath "$INSTDIR\selenium_driver\jsunit\css"
  File "..\dist\selenium_driver\jsunit\css\jsUnitStyle.css"
  SetOutPath "$INSTDIR\selenium_driver\jsunit\images"
  File "..\dist\selenium_driver\jsunit\images\green.gif"
  File "..\dist\selenium_driver\jsunit\images\logo_jsunit.gif"
  File "..\dist\selenium_driver\jsunit\images\red.gif"
  SetOutPath "$INSTDIR\selenium_driver\jsunit\intellij"
  File "..\dist\selenium_driver\jsunit\intellij\.cvsignore"
  File "..\dist\selenium_driver\jsunit\intellij\JsUnit.iml"
  File "..\dist\selenium_driver\jsunit\intellij\JsUnit.ipr"
  SetOutPath "$INSTDIR\selenium_driver\jsunit\java\bin"
  File "..\dist\selenium_driver\jsunit\java\bin\.cvsignore"
  File "..\dist\selenium_driver\jsunit\java\bin\jsunit.jar"
  SetOutPath "$INSTDIR\selenium_driver\jsunit\java\lib"
  File "..\dist\selenium_driver\jsunit\java\lib\javax.servlet.jar"
  File "..\dist\selenium_driver\jsunit\java\lib\jdom.jar"
  File "..\dist\selenium_driver\jsunit\java\lib\jetty.jar"
  File "..\dist\selenium_driver\jsunit\java\lib\junit.jar"
  File "..\dist\selenium_driver\jsunit\java\lib\xerces.jar"
  SetOutPath "$INSTDIR\selenium_driver\jsunit\java\src"
  File "..\dist\selenium_driver\jsunit\java\src\.cvsignore"
  SetOutPath "$INSTDIR\selenium_driver\jsunit"
  File "..\dist\selenium_driver\jsunit\jsunit.properties.sample"
  SetOutPath "$INSTDIR\selenium_driver\jsunit\licenses"
  File "..\dist\selenium_driver\jsunit\licenses\gpl-2.txt"
  File "..\dist\selenium_driver\jsunit\licenses\index.html"
  File "..\dist\selenium_driver\jsunit\licenses\JDOM_license.txt"
  File "..\dist\selenium_driver\jsunit\licenses\Jetty_license.html"
  File "..\dist\selenium_driver\jsunit\licenses\lgpl-2.1.txt"
  File "..\dist\selenium_driver\jsunit\licenses\MPL-1.1.txt"
  File "..\dist\selenium_driver\jsunit\licenses\mpl-tri-license-c.txt"
  File "..\dist\selenium_driver\jsunit\licenses\mpl-tri-license-html.txt"
  SetOutPath "$INSTDIR\selenium_driver\jsunit"
  File "..\dist\selenium_driver\jsunit\readme.txt"
  File "..\dist\selenium_driver\jsunit\testRunner.html"
  SetOutPath "$INSTDIR\selenium_driver\jsunit\tests\data"
  File "..\dist\selenium_driver\jsunit\tests\data\data.html"
  File "..\dist\selenium_driver\jsunit\tests\data\staff.css"
  File "..\dist\selenium_driver\jsunit\tests\data\staff.dtd"
  File "..\dist\selenium_driver\jsunit\tests\data\staff.xml"
  SetOutPath "$INSTDIR\selenium_driver\jsunit\tests"
  File "..\dist\selenium_driver\jsunit\tests\index.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitAssertionTests.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitDeclarationTests.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitDeclAssertionTests.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitDeclFrameworkUtilityTests.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitDeclOnLoadTests.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitDeclSetUpTearDownTests.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitDeclTestFailures.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitDeclTestLoadData.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitDeclTestSetUpPages.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitDeclTestSetUpPagesSuite.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitDeclTestSuite.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitDeclUtilityTests.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitFrameworkUtilityTests.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitOnLoadTests.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitSetUpTearDownTests.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitTestFailures.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitTestLoadData.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitTestLoadStaff.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitTestSetUpPages.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitTestSetUpPagesSuite.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitTestSuite.html"
  File "..\dist\selenium_driver\jsunit\tests\jsUnitUtilityTests.html"
  SetOutPath "$INSTDIR\selenium_driver"
  File "..\dist\selenium_driver\README.txt"
  File "..\dist\selenium_driver\RPC2.rpy"
  File "..\dist\selenium_driver\SeleneseRunner.html"
  File "..\dist\selenium_driver\selenium-api.js"
  File "..\dist\selenium_driver\selenium-browserbot.js"
  File "..\dist\selenium_driver\selenium-commandhandlers.js"
  File "..\dist\selenium_driver\selenium-executionloop.js"
  File "..\dist\selenium_driver\selenium-fitrunner.js"
  File "..\dist\selenium_driver\selenium-logo.jpg"
  File "..\dist\selenium_driver\selenium-tableparser.js"
  File "..\dist\selenium_driver\selenium.css"
  File "..\dist\selenium_driver\startWebServer.bat"
  File "..\dist\selenium_driver\stopWebServer.bat"
  File "..\dist\selenium_driver\TestRunner.hta"
  File "..\dist\selenium_driver\TestRunner.html"
  SetOutPath "$INSTDIR\selenium_driver\tests\browserbot"
  File "..\dist\selenium_driver\tests\browserbot\alert-handling-tests.html"
  File "..\dist\selenium_driver\tests\browserbot\browserbot-tests.html"
  File "..\dist\selenium_driver\tests\browserbot\command-factory-tests.html"
  File "..\dist\selenium_driver\tests\browserbot\command-handler-tests.html"
  File "..\dist\selenium_driver\tests\browserbot\confirm-handling-tests.html"
  File "..\dist\selenium_driver\tests\browserbot\event-bubble-tests.html"
  File "..\dist\selenium_driver\tests\browserbot\pagebot-accessor-tests.html"
  File "..\dist\selenium_driver\tests\browserbot\pagebot-action-tests.html"
  File "..\dist\selenium_driver\tests\browserbot\pagebot-attribute-tests.html"
  File "..\dist\selenium_driver\tests\browserbot\pagebot-locator-tests-include.html"
  File "..\dist\selenium_driver\tests\browserbot\pagebot-locator-tests.html"
  File "..\dist\selenium_driver\tests\browserbot\pagebot-property-tests.html"
  File "..\dist\selenium_driver\tests\browserbot\selenium-api-tests.html"
  File "..\dist\selenium_driver\tests\browserbot\suite.html"
  SetOutPath "$INSTDIR\selenium_driver\tests\events"
  File "..\dist\selenium_driver\tests\events\readme.txt"
  File "..\dist\selenium_driver\tests\events\TestButtonEvents.html"
  File "..\dist\selenium_driver\tests\events\TestCheckboxEvents.html"
  File "..\dist\selenium_driver\tests\events\TestLinkEvents.html"
  File "..\dist\selenium_driver\tests\events\TestRadioEvents.html"
  File "..\dist\selenium_driver\tests\events\TestSelectEvents.html"
  File "..\dist\selenium_driver\tests\events\TestTextEvents.html"
  SetOutPath "$INSTDIR\selenium_driver\tests"
  File "..\dist\selenium_driver\tests\GoogleTestSearch.html"
  File "..\dist\selenium_driver\tests\GoogleTestSuite.html"
  SetOutPath "$INSTDIR\selenium_driver\tests\html"
  File "..\dist\selenium_driver\tests\html\test_click_javascript_page.html"
  File "..\dist\selenium_driver\tests\html\test_click_page1.html"
  File "..\dist\selenium_driver\tests\html\test_click_page2.html"
  File "..\dist\selenium_driver\tests\html\test_confirm.html"
  File "..\dist\selenium_driver\tests\html\test_dummy_page.html"
  File "..\dist\selenium_driver\tests\html\test_form_events.html"
  File "..\dist\selenium_driver\tests\html\test_locators.html"
  File "..\dist\selenium_driver\tests\html\test_open.html"
  File "..\dist\selenium_driver\tests\html\test_reload_onchange_page.html"
  File "..\dist\selenium_driver\tests\html\test_select_window.html"
  File "..\dist\selenium_driver\tests\html\test_select_window_popup.html"
  File "..\dist\selenium_driver\tests\html\test_slowloading_page.html"
  File "..\dist\selenium_driver\tests\html\test_store_value.html"
  File "..\dist\selenium_driver\tests\html\test_type_page1.html"
  File "..\dist\selenium_driver\tests\html\test_type_page2.html"
  File "..\dist\selenium_driver\tests\html\test_verifications.html"
  File "..\dist\selenium_driver\tests\html\test_verify_alert.html"
  SetOutPath "$INSTDIR\selenium_driver\tests"
  File "..\dist\selenium_driver\tests\JsUnitSuite.html"
  SetOutPath "$INSTDIR\selenium_driver\tests\tableparser"
  File "..\dist\selenium_driver\tests\tableparser\tableparser-tests.html"
  SetOutPath "$INSTDIR\selenium_driver\tests"
  File "..\dist\selenium_driver\tests\TestClick.html"
  File "..\dist\selenium_driver\tests\TestClickJavascriptHref.html"
  File "..\dist\selenium_driver\tests\TestCommandError.html"
  File "..\dist\selenium_driver\tests\TestConfirmations.html"
  File "..\dist\selenium_driver\tests\TestFailingAssert.html"
  File "..\dist\selenium_driver\tests\TestFailingVerifications.html"
  File "..\dist\selenium_driver\tests\TestLocators.html"
  File "..\dist\selenium_driver\tests\TestOpen.html"
  File "..\dist\selenium_driver\tests\TestPause.html"
  File "..\dist\selenium_driver\tests\TestProxy.html"
  File "..\dist\selenium_driver\tests\TestSelectWindow.html"
  File "..\dist\selenium_driver\tests\TestStoreValue.html"
  File "..\dist\selenium_driver\tests\TestSuite.html"
  File "..\dist\selenium_driver\tests\TestType.html"
  File "..\dist\selenium_driver\tests\TestVerifications.html"
  File "..\dist\selenium_driver\tests\TestVerifyAlerts.html"
  File "..\dist\selenium_driver\tests\TestVerifyAlertsFailures.html"
  File "..\dist\selenium_driver\tests\TestVerifyConfirmationFailures.html"
  File "..\dist\selenium_driver\tests\TestWait.html"
  SetOutPath "$INSTDIR\selenium_driver"
  File "..\dist\selenium_driver\tinyWebClient.py"
  File "..\dist\selenium_driver\tinyWebServer.py"
  File "..\dist\selenium_driver\xmlextras.js"
  File "..\dist\selenium_driver\__init__.py"
  SetOutPath "$INSTDIR"
  File "..\dist\selenium_server.exe"
  File "..\dist\w9xpopen.exe"
  File "..\dist\win32api.pyd"
  File "..\dist\win32event.pyd"
  File "..\dist\win32file.pyd"
  File "..\dist\win32gui.pyd"
  File "..\dist\win32pipe.pyd"
  File "..\dist\win32process.pyd"
  File "..\dist\win32security.pyd"
  File "..\dist\_c_urlarg.pyd"
  File "..\dist\_socket.pyd"
  File "..\dist\_sre.pyd"
  File "..\dist\_ssl.pyd"
  File "..\dist\_winreg.pyd"

; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Selenium.lnk" "$INSTDIR\selenium_server.exe"
  CreateShortCut "$DESKTOP\Selenium.lnk" "$INSTDIR\selenium_server.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -AdditionalIcons
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk" "$INSTDIR\uninst.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\selenium_server.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\selenium_server.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "Selenium was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove Selenium and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\_winreg.pyd"
  Delete "$INSTDIR\_ssl.pyd"
  Delete "$INSTDIR\_sre.pyd"
  Delete "$INSTDIR\_socket.pyd"
  Delete "$INSTDIR\_c_urlarg.pyd"
  Delete "$INSTDIR\win32security.pyd"
  Delete "$INSTDIR\win32process.pyd"
  Delete "$INSTDIR\win32pipe.pyd"
  Delete "$INSTDIR\win32gui.pyd"
  Delete "$INSTDIR\win32file.pyd"
  Delete "$INSTDIR\win32event.pyd"
  Delete "$INSTDIR\win32api.pyd"
  Delete "$INSTDIR\w9xpopen.exe"
  Delete "$INSTDIR\selenium_server.exe"
  Delete "$INSTDIR\selenium_driver\__init__.py"
  Delete "$INSTDIR\selenium_driver\xmlextras.js"
  Delete "$INSTDIR\selenium_driver\tinyWebServer.py"
  Delete "$INSTDIR\selenium_driver\tinyWebClient.py"
  Delete "$INSTDIR\selenium_driver\tests\TestWait.html"
  Delete "$INSTDIR\selenium_driver\tests\TestVerifyConfirmationFailures.html"
  Delete "$INSTDIR\selenium_driver\tests\TestVerifyAlertsFailures.html"
  Delete "$INSTDIR\selenium_driver\tests\TestVerifyAlerts.html"
  Delete "$INSTDIR\selenium_driver\tests\TestVerifications.html"
  Delete "$INSTDIR\selenium_driver\tests\TestType.html"
  Delete "$INSTDIR\selenium_driver\tests\TestSuite.html"
  Delete "$INSTDIR\selenium_driver\tests\TestStoreValue.html"
  Delete "$INSTDIR\selenium_driver\tests\TestSelectWindow.html"
  Delete "$INSTDIR\selenium_driver\tests\TestProxy.html"
  Delete "$INSTDIR\selenium_driver\tests\TestPause.html"
  Delete "$INSTDIR\selenium_driver\tests\TestOpen.html"
  Delete "$INSTDIR\selenium_driver\tests\TestLocators.html"
  Delete "$INSTDIR\selenium_driver\tests\TestFailingVerifications.html"
  Delete "$INSTDIR\selenium_driver\tests\TestFailingAssert.html"
  Delete "$INSTDIR\selenium_driver\tests\TestConfirmations.html"
  Delete "$INSTDIR\selenium_driver\tests\TestCommandError.html"
  Delete "$INSTDIR\selenium_driver\tests\TestClickJavascriptHref.html"
  Delete "$INSTDIR\selenium_driver\tests\TestClick.html"
  Delete "$INSTDIR\selenium_driver\tests\tableparser\tableparser-tests.html"
  Delete "$INSTDIR\selenium_driver\tests\JsUnitSuite.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_verify_alert.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_verifications.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_type_page2.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_type_page1.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_store_value.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_slowloading_page.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_select_window_popup.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_select_window.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_reload_onchange_page.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_open.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_locators.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_form_events.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_dummy_page.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_confirm.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_click_page2.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_click_page1.html"
  Delete "$INSTDIR\selenium_driver\tests\html\test_click_javascript_page.html"
  Delete "$INSTDIR\selenium_driver\tests\GoogleTestSuite.html"
  Delete "$INSTDIR\selenium_driver\tests\GoogleTestSearch.html"
  Delete "$INSTDIR\selenium_driver\tests\events\TestTextEvents.html"
  Delete "$INSTDIR\selenium_driver\tests\events\TestSelectEvents.html"
  Delete "$INSTDIR\selenium_driver\tests\events\TestRadioEvents.html"
  Delete "$INSTDIR\selenium_driver\tests\events\TestLinkEvents.html"
  Delete "$INSTDIR\selenium_driver\tests\events\TestCheckboxEvents.html"
  Delete "$INSTDIR\selenium_driver\tests\events\TestButtonEvents.html"
  Delete "$INSTDIR\selenium_driver\tests\events\readme.txt"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\suite.html"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\selenium-api-tests.html"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\pagebot-property-tests.html"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\pagebot-locator-tests.html"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\pagebot-locator-tests-include.html"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\pagebot-attribute-tests.html"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\pagebot-action-tests.html"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\pagebot-accessor-tests.html"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\event-bubble-tests.html"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\confirm-handling-tests.html"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\command-handler-tests.html"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\command-factory-tests.html"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\browserbot-tests.html"
  Delete "$INSTDIR\selenium_driver\tests\browserbot\alert-handling-tests.html"
  Delete "$INSTDIR\selenium_driver\TestRunner.html"
  Delete "$INSTDIR\selenium_driver\TestRunner.hta"
  Delete "$INSTDIR\selenium_driver\stopWebServer.bat"
  Delete "$INSTDIR\selenium_driver\startWebServer.bat"
  Delete "$INSTDIR\selenium_driver\selenium.css"
  Delete "$INSTDIR\selenium_driver\selenium-tableparser.js"
  Delete "$INSTDIR\selenium_driver\selenium-logo.jpg"
  Delete "$INSTDIR\selenium_driver\selenium-fitrunner.js"
  Delete "$INSTDIR\selenium_driver\selenium-executionloop.js"
  Delete "$INSTDIR\selenium_driver\selenium-commandhandlers.js"
  Delete "$INSTDIR\selenium_driver\selenium-browserbot.js"
  Delete "$INSTDIR\selenium_driver\selenium-api.js"
  Delete "$INSTDIR\selenium_driver\SeleneseRunner.html"
  Delete "$INSTDIR\selenium_driver\RPC2.rpy"
  Delete "$INSTDIR\selenium_driver\README.txt"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitUtilityTests.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitTestSuite.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitTestSetUpPagesSuite.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitTestSetUpPages.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitTestLoadStaff.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitTestLoadData.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitTestFailures.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitSetUpTearDownTests.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitOnLoadTests.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitFrameworkUtilityTests.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitDeclUtilityTests.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitDeclTestSuite.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitDeclTestSetUpPagesSuite.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitDeclTestSetUpPages.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitDeclTestLoadData.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitDeclTestFailures.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitDeclSetUpTearDownTests.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitDeclOnLoadTests.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitDeclFrameworkUtilityTests.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitDeclAssertionTests.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitDeclarationTests.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\jsUnitAssertionTests.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\index.html"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\data\staff.xml"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\data\staff.dtd"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\data\staff.css"
  Delete "$INSTDIR\selenium_driver\jsunit\tests\data\data.html"
  Delete "$INSTDIR\selenium_driver\jsunit\testRunner.html"
  Delete "$INSTDIR\selenium_driver\jsunit\readme.txt"
  Delete "$INSTDIR\selenium_driver\jsunit\licenses\mpl-tri-license-html.txt"
  Delete "$INSTDIR\selenium_driver\jsunit\licenses\mpl-tri-license-c.txt"
  Delete "$INSTDIR\selenium_driver\jsunit\licenses\MPL-1.1.txt"
  Delete "$INSTDIR\selenium_driver\jsunit\licenses\lgpl-2.1.txt"
  Delete "$INSTDIR\selenium_driver\jsunit\licenses\Jetty_license.html"
  Delete "$INSTDIR\selenium_driver\jsunit\licenses\JDOM_license.txt"
  Delete "$INSTDIR\selenium_driver\jsunit\licenses\index.html"
  Delete "$INSTDIR\selenium_driver\jsunit\licenses\gpl-2.txt"
  Delete "$INSTDIR\selenium_driver\jsunit\jsunit.properties.sample"
  Delete "$INSTDIR\selenium_driver\jsunit\java\src\.cvsignore"
  Delete "$INSTDIR\selenium_driver\jsunit\java\lib\xerces.jar"
  Delete "$INSTDIR\selenium_driver\jsunit\java\lib\junit.jar"
  Delete "$INSTDIR\selenium_driver\jsunit\java\lib\jetty.jar"
  Delete "$INSTDIR\selenium_driver\jsunit\java\lib\jdom.jar"
  Delete "$INSTDIR\selenium_driver\jsunit\java\lib\javax.servlet.jar"
  Delete "$INSTDIR\selenium_driver\jsunit\java\bin\jsunit.jar"
  Delete "$INSTDIR\selenium_driver\jsunit\java\bin\.cvsignore"
  Delete "$INSTDIR\selenium_driver\jsunit\intellij\JsUnit.ipr"
  Delete "$INSTDIR\selenium_driver\jsunit\intellij\JsUnit.iml"
  Delete "$INSTDIR\selenium_driver\jsunit\intellij\.cvsignore"
  Delete "$INSTDIR\selenium_driver\jsunit\images\red.gif"
  Delete "$INSTDIR\selenium_driver\jsunit\images\logo_jsunit.gif"
  Delete "$INSTDIR\selenium_driver\jsunit\images\green.gif"
  Delete "$INSTDIR\selenium_driver\jsunit\css\jsUnitStyle.css"
  Delete "$INSTDIR\selenium_driver\jsunit\changelist.txt"
  Delete "$INSTDIR\selenium_driver\jsunit\build.xml"
  Delete "$INSTDIR\selenium_driver\jsunit\app\xbDebug.js"
  Delete "$INSTDIR\selenium_driver\jsunit\app\testContainerController.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\testContainer.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\main-status.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\main-results.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\main-progress.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\main-loader.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\main-frame.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\main-errors.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\main-data.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\main-counts.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\main-counts-runs.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\main-counts-failures.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\main-counts-errors.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\jsUnitTracer.js"
  Delete "$INSTDIR\selenium_driver\jsunit\app\jsUnitTestSuite.js"
  Delete "$INSTDIR\selenium_driver\jsunit\app\jsUnitTestManager.js"
  Delete "$INSTDIR\selenium_driver\jsunit\app\jsUnitCore.js"
  Delete "$INSTDIR\selenium_driver\jsunit\app\emptyPage.html"
  Delete "$INSTDIR\selenium_driver\jsunit\app\css\readme"
  Delete "$INSTDIR\selenium_driver\jsunit\app\css\jsUnitStyle.css"
  Delete "$INSTDIR\selenium_driver\jsmock\mock.js"
  Delete "$INSTDIR\selenium_driver\jsmock\mock-tests.html"
  Delete "$INSTDIR\selenium_driver\htmlutils.js"
  Delete "$INSTDIR\selenium_driver\html-xpath\rainbow.jpg"
  Delete "$INSTDIR\selenium_driver\html-xpath\license.txt"
  Delete "$INSTDIR\selenium_driver\html-xpath\html-xpath.js"
  Delete "$INSTDIR\selenium_driver\html-xpath\html-xpath-patched.js"
  Delete "$INSTDIR\selenium_driver\html-xpath\example.html"
  Delete "$INSTDIR\selenium_driver\html-xpath\carnation.jpg"
  Delete "$INSTDIR\selenium_driver\Embedded-WEB-INF\web.xml"
  Delete "$INSTDIR\selenium_driver\driver.rpy"
  Delete "$INSTDIR\selenium_driver\build.xml"
  Delete "$INSTDIR\selenium_driver\.cvsignore"
  Delete "$INSTDIR\select.pyd"
  Delete "$INSTDIR\pywintypes23.dll"
  Delete "$INSTDIR\python23.dll"
  Delete "$INSTDIR\pyexpat.pyd"
  Delete "$INSTDIR\library.zip"
  Delete "$INSTDIR\datetime.pyd"
  Delete "$INSTDIR\cgi-bin\README"
  Delete "$INSTDIR\cgi-bin\nph-proxy.cgi"
  Delete "$INSTDIR\cBanana.pyd"

  Delete "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Website.lnk"
  Delete "$DESKTOP\Selenium.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Selenium.lnk"

  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$INSTDIR\selenium_driver\tests\tableparser"
  RMDir "$INSTDIR\selenium_driver\tests\html"
  RMDir "$INSTDIR\selenium_driver\tests\events"
  RMDir "$INSTDIR\selenium_driver\tests\browserbot"
  RMDir "$INSTDIR\selenium_driver\tests"
  RMDir "$INSTDIR\selenium_driver\jsunit\tests\data"
  RMDir "$INSTDIR\selenium_driver\jsunit\tests"
  RMDir "$INSTDIR\selenium_driver\jsunit\licenses"
  RMDir "$INSTDIR\selenium_driver\jsunit\java\src"
  RMDir "$INSTDIR\selenium_driver\jsunit\java\lib"
  RMDir "$INSTDIR\selenium_driver\jsunit\java\bin"
  RMDir "$INSTDIR\selenium_driver\jsunit\intellij"
  RMDir "$INSTDIR\selenium_driver\jsunit\images"
  RMDir "$INSTDIR\selenium_driver\jsunit\css"
  RMDir "$INSTDIR\selenium_driver\jsunit\app\css"
  RMDir "$INSTDIR\selenium_driver\jsunit\app"
  RMDir "$INSTDIR\selenium_driver\jsunit"
  RMDir "$INSTDIR\selenium_driver\jsmock"
  RMDir "$INSTDIR\selenium_driver\html-xpath"
  RMDir "$INSTDIR\selenium_driver\Embedded-WEB-INF"
  RMDir "$INSTDIR\selenium_driver"
  RMDir "$INSTDIR\cgi-bin"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd