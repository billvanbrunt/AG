<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlDefaultEligibilityInfo.ascx.cs" Inherits="controls_ctrlDefaultEligibilityInfo" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Register Assembly="obout_Calendar2_Net" Namespace="OboutInc.Calendar2" TagPrefix="obout" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>

<div id="divButtons">
    <input type="button" id="btnGoBack" runat="server" style="font-size: x-small; width: 125px; border-radius: 5px;" onclick="GoBack_Click()" value="Student Info" />
    <input type="button" id="btnTest" runat="server" style="font-size: x-small; width: 125px; border-radius: 5px;" onserverclick="btnTest_Click" value="Data Evidence" />
    <input type="button" id="btnStudentEligibilityRecord" runat="server" style="font-size: x-small; width: 125px; border-radius: 5px;" onserverclick="btnStudentEligibilityRecord_Click" value="Student Eligibility Record" />
    <input type="button" id="btnNewSearch" runat="server" style="font-size: x-small; width: 125px; border-radius: 5px;" onserverclick="ShowSearchWindowAgain_Click" value="New Search" />
</div>

<div id="DIvDefaultStudentMain">
    <fieldset style="width: 730px; height: 125px; font-size: small;">
        <legend style="font-size: small; font-weight: bolder; color: #295B8B">Student Profile</legend>
        <table style="width: 550px;" border="0">
            <tr>
                <td colspan="2" style="font-weight: bold;">
                    <asp:Label ID="txtFullName" runat="server" Font-Size="large" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">Student ID: </td>
                <td style="text-align: left; width: 75%;">
                    <asp:Label ID="txtStudentId" runat="server" Style="font-size: small;" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">School: </td>
                <td style="text-align: left">
                    <asp:Label ID="txtSchoolName" runat="server" Style="font-size: small;" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">Last Modification Info: </td>
                <td style="text-align: left">
                    <asp:Label ID="txtLastModificationInfo" runat="server" Style="font-size: small;" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">Modification Type: </td>
                <td style="text-align: left">
                    <asp:Label ID="txtModificationType" runat="server" Style="font-size: small;" />
                </td>
            </tr>

        </table>
    </fieldset>
    <div id="divEligibilityInfo">
        <fieldset>
            <legend style="font-size: small; font-weight: bolder; color: #295B8B">Eligibility Info </legend>
            <div id="divReadEligibility">
                <table style="width: 700px;" border="0">
                    <tr>
                        <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">Initial Screening Date: </td>
                        <td style="text-align: left">
                            <asp:Label ID="txtInitialScreeningDate" runat="server" Style="font-size: small;" />
                        </td>
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;" rowspan="2">Decision: </td>
                        <td style="text-align: left" rowspan="2">
                            <asp:Label ID="txtDecision" runat="server" Style="font-size: small;" />
                        </td>

                        <td style="text-align: right; font-size: small; font-weight: bold;" colspan="1" rowspan="2">Traditional:<br />
                            Nontraditional:
                        </td>

                        <td style="text-align: left; vertical-align: top;" colspan="2">
                            <asp:Label ID="txtTraditional" runat="server"></asp:Label><br />
                            <asp:Label ID="txtNonTraditional" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td colspan="8">
                            <div style="font-size: small; font-weight: bolder; color: #295B8B">
                                Service Info
                                <hr />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">Reading: </td>
                        <td style="text-align: left">
                            <asp:Label ID="txtReading" runat="server" Style="font-size: small;" />
                        </td>
                        <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">Mathematics: </td>
                        <td style="text-align: left" colspan="3">
                            <asp:Label ID="txtMath" runat="server" Style="font-size: small;" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">Science: </td>
                        <td style="text-align: left">
                            <asp:Label ID="txtScience" runat="server" Style="font-size: small;" />
                        </td>
                        <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">Social Studies: </td>
                        <td style="text-align: left" colspan="3">
                            <asp:Label ID="txtSocialStudies" runat="server" Style="font-size: small;" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">AIG Support Plan: </td>
                        <td style="text-align: left">
                            <obout:OboutCheckBox ID="chkSupportPlanStartReadOnly" runat="server" Text="Support Plan Start" Enabled="false" Font-Bold="True"></obout:OboutCheckBox><br />

                        </td>
                        <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">Date: </td>
                        <td style="text-align: left" colspan="4">
                            <asp:Label ID="txtSupportPlanStartDateReadOnly" runat="server" Style="font-size: small;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Width="100px" /><br />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp; </td>
                        <td>
                            <obout:OboutCheckBox ID="chkSupportPlanResolvedReadOnly" runat="server" Text="Support Plan Resolved" Enabled="false" Font-Bold="True"></obout:OboutCheckBox>
                        </td>
                        <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">Date: </td>
                        <td colspan="4">
                            <asp:Label ID="txtSupportPlanResolvedDateReadOnly" runat="server" Style="font-size: small;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Width="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">
                            <input type="button" id="btnOpenComments" style="border: 0px none transparent; font-size: x-small; text-decoration: underline; color: #395b8b;" onclick="diaComments.Open();" value="Add/View Comments" />
                        </td>
                        <td style="text-align: left" colspan="5"></td>
                    </tr>
                    <tr>
                        <td colspan="6" style="text-align: center;">
                            <input type="button" id="btnUpdate" runat="server" name="btnUpdate" value="Edit Current Information" style="font-size: x-small; width: 145px; border-radius: 5px;" onclick="btnUpdate_Click()" />
                        </td>
                    </tr>
                </table>
            </div>

            <div id="divUpdateEligibility" style="display: none; background-color: #CCCCCC;">
                <table style="width: 725px;" border="0">
                    <tr>
                        <td style="text-align: right; font-size: small; font-weight: bold;">Initial Screening Date: </td>
                        <td style="text-align: left">
                            <asp:Label ID="txtInitialScreeningDate2" runat="server" Style="font-size: small;" />
                        </td>
                        <td style="text-align: left" colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-size: small; font-weight: bold;" rowspan="2">Decision:</td>
                        <td style="text-align: left; font-size: small; font-weight: bold;" rowspan="2">
                            <obout:OboutDropDownList ID="ddlDecision" runat="server" Width="150px" Font-Size="small"
                                DataTextField="Decisions"
                                DataValueField="DecisionId"
                                AppendDataBoundItems="true"
                                tabstop="1"
                                >
                            </obout:OboutDropDownList>
                        </td>
                        <td rowspan="2">&nbsp;</td>
                        <td style="text-align: right; font-size: small; font-weight: bold;" colspan="1" rowspan="2">Traditional:<br />
                            Nontraditional:
                        </td>
                        <td style="text-align: left" colspan="1" rowspan="2">
                            <obout:OboutDropDownList ID="ddlTraditional" runat="server" Width="150px" Font-Size="small">
                                <asp:ListItem Text="" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Reading only" Value="Reading"></asp:ListItem>
                                <asp:ListItem Text="Math only" Value="Math"></asp:ListItem>
                                <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                            </obout:OboutDropDownList>
                            <br />
                            <obout:OboutDropDownList ID="ddlNonTraditional" runat="server" Width="150px" Font-Size="small">
                                <asp:ListItem Text="" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Reading only" Value="Reading"></asp:ListItem>
                                <asp:ListItem Text="Math only" Value="Math"></asp:ListItem>
                                <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                            </obout:OboutDropDownList>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td colspan="8">
                            <div style="font-size: small; font-weight: bolder; color: #295B8B">
                                Service Info
                                <hr />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-size: small; font-weight: bold;">Reading: </td>
                        <td style="text-align: left">
                            <obout:OboutDropDownList ID="ddlReading" runat="server" Width="175px" Font-Size="small" DataTextField="LOSDescription" DataValueField="LOSCode" AppendDataBoundItems="true"></obout:OboutDropDownList>
                        </td>
                        <td style="text-align: left">&nbsp;</td>
                        <td style="text-align: right; font-size: small; font-weight: bold;">Mathematics: </td>
                        <td colspan="2" style="text-align: left">
                            <obout:OboutDropDownList ID="ddlMath" runat="server" Width="175px" Font-Size="small" DataTextField="LOSDescription" DataValueField="LOSCode" AppendDataBoundItems="true"></obout:OboutDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-size: small; font-weight: bold;">Science: </td>
                        <td style="text-align: left">
                            <obout:OboutDropDownList ID="ddlScience" runat="server" Width="175px" Font-Size="small" DataTextField="LOSDescription" DataValueField="LOSCode" AppendDataBoundItems="true"></obout:OboutDropDownList>
                        </td>
                        <td style="text-align: left">&nbsp;</td>
                        <td style="text-align: right; font-size: small; font-weight: bold;">Social Studies: </td>
                        <td style="text-align: left">
                            <obout:OboutDropDownList ID="ddlSocialStudies" runat="server" Width="175px" Font-Size="small" DataTextField="LOSDescription" DataValueField="LOSCode" AppendDataBoundItems="true"></obout:OboutDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-size: small; font-weight: bold;">AIG Support Plan: </td>
                        <td style="text-align: left">
                            <obout:OboutCheckBox ID="chkSupportPlanStart" runat="server" Text="Support Plan Initiated" FolderStyle="/obout_styles/premiere_blue/OboutCheckBox">
                            </obout:OboutCheckBox>
                        </td>
                        <td id="tdStartDate" style="text-align: right; font-size: small; font-weight: bold;">Date: </td>
                        <td id="tdStarttxt" style="text-align: left;" colspan="5">
                            <input type="text" id="txtSupportPlasnStart" name="txtSupportPlasnStart" style="font-size: small; width: 100px; border-radius: 5px;" bordercolor="#CCCCCC" borderstyle="Solid" borderwidth="1px" />
                            <obout:Calendar ID="calSupportStartDate" runat="server"
                                TextBoxId="txtSupportPlasnStart"
                                StyleFolder="~\Obout_styles\calendar\default"
                                Columns="1"
                                DatePickerMode="true"
                                ShowYearSelector="false"
                                DatePickerImagePath="~\images\icon2.gif"
                                ShowHourSelector="False"
                                ShowMinuteSelector="False"
                                ShowOtherMonthDays="False"
                                TextArrowLeft="&amp;lt;"
                                TextArrowRight="&amp;gt;"
                                TitleText=" ">
                            </obout:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp; </td>
                        <td>
                            <obout:OboutCheckBox ID="chkSupportPlanResolved" runat="server" Text="Support Plan Resolved" FolderStyle="/obout_styles/premiere_blue/OboutCheckBox">
                            </obout:OboutCheckBox>
                        </td>
                        <td id="tdEndDate" style="text-align: right; font-size: small; width: 100px; font-weight: bold;">Date: </td>
                        <td id="tdEndtxt" colspan="2">
                            <input type="text" id="txtSupportPlanResolved" name="txtSupportPlanResolved" style="width: 100px; border-radius: 5px;" bordercolor="#CCCCCC" borderstyle="Solid" borderwidth="1px" />
                            <obout:Calendar ID="calPlanResolvedDate" runat="server"
                                TextBoxId="txtSupportPlanResolved"
                                StyleFolder="~\Obout_styles\calendar\default"
                                Columns="1"
                                DatePickerMode="true"
                                ShowYearSelector="false"
                                DatePickerImagePath="~\images\icon2.gif"
                                ShowHourSelector="False"
                                ShowMinuteSelector="False"
                                ShowOtherMonthDays="False"
                                TextArrowLeft="&amp;lt;"
                                TextArrowRight="&amp;gt;"
                                TitleText=" ">
                            </obout:Calendar>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td style="text-align: right; font-size: small; font-weight: bold;">Comments: </td>
                        <td style="text-align: left" colspan="4">
                            <obout:OboutTextBox ID="txtCommentsEdit" runat="server" Style="font-size: small;" Width="500px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" style="text-align: center;">
                            <input type="button" id="btnSaveData" value="Save Changes" style="font-size: x-small; width: 145px; border-radius: 5px;" onclick="btnSaveData_Click()" />
                            <input type="button" id="btnServerSaveData" runat="server" value="Save Changes" style="font-size: x-small; width: 145px; border-radius: 5px; display: none;" onserverclick="btnServerSaveData_Click" />
                            <input type="button" id="btnCancelSave" value="Cancel" style="font-size: x-small; width: 145px; border-radius: 5px;" onclick="btnCancelSaveData_Click()" />
                        </td>
                    </tr>
                </table>

            </div>
            <br />

            <div id="divHistory">
                <obout:Grid ID="grdHistory" runat="server"
                    AutoGenerateColumns="false"
                    AllowAddingRecords="false"
                    ShowFooter="true"
                    PageSize="10"
                    AllowManualPaging="false"
                    Serialize="true"
                    CallbackMode="true">
                    <ClientSideEvents ExposeSender="true" OnClientSelect="ShowHistory" />
                    <Columns>
                        <obout:Column DataField="HistoryId" HeaderText="" Visible="false" runat="server"></obout:Column>
                        <obout:Column DataField="Decision" HeaderText="Decision" Width="100" runat="server">
                            <TemplateSettings HeaderTemplateId="tempDecision" EditTemplateId="etempDecision" />
                        </obout:Column>
                        <obout:Column DataField="Reading" HeaderText="Reading" Width="75" runat="server">
                            <TemplateSettings HeaderTemplateId="tempReading" EditTemplateId="etempReading" />
                        </obout:Column>
                        <obout:Column DataField="Math" HeaderText="Math" Width="65" runat="server">
                            <TemplateSettings HeaderTemplateId="tempMath" EditTemplateId="etempMath" />
                        </obout:Column>
                        <obout:Column DataField="Science" HeaderText="Science" Width="75" runat="server">
                            <TemplateSettings HeaderTemplateId="tempScience" EditTemplateId="etempScience" />
                        </obout:Column>
                        <obout:Column DataField="SocialStudies" HeaderText="Social Studies" Width="75" runat="server">
                            <TemplateSettings HeaderTemplateId="tempSocial" EditTemplateId="etempSocial" />
                        </obout:Column>
                        <obout:Column DataField="LOSInfromationEnteredDate" HeaderText="Changed Date" Width="100" runat="server">
                            <TemplateSettings HeaderTemplateId="tempLOSInformationEnter" EditTemplateId="tempLOSInformationEnter" />
                        </obout:Column>
                        <obout:Column DataField="ChangeType" HeaderText="Comments" Width="235" runat="server">
                            <TemplateSettings HeaderTemplateId="tempComments" EditTemplateId="etempComments" />
                        </obout:Column>
                        <obout:Column DataField="LOSInformationEnterBy" HeaderText="" Visible="false" runat="server">
                            <TemplateSettings EditTemplateId="tempLOSInformationEnterBy" />
                        </obout:Column>
                        <obout:Column DataField="SupportPlanStartDate" HeaderText="" Visible="false" runat="server">
                            <TemplateSettings EditTemplateId="tempSupportPlanStartDate" />
                        </obout:Column>
                        <obout:Column DataField="SupportPlanResolvedDate" HeaderText="" Visible="false" runat="server">
                            <TemplateSettings EditTemplateId="tempSupportPlanResolvedDate" />
                        </obout:Column>
                        <obout:Column DataField="FullName" HeaderText="" Visible="false" runat="server" />
                    </Columns>
                    <TemplateSettings HeadingTemplateId="Active" />
                    <Templates>
                        <obout:GridTemplate runat="server" ID="Active">
                            <Template>Historical Data</Template>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tempDecision">
                            <Template>
                                <%--[1]--%>
                                <font size="-2">
                                    Decision
                                </font>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tempReading">
                            <Template>
                                <%--[2]--%>
                                <font size="-2">
                                    Reading
                                </font>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tempMath">
                            <Template>
                                <%--[3]--%>
                                <font size="-2">
                                    Math
                                </font>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tempScience">
                            <Template>
                                <%--[4]--%>
                                <font size="-2">
                                    Science
                                </font>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tempSocial">
                            <Template>
                                <%--[5]--%>
                                <font size="-2">
                                    Social<br />Studies
                                </font>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>

                    <Templates>
                        <obout:GridTemplate runat="server" ID="tempLOSInformationEnter">
                            <Template>
                                <%--[6]--%>
                                <font size="-2">
                                    Changed<br />Date
                                </font>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tempComments">
                            <Template>
                                <%--[7]--%>
                                <font size="-2">
                                    Comments
                                </font>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                </obout:Grid>
            </div>
        </fieldset>
    </div>
</div>
<owd:Dialog ID="diaMessage" runat="server"
    Title="Error Message"
    ShowCloseButton="true"
    IsModal="true"
    StyleFolder="~/obout_styles/windia/grandgray"
    IsDraggable="true"
    VisibleOnLoad="false"
    Width="500"
    Height="240"
    IconPath="/images/warning.gif"
    Position="SCREEN_CENTER">
    <center>
        <div ID="divErrorMsg"  style="background-color:Transparent;Border Style:None;Border Color:1px solid #000000; text-align:left;"></div>
        <br /><br />
        <input type="Button" id="btnDiaMessageYes"  style="font-size:x-small;width:100px;border-radius:5px;" />
        <input type="Button" id="btnDiaMessageNo"   style="font-size:x-small;width:100px;border-radius:5px;" />
    </center>
</owd:Dialog>
<owd:Dialog ID="diaShowHistory" runat="server"
    Title="Historical Details"
    ShowCloseButton="true"
    IsModal="true"
    StyleFolder="~/obout_styles/windia/grandgray"
    IsDraggable="true"
    VisibleOnLoad="false"
    Width="500"
    Height="295"
    IconPath="/images/gcsGlobe.png"
    Position="SCREEN_CENTER">
    <div id="divMainDiaShowHistory">
        <table style="align-self: center; width: 510px;">
            <tr>
                <td>Record Id:
                </td>
                <td>
                    <span id="txtHistoryId"></span>
                </td>
            </tr>
            <tr style="background-color: lightgray;">
                <td>Record Entered by:
                </td>
                <td>
                    <span id="txtEnteredBy"></span>
                </td>
            </tr>
            <tr>
                <td>Date Entered:
                </td>
                <td>
                    <span id="txtEnteredDate"></span>
                </td>
            </tr>
            <tr style="background-color: lightgray;">
                <td>Decision:
                </td>
                <td>
                    <span id="txthDecision"></span>
                </td>
            </tr>
            <tr>
                <td>Reading/Math/Science/History:
                </td>
                <td>
                    <span id="txtStatus"></span>
                </td>
            </tr>
            <tr style="background-color: lightgray;">
                <td>Support Plan:
                </td>
                <td>
                    <span id="txtSupportPlan"></span>
                </td>
            </tr>
            <tr>
                <td>Start Date:
                </td>
                <td>
                    <span id="txtSupportPlanStartDate"></span>
                </td>
            </tr>
            <tr>
                <td>End Date:
                </td>
                <td>
                    <span id="txtSupportPlanEndDate"></span>
                </td>
            </tr>

        </table>
        <center>
            <fieldset style="width:450px;height:75px; text-align:left;" >
                <legend style="font-size: xx-small; font-weight: bolder; color: #295B8B">comments</legend>
                <div id="divComments" style="width:440px;font-size:small;" >

                    <span id="txtComment"  ></span>

                </div>
            </fieldset>
        </center>
    </div>
</owd:Dialog>
<owd:Dialog ID="diaComments" runat="server"
    Title="Comments"
    ShowCloseButton="true"
    IsModal="true"
    StyleFolder="~/obout_styles/windia/grandgray"
    IsDraggable="true"
    VisibleOnLoad="false"
    Width="500"
    Height="375"
    IconPath="/images/gcsglobe.png"
    Position="SCREEN_CENTER">
    <div id="DivTxtBoxHolder" style="text-align: center;">
        <obout:OboutTextBox ID="txtComments" runat="server" TextMode="MultiLine" Width="400px" Height="300px"></obout:OboutTextBox>
    </div>
    <br />
    <div id="divButtonHolder" style="text-align: center;">
        <input type="button" id="btnSaveNotes" onclick="btnSaveNotes_Click()" value="Save" />
        <input type="button" id="btnCancel" onclick="diaComments.Close();" value="Cancel" />
    </div>
</owd:Dialog>

<div id="hiddenItems" style="display: none;">
    <input type="button" runat="server" id="btnServerSaveNotes" onserverclick="btnServerSaveNotes_Click" />

</div>

<script type="text/javascript">
        function btnSaveNotes_Click() {

            diaComments.Close(); 
             lMessage = "<br>Click OK to Save Notes";
                    $("#divErrorMsg").empty();
                    $('#divErrorMsg').append(lMessage);
                    document.getElementById("divErrorMsg").setAttribute("style", "Height:50px;Width:200px;");
                    diaMessage.setSize(350, 150);
                    diaMessage.setTitle('Saving Eligibility Info');
                    document.getElementById("btnDiaMessageYes").value = "OK";
                    document.getElementById("btnDiaMessageNo").setAttribute("onClick", "SwapDiags()");
                    document.getElementById("btnDiaMessageYes").setAttribute("onClick", "clickSaveNotes();");
                    document.getElementById("btnDiaMessageNo").value = "cancel";
                    $("#btnDiaMessageNo").show();
                    diaMessage.Open();
        }
        function clickSaveNotes()
        {
            document.getElementById('<%=btnServerSaveNotes.ClientID %>').click();
        }
        function SwapDiags() {
            
            diaMessage.Close();
            diaComments.Open();
        }
        function GoBack_Click() {
            window.history.back();
        }
        function btnUpdate_Click() {
            $('#divUpdateEligibility').show();
            $('#divReadEligibility').hide();
        }
        function btnCancelSaveData_Click() {
            $('#divReadEligibility').show();
            $('#divUpdateEligibility').hide();
        }
        function btnSaveData_Click()
        {
            var lDecision = ddlDecision.value();
            var lddlTraditional = ddlTraditional.value();
            var lddlNonTraditional = ddlNonTraditional.value();
            var lddlReading = ddlReading.value();
            var lddlMath = ddlMath.value();
            var lddlScience = ddlScience.value();
            var lddlSocialStudies = ddlSocialStudies.value();
            var lchkStart = chkSupportPlanStart.checked();
            var lchkEnd = chkSupportPlanResolved.checked();
            var lchkStartDate = txtSupportPlasnStart.value;
            var lchkEndDate = txtSupportPlanResolved.value;
            var lError = false;
            var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';
    
            if (lDecision == "" && lddlReading == "" && lddlMath == "" && (lddlScience == "" || lddlScience == "NE") && (lddlSocialStudies == "" || lddlSocialStudies == "NE") && lchkStart == false && lchkEnd == false)
            {
                document.getElementById("btnDiaMessageYes").setAttribute("onClick", "document.getElementById('btnCancelSaveData').click();");
            }
            else
            {
                if (lDecision == "")
                {
                    lError = true;
                    lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select a Decision from dropdown<br />";
                }
                //if (lddlTraditional == 0 && lddlNonTraditional == 0)
                //{
                //    lError = true;
                //    lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Make a selection from either the Traditional/Nontraditional dropdown.<br />";
                //}
                if (lddlReading == "")
                {
                    lError = true;
                    lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Make a selection from the Reading dropdown.<br />";
                }
                if (lddlMath == "")
                {
                    lError = true;
                    lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Make a selection from the Math dropdown.<br />";
                }
                if (lddlScience == "")
                {
                    lError = true;
                    lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Make a selection from the Science dropdown.<br />";
                }
                if (lddlSocialStudies == "")
                {
                    lError = true;
                    lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Make a selection from the Social Studies dropdown.<br />";
                }
                if (lchkStart == true && lchkStartDate == '')
                {
                    lError = true;
                    lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Support plan initaitation date must be selected. <br />";
                }
                if (lchkEnd == true && lchkEndDate == '')
                {
                    lError = true;
                    lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Support plan termination date must be selected.<br />";
                }
                if (lError == true)
                {
                    lMessage += '</font><br />Please correct the above issues and try again.';
                    $("#divErrorMsg").empty();
                    $('#divErrorMsg').append(lMessage);
                    document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;text-alignment;left;");
                    diaMessage.setSize(500, 240);
                    diaMessage.setTitle('Data Problem');
                    document.getElementById("btnDiaMessageYes").value = "OK";
                    document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
                    $("#btnDiaMessageNo").hide();
                    diaMessage.Open();
                }
                else
                {
                    lMessage = "You are about to save Eligibility Information.<br /><br /> Click Ok to continue.";
                    $("#divErrorMsg").empty();
                    $('#divErrorMsg').append(lMessage);
                    document.getElementById("divErrorMsg").setAttribute("style", "Height:50px;Width:295px;");
                    diaMessage.setSize(375, 150);
                    diaMessage.setTitle('Saving Eligibility Info');
                    document.getElementById("btnDiaMessageYes").value = "OK";
                    document.getElementById("btnDiaMessageNo").setAttribute("onClick", "DoSaveEligibility();");
                    document.getElementById("btnDiaMessageYes").setAttribute("onClick", "document.getElementById('<%=btnServerSaveData.ClientID%>').click();");
                    document.getElementById("btnDiaMessageNo").value = "cancel";
                    $("#btnDiaMessageNo").show();
                    diaMessage.Open();
                }
            }
        }
    function DoSaveEligibility()
    {
        document.getElementById('<%=btnServerSaveData.ClientID%>').click(); 
        diaMessage.Close();
    }
    function ShowHistory()
    {
        for (var i = 0; i < grdHistory.SelectedRecords.length; i++) {
            var fff = grdHistory.SelectedRecords[i];
    
            if (fff.FullName == "") {
                document.getElementById('txtEnteredBy').innerHTML = fff.LOSInformationEnterBy;
            } else {
                document.getElementById('txtEnteredBy').innerHTML = fff.FullName;
            }
            document.getElementById('txtEnteredDate').innerHTML = fff.LOSInfromationEnteredDate;
            document.getElementById('txtHistoryId').innerHTML = fff.HistoryId;
            document.getElementById('txthDecision').innerHTML = fff.Decision;
            document.getElementById('txtStatus').innerHTML = fff.Reading + '/' + fff.Math + '/' + fff.Science + '/' + fff.SocialStudies;
            document.getElementById('txtComment').innerHTML = fff.ChangeType;
            document.getElementById('txtSupportPlanStartDate').innerHTML = fff.SupportPlanStartDate;
            document.getElementById('txtSupportPlanEndDate').innerHTML = fff.SupportPlanEndDate;
    
            if (fff.SupportPlanStartDate == '01/01/1900') {
                document.getElementById('txtSupportPlan').innerHTML = 'No';
                document.getElementById('txtSupportPlanStartDate').innerHTML = 'n/a';
                document.getElementById('txtSupportPlanEndDate').innerHTML = 'n/a';
            } else {
                document.getElementById('txtSupportPlan').innerHTML = 'Yes';
                document.getElementById('txtSupportPlanStartDate').innerHTML = fff.SupportPlanStartDate;
                document.getElementById('txtSupportPlanEndDate').innerHTML = fff.SupportPlanEndDate;
            }
            diaShowHistory.Open();
        }
    }
 </script>
