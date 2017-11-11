public class SimpleDynamicController {

/*    public Component.Apex.Detail getDynamicDetail() {
        Component.Apex.Detail detail = new Component.Apex.Detail();
        detail.expressions.subject = '{!acct.OwnerId}';
        detail.relatedList = false;
        detail.title = false;
        return detail;
    }
*/
    public Component.Apex.form getDynamicDetail(){
        Component.Apex.form form = new Component.Apex.form();
        Component.Apex.outputlabel ol= new Component.Apex.outputLabel();
        Component.Apex.selectradio sr= new Component.Apex.selectradio();
        sr.value = 'Item1';
        ol.value = 'Search';
        form.childComponents.add(sr);
      //  return ol;
        return form;
    }
    // Just return the first Account, for example purposes only
    public Account acct {
        get { return [SELECT Id, Name, OwnerId FROM Account LIMIT 1]; }
    }
}