<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlDefaultAppData.ascx.cs" Inherits="ctrlDefaultAppData" %>
<%@ Register Assembly="obout_EasyMenu_Pro" Namespace="OboutInc.EasyMenu_Pro" TagPrefix="oem" %>
<%@ Register Assembly="obout_SuperForm" Namespace="Obout.SuperForm" TagPrefix="obout" %>


            
    <div id="divButtons" >
            <input type="button" id="btnAchievementTest" runat="server" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" value="Achievement Test" />
            <input type="button" id="btnAdditionalAchievement" runat="server" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" value="Additional Achievement Test" />
            <input type="button" id="btnAptitudeTest" runat="server" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" value="Aptitude Test" />
            <input type="button" id="btnAdditionalAptitudeTest" runat="server" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" value="Additional Aptitude Test" />
    </div>
    <asp:UpdatePanel runat="server" updatemode="Conditional">
        <Triggers>
             <asp:AsyncPostBackTrigger Controlid="btnAchievementTest" runat="server"        EventName= "btnAchievementTest_Click"  />
             <asp:AsyncPostBackTrigger Controlid="btnAdditionalAchievement" runat="server"  EventName= "btnAdditionalAchievement_Click" />
             <asp:AsyncPostBackTrigger Controlid="btnAptitudeTest" runat="server"           EventName= "btnAptitudeTest_Click"  />
             <asp:AsyncPostBackTrigger Controlid="btnAdditionalAptitudeTest" runat="server" EventName= "btnAdditionalAptitudeTest_Click"  /> 
       </Triggers>
       <ContentTemplate>
            <div style="border:3px solid #c0cff0;width:740px;" ID="divTabContainer" runat="server">
			    <asp:Panel ID="panel_tab1" runat="server" Visible="false">
				    <h3>Tab Content 1</h3>
			    </asp:Panel>
			    
		    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
      

<script>
    function SelectTab(itemID)
    {
	  
    }
</script>