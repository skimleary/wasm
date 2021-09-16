'''
julia_test.robot

Usage:
  robot julia_test.robot
  -or-
  robot --variable BROWSER:xxxxxxx julia_test.robot
where,
  xxxxxxx is browser for test using one of: Chrome, Edge, Firefox, [Headless,] Opera

Default browser is specified below
'''

*** Settings ***
Documentation  Julia Set real component step test
...            - Give a light show
Library        SeleniumLibrary


*** Variables ***
${RSTART}      -0.148
${RSTOP}        0.0
${RSTEP}        0.002
${RBASE}       ${RSTART}-${RSTEP}

${BROWSER}     Firefox
${URL}         http://localhost:8080/


*** Test Cases ***
Visual Verification
    [tags]  ${BROWSER} ${RSTART} ${RSTOP} ${RSTEP}

    Launch-Browser

    Sleep  0.5

    # Step through r
    FOR  ${rval}  IN RANGE  ${RSTART}  ${RSTOP}  ${RSTEP}
	${rvalstr}=    Set Variable           ${{ f'{${rval}:.3f}' }}
        Input Text     css=input[id=real]     ${rvalstr}
	Click Element  css=button[id=render]
    END

    # Note: It does not make much sense to step through j (due to saturation)

    # Reset r
    ${rvalstr}=    Set Variable           ${{ str(${RBASE}) }}
    Input Text     css=input[id=real]     ${rvalstr}
    Click Element  css=button[id=render]

    Sleep  2

    [Teardown]  Close Browser


*** Keywords ***
Launch-Browser
    Run Keyword If  "${BROWSER}" in ("Chrome", "Opera")  Invoke-Browser-With-Options  ELSE  Invoke-Browser-Without-Options

Invoke-Browser-With-Options
    [Documentation]  Supresses logging to console
    Log To Console  Using ${BROWSER}
    Open Browser  ${URL}  ${BROWSER}  options=add_experimental_option("excludeSwitches", ["enable-logging"])

Invoke-Browser-Without-Options
    Log To Console  Using ${BROWSER}
    Open Browser  ${URL}  ${BROWSER}


# julia_test.robot
