#https://github.com/bulkan/robotframework-requests 
#https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.txt
#http://stackoverflow.com/questions/35262216/json-handling-in-robot
#http://peritus.github.io/robotframework-httplibrary/HttpLibrary.html#POST
#http://peritus.github.io/robotframework-httplibrary/HttpLibrary.html


*** Settings ***
Library                   Collections


#Resource                  environment_variables.robot
Resource                  client_operations.robot

*** Test cases***
Test get total of clients
    Get the total of clients
    
Test create a new client
    Create a client  
 
Test delete a client    
    Delete a client 
    
Test edit a client
    Edit a client    

Test get total of clients2
    Get the total of clients
    
Test Get id last client
    Get id last client    
    