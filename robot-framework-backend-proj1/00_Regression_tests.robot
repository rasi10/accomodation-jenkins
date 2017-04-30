#https://github.com/bulkan/robotframework-requests 
#https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.txt
#http://stackoverflow.com/questions/35262216/json-handling-in-robot
#http://peritus.github.io/robotframework-httplibrary/HttpLibrary.html#POST
#http://peritus.github.io/robotframework-httplibrary/HttpLibrary.html


*** Settings ***
Library                   RequestsLibrary
Library                   Collections


Resource                  environment_variables.robot
Resource                  client_operations.robot

*** Test cases***
Test case get all clients
    Get all clients
	
Test case get a client by id
    Get a specific client by id     6

Test case edit a client
    Edit a client 
       
Test case get count clients
    ${total}=             Get the total of clients
    log to console        ${total}   
  
#Test case create a client
#    Create a client 
    
#Test case delete a client
#    Delete a client    16
  
  