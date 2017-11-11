public class IFSCLookup {
    public static HttpResponse getIFSCDetails(String searchString){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://ifsc.razorpay.com/'+searchString);
        HttpResponse response = http.send(request);
        
        JSON2Apex wrapper = (JSON2Apex) JSON.deserialize(response.getBody(), JSON2Apex.class);
        System.debug('Bank '+wrapper.BANK);
        System.debug('IFSC '+wrapper.IFSC);
        System.debug('BRANCH '+wrapper.BRANCH);
         
        
        /*
        Map<String, Object> mapString = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        System.debug('Bank '+mapString.get('BANK'));
        System.debug('IFSC '+mapString.get('IFSC'));
        System.debug('BRANCH '+mapString.get('BRANCH'));
        System.debug('ADDRESS '+mapString.get('ADDRESS'));
        System.debug('CONTACT '+mapString.get('CONTACT'));
        System.debug('CITY '+mapString.get('CITY'));
        System.debug('DISTRICT '+mapString.get('DISTRICT'));
        System.debug('STATE '+mapString.get('STATE'));
        
        System.debug(mapString);
        System.debug(response.getBody());
        
        */
        return response;
        
    }   
    
    
    public class JSON2Apex {
        public String BANK;
        public String IFSC;
        public String BRANCH;
        public String ADDRESS;
        public Object CONTACT;
        public String CITY;
        public String DISTRICT;
        public String STATE;
    }
    
    
}