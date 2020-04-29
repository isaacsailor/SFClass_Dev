<aura:application extends="force:slds" >
    
    <aura:handler name="caseSelectionChange" event="c:caseItemSelected"
                  action="{!c.handleSelectedState}"/>
    
    <div id="app-container">
        <div id="controlComp" class="slds-size_3-of-5">
            <c:CaseLightComp/>
        </div>
        <div id="responseComp" class="slds-size_2-of-5">
            <c:AccountComp aura:id="acctTable"/>
            <c:ContactComp aura:id="contTable"/>
        </div>
    </div>
</aura:application>