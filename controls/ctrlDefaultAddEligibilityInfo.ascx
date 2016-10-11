<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlDefaultAddEligibilityInfo.ascx.cs" Inherits="controls_ctrlDefaultEligibilityInfo" ClientIDMode="Static" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Register Assembly="obout_Calendar2_Net" Namespace="OboutInc.Calendar2" TagPrefix="obout" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>

<div id="divButtons">
    <input type="button" id="btnGoBack" runat="server" style="font-size:x-small;width:125px;border-radius:5px;" onclick="GoBack_Click()" value="Student Info"  />
    <input type="button" id="btnTest" runat="server" style="font-size:x-small;width:125px;border-radius:5px;" onserverclick="btnTest_Click" value="Data Evidence"  />
    <input type="button" id="btnNewSearch" runat="server" style="font-size:x-small;width:125px;border-radius:5px;"  onServerclick="ShowSearchWindowAgain_Click" value="New Search"  />
</div>

<div id="DIvDefaultStudentMain" >
    <fieldset style="width:730px;height:75px;font-size:small;">
        <legend style="font-size: small; font-weight: bolder; color: #295B8B">Student Profile</legend>
        <table style="width: 550px;" border ="0">
            <tr>
                <td colspan="2" style="font-weight: bold;">
                    <asp:Label ID="txtFullName" runat="server" Font-Size="large" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">Student ID: </td>
                <td style="text-align: left;width: 75%;" >
                    <asp:Label ID="txtStudentId" runat="server" Style="font-size: small;" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small; width: 25%; font-weight: bold;">School: </td>
                <td style="text-align: left">
                    <asp:Label ID="txtSchoolName" runat="server" Style="font-size: small;" />
                </td>
            </tr>
          </table>
    </fieldset>
    <div id="divEligibilityInfo">
        <fieldset>
            <legend style="font-size: small; font-weight: bolder; color: #295B8B">Eligibility Info </legend>
            <div id="divUpdateEligibility" style="display:block; background-color: #CCCCCC;" >
                <table style="width: 725px;" border="0">
                    <tr>
                        <td style="text-align: right; font-size: small; font-weight: bold;"  >Initial Screening Date:
                        </td>
                        <td style="text-align: left">
                          
                            <input type="text" readonly="readonly" ID="txtInitialScreeningDate" name="txtInitialScreeningDate" Style="font-size: small;border-radius:5px;Width:115px; Border Color:#CCCCCC Style:Solid;Border Width:1px solid #C0C0C0;"  />
                            <obout:Calendar ID="calScreenDate" runat="server" 
                                                TextBoxId="txtInitialScreeningDate"
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
                         <td style="text-align: left" colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td  style="text-align: right; font-size: small;  font-weight: bold;" rowspan="2">Decision:</td>
                        <td style="text-align: left;font-size: small;  font-weight: bold;" rowspan="2">
                                <obout:OboutDropDownList ID="ddlDecision" runat="server" Width="150px" Font-Size="small" DataTextField="Decisions" DataValueField="DecisionCode" AppendDataBoundItems="true"></obout:OboutDropDownList>
                        </td>
                        <td rowspan="2">&nbsp; </td>
                        <td style="text-align: right;font-size: small;font-weight: bold;" colspan="1" rowspan ="2" >
                             Traditional:<br />Nontraditional:
                        </td>
                        
                        <td style="text-align: left" colspan="1" rowspan ="2">
                            <obout:OboutDropDownList ID="ddlTraditional" runat="server" Width="150px" Font-Size="small" >
                                <asp:ListItem Text="" Value="" ></asp:ListItem>
                                <asp:ListItem Text="Reading" Value="Reading" ></asp:ListItem>
                                <asp:ListItem Text="Math" Value="Math"></asp:ListItem>
                                <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                            </obout:OboutDropDownList>
                            <br />
                        
                            <obout:OboutDropDownList ID="ddlNontraditional" runat="server" Width="150px" Font-Size="small">
                                <asp:ListItem Text="" Value="" ></asp:ListItem>
                                <asp:ListItem Text="Reading" Value="Reading" ></asp:ListItem>
                                <asp:ListItem Text="Math" Value="Math"></asp:ListItem>
                                <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                            </obout:OboutDropDownList>
                         </td>
                    </tr>
                    <tr>

                    </tr>
                    <tr >
                        <td colspan="8">
                            <div style="font-size: small; font-weight: bolder; color: #295B8B">Service Info <hr /></div>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-size: small;  font-weight: bold;">Reading: </td>
                             
                         <td style="text-align: left">
                            <obout:OboutDropDownList ID="ddlReading" runat="server" Width="175px" Font-Size="small" DataTextField="LOSDescription"  DataValueField="LOSCode"  AppendDataBoundItems="true"></obout:OboutDropDownList>
                        </td>
                        <td style="text-align: left">&nbsp;</td>
                        <td style="text-align: right; font-size: small;  font-weight: bold;" >Mathematics: </td>
                            
                        <td colspan="2" style="text-align: left">
                            <obout:OboutDropDownList ID="ddlMath" runat="server" Width="175px" Font-Size="small"  DataTextField="LOSDescription" DataValueField="LOSCode"  AppendDataBoundItems="true"></obout:OboutDropDownList>
                        </td>
                       
                    </tr>
                    <tr>
                        <td style="text-align: right; font-size: small;  font-weight: bold;">Science: </td>
                        <td style="text-align: left">
                            <obout:OboutDropDownList ID="ddlScience" runat="server" Width="175px" Font-Size="small"  DataTextField="LOSDescription" DataValueField="LOSCode"  AppendDataBoundItems="true"></obout:OboutDropDownList>
                        </td>
                         <td style="text-align: left">&nbsp;</td>
                        <td style="text-align: right; font-size: small;  font-weight: bold;">Social Studies: </td>
                       
                         <td style="text-align: left">
                            <obout:OboutDropDownList ID="ddlSocialStudies" runat="server" Width="175px" Font-Size="small"  DataTextField="LOSDescription" DataValueField="LOSCode"  AppendDataBoundItems="true"></obout:OboutDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-size: small;  font-weight: bold;">AIG Support Plan: </td>
                        <td style="text-align: left">
                            <obout:OboutCheckBox ID="chkSupportPlanStart" runat="server" Text="Support Plan Initiated" ControlsToEnable="lblStartDate1,lblStartDate2" Checked="false"></obout:OboutCheckBox>
                        </td>
                        <td id="lblStartDate1" style="text-align: right; font-size: small;  font-weight: bold;">Date: </td>
                        <td id="lblStartDate2" style="text-align: left" colspan="5">
                            <input type="text" readonly="readonly" ID="txtSupportPlasnStart" name="txtSupportPlasnStart"  Style="font-size: small;border-radius:5px;Width:115px; Border Color:#CCCCCC Style:Solid;Border Width:1px solid #C0C0C0;"  />
                            <obout:Calendar ID="calSupportPlasnStartDAte" runat="server" 
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
                                                TitleText=" "
                                                 
                                >
                            </obout:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;
                        </td>
                        <td id="allEndDate">
                            <obout:OboutCheckBox ID="chkSupportPlanResolved" runat="server" Text="Support Plan Resolved" ControlsToEnable="lblEndDate1,lblEndDate2"></obout:OboutCheckBox>
                        </td>
                        <td id="lblEndDate1" style="text-align: right; font-size: small;  font-weight: bold;">Date: </td>
                        <td id="lblEndDate2" colspan="2">
                            <input type="text" readonly="readonly" ID="txtSupportPlanResolved" name="txtSupportPlanResolved" Style="font-size: small;border-radius:5px;Width:115px; Border Color:#CCCCCC Style:Solid;Border Width:1px solid #C0C0C0;"  />
                            <obout:Calendar ID="calSupportPlanResolvedDate" runat="server"
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

                    <tr>
                        <td style="text-align: right; font-size: small;  font-weight: bold;">Comments: </td>
                        <td style="text-align: left" colspan="4">
                            <asp:Label ID="txtCommentsEdit" runat="server" Style="font-size: small;" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" style="text-align: center;">
                             <input type="button" id="btnSaveData" value="Save Changes" style="font-size: x-small; width: 145px; border-radius: 5px;" onclick="btnSaveData_Click()" />
                             <input type="button" id="btnServerSaveData" runat="server" value="Save Changes" style="font-size: x-small; width: 145px; border-radius: 5px;display:none;" onServerclick="btnServerSaveData_Click" />
                             <input type="button" runat="server" id="btnCancelSave" value="Cancel" style="font-size: x-small; width: 145px; border-radius: 5px;" onserverclick="btnCancelSaveData_Click" />
                            <br /><br />
                        </td>
                    </tr>
                </table>

            </div>
       </fieldset>
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

<input type="text"  id="hftxtInitalScreeningDate" runat="server" style="display:none;" />
<input type="text"  id="hftxtSupportStartDate" runat="server" style="display:none;" />
<input type="text"  id="hftxtSupportEndDate" runat="server" style="display:none;" />

<asp:HiddenField ID="HiddenField1" runat="server" />

<script type="text/javascript">
    function GoBack_Click() {
        window.history.back();
    }
    function btnUpdate_Click() {
        $('#divUpdateEligibility').show();
        $('#divReadEligibility').hide();
    }
   
    function btnSaveData_Click() {
        var lDecision = ddlDecision.value();
        var lInitialScreeningDate = document.getElementById('txtInitialScreeningDate').value;

               
        if (lDecision == '' || lInitialScreeningDate == "")
        {
            
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").hide();
            if (lInitialScreeningDate == "") {

                txtMessage.value("You must select a Initial Screening Date to add this student to the AG program. \n Please click OK and try again.");
            }
            else {
                txtMessage.value("You must select a Decision to add this student to the AG program. \n Please click OK and try again.");
            }
           
            diaMessage.setIconPath('/images/warning.gif');
            diaMessage.Open();
        }
        else
        {
            document.getElementById('<%= hftxtInitalScreeningDate.ClientID%>').value = lInitialScreeningDate;
           
            var lldate1 = document.getElementById('txtSupportPlasnStart').value;
            var lldate2 = document.getElementById('txtSupportPlanResolved').value;
           
            var lchkSupportPlanStart =chkSupportPlanStart.checked();
            var lchkSupportPlanResolved = chkSupportPlanResolved.checked();
           
           
            if (lchkSupportPlanStart == true || lchkSupportPlanResolved == true)
            {

                if (lchkSupportPlanStart == true  && lldate1 == '')
                {
                    txtMessage.value("The Support Plan Initiated check box was clicked, but no date was entered. \n To add Support Plan Initiation Date,  \n click OK and enter date.");
                    document.getElementById("btnDiaMessageYes").value = "OK";
                    document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
                    $("#btnDiaMessageNo").hide();
                    diaMessage.setIconPath('/images/warning.gif');
                    diaMessage.Open();
                }
                else if(lchkSupportPlanResolved == true && lldate2 == '')
                {
                    txtMessage.value("The Support Plan Resolved check box was clicked, but no date was entered. \n To add Support Plan Resolution Date,  \n click OK and enter date.");
                    document.getElementById("btnDiaMessageYes").value = "OK";
                    document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
                    $("#btnDiaMessageNo").hide();
                    diaMessage.setIconPath('/images/warning.gif');
                    diaMessage.Open();
                }
                else {
                    document.getElementById("<%=hftxtSupportStartDate.ClientID%>").value = lldate1;
                    document.getElementById("<%=hftxtSupportEndDate.ClientID%>").value = lldate2;
                    document.getElementById("<%=btnServerSaveData.ClientID%>").click();
                }
            }
            else
            {
                document.getElementById("<%=hftxtSupportStartDate.ClientID%>").value = lldate1;
                document.getElementById("<%=hftxtSupportEndDate.ClientID%>").value = lldate2;
                document.getElementById("<%=btnServerSaveData.ClientID%>").click();
            }
        }
   }
</script>