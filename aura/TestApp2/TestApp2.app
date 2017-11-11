<aura:application extends="force:slds" controller="customLookUpController">
    <!-- Create attribute to store lookup value as a sObject
    <aura:attribute name="selectedLookUpRecord" type="sObject" default="{}"/>
    
    <c:customLookup objectAPIName="account" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecord}" label="Account Name"/>
        
    <c:lightningdataTableTrail />
    <c:AccountSearchLCwithSLDS /> -->  
    <aura:attribute name="selectedLookUpRecord" type="sObject" default="{}"/>
    <aura:handler name="init" value="{!this}" action="{!c.loadASingleRecord}" />
    
    <c:customLookup objectAPIName="account" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecord}" label="Account Name"/>
  
    <c:TestChildLC />
</aura:application>