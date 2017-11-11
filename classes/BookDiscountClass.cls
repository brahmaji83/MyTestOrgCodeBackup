public class BookDiscountClass {
    
    public static void givediscount(List<Book__c> books){
        for(Book__c b: books){
            b.Price__c = b.Price__c * 0.9;
        }
    }

}