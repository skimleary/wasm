'''
webaudio_test.robot

Usage:
  robot webaudio_test.robot
  -or-
  robot --variable BROWSER:xxxxxxx webaudio_test.robot
where,
  xxxxxxx is browser for test using one of: Chrome, Edge, Firefox, Opera

Default browser is specified below
'''

*** Settings ***
Documentation  Web audio in WASM
Library        SeleniumLibrary
#Resource       Daisy.{txt,robot}


*** Variables ***
${FSTART}      30        # Primary frequency (min="30" max="80" value="50")
${FDEFAULT}    60
${FSTOP}       80
${FSTEP}       2
${FDWELL}      0.1
${MSTART}      0         # Modulaton frequency (min="0" max="3" value="0" step="0.05")
${MSTOP}       3
${MSTEP}       0.1
${MDWELL}      0.075

${BROWSER}     Firefox
${URL}         http://localhost:8080/


*** Tasks ***
Step Frequency
    [tags]  ${BROWSER} ${FSTART} ${FSTOP} ${FSTEP}

    Launch-Browser

    # Start Oscillator
    Click Element  css=input[id=play]

    # Frequency
    FOR  ${fval}  IN RANGE  ${FSTART}  ${FSTOP}+${FSTEP}  ${FSTEP}
        Adjust-Slider  primary_input  ${fval}
	Sleep  ${FDWELL}
    END

    Sleep  .5

    Adjust-Slider  primary_input  ${FDEFAULT}

    # Modulation volume
    Adjust-Slider  fm_amount  1

    # Modulation frequency
    FOR  ${mval}  IN RANGE  ${MSTART}  ${MSTOP}+${MSTEP}  ${MSTEP}
        Adjust-Slider  fm_freq  ${mval}
        Sleep  ${MDWELL}
    END
    FOR  ${mval}  IN RANGE  ${MSTOP}  ${MSTART}  -${MSTEP}
        Adjust-Slider  fm_freq  ${mval}
	Sleep  ${MDWELL}
    END

    Sleep  1

    [Teardown]  Close Browser

Daisy Daisy
    [tags]  foo
    Log To Console  Does nothing for now


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

Adjust-Slider
    [Arguments]    ${sele}  ${sval}
    Execute JavaScript  let el = window.document.getElementById('${sele}'); el.value = ${sval}; el.dispatchEvent(new Event('input'));


# webaudio_test.robot
