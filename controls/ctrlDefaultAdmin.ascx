<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlDefaultAdmin.ascx.cs" Inherits="controls_ctrlDefaultAdmin" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolKit" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>


<style type="text/css">
    .gridRowTitle{
        background-image: url('http://localhost:46582/images/gridRowTitlebg.PNG');
        background-repeat:repeat-x;
        text-align:left;
        background-color:transparent;
        font-family:Verdana;
        font-size:x-small;
        color:#295b8b;
    }
    .gridTitle{
        background-image: url('http://localhost:46582/images/gridTitlebg.PNG');
        background-repeat:repeat;
        text-align:left;
        background-color:transparent;
        font-family:Verdana;
        font-size:small;
        background:transparent; 
        color: white;
        width:739px;
        text-align:left; 
    }
    .gridData{
        Font-Size:x-Small;
        color:#295b8b;
        font-family:Verdana;
        background-color:#CCCCCC;
        text-align:center;
    }
  
        
</style>


<div id="divAdminFormMain">
    
    <div id="divExistingUsers">
        <table border="0">
            <tr>
                <td style="text-align: left;">
                    &nbsp;
                </td>
                <td style="text-align: right;">
                    <input type="button" id="AddUser" name="AddUser" style="border-style: none; border-width: 0px; font-size: x-small; border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #295b8b; font-family: Verdana; background-color: transparent; outline: none; display: inline;" value="Add New" onclick="diaSearch.Open()" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="aciveMembers" runat="server">
                        <obout:Grid ID="grdActiveMembers" runat="server"
                            AutoGenerateColumns="false"
                            AllowAddingRecords="false"
                            ShowFooter="true"
                            PageSize="30"
                            AllowManualPaging="false"
                            AllowRecordSelection="true"
                            AllowMultiRecordSelection="false"
                            EnableRecordHover="true"
                            Serialize="true"
                            CallbackMode="true"
                            Width="740"
                            KeepSelectedRecords="true"
                            AllowPageSizeSelection="false">
                            <ClientSideEvents  OnClientSelect="DoRow_Clicked" />
                            <Columns>
                                <obout:Column HeaderText="ID" DataField="MemberId" ReadOnly="true" Visible="false"></obout:Column>
                                <obout:Column HeaderText="Site" DataField="SiteId" ReadOnly="true" Visible="false"></obout:Column>
                                <obout:Column HeaderText="Full Name" DataField="FullName" ReadOnly="true" ItemStyle-Font-Size="10pt" Width="240"></obout:Column>
                                <obout:Column HeaderText="GroupType" DataField="Groupid" ReadOnly="true" ItemStyle-Font-Size="10pt" Width="150"></obout:Column>
                                <obout:Column HeaderText="Sites" DataField="SiteName" ReadOnly="true" ItemStyle-Font-Size="10pt" Width="350"></obout:Column>
                            </Columns>
                            <TemplateSettings HeadingTemplateId="Active" />
                            <Templates>
                                <obout:GridTemplate runat="server" ID="Active">
                                    <Template>AG Staff</Template>
                                </obout:GridTemplate>
                            </Templates>
                        </obout:Grid>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" id="AddUser1" name="AddUser1" style="border-style: none; border-width: 0px; font-size: x-small; border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #295b8b; font-family: Verdana; background-color: transparent; outline: none; display: inline;" value="Add New" onclick="diaSearch.Open()" />
                </td>
            </tr>
        </table>
    </div>
    <table width="740px" >
        <tr>
            <td colspan="2">
                <div id="divAddEmployees" style="display: none;">
                    Select Group Assignment:
                  <obout:OboutDropDownList ID="ddlGroups" runat="server" Width="175px" Font-Size="small" DataTextField="GroupName" DataValueField="GroupId" AppendDataBoundItems="true">
                      <asp:ListItem Text="" Value="0"></asp:ListItem>
                  </obout:OboutDropDownList>
                    <br />
                </div>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <div id="divAddEmployees1" style="display: none;">
                    <obout:Grid ID="grdEmployees" runat="server"
                        AutoGenerateColumns="false"
                        AllowAddingRecords="false"
                        ShowFooter="false"
                        PageSize="5000"
                        AllowManualPaging="false"
                        AllowRecordSelection="true"
                        AllowMultiRecordSelection="false"
                        EnableRecordHover="true"
                        Serialize="true"
                        CallbackMode="true"
                        Width="370"
                        Height="550"
                        KeepSelectedRecords="true"
                        AllowSorting="false"
                        AllowPageSizeSelection="false">
                        <ScrollingSettings ScrollHeight="700" ScrollTop="250" />
                        <Columns>
                            <obout:Column HeaderText="ID" DataField="MemberId" ReadOnly="true" Visible="false"></obout:Column>
                            <obout:Column HeaderText="Full Name" DataField="FullName" ReadOnly="true" Visible="false"></obout:Column>
                            <obout:Column HeaderText="Employees" DataField="FullNamePlus" ReadOnly="true" Width="360px"></obout:Column>
                        </Columns>
                    </obout:Grid>
                </div>
            </td>
            <td style="text-align:left;">
                <div id="divAddEmployeesSites" style="display: none;">
                    <obout:Grid ID="grdSchoolSelect" runat="server"
                        AutoGenerateColumns="false"
                        AllowAddingRecords="false"
                        ShowFooter="false"
                        PageSize="7000"
                        AllowManualPaging="false"
                        AllowRecordSelection="true"
                        AllowMultiRecordSelection="true"
                        EnableRecordHover="true"
                        Serialize="true"
                        CallbackMode="true"
                        Width="370"
                        Height="550"
                        KeepSelectedRecords="true"
                        AllowSorting="false"
                        AllowPageSizeSelection="false">
                        <ScrollingSettings ScrollHeight="700" ScrollTop="250" />
                        <Columns>
                            <obout:Column HeaderText="Site Id" DataField="SiteId" ReadOnly="true" Visible="false"></obout:Column>
                            <obout:Column HeaderText="Site Name" DataField="SiteName" ReadOnly="true" Visible="true" Width="360px"></obout:Column>
                        </Columns>
                    </obout:Grid>


                </div>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <center>
                        <div id="divAddEmployeesButtons" style="display:none;" > 
                              <input type="button" id="btnSaveNewEmployee" name="btnSaveNewEmployee" onclick="btnSaveNewEmployee_Click()" value="Save" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" />
                              <input type="button" id="btnServerSaveNewEmployee" name="btnServerSaveNewEmployee" runat="server" style="display:none;" onserverclick="btnServerSaveNewEmployee_Click" /> 
                              <input type="button" id="btnCancelNewEmployee" name="btnCancelNewEmployee" value="Cancel" onclick="btnCancelNewEmployee_Click()"  style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;"/>
                        </div>
                    </center>
            </td>
        </tr>

    </table>
</div>

<owd:Dialog ID="diaSearch" runat="server"
            title="Add New User"
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
        <div id="divSearchEmployee" >
            <table style="width:485px;">
                <tr style="text-align:center;width:485px;">
                    <td>
                        &nbsp;&nbsp;Enter employees last name:&nbsp;
                        <obout:OboutTextBox id="txtSearchName" runat="server" style="width:100px;font-size:x-small" onkeypress="return EnterEvent(event)"></obout:OboutTextBox>
                        <%--<input type="text" style="width:200px;font-size:x-small" />--%>
                        &nbsp;
                        <input type="button" id="btnServerGetUserSearch" runat="server" style="display:none;" onserverclick="btnServerGetUserSearch_Click" />
                        <input type="button" id="btnGetUserSearch" 
                            Style="border-style: none; border-width: 0px;font-size:x-small;border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #295b8b; font-family: Verdana; background-color: transparent;outline:none;" 
                                             value="Search" onclick="btnGetUserSearch_Click()" />
                        <input type="button" id="btnCancelUserSearch" 
                            Style="border-style: none; border-width: 0px;font-size:x-small;border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #295b8b; font-family: Verdana; background-color: transparent;outline:none;" 
                                             value="Cancel" onclick="btnCancelNewEmployee_Click()" />
                  
                    </td>
                </tr>
            </table>
        </div> 
             


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
<owd:Dialog ID="diaAddSitesOnly" runat="server"
            title="Error Message"
            ShowCloseButton="true" 
            IsModal="true"
            StyleFolder="~/obout_styles/windia/grandgray"
            IsDraggable="true"   
            VisibleOnLoad="false"
            Width="600" 
            Height="800"
            IconPath="/images/warning.gif"
            Position="CUSTOM"
            >
    <center>
        <div ID="divDisplayMsg"  style="background-color:Transparent;Border Style:None;Border Color:0px none Transparent;text-align:left;"></div>
                  <obout:Grid ID="grdAddSchool" runat="server"
                            AutoGenerateColumns="false"
                            AllowAddingRecords="false"
                            ShowFooter="true"
                            PageSize="25"
                            AllowManualPaging="false" 
                            AllowRecordSelection="true"
                            AllowMultiRecordSelection="true"
                            EnableRecordHover="true" 
                            Serialize="true"
                            CallbackMode="true"
                            Width="350" 
                            KeepSelectedRecords="true" 
                            AllowSorting="false"
                            AllowPageSizeSelection="false" 
                    >    
                         <Columns>
                            <obout:Column HeaderText="Site Id" DataField="SiteId" ReadOnly="true"  Visible="false" ></obout:Column>
                            <obout:Column HeaderText="Site Name" DataField="SiteName" ReadOnly="true" visible="true" Width="350px"></obout:Column>
                         </Columns>
                     </obout:Grid>   
        <br />
        <input type="Button" id="btnDiaMessageOne"  style="font-size:x-small;width:100px;border-radius:5px;" />
        <input type="Button" id="btnDiaMessageTwo"   style="font-size:x-small;width:100px;border-radius:5px;" />
    </center>
</owd:Dialog>


<input type="button" ID="btnReturnToServer" runat="server" style="display:none;" onserverclick="btnReturnToServer_Click" />
<input type="button" ID="btnServerAddSited" runat="server" style="display:none;" onserverclick="btnServerAddSited_Click" />

<script type="text/javascript">

    function EnterEvent(e) {
        
        if (e.keyCode == 13) {
            $('#btnGetUserSearch').click();
        }
    }
    function AddUser_Click()
    {
        document.getElementById("aciveMembers").attributes("display", "none");
        document.getElementById("SearchEmployee").attributes("display", "inline");

    }
    function btnGetUserSearch_Click()
    {
       var lSearchName = txtSearchName.value(); 
       var lError = false;
       var lMessage = 'There is a problem with the last name entered <br /><br /><font color="red">';
       if (lSearchName.length <= 2)
        {
            lError = true;
            lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;At least three chaecters must be entered for a search.<br /> Please click ok and try again";
        }
       if (lError == true) 
        {
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
            diaMessage.setSize(500, 240);
            diaMessage.setTitle('Data Problem');
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").hide();
            $("#btnDiaMessageThree").hide();
            diaMessage.Open();
        }
       else 
        { 
            diaMessage.Close();
            document.getElementById('<%=btnServerGetUserSearch.ClientID%>').click();
        }
    }
    function OpenEmployeeDiv()
    {
        $(document).ready(function () {
            
            document.getElementById('divAddEmployees').style.display = 'block';
            document.getElementById('divAddEmployees1').style.display = 'block';
            document.getElementById('divAddEmployeesSites').style.display = 'block';
            document.getElementById('divAddEmployeesButtons').style.display = 'block';
            document.getElementById('divExistingUsers').style.display = 'none';

            diaSearch.Open();

        });
    }
    function Delete_Clicked() {
       
        diaMessage.Close();

        var lStrg = '';
       
        if (gGroupId != 'ADMIN') {
            lStrg = gFullName + ' for Site  ' + gSiteName;
        }
        else {
            lStrg = gFullName;
        }
      
        var lMessage = '<br/><font size="5"><font color="red">You are about to delete a record for:<br /><br /></font color> ' + lStrg + ' <br /><br /><br /></font size> <cneter>Click ok to continue.</center><br />';
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        $("#btnDiaMessageNo").show();
        document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
        diaMessage.setSize(500, 250);
        diaMessage.setTitle('Caution!');
        document.getElementById("btnDiaMessageYes").value = "OK";
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "doDelete()");
        document.getElementById("btnDiaMessageNo").value = "Cancel";
        document.getElementById("btnDiaMessageNo").setAttribute("onClick", "diaMessage.Close();");
        diaMessage.Open();
    }
    function DoRow_Clicked(record) {
      
        for (var i = 0; i < grdActiveMembers.SelectedRecords.length; i++) {
            var record = grdActiveMembers.SelectedRecords[i];

            gFullName = record.FullName;
            gUserToAssign = record.MemberId;
            gSiteId = record.SiteId;
            gGroupId = record.Groupid;
            gSiteName = record.SiteName;


            if (gGroupId == 'ADMIN')
            {
                Delete_Clicked();
                return;
            }
            
        }
        var lMessage = '<br/><font size="5">Do you want to Add or Delete a school for  <br/>' + gFullName + ' <br /><br /><br /></font size>';
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
        diaMessage.setSize(500, 250);
        diaMessage.setTitle('User Action Required!');
        diaMessage.setIconPath("/images/gcsGlobe.png");
        document.getElementById("btnDiaMessageYes").value = "Add";
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "doAddSite()");
        document.getElementById("btnDiaMessageNo").value = "Delete";
        document.getElementById("btnDiaMessageNo").setAttribute("onClick", "Delete_Clicked();");
        document.getElementById("btnDiaMessageThree").value = "Cancel";
        document.getElementById("btnDiaMessageThree").setAttribute("onClick", "diaMessage.Close();");
        diaMessage.Open();

    }
    function doAddSite() {
        diaMessage.Close();
        var lMessage = '<br /> Select all the sites that need to be assigned to <b>' + gFullName + '</b> <br /> Then click ok to continue';
        $("#divDisplayMsg").empty();
        $('#divDisplayMsg').append(lMessage);
        document.getElementById("divDisplayMsg").setAttribute("style", "Height:100px;Width:385px;");
        diaAddSitesOnly.setTitle('Assign Sites');
        diaAddSitesOnly.setIconPath("/images/gcsGlobe.png");
        diaAddSitesOnly.setPosition(600 ,1);
        diaAddSitesOnly.setSize(400, 900);
        document.getElementById("btnDiaMessageOne").value = "Ok";
        document.getElementById("btnDiaMessageOne").setAttribute("onClick", "doSaveSite()");
        document.getElementById("btnDiaMessageTwo").value = "Cancel";
        document.getElementById("btnDiaMessageTwo").setAttribute("onClick", "AddSiteOnlyClose()");
        $("#btnDiaMessageThree").hide();
        diaAddSitesOnly.Open();
    }
    function AddSiteOnlyClose() {
        for (var i = 0; i < grdAddSchool.SelectedRecordsCollection.length; i++) {
            grdAddSchool.deselectRecord(i);
        }
        diaAddSitesOnly.Close();
    }
    function doSaveSite(record)
    {
        diaAddSitesOnly.Close(); 
        sMessage = grdAddSchool.SelectedRecords.length;
        if (sMessage == 0) {
            var lMessage = '<br/><font size="5">Please go back and select a group assignement <br /><br /><br /></font size>';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:285px;");
            diaMessage.setSize(400, 250);
            diaMessage.setTitle('Error');
            diaMessage.setIconPath("/images/warning.gif");
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close()");
            diaMessage.Open();
        }
        else if (sMessage >= 1  )
        {
            var lMessage = '<br/><font size="5">Do you want to save  the ' + sMessage + ' school(s) selected<br /><br /><br /></font size>';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
            diaMessage.setSize(500, 250);
            diaMessage.setTitle('User Action Required!');
            diaMessage.setIconPath("/images/gcsGlobe.png");
            document.getElementById("btnDiaMessageYes").value = "Yes";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "doAddSiteSave()");
            document.getElementById("btnDiaMessageNo").value = "No";
            document.getElementById("btnDiaMessageNo").setAttribute("onClick", "doAddSite();");
            diaMessage.Open();
        }
    } 
    function doAddSiteSave() {
        document.getElementById('<%=btnServerAddSited.ClientID%>').click();
    }
    function doDelete(){
        document.getElementById('<%=btnReturnToServer.ClientID%>').click();
    }
    function doAddNewUser() {
        document.getElementById('<%=btnServerSaveNewEmployee.ClientID%>').click();
    }
    function btnSaveNewEmployee_Click() {
        var lGroupId = ddlGroups.value();
        var lUserName = "";
        var lMemberId = "";
        var lNoSites = "";
        var lGroupName = "";
        var i = ddlGroups.selectedIndex();

        lGroupName = ddlGroups.options[i].text;
       
        for (var j = 0; j < grdEmployees.SelectedRecords.length; j++)
        {
            var record = grdEmployees.SelectedRecords[j];
            lUserName = record.FullName;
            lMemberId = record.MemberId;
        }

        lNoSites = grdSchoolSelect.SelectedRecords.length;
       
        if (lGroupId == "") {
            var lMessage = '<br/><font size="5">A Group must be selected to continue.<br />Click Ok to continue.<br /><br /></font size>';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
            diaMessage.setSize(500, 240);
            diaMessage.setTitle('Data Problem');
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").hide();
            $("#btnDiaMessageThree").hide();
            diaMessage.Open();
        }
        else if (lMemberId == "" && lNoSites == 0) {
           return;
        }
        else if (lGroupId == "ADMIN" && lMemberId != "")
        {
            var lMessage = '<br/><font size="5">You are about to make ' + lUserName + ' as an Administrative User. <br />Click Ok to continue.<br /></font size>';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
            diaMessage.setSize(500, 240);
            diaMessage.setTitle('User intervention required');
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "doAddNewUser();");
            $("#btnDiaMessageNo").hide();
            $("#btnDiaMessageThree").hide();
            diaMessage.Open();
        }
        else if (lMemberId != "" && lNoSites == 0)
        {
            var lMessage = "<br/><font size='5'>You have selected " + lUserName + " as a " + lGroupName + " user, however no schools have been selected.<br />Click Ok to continue and select at least 1 school.<br /></font size>";
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
            diaMessage.setSize(500, 240);
            diaMessage.setTitle('Data Problem');
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").hide();
            $("#btnDiaMessageThree").hide();
            diaMessage.Open();
        }
       
        else if (lMemberId != "" && lNoSites != 0) {
            var lMessage = '<br/><font size="5">You are about to make ' + lUserName + ',<br /> a ' + lGroupName + ' User. <br />Click Ok to continue.<br /></font size>';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
            diaMessage.setSize(500, 240);
            diaMessage.setTitle('User intervention required');
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "doAddNewUser();");
            $("#btnDiaMessageNo").hide();
            $("#btnDiaMessageThree").hide();
            diaMessage.Open();
        }
      
    }
    function btnCancelNewEmployee_Click()
    {
        document.getElementById('divAddEmployees').style.display = 'none';
        document.getElementById('divAddEmployees1').style.display = 'none';
        document.getElementById('divAddEmployeesSites').style.display = 'none';
        document.getElementById('divAddEmployeesButtons').style.display = 'none';
        document.getElementById('divExistingUsers').style.display = 'block';
        diaSearch.Close();
    }
</script>