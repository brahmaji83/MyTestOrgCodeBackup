public class YoutueSearchForLC {
    private static final String SEARCH_URL = 'https://www.googleapis.com/youtube/v3/search';
    private static final String API_KEY = 'AIzaSyDu7bMi1EOdGy6ghddWExTBvhb52CxJ6Yk';   
    
    public static YoutueSearchForLC.Item[] varitems;
    
    @AuraEnabled
    public static List<YoutueSearchForLC.Item> search(String searchText) {        
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = null;
        String endpoint = SEARCH_URL +
            '?part=snippet' +
            '&maxResults=10' +
            '&type=video' +
            '&q=' + EncodingUtil.urlEncode(searchText, 'UTF-8') +
            '&key=' + API_KEY;
        system.debug(endpoint);
        req.setEndPoint(endpoint);
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept','application/json');
        try {
            res = http.send(req);
        //    System.debug(res.getBody());
        } catch (System.CalloutException e){
            System.debug('ERROR:' + e);
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Unable to run search at this time.  Please try again later.'));            
        }
        
        resourceresponse s = (resourceresponse)JSON.deserialize(res.getBody(), resourceresponse.class);
        System.debug('responser result'+s);
        varitems = s.items;
        system.debug(varitems);
        system.debug(s.items);
        return varitems;
    }
    public class resourceresponse {
        @AuraEnabled
        public String kind { get; set; }
        @AuraEnabled
        public String etag { get; set; }
        @AuraEnabled
        public String nextPageToken { get; set; }
        @AuraEnabled
        public String prevPageToken { get; set; }
        @AuraEnabled
        public YoutueSearchForLC.PageInfo pageInfo { get; set; }
        @AuraEnabled
        public YoutueSearchForLC.Item[] items { get; set; }
    }
    
    public class PageInfo {
        @AuraEnabled
        public Integer totalResults { get; set; }
        @AuraEnabled
        public Integer resultsPerPage { get; set; }
    }
    
    public class Item {
        @AuraEnabled
        public String kind { get; set; }
        @AuraEnabled
        public String etag { get; set; }
        @AuraEnabled
        public YoutueSearchForLC.Id id { get; set; }
        @AuraEnabled
        public YoutueSearchForLC.Snippet snippet { get; set; }
    }
    
    public class Id {
        @AuraEnabled
        public String kind { get; set; }
        @AuraEnabled
        public String videoId { get; set; }
    }
    
    public class Snippet {
        @AuraEnabled
        public Datetime publishedAt { get; set; }
        @AuraEnabled
        public String channelId { get; set; }
        @AuraEnabled
        public String title { get; set; }
        @AuraEnabled
        public String description { get; set; }
        @AuraEnabled
        public YoutueSearchForLC.Thumbnails thumbnails { get; set; }
        @AuraEnabled
        public String channelTitle { get; set; }
        @AuraEnabled
        public String liveBroadcastContent { get; set; }
    }
    
    public class Thumbnails {
        //public YouTubeSearchController.Thumbnail default { get; set; }
        @AuraEnabled
        public YoutueSearchForLC.Thumbnail medium { get; set; }
        @AuraEnabled
        public YoutueSearchForLC.Thumbnail high { get; set; }
    }
    
    public class Thumbnail {
        @AuraEnabled
        public String url { get; set; }
    }
    
}