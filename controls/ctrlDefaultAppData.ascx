<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlDefaultAppData.ascx.cs" Inherits="ctrlDefaultAppData" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>
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
    .HiddenField
    {
        display:none;
    }
</style>
<div id="divButtons" style="vertical-align:top;" >
    <asp:button id="btnDefault" runat="server" style="font-size:x-small;width:75px;border-radius:5px; font-weight: bold;" text="Home"  onclick="btnDefault_Click" />
    <asp:button id="btnAchievementTest" runat="server" CommandArgument="A" style="font-size:x-small;width:120px;border-radius:5px; font-weight: bold;" text="Achievement Test" onclick="btnAchievementTest_Click" />
    <asp:button id="btnAdditionalAchievement" runat="server" CommandArgument="C" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" text="Additional Achievement Test" onclick="btnAdditionalAchievement_Click"  />
    <asp:button id="btnAptitudeTest" runat="server" CommandArgument="B" style="font-size:x-small;width:100px;border-radius:5px; font-weight: bold;" text="Aptitude Test" onclick="btnAptitudeTest_Click"/>
    <asp:button id="btnAdditionalAptitudeTest" runat="server" CommandArgument="D" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" text="Additional Aptitude Test" onclick="btnAdditionalAptitudeTest_Click"/>
    <input type="button" id="btnAddNewTest" style="font-size:x-small;width:100px;border-radius:5px; font-weight: bold;" value="Add New Test" onclick="btnAddNewTest_Click()"/>
</div>

<hr style="color:#395b8b"  />

<div id="divPanel" style="width: 740px; height: 500px;">
    <obout:Splitter ID="Splitter1" runat="server">
        <LeftPanel WidthMin="369" WidthMax="370">
            <Content>
                <div id="divTitleInactive" style="font-weight: bold; color: #395b8b; font-size: 13pt; width: 100%; text-align: center; text-decoration: underline;">
                    Inactive
                </div>
                <div id="divInactiveTest" style="display: inline; text-align: center;">
                    <center>
                        <obout:Grid ID="grdInactiveTests" runat="server"
                                    AutoGenerateColumns="false"
                                    AllowAddingRecords="false"
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
                                    AllowPageSizeSelection="false"
                                    AllowMultiRecordSelection="false">  
                            <ClientSideEvents OnClientSelect="SetUpForEditInactive" />
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
                <div id="divTitleActive" style="font-weight: bold; color: #395b8b; font-size: 13pt; width: 100%; text-align: center; text-decoration: underline;">
                    Active
                </div>
                <center>
                    <div id="divActiveTest" style="display: inline;text-align:center;">
                        <obout:Grid ID="grdActiveTests" runat="server"
                                    AutoGenerateColumns="false"
                                    AllowAddingRecords="false"
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
                                    AllowPageSizeSelection="false"
                                    AllowMultiRecordSelection="false">
                            <ClientSideEvents OnClientSelect="SetUpForEditActive" />
                            <Columns>
                                <obout:Column DataField="TestId" Width="1" runat="server" Visible="false"  ></obout:Column>
                                <obout:Column DataField="TestType" Width="1" runat="server" Visible="false"  ></obout:Column>
                                <obout:Column DataField="TestName"  Width="1" runat="server" Visible="false"  ></obout:Column>
                                <obout:Column DataField="Description"  Width="1" runat="server" Visible="false"  ></obout:Column>
                                <obout:Column DataField="Active"  Width="1" runat="server" Visible="false" ></obout:Column>
                                <obout:Column DataField="Test"  HeaderText=" " Width="350" runat="server"  ></obout:Column>
                            </Columns>

                        </obout:Grid>
                    </div>
                </center>
            </Content>
        </RightPanel>
    </obout:Splitter>
</div>



<div id="divOfHiddenThings" class="HiddenField">
    
    <obout:oboutTextbox runat="server" id="gTestId" ></obout:oboutTextbox> 
    <obout:oboutTextbox runat="server" id="gTestType" ></obout:oboutTextbox>
    <obout:oboutTextbox runat="server" id="gTestName" ></obout:oboutTextbox> 
    <obout:oboutTextbox runat="server" id="gDescription" ></obout:oboutTextbox> 
    <obout:oboutTextbox runat="server" id="gActive" ></obout:oboutTextbox> 

</div>
<owd:Dialog ID="diaNewTest" runat="server"
            title="&nbsp; Add New Test"
            ShowCloseButton="true" 
            IsModal="true"
            StyleFolder="~/obout_styles/windia/aura"
            IsDraggable="true"   
            VisibleOnLoad="false"
            Width="640" 
            Height="150"
            IconPath="/images/gcsGlobe.png"
            Position="SCREEN_CENTER"
            >
    <center>
       <div id="divNewText" style="padding:5px;" >
            <table>
                <tr>
                    <td colspan="3" style="font-size:18px;text-align:center;color:#395b8b;font-weight:bolder;text-decoration:underline;">
                       <div id="divNewTitle"> Add New Tests </div><br />
                    </td>
                </tr>
                <tr style="font-size:10px;text-align:center;">
                    <td>
                        Test Name
                    </td>
                    <td>
                        Test Description
                    </td>
                    <td>
                        Test Type
                    </td>
                </tr>
                <tr>
                    <td>
                        <obout:OboutTextBox runat="server" id="txtTestNameNew" Width="150px" WatermarkText="Enter Test Name..." /> 
                      
                    </td>
                    <td>
                        <obout:OboutTextBox runat="server" id="txtTestDescriptionNew"  Width="300px" WatermarkText="Enter Test Description..."/>
                    </td>
                    <td>
                        <obout:OboutDropDownList ID="ddTestTypeNew" runat="server"
                                                     DataTextField="Description" 
                                                     datavalueField="TestTypeId"
                                                     AppendDataBoundItems="true"  >                          
                             <Items>
		                        <asp:ListItem>Select a Test Type ...</asp:ListItem>
		                    </Items>
                        </obout:OboutDropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center;">
                        <input type="button" id="btnSaveNewTest" onclick ="btnSaveNewTest_Click()" value="save" style="font-size:x-small;width:100px;border-radius:5px" />
                        <input type="button" id="btnServerSaveNewTest" runat="server" onServerclick ="btnServerSaveNewTest_Click" style="display:none;" />
                        <input type="button" id ="btnNewclose" onClick ="diaNewTest.Close();" value="close" style="font-size:x-small;width:100px;border-radius:5px" />
                    </td>
                </tr>
            </table>
        </div>
    </center>
</owd:Dialog>
<owd:Dialog ID="diaEditTest" runat="server"
            title="&nbsp; Make Test Changes"
            ShowCloseButton="true" 
            IsModal="true"
            StyleFolder="~/obout_styles/windia/aura"
            IsDraggable="true"   
            VisibleOnLoad="false"
            Width="640" 
            Height="150"
            IconPath="/images/gcsGlobe.png"
            Position="SCREEN_CENTER"
            >
    <center>
       <div id="divEditText" style="padding:5px;" >
            <table>
                <tr>
                    <td colspan="3" style="font-size:18px;text-align:center;color:#395b8b;font-weight:bolder;text-decoration:underline;">
                       <div id="divTitle"> Active Tests </div><br />
                    </td>
                </tr>
                <tr style="font-size:10px;text-align:center;">
                    <td>
                        Test Name
                    </td>
                    <td>
                        Test Description
                    </td>
                    <td>
                        Status
                    </td>
                </tr>
                <tr>
                    <td>
                        <obout:OboutTextBox runat="server" id="txtTestName" Width="150px" /> 
                        <div class ="HiddenField">
                              <obout:OboutTextBox runat="server" id="txtTestId"  />
                            <obout:OboutTextBox runat="server" id="txtTestType"  />
                        </div>
                    </td>
                    <td>
                        <obout:OboutTextBox runat="server" id="txtDescription"  Width="300px"/>
                    </td>
                    <td>
                        <obout:OboutDropDownList ID="ddActive" runat="server">
                            <asp:ListItem Text =""  Value ="z"></asp:ListItem>
                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                        </obout:OboutDropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center;">
                        <input type="button" id="btnSaveEditTest" onclick ="btnSaveEditTest_Click()" value="save" style="font-size:x-small;width:100px;border-radius:5px" />
                        <input type="button" id="btnServerSaveEditTest" runat="server" onServerclick ="btnServerSaveEditTest_Click" style="display:none;" />
                        <input type="button" id ="btnclose" onClick ="diaEditTest.Close();" value="close" style="font-size:x-small;width:100px;border-radius:5px" />
                    </td>
                </tr>
            </table>
        </div>
    </center>
</owd:Dialog>
<owd:Dialog ID="diaMessage" runat="server"
            title="Error Message"
            ShowCloseButton="true" 
            IsModal="true"
            StyleFolder="~/obout_styles/windia/grandgray"
            IsDraggable="true"   
            VisibleOnLoad="false"
            Width="500" 
            Height="240"
            IconPath="/images/warning.gif"
            Position="SCREEN_CENTER"
            >
    <center>
        <div ID="divErrorMsg"  style="background-color:Transparent;Border Style:None;Border Color:0px none Transparent;text-align:left;"></div>
        <br /><br />
        <input type="Button" id="btnDiaMessageYes"  style="font-size:x-small;width:100px;border-radius:5px;" />
        <input type="Button" id="btnDiaMessageNo"   style="font-size:x-small;width:100px;border-radius:5px;" />
         <input type="Button" id="btnDiaMessageThree"   style="font-size:x-small;width:100px;border-radius:5px;" />
    </center>
</owd:Dialog>
<script>
    function btnSaveEditTest_Click()
    {
        var whereAreWe = $("#divTitle").html(); 
        var lTestName = txtTestName.value(); 
        var lTestId = txtTestId.value();
        var lDescription = txtDescription.value();
        var lActive = ddActive.value();

        var vTestName = gTestName.value(); 
        var vTestId = gTestId.value();
        var vDescription = gDescription.value();
        var vActive = gActive.value();
     
      
        if(vTestName !== lTestName || vDescription !== lDescription || vActive !== lActive)
        {
            //alert('Inside Somethinghas Changed');
            var lMessage = '<br/><font size="5">You are about to make changes to test ' + lTestName + ',<br /> . <br />Click Ok to continue.<br /></font size>';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
            diaMessage.setSize(500, 240);
            diaMessage.setTitle('User intervention required');
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "ChangeMadeToTests();");
            document.getElementById("btnDiaMessageNo").value = "Cancel";
            document.getElementById("btnDiaMessageNo").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").show();
            $("#btnDiaMessageThree").hide();
            diaMessage.Open();
        }
        else if (vTestName === lTestName && vDescription === lDescription && vActive === lActive)
        {
           diaEditTest.Close();
        } 
        //alert('about to leave changes');
    }
    function LoadDataToEditActive(record)
    {
        divTitle.innerHTML = "Active Test";
        for (var i = 0; i < grdActiveTests.SelectedRecords.length; i++)
        { 
            var record = grdActiveTests.SelectedRecords[i];
            txtTestId.value(record.TestId);
            txtTestName.value(record.TestName);
            txtDescription.value(record.Description);
            ddActive.value(record.Active);

            gTestName.value(record.TestName);
            gTestId.value(record.TestId);
            gDescription.value(record.Description);
            gActive.value(record.Active);
        }
    }
    function LoadDataToEditInactive(record) {
       
       divTitle.innerHTML ="Inactive Test"; 
        for (var i = 0; i < grdInactiveTests.SelectedRecords.length; i++) {
            var record = grdInactiveTests.SelectedRecords[i];
            txtTestId.value(record.TestId);
            txtTestName.value(record.TestName);
            txtDescription.value(record.Description);
            ddActive.value(record.Active);
           
            gTestName.value(record.TestName);
            gTestId.value(record.TestId);
           gDescription.value(record.Description); 
            gActive.value(record.Active);
        }
    }
    function SetUpForEditInactive()
    {
        LoadDataToEditInactive();
        diaEditTest.Open();
    }
    function SetUpForEditActive()
    {
        LoadDataToEditActive();
        diaEditTest.Open();
    }
    function ChangeMadeToTests()
    {
        $('#<%= btnServerSaveEditTest.ClientID%>').click();
    }
    function AddNewTest() {
        $('#<%= btnServerSaveNewTest.ClientID%>').click();
    }
    function DidNotSAveUpdate()
    {
        var lMessage = '<br/><font size="5">There was a problem saving test ' + gTestName.value() + ',<br /> . <br />Click Ok and try again.<br /></font size>';
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
        diaMessage.setSize(500, 240);
        diaMessage.setTitle('User intervention required');
        document.getElementById("btnDiaMessageYes").value = "OK";
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "ChangeMadeToTests();");
        $("#btnDiaMessageNo").hide();
        $("#btnDiaMessageThree").hide();
        diaMessage.Open();
    }
    function SavedUpdate()
    {
        $(document).ready(function () {
            var lMessage = '<br/><font size="5">Test saved. <br />Click Ok to continue.<br /></font size>';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
            diaMessage.setSize(500, 240);
            diaMessage.setTitle('User intervention required');
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "resetScreen();");
            document.getElementById("btnDiaMessageNo").value = "Cancel";
            document.getElementById("btnDiaMessageNo").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").hide();
            $("#btnDiaMessageThree").hide();
            diaMessage.Open();
        });
    }
    function btnAddNewTest_Click()
    {
        diaNewTest.Open();
    }
    function btnSaveNewTest_Click()
    {
       
        var lTestName = txtTestNameNew.value();
        var lDescription = txtTestDescriptionNew.value();
        var lTestType = ddTestTypeNew.value(); 
        var ErrorFlag = true;
        var ErrorMsg = "There was an issue with the data entered please correct issues stated below:";
   
      
        if (lTestName != "Enter Test Name..." && lDescription != "Enter Test Description..." && lTestType > 0)
        {
            ErrorFlag = false;
            var lMessage = '<br/><font size="5">You are about save a new test named ' + lTestName + ',<br /> . <br />Click Ok to continue.<br /></font size>';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
            diaMessage.setSize(500, 240);
            diaMessage.setTitle('User intervention required');
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "AddNewTest();");
            document.getElementById("btnDiaMessageNo").value = "Cancel";
            document.getElementById("btnDiaMessageNo").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").show();
            $("#btnDiaMessageThree").hide();
            diaMessage.Open();
        }
        else 
        {
            if(lTestName == "Enter Test Name...")
                {
                    ErrorFlag = true;
                    ErrorMsg = ErrorMsg + "<br /> A test name must be entered";
                }
            else if (lDescription == "Enter Test Description...")
                {
                    ErrorFlag = true;
                    ErrorMsg = ErrorMsg + "<br /> A description of the test must be entered";
                }
            else if(lTestType < 0) 
                {
                    ErrorFlag = true; 
                    ErrorMsg = ErrorMsg + "<br /> A test type must be entered";
                }
        }
        
        if (ErrorFlag)
        {
            ErrorFlag = false;
            var lMessage = ErrorMsg + '<br />Correct errors and Click Ok to continue.<br /></font size>';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
            diaMessage.setSize(500, 240);
            diaMessage.setTitle('User intervention required');
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
            document.getElementById("btnDiaMessageNo").value = "Cancel";
            document.getElementById("btnDiaMessageNo").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").hide();
            $("#btnDiaMessageThree").hide();
            diaMessage.Open();
        }
    }
    function SavedNew() {
        $(document).ready(function () {
            var lMessage = '<br/><font size="5">New Test has been saved. <br />Click Ok to continue.<br /></font size>';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
            diaMessage.setSize(500, 240);
            diaMessage.setTitle('User intervention required');
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "resetScreen();");
            document.getElementById("btnDiaMessageNo").value = "Cancel";
            document.getElementById("btnDiaMessageNo").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").hide();
            $("#btnDiaMessageThree").hide();
            diaMessage.Open();
        });
    }
    function DidNotSavedNew()
    {
        var lMessage = '<br/><font size="5">There was a problem saving New test, <br />Click Ok and try saving again.<br /></font size>';
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
        diaMessage.setSize(500, 240);
        diaMessage.setTitle('User intervention required');
        document.getElementById("btnDiaMessageYes").value = "OK";
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "ChangeMadeToTests();");
        $("#btnDiaMessageNo").hide();
        $("#btnDiaMessageThree").hide();
        diaMessage.Open();
    }
    function resetScreen()
    {
        $(document).ready(function () {
            btnAchievementTest_Click();
        });
    }
</script>

    