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
    Input Text  ${Login}  7766000998
    Wait Until Element Is Visible  ${send}  timeout=10s
    Click Element  ${send} 
    Wait Until Element Is Visible  ${enter_otp}  timeout=30s
    Input Text  ${otp1}  3
    Input Text  ${otp2}  1
    Input Text  ${otp3}  3
    Input Text  ${otp4}  4 

Verify the Message
    Wait Until Page Contains  apnaJobs  timeout=20s
    Click Element  ${Group} 
    Wait Until Element is Visible   ${ic_move_next}  timeout=30s
    Click Element  ${ic_move_next}
    Click Element  ${ic_move_next}
    Click Element  ${tv_done}
    Wait Until Page Contains  Accounts / Finance Group  timeout=20s
    Click Element  xpath=//android.widget.TextView[@text="Accounts / Finance Group"]
    Wait Until Element is Visible  ${iv_attach}  timeout=10s 
    Click Element  ${iv_attach}
    Wait Until Element is Visible   ${tv_use_this_message}  timeout=10s
    Click Element  ${tv_use_this_message}
    Wait Until Element is Visible  ${tv_guideline_agree}  timeout=10s
    Click Element  ${tv_guideline_agree}
    Wait Until Element is Visible  ${sent_post}
    Click Element  ${sent_post}
    Wait Until Element is Visible  ${tv_view_post}  timeout=10s
    Click Element  ${tv_view_post}
    Wait Until Element is Visible  ${tv_message} timeout=20s
    Page Should Contain Element  ${tv_message}
    Click Element  ${iv_back} 
    Click Element  ${iv_back}


select any camera image,image,audio,video,doc from gallery and then send it
    Wait Until Element is Visible 
    Click Element  xpath=//android.widget.TextView[@text="Card"]
    Wait Until Element is Visible  timeout=10s
    Click Element  id=com.apnatime.debug:id/btn_send_first_message
    Wait Until Element is Visible  timeout=10s
    Click Element  xpath=//android.widget.TextView[@text="Maid Group"]
    Wait Until Element is Visible  timeout=10s
    Click Element  id=com.apnatime.debug:id/tv_sent_msg
    Wait Until Element is Visible  timeout=10s
    Click Element  id=com.apnatime.debug:id/tv_guideline_agree
    Wait Until Element is Visible  timeout=10s
    Click Element  id=com.apnatime.debug:id/iv_pick_picture	
    Wait Until Element is Visible  timeout=10s
    Click Element  id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Wait Until Element is Visible  timeout=10s
    Click Element  id=com.android.permissioncontroller:id/permission_allow_button
    Wait Until Element is Visible  timeout=10s
    Click Element  id=com.google.android.apps.photos:id/image
    Wait Until Element is Visible  timeout=10s
    Click Element  accessibility_id=Photo taken on Dec 9, 2021 10:02:56 AM
    Wait Until Element is Visible  timeout=10s
    Click Element  id=com.apnatime.debug:id/btn_continue
    Wait Until Element is Visible  timeout=10s 
    Click Element  id=com.apnatime.debug:id/sent_post
    Wait Until Element is Visible  timeout=10s
    Click Element  id=com.apnatime.debug:id/iv_back


Post the message
    Wait Until Element is Visible  ${message}  timeout=10s
    Click Element  ${message}
    Wait Until Element is Visible  ${Select_person}  timeout=10s
    Click Element  ${Select_person}
    Wait Until Element is Visible  ${enter_message}  timeout=10s
    Click Element  ${enter_message}
    Wait Until Element is Visible  ${enter_text}   timeout=10s 
    Input Text  ${enter_text}  Good Morning
    Wait Until Element is Visible  ${send_text}  timeout=10s 
    Click Element  ${send_text}
    Wait Until Element is Visible  ${back_button}  timeout=10s 
    Click Element  ${back_button}
    Wait Until Element is Visible  timeout=10s
    Page Should Contain Text  text=Inbox
    Wait Until Element is Visible  timeout=10s
    click Element  ${back_button1}


Restricted words in message
    Wait Until Element is Visible  ${message}  timeout=10s 
    Click Element  ${message}
    Wait Until Element is Visible  ${Select_person}  timeout=10s
    Click Element  ${Select_person}
    Wait Until Element is Visible   ${enter_message} timeout=10s 
    Click Element  ${enter_message}
    Wait Until Element is Visible  ${enter_text}  timeout=10s
    Input Text  ${enter_text}  Fuck off
    Wait Until Element is Visible  ${send_text}  timeout=10s
    Click Element  ${send_text}
    Wait Until Element is Visible   ${alert_message}  timeout=10s 
    Page Should Contain Element  ${alert_message}
    Wait Until Element is Visible  ${ok}  timeout=10s
    Click Element  ${ok}
    Wait Until Element is Visible  ${back_button}  timeout=10s
    Click Element  ${back_button}
    Page Should Contain Text  text=Inbox
    Wait Until Element is Visible  ${back_button1}  timeout=10s
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

${Group} =  id=com.apnatime.debug:id/action_in_app_groups
${ic_move_next} =  id=com.apnatime.debug:id/ic_move_next
${tv_done} =  id=com.apnatime.debug:id/tv_done
${iv_close} =  id=com.apnatime.debug:id/iv_close
${iv_back}  =  id=com.apnatime.debug:id/iv_back
${iv_attach} =  id=com.apnatime.debug:id/iv_attach
${tv_use_this_message} =  id=com.apnatime.debug:id/tv_use_this_message
${tv_guideline_agree} =  id=com.apnatime.debug:id/tv_guideline_agree
${sent_post} =  id=com.apnatime.debug:id/sent_post
${tv_post_message} =  id=com.apnatime.debug:id/tv_post_message
${tv_view_post} =  id=com.apnatime.debug:id/tv_view_post
${tv_message} =  id=com.apnatime.debug:id/tv_message

${message} =  id=com.apnatime.debug:id/iv_conversation
${Select_person} =  id=com.apnatime.debug:id/root
${enter_message} =  id=com.apnatime.debug:id/conversation_message
${enter_text} =  id=com.apnatime.debug:id/conversation_message
${send_text} =  id=com.apnatime.debug:id/conversation_send
${back_button} =  accessibility_id=Navigate up
${back_button1} =  id=com.apnatime.debug:id/iv_back

${alert_message} =  id=android:id/alertTitle
${ok}  id=android:id/button1