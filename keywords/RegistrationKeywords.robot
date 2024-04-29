*** Settings ***
Library    SeleniumLibrary
Resource    CommonKeywords.robot

*** Keywords ***
Successful registration with ${email}, ${firstname}, ${surname}, ${phonenumber}, ${password}, and ${confirmpassword}
    CommonKeywords.Wait until element is ready then click element    xpath=//button[text()="สมัครสมาชิก"]
    CommonKeywords.Wait until element is ready then input text    name=email    ${email}
    CommonKeywords.Wait until element is ready then input text    name=firstName    ${firstname}
    CommonKeywords.Wait until element is ready then input text    name=lastName    ${surname}
    CommonKeywords.Wait until element is ready then input text    name=phoneNumber    ${phonenumber}
    CommonKeywords.Wait until element is ready then input text    name=newPassword    ${password}
    CommonKeywords.Wait until element is ready then input text    name=confirmPassword    ${confirmpassword}
    CommonKeywords.Wait until element is ready then select checkbox    name=consent
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@type="submit" and text()="สมัครสมาชิก"]

Registration with invalid format with ${email}, ${firstname}, ${surname}, ${phonenumber}, ${password}, and ${confirmpassword} then display "${expected_message}"
    CommonKeywords.Wait until element is ready then input text    name=email    ${email}
    CommonKeywords.Wait until element is ready then input text    name=firstName    ${firstname}
    CommonKeywords.Wait until element is ready then input text    name=lastName    ${surname}
    CommonKeywords.Wait until element is ready then input text    name=phoneNumber    ${phonenumber}
    CommonKeywords.Wait until element is ready then input text    name=newPassword    ${password}
    CommonKeywords.Wait until element is ready then input text    name=confirmPassword    ${confirmpassword}
    CommonKeywords.Wait until element is ready then select checkbox    name=consent
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@type="submit" and text()="สมัครสมาชิก"]
    CommonKeywords.Wait until page contains element then verify text    ${expected_message} 

