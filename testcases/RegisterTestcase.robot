*** Settings ***
Library    SeleniumLibrary
Resource        ../keywords/RegistrationKeywords.robot
Resource        ../keywords/OTPPageKeyword.robot
Variables    ../config/config.yaml
Variables     ../testdata.yaml

Suite Setup    Open Browser    ${baseUrl}    chrome
Suite Teardown     Close Browser


*** Test Cases *** 
User can successfully register
    When Successful registration with ${email}, ${firstname}, ${surname}, ${phonenumber}, ${password}, and ${confirmpassword}    # robotcode: ignore
    Then Display OTP Page with "ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์"
    Then Go back to registration page

Registration with invalid email format
    When Reload Page
    Then Registration with invalid format with ${invalid_email}, ${firstname}, ${surname}, ${phonenumber}, ${password}, and ${confirmpassword} then display "กรุณากรอกอีเมลให้ถูกต้อง (you@example.com)"    # robotcode: ignore

Registration with invalid phone number format
    When Reload Page
    Then Registration with invalid format with ${email}, ${firstname}, ${surname}, ${invalid_phonenumber}, ${password}, and ${confirmpassword} then display "เบอร์โทรศัพท์ไม่ถูกต้อง"    # robotcode: ignore

Registration with invalid password format
    When Reload Page
    Then Registration with invalid format with ${email}, ${firstname}, ${surname}, ${phonenumber}, ${invalid_password}, and ${invalid_confirmpassword} then display "รหัสผ่าน 8 ตัวขึ้นไป โดยประกอบด้วยอักษร a-z และ A-Z และ 0-9"    # robotcode: ignore

Registration with invalid confirm password
    When Reload Page
    Then Registration with invalid format with ${email}, ${firstname}, ${surname}, ${phonenumber}, ${password}, and ${invalid_confirmpassword} then display "รหัสผ่านไม่ตรงกัน"    # robotcode: ignore

Registration with no email filled
    When Reload Page
    Then Registration with invalid format with ${EMPTY}, ${firstname}, ${surname}, ${phonenumber}, ${password}, and ${confirmpassword} then display "กรุณากรอกอีเมลของคุณ" 

Registration with no firstname filled
    When Reload Page
    Then Registration with invalid format with ${email}, ${EMPTY}, ${surname}, ${phonenumber}, ${password}, and ${confirmpassword} then display "กรุณากรอกชื่อของคุณ" 

Registration with no surname filled
    When Reload Page
    Then Registration with invalid format with ${email}, ${firstname}, ${EMPTY}, ${phonenumber}, ${password}, and ${confirmpassword} then display "กรุณากรอกนามสกุลของคุณ" 

Registration with no phonenumber filled
    When Reload Page
    Then Registration with invalid format with ${email}, ${firstname}, ${surname}, ${EMPTY}, ${password}, and ${confirmpassword} then display "กรุณากรอกเบอร์โทรศัพท์"

Registration with no password filled
    When Reload Page
    Then Registration with invalid format with ${email}, ${firstname}, ${surname}, ${phonenumber}, ${EMPTY}, and ${confirmpassword} then display "กรุณากรอกรหัสผ่านใหม่"

Registration with no confirm password filled
    When Reload Page
    Then Registration with invalid format with ${email}, ${firstname}, ${surname}, ${phonenumber}, ${password}, and ${EMPTY} then display "กรุณายืนยันรหัสผ่านใหม่"
    
#to be designed
#Registration with no consent
