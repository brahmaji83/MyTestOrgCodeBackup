<aura:application extends="force:slds">
    <div class="slds-grid slds-grid--frame slds-grid--align-center slds-grid--vertical-align-center">
        
      
        <c:MyPopup >
            <aura:set attribute="popoverBody">
                Test1
            </aura:set>                       
            Test2
        </c:MyPopup>
     
        <div id="anchor">            
            Test 4
            <div class="slds-popover slds-nubbin--bottom-left" role="dialog">                
                <div class="slds-popover__body">
                    Test 3
                </div>
            </div>
        </div>
    </div>
    
    <c:PopOverTestComp1 />
    
    <!--
    <c:ChildComponent />
-->
    <!--
    <c:iframeLC /> -->
    <!--
    <c:YoutubeLC />
    <c:overrideComponent /> 
    <c:justloadit />
    
    <c:forumError />
    <c:cardExample />
    
    <c:LightningTable />-->
    <!--
    <c:DynamicSearch /> 
    <c:DynamicSearchResult />   
    <c:RelatedListComponent />-->
    
    
    
    
</aura:application>