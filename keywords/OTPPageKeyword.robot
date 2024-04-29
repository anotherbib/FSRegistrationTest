*** Settings ***
Library    SeleniumLibrary
Resource    CommonKeywords.robot

*** Keywords ***
Display OTP Page with "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}

Go back to registration page
    CommonKeywords.Wait until element is ready then click element    xpath=//*[@id="__next"]/div[2]/div/div[2]/div[3]/form/div/div[3]/button