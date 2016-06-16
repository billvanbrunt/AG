<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlDefault.ascx.cs" Inherits="controls_ctrlDefault" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register Assembly="obout_SuperForm" Namespace="Obout.SuperForm" TagPrefix="obout" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>

<div id="divApp" >
     

    <div id="divMenu">
      
    </div>
    <div id="divMain">
        <div id="divSearchEntry"  style="display:block;" runat="server">
            <br />
            <table >

                <tr>
                    <td colspan="4" style="font-size: x-large; font-weight: bold; color: #295b8b;text-align:center;">
                        <u>Student Search</u> <br/>
                    </td>
                </tr>
                <tr>
                    <td  colspan="4" style="font-size: medium; font-weight: bold; color: #295b8b">
                        To search for a student record, please enter at least one search criteria below, then select search.
                    </td>
                </tr>
                <tr>
                    <td style="width:25%">
                        &nbsp;
                    </td>
                    <td style="text-align:right;width:25%">
                        Student Id:
                    </td>
                    <td colspan="2">
                        <obout:OboutTextBox ID="txtStudentId" runat="server" onkeypress="return EnterEvent(event)"></obout:OboutTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width:25%">
                        &nbsp;
                    </td>
                    <td style="text-align:right;width:25%">
                        Last Name:
                    </td>
                    <td colspan="2">
                        <obout:OboutTextBox ID="txtLastName" runat="server" onkeypress="return EnterEvent(event)"></obout:OboutTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width:25%">
                        &nbsp;
                    </td>
                    <td style="text-align:right;width:25%">
                        First Name:
                    </td>
                    <td colspan="2">
                        <obout:OboutTextBox ID="txtFirstName" runat="server" onkeypress="return EnterEvent(event)" ></obout:OboutTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width:25%">
                        &nbsp;
                    </td>
                    <td style="text-align:right;width:25%">
                        <input type="button" ID="btnSearch"  style="font-size:x-small;width:150px;border-radius:5px;" runat="server" value="Search" onclick="btnSearch_Click()" />
                        <input type="button" ID="btnSearchServer"  style="display:none;" runat="server" value="Search" onserverclick="btnSearchServer_Click" />
                       
                    </td>
                    <td >
                        <input type="button" ID="BtnClearForm" style="font-size:x-small;width:150px;border-radius:5px;" runat="server" value="Clear Form" onclick="btnClearForm_Click()" />
                    </td>
                    <td style="width:25%">
                        &nbsp;
                    </td>

                </tr>
            </table>
        </div>
       
        
        <div id="divSearchResults" style="display:none;" runat="server">
            <input type="button" id="btnActive" runat="server" style="font-size:x-small;width:125px;border-radius:5px;" onclick="ShowActiveResults_Click()"  value="Active Students"  />
            <input type="button" id="btnInactive" runat="server" style="font-size:x-small;width:125px;border-radius:5px;" onclick="ShowInactiveResults_Click()" value="Inactive Students"  />
            <input type="button" id="btnProspective" runat="server" style="font-size:x-small;width:125px;border-radius:5px;" onclick="ShowProspectiveResults_Click()" value="Prospective Students"  />
            <input type="button" id="btnNewSearch" runat="server" style="font-size:x-small;width:125px;border-radius:5px;" onclick="ShowSearchWindowAgain_Click()" value="New Search"  />

            <div id="divSearchResultsActive" style="display:block;" >
                <obout:Grid ID="grdActiveStudents" runat="server"
                            AutoGenerateColumns="false"
                            AllowAddingRecords="false"
                            ShowFooter="true"
                            PageSize="20"
                            AllowManualPaging="false" 
                            AllowRecordSelection="true"
                            EnableRecordHover="true" 
                            Serialize="true"
                            CallbackMode="true"
                            OnSelect="OpenStudentData" 
                            AutoPostBackOnSelect="true"  
                            KeepSelectedRecords="true"  
                            >
                    <Columns>
                        <obout:Column DataField="StudentId" HeaderText="StudentId"   Width="100" runat="server" ></obout:Column>
                        <obout:Column DataField="LastName"  HeaderText="Last Name" Width="125" runat="server" ></obout:Column>
                        <obout:Column DataField="FirstName" HeaderText="First Name" Width="125" runat="server" ></obout:Column>
                        <obout:Column DataField="Grade"     HeaderText="Grade"   Width="75" runat="server" ></obout:Column>
                        <obout:Column DataField="School"    HeaderText="School Name"  Width="300" runat="server" ></obout:Column>
                    </Columns>
                    <TemplateSettings HeadingTemplateId="Active" />
                    <Templates>
                        <obout:GridTemplate runat="server" ID="Active">
                            <Template>Active AG Students</Template>
                        </obout:GridTemplate>
                    </Templates>
                </obout:Grid>
            </div>
            <div id="divSearchResultsInactive" style="display:none;" >
                <obout:Grid ID="grdSearchResultInactive" runat="server"
                            AutoGenerateColumns="false"
                            AllowAddingRecords="false"
                            ShowFooter="true"
                            PageSize ="20"
                            AllowManualPaging="false" 
                            AllowRecordSelection="true"
                            EnableRecordHover="true" 
                            Serialize="true"
                            CallbackMode="true"
                            OnSelect="OpenStudentData" 
                            AutoPostBackOnSelect="true" 
                    >
                    <Columns>
                        <obout:Column DataField="StudentId"  ReadOnly="true" HeaderText="StudentId"   Width="100" runat="server" ></obout:Column>
                        <obout:Column DataField="LastName"  ReadOnly="true"  HeaderText="Last Name"   Width="125" runat="server" ></obout:Column>
                        <obout:Column DataField="FirstName"  ReadOnly="true" HeaderText="First Name"  Width="125" runat="server" ></obout:Column>
                        <obout:Column DataField="Grade" ReadOnly="true"     HeaderText="Grade"       Width="75" runat="server" ></obout:Column>
                        <obout:Column DataField="School"  ReadOnly="true" HeaderText="School Name" Width="300" runat="server" ></obout:Column>
                    </Columns>
                    <TemplateSettings HeadingTemplateId="Inactive" />
                    <Templates>
                        <obout:GridTemplate runat="server" ID="Inactive">
                            <Template>Inactive AG Students</Template>
                        </obout:GridTemplate>
                    </Templates>
                </obout:Grid>
            </div>
            <div id="divSearchResultsProspective" style="display:none;">
                <obout:Grid ID="grdSearchResultProspective" runat="server"
                            AutoGenerateColumns="false"
                            AllowAddingRecords="false"
                            ShowFooter="true"
                            PageSize ="20"
                            AllowManualPaging="false" 
                            AllowRecordSelection="true"
                            EnableRecordHover="true" 
                            Serialize="true"
                            CallbackMode="true"
                            OnSelect="OpenProspectiveStudentData" 
                            AutoPostBackOnSelect="true">
                    <Columns>
                        <obout:Column DataField="StudentId"  ReadOnly="true" HeaderText="StudentId"   Width="100" runat="server" ></obout:Column>
                        <obout:Column DataField="LastName"  ReadOnly="true"  HeaderText="Last Name"   Width="125" runat="server" ></obout:Column>
                        <obout:Column DataField="FirstName"  ReadOnly="true" HeaderText="First Name"  Width="125" runat="server" ></obout:Column>
                        <obout:Column DataField="Grade" ReadOnly="true"     HeaderText="Grade"       Width="75" runat="server" ></obout:Column>
                        <obout:Column DataField="School"  ReadOnly="true" HeaderText="School Name" Width="300" runat="server" ></obout:Column>
                    </Columns>
                    <TemplateSettings HeadingTemplateId="Prospective" />
                    <Templates>
                        <obout:GridTemplate runat="server" ID="Prospective">
                            <Template>Prospective AG Students</Template>
                        </obout:GridTemplate>
                    </Templates>
                </obout:Grid>
            </div>
        </div>
    </div>
</div>

<owd:Dialog ID="diaMessage" runat="server"
            title="Error Message"
            ShowCloseButton="true" 
            IsModal="true"
            StyleFolder="~/obout_styles/windia/grandgray"
            IsDraggable="true"   
            VisibleOnLoad="false"
            Width="500" 
            Height="200"
            IconPath="/images/warning.gif"
            Position="SCREEN_CENTER"
>
    <center>
        <obout:OboutTextBox ID="txtMessage" runat="server" Height="125px"  Width="485px" BackColor="Transparent" BorderStyle="None" BorderColor="Transparent" TextMode="MultiLine"></obout:OboutTextBox>
        <br /><br />
        <input type="Button" id="btnDiaMessageYes"  style="font-size:x-small;width:100px;border-radius:5px;" />
        <input type="Button" id="btnDiaMessageNo"   style="font-size:x-small;width:100px;border-radius:5px;" />
    </center>
</owd:Dialog>

<script type="text/javascript">
    function btnClearForm_Click() {
        ClearSearchForm();
    }
    function ShowActiveResults_Click() {
        $('#divSearchEntry').hide();
        $('#divSearchResultsInactive').hide();
        $('#divSearchResultsActive').show();
        $('#divSearchResultsProspective').hide();
    }
    function ShowInactiveResults_Click() {
        $('#divSearchResultsActive').hide();
        $('#divSearchEntry').hide();
        $('#divSearchResultsInactive').show();
        $('#divSearchResultsProspective').hide();
    }
    function ShowProspectiveResults_Click() {
        $('#divSearchResultsActive').hide();
        $('#divSearchEntry').hide();
        $('#divSearchResultsInactive').hide();
        $('#divSearchResultsProspective').show();
    }
    function ShowSearchWindowAgain_Click() {
        ClearSearchForm();
        $('#<%=divSearchResults.ClientID%>').hide();
        $('#<%=divSearchEntry.ClientID%>').show();
    }
    
    function ClearSearchForm() {
        txtStudentId.value('');
        txtLastName.value('');
        txtFirstName.value('');
    }
    function btnSearch_Click() {
        var lStudentId = txtStudentId.value();
        var lLastName = txtLastName.value();
        var lFirstName = txtFirstName.value();
    
        if (lStudentId == '' && lLastName == '' && lFirstName == '')
        {
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").hide();
            txtMessage.value('You must enter something in either First Name, Last Name of Student Id to do a lookup. \n Please click OK and try again.');
            diaMessage.setIconPath('/images/warning.gif');
            diaMessage.Open();
        }
        else
        {
            $('#<%= btnSearchServer.ClientID%>').click();
        }
    }
    function EnterEvent(e) {
        
        if (e.keyCode == 13)
        {
            $('#<%= btnSearch.ClientID%>').click();
        }
    }

    function OpenNoSites()
    {
        document.getElementById("btnDiaMessageYes").value = "OK";
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
        $("#btnDiaMessageNo").hide();
        txtMessage.value('There was a problem with your account, there are no schools assigned to you. \n Please contat your supervisor to get this problem solved. \n Click ok to continue.');
        diaMessage.setIconPath('/images/warning.gif');
        diaMessage.Open();
    }
</script>