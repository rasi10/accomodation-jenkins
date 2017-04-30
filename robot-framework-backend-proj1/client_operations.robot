#MAKING A REQUEST WITH CURL
#sudo apt install curl
# curl  http://rbt-course:8080/hotel-rest/webresources/client/6
# curl  http://rbt-course:8080/hotel-rest/webresources/client/
# curl  http://rbt-course:8080/hotel-rest/webresources/client/count
# curl -i -X PUT -H 'Content-Type: application/json' -d '{"id": "6", "name": "rafael_curl", "createDate": "1473633063279", "email": "rafael@email.com", "gender": "M", "socialSecurityNumber": "1234445"}' http://rbt-course:8080/hotel-rest/webresources/client/6

*** Settings ***
Library                              HttpLibrary.HTTP
#Library                              RequestsLibrary
#Library                              Collections
#Library                              String
#Library                              json
#Library                              OperatingSystem

Resource                             environment_variables.robot


*** keywords ***
Get all clients        
    Create Http Context              localhost:8080     http     
    Set Request Header               Content-Type    application/json
    Set Request Header               Accept    */*   
    HttpLibrary.HTTP.GET             /hotel-rest/webresources/client/
    ${response_status}=              Get response Status   
    log to console                   ${response_status}   
    Should contain                   ${response_status}	                      200

Get a specific client by id          [Arguments]                              ${client_id}      
    Create Http Context              localhost:8080     http     
    Set Request Header               Content-Type    application/json
    Set Request Header               Accept    */*   
    HttpLibrary.HTTP.GET             /hotel-rest/webresources/client/${client_id}
    ${response_status}=              Get response Status   
    log to console                   ${response_status}   
    Should contain                   ${response_status}	                      200
      
Edit a client  
    ${dictionary}=                   Create Dictionary  id=6   name=rafael_new  createDate=1473633063279   email=rafael@email.com   gender=M   socialSecurityNumber=1234445  
    Create Http Context              localhost:8080     http     
    Set Request Header               Content-Type    application/json
    Set Request Header               Accept    */*   
    ${value}=    Stringify Json      ${dictionary}
    Set Request Body                 ${value}
    HttpLibrary.HTTP.PUT             /hotel-rest/webresources/client/6
    ${response_status}=              Get response Status   
    log to console                   ${response_status}   
    Should contain                   ${response_status}	                      204
   
Get the total of clients                      
    Create Http Context              localhost:8080     http     
    Set Request Header               Content-Type    application/json
    Set Request Header               Accept    */*   
    HttpLibrary.HTTP.GET             /hotel-rest/webresources/client/count
    ${response_status}=              Get response Status
    ${total_clients}=                Get response body      
    log to console                   ${response_status}   
    Should contain                   ${response_status}	                      200 
    [Return]                         ${total_clients}             
  
      
Create a client                      
    ${dictionary}=                   Create Dictionary  id=102   name=namecreatetwo  createDate=1473633063279   email=namecreatetwo@email.com   gender=M   socialSecurityNumber=09882
    Create Http Context              localhost:8080     http     
    Set Request Header               Content-Type    application/json
    Set Request Header               Accept    */*   
    ${value}=    Stringify Json      ${dictionary}
    Set Request Body                 ${value}
    HttpLibrary.HTTP.POST            /hotel-rest/webresources/client/
    ${response_status}=              Get response Status    
    log to console                   ${response_status}   
    Should contain                   ${response_status}	                      204   
   

Delete a client                      [Arguments]                              ${client_id}   
    Create Http Context              localhost:8080     http     
    Set Request Header               Content-Type    application/json
    Set Request Header               Accept    */*   
    HttpLibrary.HTTP.DELETE          /hotel-rest/webresources/client/${client_id}
    ${response_status}=              Get response Status   
    log to console                   ${response_status}   
    Should contain                   ${response_status}	                      204
  
  
   
  
*** comments ***    
Create a specific client
    ${json_string} =   catenate
    ...    {
    ...    "id": 100,
    ...    "name": "test",
    ...    "createDate": 1473633063279,
    ...    "email": "test@email.com",
    ...    "gender": "M",
    ...    "socialSecurityNumber": "121211"
    ...    }
    
    Create Session	  hotel	     ${BASE_URL} 	
	${resp}=	post Request	 hotel	   /webresources/client/        ${json_string}
	
	#${resp}=	Get Request	     hotel	   /webresources/client/${client_id}
	#Should Be Equal As Strings	 ${resp.status_code}	200	
	#${pretty}=                   RequestsLibrary.To Json       ${resp.text}      pretty_print=True
	#Should Contain               ${resp.text}       JP.ALENCAR@HOTMAIL.COM	
    #log to console               ${pretty}
    
    
    

    
Building a json file to make a request

   [Tags]  get
    Create Session  httpbin     http://httpbin.org
    &{data}=    Create Dictionary     latitude=30.496346    longitude=-87.640356
    log to console         test
    log to console        ${data}
    set to dictionary     ${data}   rafael     rafaelvalue    
    log to console        ${data}
       
    
Post Requests
    [Tags]  post
    Create Session  httpbin  http://httpbin.org
    &{data}=  Create Dictionary  name=bulkan  surname=evcimen
    &{headers}=  Create Dictionary  Content-Type=application/x-www-form-urlencoded
    ${resp}=  Post Request  httpbin  /post  data=${data}  headers=${headers}
    Dictionary Should Contain Value  ${resp.json()['form']}  bulkan
    Dictionary Should Contain Value  ${resp.json()['form']}  evcimen    
    
    
    
 Get all clients with requests
	Create Session	  hotel	         ${BASE_URL} 	
	${resp}=	Get Request	         hotel	   /webresources/client
	Should Be Equal As Strings	     ${resp.status_code}	200	
	#log to console                  ${resp.status_code}
	#log to console                  ${resp.headers}
	#log to console                  ${resp.text}
	${pretty}=                       RequestsLibrary.To Json       ${resp.text}      pretty_print=True
	Should Contain                   ${resp.text}       JP.ALENCAR@HOTMAIL.COM	
    #log to console                  ${pretty}
    
    
#The Assertion for this method should be corrected
Get a specific client                [Arguments]       ${client_id}
    Create Session	  hotel	         ${BASE_URL} 	
	${resp}=	Get Request	         hotel	   /webresources/client/${client_id}
	Should Be Equal As Strings	     ${resp.status_code}	200	
	#Should Contain                   ${resp.text}       test@email.com
	${pretty}=                       RequestsLibrary.To Json       ${resp.text}      pretty_print=True		
    log to console                   ${pretty}
    

 
    
      