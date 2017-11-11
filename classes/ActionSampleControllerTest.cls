@isTest
public class ActionSampleControllerTest {

    static testmethod void ActionSample(){
        ActionSampleController ascc = new ActionSampleController();
        ascc.accName = 'Brashma';
        ascc.accNames = 'Brafd';
        ascc.createAcccount();
        ascc.searchaccount();
    }
}