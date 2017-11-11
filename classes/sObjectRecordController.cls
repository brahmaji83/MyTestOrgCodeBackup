/**
* This apex class to return the list of records for the specified object
* 
* @Author  Karanraj Sankaranarayanan 
* @version 1.0
* @since   2016-5-12
*/ 

public class sObjectRecordController {
    /**
* This method is used to return recently view records
* @param ObjectName - Specify the API name of object to get recently view records
* @param fieldstoget - Fields from the object need to get
* @param pageNumber - Number of the page to display in the table
* @param pageSize - Number of records needs to be displayed in the page
*/ 
    @AuraEnabled public static lightningTableWrapper getRecords(String ObjectName,String fieldstoget,decimal pageNumber, String pageSize, String searchStr, String fieldSetName, String fiednameServer){     
        
        integer offset = (integer.valueOf(pageNumber) - 1) * integer.valueof(pageSize);
        List<String> lstFieldsFromFS = new List<String>();
        System.debug(fieldSetName);
        if(!String.isBlank(fieldSetName)){
            Map<String, Schema.SObjectType> GlobalDescribeMap = Schema.getGlobalDescribe(); 
            Schema.SObjectType SObjectTypeObj = GlobalDescribeMap.get(ObjectName);
            Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();            
            Schema.FieldSet fieldSetObj = DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName);
            System.debug(fieldSetObj);                
            for(Schema.FieldSetMember sf : fieldSetObj.getFields()){
                System.debug('entered inside fsm');
                lstFieldsFromFS.add(String.valueOf(sf.getFieldPath()));
            }
        }
        else{
            lstFieldsFromFS.add('Id');
            lstFieldsFromFS.add('Name');
        }
        
        String strWhereClause = '';
        
        if(!lstFieldsFromFS.isEmpty()){
            for(String str : lstFieldsFromFS){
                if(!String.isBlank(strWhereClause)){
                    strWhereClause = strWhereClause + ',' + str;    
                }else{
                    strWhereClause = str;
                }            
            }
        }
        
        
        String strOperator = ' LIKE '+'\'%' + searchStr +'%\'';
        String queryString = 'Select '+ strWhereClause +
            ' from '+ String.escapeSingleQuotes(ObjectName) +
            ' where ' + fiednameServer + strOperator +
            ' Limit '+ String.escapeSingleQuotes(pageSize) + ' Offset '+offset;     
        System.debug('Query String-->'+queryString);
        lightningTableWrapper ltw = new lightningTableWrapper();
        ltw.total = database.countQuery('Select count() from '+String.escapeSingleQuotes(ObjectName) + ' where '+ fiednameServer + strOperator);
        ltw.page = Integer.valueOf(pageNumber);
        ltw.sObjectrecords = database.query(queryString);
        ltw.fieldsToDisplay = lstFieldsFromFS;
        System.debug(lstFieldsFromFS);
        return ltw;
    }
}