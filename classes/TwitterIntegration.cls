public class TwitterIntegration {
    
    public static String getTwitterAccessToken(){
        
        String keyencoded = EncodingUtil.urlEncode('p5hADYeDhui3iGlFUeYAlCnO5', 'UTF-8');
        String secretkeyencoded = EncodingUtil.urlEncode('VP6YeivqmMjHiXEa0fmzMqt2WJtYhhVqKPJdXVxu1UOzofQ2yy', 'UTF-8');
        
        //Create Final Key String
        String sFinal = keyencoded + ':' + secretkeyencoded;
        //Convert to Blob
        Blob headerValue = Blob.valueOf(sFinal);
        
        //Build Request
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.twitter.com/oauth2/token');
        req.setMethod('POST');
        
        //Add Auth Header
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        
        //You need to add this to the request - proved easy to miss in instructions...
        req.setBody('grant_type=client_credentials');
        
        //Make request
        Http http = new Http();
        HTTPResponse res = http.send(req);
        String stoken;
        //Parse JSON for Bearer Token
        JSONParser parser = JSON.createParser(res.getBody());
        while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText() == 'access_token'){
                parser.nextToken();
                stoken = parser.getText();
            }
        }
        //Return Token so it can be used in next call
        return stoken;
    }
    
    
    public static void searchTweets(String searchString){
        String authorizationHeader = 'Bearer ' + getTwitterAccessToken();
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', authorizationHeader);
        req.setEndpoint('https://api.twitter.com/1.1/search/tweets.json?q='+searchString);
        req.setMethod('GET');
        HttpResponse response = http.send(req);
        System.debug(response.getBody());
        
        Map<String, Object> mapFetchData = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        System.debug('Total nodes' + mapFetchData.size());
        
        List<Object> statusObj = (List<Object>) mapFetchData.get('statuses');
        System.debug('Total Tweets ' + statusObj.size());                              
        
        for(Object eachObj : statusObj){
            Map<String, Object> mapStatusData = (Map<String, Object>) eachObj;          
            if(mapStatusData.containsKey('user')){
            	Map<String, Object> mapUserData = (Map<String, Object>) mapStatusData.get('user');
            //	System.debug(mapUserData.get('lang'));    
            }                              
        } 
        
        
        System.debug(response.getBody());
        JSONParser parser = JSON.createParser(response.getBody());
        while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME){
            //    System.debug(parser.getText());
                parser.nextToken();                
              //  System.debug(parser.getText());
            }
        }
    }


    public static void retweet(String searchString){
        String authorizationHeader = 'Bearer ' + getTwitterAccessToken();

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', authorizationHeader);
        req.setEndpoint('https://api.twitter.com/1.1/statuses/retweet/'+searchString+'.json');
        req.setMethod('POST');
        HttpResponse response = http.send(req);
        System.debug(response.getBody());
    }
           
}