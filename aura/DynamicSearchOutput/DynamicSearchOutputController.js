({
    doInit : function(component, helper) {
  //      console.log('entered dynamic search output');
        var Contact = component.get('v.objRecord');
        var FieldName = component.get('v.fieldName');
        var outputText = component.find("outputId");
    //    outputText.set("v.body",Contact[FieldName]);
//        console.log(Contact[FieldName]+'entered dynamic search output');
        component.set("v.body",Contact[FieldName]);
    }
})