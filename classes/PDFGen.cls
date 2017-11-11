public class PDFGen {
    public Account acc {get;set;}
    public PDFGen(){
        acc = [select id, name, Phone from Account where id =: ApexPages.currentPage().getparameters().get('id')];
    }
    
    public pagereference GenPDF(){
        update acc;
        id accid = apexpages.currentpage().getparameters().get('id');
        pagereference prf = new pagereference('/apex/GenPDF');
        prf.setRedirect(true);
        prf.getParameters().put('id', accid);
        return prf;
    }
    
    public pagereference sendpdf(){
        update acc;
        system.debug('acc phone'+acc.Phone);
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        Pagereference prf = Page.GenPDF;
        id accid = apexpages.currentpage().getparameters().get('id');
        prf.getParameters().put('id', accid);
        prf.setRedirect(true);
        blob b = prf.getContent();
        
        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
        
        attach.setFileName('accountdetails.pdf');
        attach.setBody(b);
        
        List<String> sendaddr = new List<String>{'brahmaji83@gmail.com'};
        email.setSubject('Account Details');
        email.setToAddresses(sendaddr);
        email.setPlainTextBody('Please find attach');        
        email.setFileAttachments(new Messaging.EmailFileAttachment[] { attach});
        Messaging.SendEmailResult [] r = 
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        
        return null;
    }

}