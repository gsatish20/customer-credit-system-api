%dw 2.0
output application/json
---
{
 "code": if(error.errorMessage.typedAttributes.statusCode != null) error.errorMessage.typedAttributes.statusCode else 500,
 "message":  error.detailedDescription,
 "serverTimeStamp" : now(),
 "apiName" : app.name,
 "payload" : payload,
 "errors" :
 [
   {
     "reason" : error.exception.STRING_REPRESENTATION,
     "message" :  error.exception.detailMessage,
     "errorType" :  error.errorType.namespace as String ++ ":" ++ error.errorType.identifier as String
   }
 ]
}