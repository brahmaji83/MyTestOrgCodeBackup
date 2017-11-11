public class PinCodeSearchController {
    
    @AuraEnabled
    public static Object searchData(String strPinCode){        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://postalpincode.in/api/pincode/'+strPinCode);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug(response.getBody());
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            if(!results.isEmpty()){
                List<Object> animals = (List<Object>) results.get('PostOffice'); 
                return animals;
            }else{
                return null;
            }
        }else{
            return null;
        }
        
    }
    
    public static void getRecordData(String strPlaceName){
        String strInput = strPlaceName.replace(' ', '+');
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://maps.googleapis.com/maps/api/geocode/json?address='+strInput+'&key=AIzaSyDxDY-AwnlNlayhji-3j6aDRbXbKRqg764');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());       
            List<Object> lstObj = (List<Object>) results.get('results');
            Map<String, Object> geometry = (Map<String, Object>) lstObj[0];    
            Map<String, Object> locdetails = (Map<String, Object>) geometry.get('geometry');
            Map<String, Object> langLat = (Map<String, Object>) locdetails.get('location');
            System.debug(langLat.get('lng'));
            System.debug(langLat.get('lat'));
        }
        
        
    }
}