trigger updatetrigger on Account (before update) {
    public string ab;
    for(Account a:Trigger.old){
        system.debug('Tigger Old: '+a.Name);
 		System.debug('Trigger old industry'+a.Industry);     
        ab=a.Name+'Hello';
        
    }
    
    for(Account b:Trigger.New){
        system.debug('Trigger new Name'+b.Name);
        system.debug('Trigger new Industry'+b.Industry);
        b.Name=ab;
        system.debug('Trigger new Name'+b.Name);
    }
    system.debug('Hi');
}