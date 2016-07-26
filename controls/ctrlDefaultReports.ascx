<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlDefaultReports.ascx.cs" Inherits="controls_ctrlDefaultReports" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register Assembly="obout_ComboBox" Namespace="Obout.ComboBox" TagPrefix="obout" %>
<%@ Register Assembly="obout_ListBox" Namespace="Obout.ListBox" TagPrefix="obout" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>

<div id="divMain">

    <div id="divReportTitle">
        <table width="735px" >
            <tr>
                <td style="text-align:left">
                    Select the report you wish to print:
                    <obout:OboutDropDownList ID="ddlReportNames" runat="server" DataTextField="Description" DataValueField="ReportId" AppendDataBoundItems="true">
                    </obout:OboutDropDownList>
                </td>
                <td  style="text-align:right;">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Icon_stopx.gif" OnClick="btnHome_Click" ToolTip="Return to main menu" Height="25%" Width="20%" />
                </td>
            </tr>
        </table>
    </div>

    <div id="divReportBody">
        <fieldset style="width:710px;height:165px;font-size:small;">
            <table style="width:710px">
                <tr>
                    <td style="text-align:right">
                        School:
                    </td>
                    <td colspan="4" style="text-align:left">
                        <obout:combobox ID="ddlSites" runat="server" 
                                            SelectionMode="Multiple" 
                                            DataTextField="SiteName" 
                                            DataValueField="SiteId" 
                                            Width="215px" 
                                            Height="200px" 
                                            AppendDataBoundItems="true" >
                            <obout:ComboBoxItem Value="0" Text="" />
                        </obout:combobox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right">
                        Decision:
                    </td>
                    <td colspan="2" style="text-align:left">
                        <obout:combobox ID="ddlDecision" runat="server" 
                                                     DataTextField="Decisions"   
                                                     DataValueField="DecisionId"  
                                                     AppendDataBoundItems="true"
                                                     SelectionMode="Multiple" 
                                                     >
                                 <obout:ComboBoxItem runat="server" Text="" />
                        </obout:combobox>
                    </td>
                    <td style="text-align:right">
                        Grade:
                    </td>
                    <td style=" text-align:left">
                        <obout:ComboBox ID="cboGrade" runat="server" SelectionMode="Multiple" AppendDataBoundItems="true" DataTextField="" DataValueField="">
                            <obout:ComboBoxItem Value="0" Text="" />
                            <obout:ComboBoxItem Value="PK" Text="PK" />
                            <obout:ComboBoxItem Value="KI" Text="KI" />
                            <obout:ComboBoxItem Value="01" Text="01" />
                            <obout:ComboBoxItem Value="02" Text="02" />
                            <obout:ComboBoxItem Value="03" Text="03" />
                            <obout:ComboBoxItem Value="04" Text="04" />
                            <obout:ComboBoxItem Value="05" Text="05" />
                            <obout:ComboBoxItem Value="06" Text="06" />
                            <obout:ComboBoxItem Value="07" Text="07" />
                            <obout:ComboBoxItem Value="08" Text="08" />
                            <obout:ComboBoxItem Value="09" Text="09" />
                            <obout:ComboBoxItem Value="10" Text="10" />
                            <obout:ComboBoxItem Value="11" Text="11" />
                            <obout:ComboBoxItem Value="12" Text="12" />
                        </obout:ComboBox>

                    </td>
                </tr>
                <tr>
                    <td style="text-align:right">
                        Gender:
                    </td>
                    <td colspan="2" style="text-align:left">
                        <obout:OboutDropDownList  ID="ddlGender" runat="server" AppendDataBoundItems="true" >
                            <items>
                                <asp:ListItem Value="0" Text="" />
                                <asp:ListItem Value="M" Text="Male" />
                                <asp:ListItem Value="F" Text="Female" />
                            </items>
                        </obout:OboutDropDownList>
                    </td>
                    <td style="text-align:right">
                        Ethnicity:
                    </td>
                    <td style=" text-align:left">
                        <obout:combobox ID="cboEthnicity" runat="server" SelectionMode="Multiple" AppendDataBoundItems="true" DataTextField="EthnicityDescription" DataValueField="EthnicityCode">
                            <obout:ComboBoxItem runat="server" Text="" />
                        </obout:combobox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right">
                        Reading Service:
                    </td>
                    <td colspan="2" style=" text-align:left">
                        <obout:OboutDropDownList ID="ddlReadingLOS" runat="server"  DataValueField="LOSCode"   DataTextField="LOSDescription" AppendDataBoundItems="true"></obout:OboutDropDownList>
                    </td>
                    <td style="text-align:right">
                        Math Service:
                    </td>
                    <td style=" text-align:left">    
                        <obout:OboutDropDownList ID="ddlMathLOS" runat="server"  DataValueField="LOSCode"   DataTextField="LOSDescription" AppendDataBoundItems="true"></obout:OboutDropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right">
                        Science Service:
                    </td>
                    <td colspan="2" style=" text-align:left">
                        <obout:OboutDropDownList ID="ddlSCILOS" runat="server"  DataValueField="LOSCode"   DataTextField="LOSDescription" AppendDataBoundItems="true"></obout:OboutDropDownList>
                    </td>
                    <td style="text-align:right">
                        Social&nbsp;Studies&nbsp;Service:
                    </td>
                    <td style=" text-align:left">
                        <obout:OboutDropDownList ID="ddlSSLOS" runat="server"  DataValueField="LOSCode"   DataTextField="LOSDescription" AppendDataBoundItems="true"></obout:OboutDropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" style=" text-align:center">&nbsp;</td>
                </tr>
                <tr>

                    <td colspan="5" style=" text-align:center">
                        <input id="Button1" type="button"  value="View in Excel" onclick="btnView_Click()" style="font-size:x-small;width:150px;border-radius:5px;" />&nbsp;
                        <input id="btnServerView" type="button" runat="server" value="View in Excel" onserverclick="btnView_Click" style="font-size:x-small;width:150px;border-radius:5px;display:none;"  />&nbsp;
                        <input id="btnCancel" type="button" value="Clear Form" onclick="ClearForm_Click()" style="font-size:x-small;width:150px;border-radius:5px;" />&nbsp;
                        <input type="button" ID="btnHome" runat="server" value="Close" onserverclick="btnHome_Click" style="font-size:x-small;width:150px;border-radius:5px;" title="Return to main menu"/>
                    </td>

                </tr>
            </table>
        </fieldset>
    </div>

    <owd:Dialog ID="diaMessage" runat="server"
                Title="Error entering information."
                Width="450" 
                Height="250"
                ShowCloseButton="true" 
                IsModal="true"
                StyleFolder="~/obout_styles/windia/grandgray"
                IsDraggable="true"   
                VisibleOnLoad="false"
                IconPath="../images/information.png"
                Position="SCREEN_CENTER">
        <div id="divErrorWindow" style="width:99%; HEIGHT:95%; text-align:center;">
            <center>
                <div id="divErrorMsg" style="width:90%; HEIGHT:55%; text-align:left; padding:20px;" runat="server" ></div>
            </center>
            <br />
            <input type="button" id="btnCloseErrorDialog" value="  ok  " onclick="diaMessage.Close()" style="font-size:x-small;width:100px;border-radius:5px;" />
        </div>
    </owd:Dialog>

</div>

<script type="text/javascript" >
    
    function ClearForm_Click()
    {
        var initialSelectedIndex = -1;
        cboGrade.selectedIndex(initialSelectedIndex);
        ddlSites.selectedIndex(initialSelectedIndex);
        ddlDecision.selectedIndex(initialSelectedIndex);
        cboEthnicity.selectedIndex(initialSelectedIndex);
        ddlGender.selectedIndex(initialSelectedIndex);
        ddlReadingLOS.selectedIndex(initialSelectedIndex);
        ddlMathLOS.selectedIndex(initialSelectedIndex);
        ddlSCILOS.selectedIndex(initialSelectedIndex);
        ddlSSLOS.selectedIndex(initialSelectedIndex);
    }
        
      
    
    
    function btnView_Click() {
        var ddlVal = ddlReportNames.value();
    
        var ltxt = 'Oops,<br /> No resport has been selected. <br /> Click <font color="#295b8b"><b>ok</b></font> and select a report to print.';
        var lName = document.getElementById("<%=divErrorMsg.ClientID %>").id;
    
        if (ddlVal == 0)
        {
            diaMessage.setTitle("Data Missing!");
            diaMessage.setSize(300, 175);
    
            document.getElementById(lName).innerHTML = ltxt;
            diaMessage.Open();
        }
        else
        {
            lbtn = document.getElementById('<%=btnServerView.ClientID%>');
            lbtn.click();
        }
    }   
</script>