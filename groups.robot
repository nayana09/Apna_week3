*** Settings ***
Library     AppiumLibrary

*** Test Cases ***
user should be able to search in Apna application
    [Tags]        user should be able to search in Apna application
    Launch the Apna Application

User need to login and get otp 
    [Tags]        Login and get OTP
    OTPs and phone number should be generated randomly for staging environment

Clicking on Bulb icon should display a set of suggestions for both the languages
    [Tags]        Display the set of suggestion Messages
    Verify the Message 

Click on bulb icon suggestions >> select any one suggestion >> select any camera image,image,audio,video,doc from gallery and then send it
    [Tags]        Posting images from gallery 
    select any camera image,image,audio,video,doc from gallery and then send it

Click on the message icon to open one on one message window with the same user and post a message. 
    [Tags]        Send message
    Post the message
Verify the restricted word in message chat box
    [Tags]        Sending Abusive words
    Restricted words in message


*** Keywords ***
Launch the Apna Application
    Open Application  ${mir_server}  platformName=${platformName}  platformVersion=${platformVersion}  deviceName=${deviceName}   appActivity=${app_activity}  appPackage=${app_package}  noReset=true
  
OTPs and phone number should be generated randomly for staging environment
    Wait Until Page Contains Element  ${Login}  timeout=30s
    Sleep  3s
    Input Text  ${Login}  9734667811
    sleep  3s 
    Click Element  ${send}  
    Sleep  3s
    Wait Until Element Is Visible  ${enter_otp}  timeout=30s
    Input Text  ${otp1}  3
    Input Text  ${otp2}  1
    Input Text  ${otp3}  3
    Input Text  ${otp4}  4 
    Sleep  3s


Verify the Message
    sleep  30s 
    Click Element  id=com.apnatime.debug:id/action_in_app_groups 
    sleep  3s 
    Wait Until Element is Visible   id=com.apnatime.debug:id/ic_move_next
    Click Element  id=com.apnatime.debug:id/ic_move_next
    sleep  3s 
    Click Element  id=com.apnatime.debug:id/ic_move_next
    sleep  3s
    Click Element  id=com.apnatime.debug:id/tv_done
    sleep  3s
    Wait Until Page Contains  text=Accounts / Finance Group
    sleep  3s 
    Click Element  xpath=//android.widget.TextView[@text="Accounts / Finance Group"]
    sleep  3s 
    Click Element  id=com.apnatime.debug:id/iv_attach
    Wait Until Page Contains  text=Choose from the below message suggestions  timeout=20s
    Page Should Contain Text  text=Choose from the below message suggestions
    sleep  3s 
    Click Element  id=com.apnatime.debug:id/iv_close
    sleep  3s 
    Click Element  id=com.apnatime.debug:id/iv_close
    sleep  3s 
    Click Element  id=com.apnatime.debug:id/iv_back
    sleep  2s
    Click Element  id=com.apnatime.debug:id/iv_back

select any camera image,image,audio,video,doc from gallery and then send it
    sleep  3s 
    Click Element  xpath=//android.widget.TextView[@text="Card"]
    Wait Until Page Contains  text=Create your first post
    Click Element  id=com.apnatime.debug:id/btn_send_first_message
    sleep  3s 
    Click Element  xpath=//android.widget.TextView[@text="Maid Group"]
    Wait Until Page Contains  text=Maid Group
    Click Element  id=com.apnatime.debug:id/tv_sent_msg
    Wait Until Page Contains  text=Community Rules
    Click Element  id=com.apnatime.debug:id/tv_guideline_agree
    Wait Until Page Contains  text=Maid Group
    Click Element  id=com.apnatime.debug:id/iv_pick_picture	
    Wait Until Page Contains  text=Allow apna to take pictures and record video?
    Click Element  id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Wait Until Page Contains  text=Allow apna to access photos and media on your device?
    Click Element  id=com.android.permissioncontroller:id/permission_allow_button
    sleep  5s 
    Click Element  id=com.google.android.apps.photos:id/image
    sleep  3s 
    Click Element  accessibility_id=Photo taken on Dec 9, 2021 10:02:56 AM
    Sleep  3s 
    Click Element  id=com.apnatime.debug:id/btn_continue
    sleep  3s 
    Click Element  id=com.apnatime.debug:id/sent_post
    Page Should Contain Text  text=Maid Group
    Sleep  3s 
    Click Element  id=com.apnatime.debug:id/iv_back

Post the message
    Sleep  30s 
    Click Element  ${message}
    sleep  3s
    Click Element  ${Select_person}
    sleep  3s 
    Click Element  ${enter_message}
    sleep  3s 
    Input Text  ${enter_text}  Good Morning
    sleep  3s 
    Click Element  ${send_text}
    sleep  3s 
    Click Element  ${back_button}
    sleep  3s 
    Page Should Contain Text  text=Inbox
    sleep  3s
    click Element  ${back_button1}

Restricted words in message
    Sleep  30s 
    Click Element  ${message}
    sleep  3s
    Click Element  ${Select_person}
    sleep  3s 
    Click Element  ${enter_message}
    sleep  3s 
    Input Text  ${enter_text}  Fuck off
    sleep  3s 
    Click Element  ${send_text}
    sleep  3s 
    Page Should Contain Element  ${alert_message}
    sleep  3s 
    Click Element  ${ok}
    sleep  3s
    Click Element  ${back_button}
    sleep  3s 
    Page Should Contain Text  text=Inbox
    sleep  3s
    click Element  ${back_button1} 

    
*** Variables ***
${mir_server} =  http://localhost:4723/wd/hub
${platformName} =  Android
${platformVersion} =  11.0
${deviceName} =  emulator-5554
${app_activity} =  com.apnatime.activities.splash.SplashActivity
${app_package} =  com.apnatime.debug

${Login} =  id=com.apnatime.debug:id/et_login_number
${send} =  id=com.apnatime.debug:id/btn_send

${enter_otp} =  id=com.apnatime.debug:id/tv_title

${otp1} =  id=com.apnatime.debug:id/et_otp1
${otp2} =  id=com.apnatime.debug:id/et_otp2
${otp3} =  id=com.apnatime.debug:id/et_otp3
${otp4} =  id=com.apnatime.debug:id/et_otp4

${message} =  id=com.apnatime.debug:id/iv_conversation
${Select_person} =  id=com.apnatime.debug:id/root
${enter_message} =  id=com.apnatime.debug:id/conversation_message
${enter_text} =  id=com.apnatime.debug:id/conversation_message
${send_text} =  id=com.apnatime.debug:id/conversation_send
${back_button} =  accessibility_id=Navigate up
${back_button1} =  id=com.apnatime.debug:id/iv_back

${alert_message} =  id=android:id/alertTitle
${ok}  id=android:id/button1