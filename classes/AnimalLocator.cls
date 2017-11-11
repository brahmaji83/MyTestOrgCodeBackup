public class AnimalLocator {
    
    public static String getAnimalNameById(Integer varId){        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+varId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        String str;
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.            
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());           
			Map<String, Object> lstObj = (Map<String, Object>) results.get('animal');
			str = (String) lstobj.get('name');                  
            
            // Cast the values in the 'animals' key as a list

        }
        return str;        
    }
    
}