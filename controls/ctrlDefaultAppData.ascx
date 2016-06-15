<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlDefaultAppData.ascx.cs" Inherits="ctrlDefaultAppData" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Register Assembly="obout_Splitter2_Net" Namespace="OboutInc.Splitter2" TagPrefix="obout" %>

<%@ Register TagPrefix="cc1" Namespace="System.Web.UI" Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>
<style type="text/css">
    .tdText
    {
        font: 11px Verdana;
        color: #333333;
    }
</style>

<div id="divButtons" style="vertical-align:top;" >
    <asp:button id="btnAchievementTest" runat="server" CommandArgument="A" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" text="Achievement Test" onclick="btnAchievementTest_Click" />
    <asp:button id="btnAdditionalAchievement" runat="server" CommandArgument="B" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" text="Additional Achievement Test" onclick="btnAdditionalAchievement_Click"  />
    <asp:button id="btnAptitudeTest" runat="server" CommandArgument="C" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" text="Aptitude Test" onclick="btnAptitudeTest_Click"/>
    <asp:button id="btnAdditionalAptitudeTest" runat="server" CommandArgument="D" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" text="Additional Aptitude Test" onclick="btnAdditionalAptitudeTest_Click"/>
</div>
<hr style="color:#395b8b"  />

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div id="divPanel" style="width:740px;height:500px;" >
            <obout:Splitter ID="Splitter1" runat="server">
                <LeftPanel WidthMin="369" WidthMax="370">
                    <Content>
                        <div id="divTitleInactive" style="font-weight:bold;color:#395b8b;font-size:13pt;width:100%;text-align:center;text-decoration:underline;">
                            Inactive
                        </div>
                        <div id="divInactiveTest" style="display: inline;text-align:center;">
                            <center>
                            <obout:Grid ID="grdInactiveTests" runat="server"
                                        AutoGenerateColumns="false"
                                        AllowAddingRecords="true"
                                        ShowFooter="true"
                                        PageSize="16"
                                        AllowManualPaging="false"
                                        AllowRecordSelection="true"
                                        EnableRecordHover="true"
                                        Serialize="true"
                                        CallbackMode="true"
                                        KeepSelectedRecords="true"
                                        AllowSorting="false"
                                        ShowHeader="true"
                                        >
                                <Columns>
                                    <obout:Column DataField="TestId" Width="1" runat="server" Visible="false"  ></obout:Column>
                                    <obout:Column DataField="TestName"  Width="1" runat="server" Visible="false"  ></obout:Column>
                                    <obout:Column DataField="Description"  Width="1" runat="server" Visible="false"  ></obout:Column>
                                    <obout:Column DataField="Active"  Width="1" runat="server" Visible="false" ></obout:Column>
                                    <obout:Column DataField="Test"  HeaderText=" " Width="350" runat="server"  ></obout:Column>
                                </Columns>

                            </obout:Grid>
                            </center>
                        </div>

                    </Content>
                </LeftPanel>
                <RightPanel WidthMin="369" WidthMax="370">
                    <Content>
                        <div id="divTitleActive" style="font-weight:bold;color:#395b8b;font-size:13pt;width:100%;text-align:center;text-decoration:underline;">
                            Active
                        </div>
                        <Center>
                          <div id="divActiveTest" style="display: inline;text-align:center;">
                            <obout:Grid ID="grdActiveTests" runat="server"
                                        AutoGenerateColumns="false"
                                        AllowAddingRecords="true"
                                        ShowFooter="true"
                                        PageSize="16"
                                        AllowManualPaging="false"
                                        AllowRecordSelection="true"
                                        EnableRecordHover="true"
                                        Serialize="true"
                                        CallbackMode="true"
                                        KeepSelectedRecords="true"
                                        AllowSorting="false"
                                        ShowHeader="true"
                                        
                                        >
                                <ClientSideEvents OnClientSelect="SetUpForEdit" />
                                <Columns>
                                    <obout:Column DataField="TestId" Width="1" runat="server" Visible="false"  ></obout:Column>
                                    <obout:Column DataField="TestName"  Width="1" runat="server" Visible="false"  ></obout:Column>
                                    <obout:Column DataField="Description"  Width="1" runat="server" Visible="false"  ></obout:Column>
                                    <obout:Column DataField="Active"  Width="1" runat="server" Visible="false" ></obout:Column>
                                    <obout:Column DataField="Test"  HeaderText=" " Width="350" runat="server"  ></obout:Column>
                                </Columns>

            </obout:Grid>
                            </center>
                        </div>

                    </Content>
                </RightPanel>
            </obout:Splitter>
            </ContentTemplate>
        </asp:UpdatePanel>


<owd:Dialog ID="diaEditTest" runat="server"
                 title="Make Test Changes"
                ShowCloseButton="true" 
                IsModal="true"
                StyleFolder="~/obout_styles/windia/grandgray"
                IsDraggable="true"   
                VisibleOnLoad="false"
                Width="600" 
                Height="100"
                IconPath="/images/warning.gif"
                Position="SCREEN_CENTER"
                >
    <center>
            
        <div id="divEditText" style="padding:5;">
            <br />
            <br />   
             <input type="text" id="txtTestId" disabled />
             <input type="text" id="txtTestName" />
             <input type="text" id="txDescription" />
             <asp:DropDownList ID="ddActive" runat="server">
             <asp:ListItem Text =""  Value ="z"></asp:ListItem>
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="0"></asp:ListItem>
            </asp:DropDownList>
                        <input type="button" id="btnSaveEditTest" onclick ="btnSaveEditTest_Click()" value="save" />
              <input type="button" id ="btnclose" onClick ="diaEditTest.Close();" value="close" /> 
            
            </div>


   </center>
</owd:Dialog>

<script>
    function btnSaveEditTest_Click()
    {
      
            var record = grdActiveMembers.SelectedRecords[1];
            document.getElementById('txtTestId').value = record.TestId;
            document.getElementById('txtTestName').value = record.TestName;
            document.getElementById('txDescription').value = record.Description;
            ddActive = record.Active;
                
       
        grdActiveTests.SelectedRecords
    }
    function SetUpForEdit()
    {
        diaEditTest.Open();
    }

</script>

