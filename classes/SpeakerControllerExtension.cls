public class SpeakerControllerExtension {
    public integer counter {get;set;}
    public blob picture {get;set;}
    public String errormessage {get;set;}
    private final Speaker__c speaker;
    private ApexPages.StandardController stdcontroller;
    
    public SpeakerControllerExtension(ApexPages.StandardController sdcontroller){
        this.stdcontroller = sdcontroller;
        this.counter = 0;
        this.speaker = (Speaker__c) sdcontroller.getRecord();
    }
    
    public void increment(){
        counter++;
    }
    
    public pagereference save(){
        errormessage = '';
        try{
            upsert speaker;
            if(picture != null){
                Attachment attachment = new Attachment();
                attachment.Body = picture;
                attachment.ContentType = 'application/jpg';
                attachment.Name='Speaker '+speaker.Id;
                attachment.ParentId=speaker.Id;
                insert attachment;
                speaker.Picture_Path__c = '/servlet/servlet.FileDownload?file='+attachment.Id;
                update speaker;
            }
            return new ApexPages.StandardController(speaker).view();
        }
        catch(Exception e){
            errormessage = e.getMessage();
            return null;
        }
        
    }
    

}