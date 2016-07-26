<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlDefaultTestInformation.ascx.cs" Inherits="controls_ctrlDefaultTestInformation" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Register Assembly="obout_Calendar2_Net" Namespace="OboutInc.Calendar2" TagPrefix="obout" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>

<%--<script src="../Scripts/TestInformation.js" type="text/javascript"></script>
--%>
<style type="text/css">
    .gridRowTitle
    {
        background-image: url('http://localhost:46582/images/gridRowTitlebg.PNG');
        background-repeat: repeat-x;
        text-align: left;
        background-color: transparent;
        font-family: Verdana;
        font-size: x-small;
        color: #295b8b;
    }
    .gridTitle
    {
        background-image: url('http://localhost:46582/images/gridTitlebg.PNG');
        background-repeat: repeat;
        text-align: left;
        background-color: transparent;
        font-family: Verdana;
        font-size: small;
        background: transparent; 
        color: white;
        width: 739px;
        text-align: left; 
    }
    .gridData
    {
        Font-Size: x-Small;
        color: #295b8b;
        font-family: Verdana;
        background-color: #CCCCCC;
        text-align: center;
    }
</style>

<div id="divButtons">
    <input type="button" id="btnEligibilityInfo" runat="server" style="font-size: x-small; width: 125px; border-radius: 5px;" onserverclick="EligibilityInfo_Click" value="Eligibility Info" />
    <input type="button" id="btnStudentInfo" runat="server" style="font-size: x-small; width: 125px; border-radius: 5px;" onserverclick="btnStudentInfo_Click" value="Student Info" />
    <input type="button" id="btnStudentEligibilityRecord" runat="server" style="font-size: x-small; width: 125px; border-radius: 5px;" onserverclick="btnStudentEligibilityRecord_Click" value="Student Eligibility Record" />
    <input type="button" id="btnNewSearch" runat="server" style="font-size: x-small; width: 125px; border-radius: 5px;" onserverclick="ShowSearchWindowAgain_Click" value="New Search" />
</div>
<br />
<div id="divDefaultMain">
    <div id="divStudentINfo">
        <fieldset style="width: 710px; height: 80px; font-size: small;">
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

            </table>
        </fieldset>
    </div>

    <div id="divAddAchievmentTest" style="width:720px;border: 5px solid #000000;border-radius:5px;display:none; background-color:#C0C0C0;">
        <table style="background-color: #C0C0C0; vertical-align: middle; border-spacing: -1px;">
            <tr>
                <td style="width:250px;text-align:left;">
                    <obout:OboutDropDownList ID="ddlTestName" runat="server" 
                                             DataSourceID="sdsAchTestTests" 
                                             DataTextField="TestName" 
                                             DataValueField="TestId" 
                                             AppendDataBoundItems="true" 
                                             Font-Size="X-Small"
                                             MenuWidth="350"
                                             Width="250"
                                            AllowAddingRecords="false">
                        <asp:ListItem>Test Name....</asp:ListItem>
                    </obout:OboutDropDownList>

                </td>
                <td style="width:127px;">
                    &nbsp;
                    <input type="text" readonly="readonly" ID="txtAchTestDate" name="txtAchTestDate"  placeholder="Test Date" 
                           Style="font-size: x-small;border-radius:5px;Width:72px; Border Width:1px solid #C0C0C0;"
                           />&nbsp;
                    <obout:Calendar ID="calAchTestDate" 
                                    runat="server" 
                                    TextBoxId="txtAchTestDate"
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
                <td style="width:73px;">
                    <obout:OboutDropDownList ID="ddlSubject" runat="server" 
                                             DataSourceID="sdsSubject" 
                                             DataTextField="SubjectName" 
                                             DataValueField="SubjectId" AppendDataBoundItems="true" Width="95px" Font-Size="X-Small">
                        <asp:ListItem>Subject....</asp:ListItem>
                    </obout:OboutDropDownList>
                </td>
                <td style="width:65px;">
                    <input type="text"  ID="txtAchScore" name="txtAchScore" Style="font-size: x-small;border-radius:5px;Width:50px; Border Color:#CCCCCC Style:Solid;Border Width:1px solid #C0C0C0;" placeholder="Score" />
                </td>
                <td style="width:100px;">
                    <input type="text" ID="txtAchScaleScore" name="txtAchScaleScore"  Style="font-size: x-small;border-radius:5px;Width:75px; Border Color:#CCCCCC Style:Solid;Border Width:1px solid #C0C0C0;" placeholder="Sacle Score" />
                </td>
                <td>
                    <obout:OboutDropDownList ID="ddlUseForEligibility" runat="server" 
                                             AppendDataBoundItems="true" 
                                             Font-Size="X-Small"
                                             MenuWidth="65"
                                             Width="65">
                        <asp:ListItem Value="-1" Text=""> </asp:ListItem>
                        <asp:ListItem Value ="1"> Yes </asp:ListItem>
                        <asp:ListItem Value="0"> No </asp:ListItem>
                    </obout:OboutDropDownList>
                </td>
            </tr>
        </table>
    </div>
    <div  id="divVieweAchievmentData" style="background:#000;color:white;width:730px;border-radius:5px;text-align:left; background-image: url('http://localhost:46582/images/gridTitlebg.PNG'); background-repeat: repeat-x; " >
        <table style="width:730px;">
            <tr>
                <td style="text-align:left;">
                    <label class="gridTitle">&nbsp;Achievment Data</label>
                </td>
                <td style="text-align:right;">
                    <input type="button" ID="btnAddAcheivmentTest" name="btnAddAcheivmentTest" runat="server" Style="border-style: none; border-width: 0px;font-size:x-small;border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent;outline:none;display:inline;" value="Add New" onclick="btnAddAcheivmentTest_Click()" />
                    <input type="button" ID="btnSaveAchevmentTest" name="btnSaveAchevmentTest" Style="border-style: none; border-width: 0px; font-size: x-small;   border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent;outline:none;display:none;" value="save"   onclick="btnSaveAchevmentTest_Click()" />
                    <input type="button" ID="btnServerSaveAchevment" runat="server" Style="display:none;" value="save" onserverclick="btnServerSaveAchevment_Click" />
                    <input type="button" ID="btnCancelAchevment" Style="border-style: none; border-width: 0px; font-size: x-small; border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent;outline:none;display:none;" value="cancel" onclick="btnCancelAchevment_Click()" />
                </td>
            </tr>

        </table>
        <obout:Grid ID="grdActiveData" runat="server"
                        AutoGenerateColumns="false"
                        AllowAddingRecords="false"
                        ShowFooter="true"
                        PageSize="20"
                        AllowManualPaging="false"
                        AllowRecordSelection="true"
                        EnableRecordHover="true"
                        Serialize="true"
                        CallbackMode="true"
                        AutoPostBackOnSelect="true"
                        KeepSelectedRecords="true"
                        AllowSorting="true"
                        ShowHeader="true"
                      
                >
                <Columns>
                    <obout:Column DataField="TestName" HeaderText="Test Name"   Width="225" runat="server" AllowSorting="true" ></obout:Column>
                    <obout:Column DataField="TestDate"  HeaderText="Test Date" Width="125" runat="server"  ></obout:Column>
                    <obout:Column DataField="Subject" HeaderText="Test Subject" Width="130" runat="server" ></obout:Column>
                    <obout:Column DataField="Score"     HeaderText="Test Score"   Width="75" runat="server" >
                          <TemplateSettings HeaderTemplateId="tempTestScore" />
                    </obout:Column>
                    <obout:Column DataField="ScaleScore"     HeaderText=""   Width="75" runat="server" >
                        <TemplateSettings HeaderTemplateId="tempScaleScore1" />
                    </obout:Column>
                    <obout:Column DataField="UseForEligibility"  HeaderText=""  Width="100" runat="server" TemplateId="TplUFE" >
                        <TemplateSettings HeaderTemplateId="tempUseForEligibility"  />
                    </obout:Column>
                </Columns>
            <Templates>
                <obout:GridTemplate runat="server" ID="TplUFE">
                    <Template>
                        <%# (Container.Value == "1" ? "yes" : "no") %>
                    </Template>
                </obout:GridTemplate>
          
                <obout:GridTemplate runat="server" ID="tempUseForEligibility">
                    <Template>Use For<br />Eligibility</Template>
                </obout:GridTemplate>
            
                <obout:GridTemplate runat="server" ID="tempTestScore">
                    <Template>Test<br />Score</Template>
                </obout:GridTemplate>
        
                <obout:GridTemplate runat="server" ID="tempScaleScore1">
                    <Template>Scale<br />Score</Template>
                </obout:GridTemplate>
            </Templates>
         
        </obout:Grid>

    </div>

    <div id="divAdditionalAchievmentTest" style="width:720px;border: 5px solid #000000;border-radius:5px;display:none; background-color:#C0C0C0;">
        <table style="border: 3px solid white; background-color: #C0C0C0; vertical-align: middle; border-spacing: -1px;">
            <tr>
                <td style="width:250px;text-align:left;">
                    <obout:OboutDropDownList ID="ddlAdditionalAchievmentTestName" runat="server" 
                                             DataSourceID="sdsAdditionalAchTestTests" 
                                             DataTextField="TestName" 
                                             DataValueField="TestId" 
                                             AppendDataBoundItems="true" 
                                             Font-Size="X-Small"
                                             MenuWidth="350"
                                             Width="250">
                        <asp:ListItem>Additional Achievement Test Name....</asp:ListItem>
                    </obout:OboutDropDownList>

                </td>
                <td style="width:127px;">
                    &nbsp;&nbsp;
                    <input type="text" readonly="readonly" ID="txtAddAdditionalAchievementTestDate" name="txtAddAdditionalAchievementTestDate" placeholder="Date"
                           Style="font-size: x-small;border-radius:5px;Width:72px;height:12px; Border Width:1px solid #C0C0C0;"
                           />
                    <obout:Calendar ID="calAddAdditionalAchievementTestDate" 
                                    runat="server" 
                                    TextBoxId="txtAddAdditionalAchievementTestDate"
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
                <td style="width:73px;">
                    <obout:OboutDropDownList ID="ddlAddAdditionalAchievementTestSubject" runat="server" 
                                             DataSourceID="sdsSubject" 
                                             DataTextField="SubjectName" 
                                             DataValueField="SubjectId" AppendDataBoundItems="true" Width="95px" Font-Size="X-Small">
                        <asp:ListItem>Subject....</asp:ListItem>
                    </obout:OboutDropDownList>
                </td>
                <td style="width:73px;">
                    <input type="text"  ID="txtAddAdditionalAchievementTestScore" name="txtAddAdditionalAchievementTestScore" Style="font-size: x-small;border-radius:5px;Width:50px; Border Color:#CCCCCC Style:Solid;Border Width:1px solid #C0C0C0;" placeholder="Score" />
                </td>
                <td style="width:73px;">
                    <input type="text" ID="txtAddAdditionalAchievementTestScaleScore" name="txtAddAdditionalAchievementTestScaleScore"  Style="font-size: x-small;border-radius:5px;Width:50px; Border Color:#CCCCCC Style:Solid;Border Width:1px solid #C0C0C0;" placeholder="Scale Score" />
                </td>
                <td>
                    <obout:OboutDropDownList ID="ddlAddAdditionalAchievementUseForEligibility" runat="server" 
                                             AppendDataBoundItems="true" 
                                             Font-Size="X-Small"
                                             MenuWidth="75"
                                             Width="75">
                        <asp:ListItem Value="-1" Text=""> </asp:ListItem>
                        <asp:ListItem Value ="1"> Yes </asp:ListItem>
                        <asp:ListItem Value="0"> No </asp:ListItem>
                    </obout:OboutDropDownList>
                </td>
            </tr>
        </table>
    </div>
    <div  id="divViewAdditionalAchievmentTest" style="background:#000;color:white;width:730px;border-radius:5px;text-align:left; background-image: url('http://localhost:46582/images/gridTitlebg.PNG'); background-repeat: repeat-x; " >
        <table style="width:730px;">
            <tr>
                <td style="text-align:left;">
                    <label class="gridTitle">&nbsp;Additional Achievment Data</label>
                </td>
                <td style="text-align:right;">
                    <input type="button" ID="btnAddAdditionalAchievmentTest" name="btnAddAdditionalAchievmentTest" runat="server" Style="border-style: none; border-width: 0px;font-size:x-small;border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent;outline:none;display:inline;" value="Add New" onclick="btnAddAdditionalAchievmentTest_Click()" />
                    <input type="button" ID="btnSaveAdditionalAchievmentTest" name="btnSaveAdditionalAchievmentTest" Style="border-style: none; border-width: 0px; font-size: x-small;   border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent;outline:none;display:none;" value="save"   onclick="btnSaveAdditionalAchievmentTest_Click()" />
                    <input type="button" ID="btnServerSaveAdditionalAchievmentTest" runat="server" Style="display:none;" value="save" onserverclick="btnServerSaveAdditionalAchievmentTest_Click" />
                    <input type="button" ID="btnCancelAdditionalAchievmentTest" name="btnCancelAdditionalAchievmentTest" Style="border-style: none; border-width: 0px; font-size: x-small; border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent;outline:none;display:none;" value="cancel" onclick="btnCancelAdditionalAchievmentTest_Click()" />
                </td>
            </tr>
        </table>
        <obout:Grid ID="grdAddAdditionalAchievmentTest" runat="server"
                        AutoGenerateColumns="false"
                        AllowAddingRecords="false"
                        ShowFooter="true"
                        PageSize="20"
                        AllowManualPaging="false"
                        AllowRecordSelection="true"
                        EnableRecordHover="true"
                        Serialize="true"
                        CallbackMode="true"
                        AutoPostBackOnSelect="true"
                        KeepSelectedRecords="true"
                        AllowSorting="true"
                        ShowHeader="true"
                >
            <Columns>
                <obout:Column DataField="TestName" HeaderText="Test Name"   Width="250" runat="server" AllowSorting="true" ></obout:Column>
                <obout:Column DataField="TestDate"  HeaderText="Test Date" Width="105" runat="server"  ></obout:Column>
                <obout:Column DataField="Subject" HeaderText="Test Subject" Width="130" runat="server" ></obout:Column>
                <obout:Column DataField="Score"     HeaderText=""   Width="70" runat="server" >
                        <TemplateSettings HeaderTemplateId="tempACHTestScore" />
                </obout:Column>
                <obout:Column DataField="ScaleScore"     HeaderText=""   Width="75" runat="server" >
                        <TemplateSettings HeaderTemplateId="tempScaleScore" />
                </obout:Column>
                <obout:Column DataField="UseForEligibility"  HeaderText=""  Width="100" runat="server" >
                    <TemplateSettings HeaderTemplateId="tempACHUseForEligibility" />
                </obout:Column>
            </Columns>
           
            <Templates>
                <obout:GridTemplate runat="server" ID="tempACHTestScore">
                    <Template>Score</Template>
                </obout:GridTemplate>
            </Templates>
            <Templates>
                <obout:GridTemplate runat="server" ID="tempScaleScore">
                    <Template>Scale<br />Score</Template>
                </obout:GridTemplate>
            </Templates>
            <Templates>
                <obout:GridTemplate runat="server" ID="tempACHUseForEligibility">
                    <Template>Use For<br />Eligibility</Template>
                </obout:GridTemplate>
            </Templates>
        </obout:Grid>
    </div>

    <div id="divAddAptitudeTest" style="width:720px; border: 5px solid #000000; border-radius: 5px; display: none; background-color: #C0C0C0;">
        <table style="border: 3px solid white; background-color: #C0C0C0; vertical-align: middle; ">
            <tr>
                <td style="width: 425px; text-align: left;">
                    <obout:OboutDropDownList ID="ddlAppTestName" runat="server"
                                             DataSourceID="sdsAppTests"
                                             DataTextField="TestName"
                                             DataValueField="TestId"
                                             AppendDataBoundItems="true"
                                             MenuWidth="395"
                                             Font-Size="X-Small"
                                             Width="395">
                        <asp:ListItem>Test Name....</asp:ListItem>
                    </obout:OboutDropDownList>
                </td>
                <td style="width: 245px; text-align: left;">
                    <input type="text" readonly="readonly" id="txtAppTestDate" name="txtAppTestDate" style="font-size: x-small; border-radius: 5px; width: 75px; border color: #CCCCCC Style:Solid; border width: 1px solid #C0C0C0;" placeholder="date" />
                    <obout:Calendar ID="calAppTestDate" runat="server"
                                    TextBoxId="txtAppTestDate"
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
                <td style="width: 85px; text-align: left;">
                    <obout:OboutTextBox ID="txtAppTestScore" font="x-small" runat="server" Width="75px" MaxLength="3" WatermarkText="Score"></obout:OboutTextBox>
                </td>
            </tr>
        </table>
    </div>
    <div id="divViewAptitudeTest" style="background: #000; color: white; width: 730px; border-radius: 5px; text-align: left; background-image: url('http://localhost:46582/images/gridTitlebg.PNG'); background-repeat: repeat-x;">
        <table style="width: 725px;">
            <tr>
                <td style="text-align: left;">
                    <label class="gridTitle">&nbsp;Aptitude Data</label>
                </td>
                <td style="text-align: right;">
                    <input type="button" id="btnADDAptitude" runat="server" style="border: none; border-width: 0; font-size: x-small; border-color: transparent;  color: #FFFFFF; font-family: Verdana; background-color: transparent; outline: none;" value="Add New" onclick="ADDAptitude_Click()" />
                    <input type="button" id="btnSaveAptitude" style="border: none; border-width: 0; font-size: x-small; border-color: transparent;  color: #FFFFFF; font-family: Verdana; background-color: transparent; outline: none; display: none;" value="save" onclick="btnSaveAptitude_Click()" />
                    <input type="button" ID="btnServerSaveAptitude" runat="server" Style="display:none;" value="save"  onserverclick="btnServerSaveAptitude_Click" />
                    <input type="button" id="btnCancelAptitude" style="border: none; border-width: 0; font-size: x-small; border-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent; outline: none; display: none;" value="cancel" onclick="btnCancelAptitude_Click()" />
                </td>
            </tr>
        </table>
        <obout:Grid ID="grdAptitudeData" runat="server"
                        AutoGenerateColumns="false"
                        AllowAddingRecords="false"
                        ShowFooter="true"
                        PageSize="20"
                        AllowManualPaging="false"
                        AllowRecordSelection="true"
                        EnableRecordHover="true"
                        Serialize="true"
                        CallbackMode="true"
                        AutoPostBackOnSelect="true"
                        KeepSelectedRecords="true"
                        AllowSorting="true"
                        ShowHeader="true"
                >
                <Columns>
                    <obout:Column DataField="TestName" HeaderText="Test Name"   Width="350" runat="server" AllowSorting="true" ></obout:Column>
                    <obout:Column DataField="TestDate"  HeaderText="Test Date" Width="150" runat="server"  ></obout:Column>
                    <obout:Column DataField="Score"  HeaderText="Score"  Width="130" runat="server" ></obout:Column>
                    <obout:Column DataField="UseForEligibility"  HeaderText=""  Width="100" runat="server" >
                         <TemplateSettings HeaderTemplateId="tempAptitudeseForEligibility" />
                    </obout:Column>
				</Columns>
                <Templates>
                    <obout:GridTemplate runat="server" ID="tempAptitudeseForEligibility">
                        <Template>Use For<br />Eligibility</Template>
                    </obout:GridTemplate>
                </Templates>
        </obout:Grid>
    </div>

    <div id="divAdditionalAptitudeTest" style="width:720px; border: 5px solid #000000; border-radius: 5px; display: none; background-color: #C0C0C0;">
        <table style="border: 2px solid white; background-color: #C0C0C0; vertical-align: middle; ">
            <tr>
                <td style="width: 425px; text-align: left;">
                    <obout:OboutDropDownList ID="ddlAdditionalAptTestName" runat="server"
                                             DataSourceID="sdsAdditionalAppTests"
                                             DataTextField="TestName"
                                             DataValueField="TestId"
                                             AppendDataBoundItems="true"
                                             MenuWidth="395"
                                             Font-Size="X-Small"
                                             Width="395">
                        <asp:ListItem>Test Name....</asp:ListItem>
                    </obout:OboutDropDownList>
                </td>
                <td style="width: 245px; text-align: left;">
                    <input type="text" readonly="readonly" id="txtAdditionalAptTestDate" name="txtAdditionalAptTestDate" style="font-size: x-small; border-radius: 5px; width: 95px; border color: #CCCCCC Style:Solid; border width: 1px solid #C0C0C0;" placeholder="Date" />
                    <obout:Calendar ID="calAdditionalApttTestDate" runat="server"
                                    TextBoxId="txtAdditionalAptTestDate"
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
                <td style="width: 100px; text-align: left;">
                    <obout:OboutTextBox ID="txtAdditionalAptTestScore" font="x-small" runat="server" Width="85px" MaxLength="3" WatermarkText="Score"></obout:OboutTextBox>
                </td>
            </tr>
        </table>
    </div>
    <div id="divViewAdditionalAptitudeTest" style="background: #000; color: white; width: 730px; border-radius: 5px; text-align: left; background-image: url('http://localhost:46582/images/gridTitlebg.PNG'); background-repeat: repeat-x;">
        <table style="width: 725px;">
            <tr>
                <td style="text-align: left;">
                    <label class="gridTitle">&nbsp;Additional Aptitude Data</label>
                </td>
                <td style="text-align: right;">
                    <input type="button" id="btnADDAdditionalAptitude" runat="server" runat="server" style="border-style: none; border-width: 0px; font-size: x-small; border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent; outline: none; display: inline;" value="Add New" onclick="btnADDAdditionalAptitude_Click()" />
                    <input type="button" id="btnSaveAdditionalAptitude" style="border-style: none; border-width: 0px; font-size: x-small; border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent; outline: none; display: none;" value="save" onclick="btnSaveAdditionalAptitude_Click()" />
                    <input type="button" ID="btnServerSaveAdditionalAptitude" runat="server" Style="display:none;" value="save"  onserverclick="btnServerSaveAdditionalAptitude_Click" />
                    <input type="button" id="btnCancelAdditionalAptitude" style="border-style: none; border-width: 0px; font-size: x-small; border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent; outline: none; display: none;" value="cancel" onclick="btnCancelAdditionalAptitude_Click()" />
                </td>
            </tr>
        </table>
        <obout:Grid ID="grdAdditionalAptitudeData" runat="server"
                     AutoGenerateColumns="false"
                        AllowAddingRecords="false"
                        ShowFooter="true"
                        PageSize="20"
                        AllowManualPaging="false"
                        AllowRecordSelection="true"
                        EnableRecordHover="true"
                        Serialize="true"
                        CallbackMode="true"
                        AutoPostBackOnSelect="true"
                        KeepSelectedRecords="true"
                        AllowSorting="true"
                        ShowHeader="true"
            >
                <Columns>
                        <obout:Column DataField="TestName" HeaderText="Test Name"   Width="350" runat="server" AllowSorting="true" ></obout:Column>
                        <obout:Column DataField="TestDate"  HeaderText="Test Date" Width="150" runat="server"  ></obout:Column>
                        <obout:Column DataField="Score"  HeaderText="Score"   Width="130px" runat="server" ></obout:Column>
                        <obout:Column DataField="UseForEligibility"  HeaderText=""  Width="100" runat="server" >
                             <TemplateSettings HeaderTemplateId="tempAdditionalAptitudeData" />
                        </obout:Column>
                </Columns>
                <Templates>
                        <obout:GridTemplate runat="server" ID="tempAdditionalAptitudeData">
                            <Template>Use For<br />Eligibility</Template>
                        </obout:GridTemplate>
                </Templates>
        </obout:Grid>
    </div>

    <div id="divAddNewTeacherInfo" style="width:720px; border: 5px solid #000000; border-radius: 5px; display: none; background-color: #C0C0C0;">
        <table style="border: 3px solid white; background-color: #C0C0C0; vertical-align: middle; ">
            <tr>
                <td style="width: 150px; text-align: left;">
                    <obout:OboutTextBox ID="txtTeacherScore" font="x-small" width="200px"  runat="server" ></obout:OboutTextBox>
                </td>
                <td style="width: 335px; text-align: Center;">
                   
                   
                    <input type="text" readonly="readonly" ID="txtTeacherDate" name="txtTeacherDate" placeholder="Date"
                           Style="font-size: x-small;border-radius:5px;Width:72px;height:12px; Border Width:1px solid #C0C0C0;"
                           />
                    <obout:Calendar ID="CalTeacherInfo" runat="server"
                                    TextBoxId="txtTeacherDate"
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
                <td style="width: 85px; text-align: left;">
                    <obout:OboutTextBox ID="txtTeacherEvalScore" font="x-small" runat="server" Width="75px" MaxLength="3" WatermarkText="Score"></obout:OboutTextBox>
                </td>
                <td>
                    <obout:OboutDropDownList ID="cboTeacherUsedFor" runat="server" 
                                             AppendDataBoundItems="true" 
                                             Font-Size="X-Small"
                                             MenuWidth="75"
                                             Width="75">
                        <asp:ListItem Value="-1" Text=""> </asp:ListItem>
                        <asp:ListItem Value ="1"> Yes </asp:ListItem>
                        <asp:ListItem Value="0"> No </asp:ListItem>
                    </obout:OboutDropDownList>
                </td>
            </tr>
        </table>
    </div>
    <div id="ViewTeacherInfo" style="background: #000; color: white; width: 730px; border-radius: 5px; text-align: left; background-image: url('http://localhost:46582/images/gridTitlebg.PNG'); background-repeat: repeat-x;">
        <table style="width: 725px;">
            <tr>
                <td style="text-align: left;">
                    <label class="gridTitle">&nbsp;Teacher Input</label>
                </td>
                <td style="text-align: right;">
                    <input type="button" id="btnAddTeacherInfo" runat="server" style="border-style: none; border-width: 0px; font-size: x-small; border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent; outline: none; display: inline;" value="Add New" onclick="ADDTeacherInfo_Click()" />
                    <input type="button" id="btnSaveTeacherInfo" style="border-style: none; border-width: 0px; font-size: x-small; border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent; outline: none; display: none;" value="save" onclick="btnSaveTeacherInfo_Click()" />
                    <input type="button" id="btnServerSaveTeacherInfo" runat="server" style="display: none;" value="save" onserverclick="btnServerSaveTeacherInfo_Click" />
                    <input type="button" id="btnCancelTeacherInfo" style="border-style: none; border-width: 0px; font-size: x-small; border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent; outline: none; display: none;" value="cancel" onclick="btnCancelTeacherInfo_Click()" />
                </td>
            </tr>
        </table>
        <obout:grid ID="grdTeacherInput" runat="server"
                     AutoGenerateColumns="false"
                        AllowAddingRecords="false"
                        ShowFooter="true"
                        PageSize="20"
                        AllowManualPaging="false"
                        AllowRecordSelection="true"
                        EnableRecordHover="true"
                        Serialize="true"
                        CallbackMode="true"
                        AutoPostBackOnSelect="true"
                        KeepSelectedRecords="true"
                        AllowSorting="true"
                        ShowHeader="true"
            >
          
                <Columns>
                    <obout:Column DataField="TestName" HeaderText="Name"   Width="350" runat="server" AllowSorting="true" ></obout:Column>
                    <obout:Column DataField="TestDate"  HeaderText="Date" Width="150" runat="server"  ></obout:Column>
                     <obout:Column DataField="Score"  HeaderText="Score"   Width="130px" runat="server" ></obout:Column>
                    <obout:Column DataField="UserForEligibility"  HeaderText="Useed for " Width="100" runat="server"  >
                        <TemplateSettings HeaderTemplateId="tempTeacherInput" />
                    </obout:Column>
                </Columns>
                <Templates>
                    <obout:GridTemplate runat="server" ID="tempTeacherInput">
                        <Template>Use For<br />Eligibility</Template>
                    </obout:GridTemplate>
                </Templates>
        </obout:grid>
    </div>

    <div id="divAddNewStudentInfo" style="width:720px; border: 5px solid #000000; border-radius: 5px; display: none; background-color: #C0C0C0;">
        <table style="border: 3px solid white; background-color: #C0C0C0; vertical-align: middle; ">
            <tr>
                <td style="width: 150px; text-align: left;">
                    <obout:oboutTextBox ID="txtStudentInput" width="200px"  runat="server" CssClass="gridData" Text='<%#Eval("Score") %>'/>
                </td>
                <td style="width: 335px; text-align: center;">
                  
                    <input type="text" readonly="readonly" id="txtStudentDate" name="txtStudentDate" style="font-size: x-small; border-radius: 5px; width: 75px; border color: #CCCCCC Style:Solid; border width: 1px solid #C0C0C0;" placeholder="Date" />
                    <obout:Calendar ID="calStudentInput" runat="server"
                                    TextBoxId="txtStudentDate"
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
                <td style="width: 85px; text-align: left;">
                    <obout:OboutTextBox ID="txtStudentrScore" font="x-small" runat="server" Width="75px" MaxLength="3" WatermarkText="Score"></obout:OboutTextBox>
                </td>
                <td>
                    <obout:OboutDropDownList ID="cboStudentUsedFor" runat="server" 
                                             AppendDataBoundItems="true" 
                                             Font-Size="X-Small"
                                             MenuWidth="75"
                                             Width="75">
                        <asp:ListItem Value="-1" Text=""> </asp:ListItem>
                        <asp:ListItem Value ="1"> Yes </asp:ListItem>
                        <asp:ListItem Value="0"> No </asp:ListItem>
                    </obout:OboutDropDownList>
                </td>
            </tr>
        </table>
    </div>
    <div id="divViewStudentInput" style="background: #000; color: white; width: 730px; border-radius: 5px; text-align: left; background-image: url('http://localhost:46582/images/gridTitlebg.PNG'); background-repeat: repeat-x;">
        <table style="width: 725px;">
            <tr>
                <td style="text-align: left;">
                    <label class="gridTitle">&nbsp;Student Input</label>
                </td>
                <td style="text-align: right;">
                    <input type="button" id="btnAddStudentInfo" runat="server" style="border-style: none; border-width: 0px; font-size: x-small; border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent; outline: none; display: inline;" value="Add New" onclick="AddStudentInfo_Click()" />
                    <input type="button" id="btnSaveStudentInfo" style="border-style: none; border-width: 0px; font-size: x-small; border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent; outline: none; display: none;" value="save" onclick="btnSaveStudentInfo_Click()" />
                    <input type="button" id="btnServerSaveStudentInfo" runat="server" style="display:none;" value="save" onserverclick="btnServerSaveStudentInfo_Click" />
                    <input type="button" id="btnCancelStudentInfo" style="border-style: none; border-width: 0px; font-size: x-small; border-top-color: transparent; border-right-color: transparent; border-bottom-color: transparent; border-left-color: transparent; color: #FFFFFF; font-family: Verdana; background-color: transparent; outline: none; display: none;" value="cancel" onclick="btnCancelStudentInfo_Click()" />
                </td>
            </tr>
        </table>
       <Obout:Grid ID="grdStudentInput" runat="server"
                     AutoGenerateColumns="false"
                        AllowAddingRecords="false"
                        ShowFooter="true"
                        PageSize="20"
                        AllowManualPaging="false"
                        AllowRecordSelection="true"
                        EnableRecordHover="true"
                        Serialize="true"
                        CallbackMode="true"
                        AutoPostBackOnSelect="true"
                        KeepSelectedRecords="true"
                        AllowSorting="true"
                        ShowHeader="true"
            >
          
                <Columns>
                    <obout:Column DataField="TestName" HeaderText="Name"   Width="350" runat="server" AllowSorting="true" ></obout:Column>
                    <obout:Column DataField="TestDate"  HeaderText="Date" Width="150" runat="server"  ></obout:Column>
                     <obout:Column DataField="Score"  HeaderText="Score"   Width="130px" runat="server" ></obout:Column>
                    <obout:Column DataField="UsedForEligibility"  HeaderText="Test Date" Width="100" runat="server"  >
                        <TemplateSettings HeaderTemplateId="tempStudentInput" />
                    </obout:Column>
                </Columns>
                <Templates>
                            <obout:GridTemplate runat="server" ID="tempStudentInput">
                                <Template>Use For<br />Eligibility</Template>
                            </obout:GridTemplate>
                </Templates>
        </obout:Grid>
    </div>

    <asp:SqlDataSource runat="server" ID="sdsAchTestTests" SelectCommand="usp_GetAchevementTests"
                       ConnectionString="<%$ ConnectionStrings:con%>" SelectCommandType="StoredProcedure"
                       ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="sdsAppTests" SelectCommand="usp_GetAptitudeTests"
                       ConnectionString="<%$ ConnectionStrings:con%>" SelectCommandType="StoredProcedure"
                       ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="sdsAdditionalAchTestTests" SelectCommand="usp_GetAdditionalAchevementTests"
                       ConnectionString="<%$ ConnectionStrings:con%>" SelectCommandType="StoredProcedure"
                       ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="sdsAdditionalAppTests" SelectCommand="usp_GetAdditionalAptitudeTests"
                       ConnectionString="<%$ ConnectionStrings:con%>" SelectCommandType="StoredProcedure"
                       ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="sdsSubject" SelectCommand="usp_GetSubject"
                       ConnectionString="<%$ ConnectionStrings:con%>" SelectCommandType="StoredProcedure"
                       ProviderName="System.Data.SqlClient"></asp:SqlDataSource>

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
        </center>
    </owd:Dialog>
</div>
    <script  type="text/javascript">
        $(document).ready(function () {
            ADDachTest.Attributes.Add("style", "display:none");
            btnADDAptitude.Attributes.Add("style", "display:none");
        });
        function ADDAptitude_Click() {
            document.getElementById('divAddAptitudeTest').style.display = 'block';
            document.getElementById('btnSaveAptitude').style.display = 'inline';
            document.getElementById('btnCancelAptitude').style.display = 'inline';
            document.getElementById('<%=btnADDAptitude.ClientID%>').style.display = 'none';
        }
        function btnCancelAptitude_Click() {
            document.getElementById('divAddAptitudeTest').style.display = 'none';
            document.getElementById('btnSaveAptitude').style.display = 'none';
            document.getElementById('btnCancelAptitude').style.display = 'none';
            document.getElementById('<%=btnADDAptitude.ClientID%>').style.display = 'inline';
        }
        function btnSaveAptitude_Click() {
            var lTestName = ddlAppTestName.value();
            var lTestDate = txtAppTestDate.value;
            var lScore = txtAppTestScore.value();
            var lError = false;
            var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';

            if (lTestName == "Test Name....") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test name must be selected from the list.<br />";
            }
            if (lTestDate == "") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test date must be selected from calendar.<br />";
            }
            if (lScore == "") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test score must be entered.<br />";
            }
            if (lError == true) {
                lMessage += '</font><br />Please correct the above issues and try again.';
                $("#divErrorMsg").empty();
                $('#divErrorMsg').append(lMessage);
                document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
                document.getElementById("btnDiaMessageYes").value = "OK";
                document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
                $("#btnDiaMessageNo").hide();
                diaMessage.Open();
            } else {
                document.getElementById("<%=btnServerSaveAptitude.ClientID%>").click();
            }
        }

        function btnADDAdditionalAptitude_Click() {
            document.getElementById('divAdditionalAptitudeTest').style.display = 'block';
            document.getElementById('btnSaveAdditionalAptitude').style.display = 'inline';
            document.getElementById('btnCancelAdditionalAptitude').style.display = 'inline';
            document.getElementById('<%=btnADDAdditionalAptitude.ClientID%>').style.display = 'none';
        }
        function btnCancelAdditionalAptitude_Click() {
            document.getElementById('divAdditionalAptitudeTest').style.display = 'none';
            document.getElementById('btnSaveAdditionalAptitude').style.display = 'none';
            document.getElementById('btnCancelAdditionalAptitude').style.display = 'none';
            document.getElementById('<%=btnADDAdditionalAptitude.ClientID%>').style.display = 'inline';
        }
        function btnSaveAdditionalAptitude_Click() {
            var lTestName = ddlAdditionalAptTestName.value();
            var lTestDate = txtAdditionalAptTestDate.value;
            var lScore = txtAdditionalAptTestScore.value();

            var lError = false;
            var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';

            if (lTestName == "Test Name....") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test name must be selected from the list.<br />";
            }

            if (lTestDate == "") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test date must be selected from calendar.<br />";
            }
            if (lScore == "") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test score must be entered.<br />";
            }

            if (lError == true) {
                lMessage += '</font><br />Please correct the above issues and try again.';
                $("#divErrorMsg").empty();
                $('#divErrorMsg').append(lMessage);
                document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
                document.getElementById("btnDiaMessageYes").value = "OK";
                document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
                $("#btnDiaMessageNo").hide();
                diaMessage.Open();
            } else {
                document.getElementById("<%=btnServerSaveAdditionalAptitude.ClientID%>").click();
            }
        }

        function btnAddAcheivmentTest_Click() {
            document.getElementById('<%=btnAddAcheivmentTest.ClientID%>').style.display = 'none';
            document.getElementById('divAddAchievmentTest').style.display = 'block';
            document.getElementById('btnSaveAchevmentTest').style.display = 'inline';
            document.getElementById('btnCancelAchevment').style.display = 'inline';
        }
        function btnCancelAchevment_Click() {
            document.getElementById('divAddAchievmentTest').style.display = 'none';
            document.getElementById('btnSaveAchevmentTest').style.display = 'none';
            document.getElementById('btnCancelAchevment').style.display = 'none';
            document.getElementById('<%=btnAddAcheivmentTest.ClientID%>').style.display = 'inline';
        }
        function btnSaveAchevmentTest_Click() {
            var lTestName = ddlTestName.value();
            var lTestDate = txtAchTestDate.value;
            var lSubject = ddlSubject.value();
            var lScore = txtAchScore.value;
            var lScaleScore = txtAchScaleScore.value;
            var lUseForEligibility = ddlUseForEligibility.value();
            var lError = false;
            var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';

            if (lTestName == "Test Name....") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test name must be selected from the list.<br />";
            }

            if (lTestDate == "") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test date must be selected from calendar.<br />";
            }

            if (lSubject == "Subject....") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A subject for this test must be selected from the list.<br />";
            }
            if (lScore == "") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test score must be entered.<br />";
            }
            if (lUseForEligibility == "-1") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select whether this test is being used for eligibility purposes.<br />";
            }
            if (lError == true) {
                lMessage += '</font><br />Please correct the above issues and try again.';
                $("#divErrorMsg").empty();
                $('#divErrorMsg').append(lMessage);
                document.getElementById("btnDiaMessageYes").value = "OK";
                document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
                $("#btnDiaMessageNo").hide();
                diaMessage.Open();
            } else {
                document.getElementById("<%=btnServerSaveAchevment.ClientID%>").click();
            }
        }

        function btnCancelAdditionalAchievmentTest_Click() {
            document.getElementById('divAdditionalAchievmentTest').style.display = 'none';
            document.getElementById('btnSaveAdditionalAchievmentTest').style.display = 'none';
            document.getElementById('btnCancelAdditionalAchievmentTest').style.display = 'none';
            document.getElementById('<%=btnAddAdditionalAchievmentTest.ClientID%>').style.display = 'inline';
        }
        function btnAddAdditionalAchievmentTest_Click() {
            document.getElementById('divAdditionalAchievmentTest').style.display = 'block';
            document.getElementById('btnSaveAdditionalAchievmentTest').style.display = 'inline';
            document.getElementById('btnCancelAdditionalAchievmentTest').style.display = 'inline';
            document.getElementById('<%=btnAddAdditionalAchievmentTest.ClientID%>').style.display = 'none';
        }
        function btnSaveAdditionalAchievmentTest_Click() {
            //ToDo: Stopped Here
            var lTestName = ddlAdditionalAchievmentTestName.value();
            var lTestDate = txtAddAdditionalAchievementTestDate.value;
            var lSubject = ddlAddAdditionalAchievementTestSubject.value();
            var lScore = txtAddAdditionalAchievementTestScore.value;
            var lScaleScore = txtAddAdditionalAchievementTestScaleScore.value;
            var lUseForEligibility = ddlAddAdditionalAchievementUseForEligibility.value();
            var lError = false;
            var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';
        
            if (lTestName == "Test Name....") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test name must be selected from the list.<br />";
            }
            if (lTestDate == "") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test date must be selected from calendar.<br />";
            }
            if (lSubject == "Subject....") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A subject for tis test must be selected from the list.<br />";
            }
            if (lScore == "") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test score must be entered.<br />";
            }
            if (lUseForEligibility == "-1") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select whether this test is being used for eligibility purposes.<br />";
            }
        
            if (lError == true) {
                lMessage += '</font><br />Please correct the above issues and try again.';
                $("#divErrorMsg").empty();
                $('#divErrorMsg').append(lMessage);
                document.getElementById("btnDiaMessageYes").value = "OK";
                document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
                $("#btnDiaMessageNo").hide();
                diaMessage.Open();
            } else {
                document.getElementById("<%=btnServerSaveAdditionalAchievmentTest.ClientID%>").click();
            }
        }
        
        function btnCancelTeacherInfo_Click() {
            document.getElementById('divAddNewTeacherInfo').style.display = 'none';
            document.getElementById('btnSaveTeacherInfo').style.display = 'none';
            document.getElementById('btnCancelTeacherInfo').style.display = 'none';
            document.getElementById('<%=btnAddTeacherInfo.ClientID%>').style.display = 'inline';
        }
        function ADDTeacherInfo_Click() {
            document.getElementById('divAddNewTeacherInfo').style.display = 'block';
            document.getElementById('btnSaveTeacherInfo').style.display = 'inline';
            document.getElementById('btnCancelTeacherInfo').style.display = 'inline';
            document.getElementById('<%=btnAddTeacherInfo.ClientID%>').style.display = 'none';
        }
        function btnSaveTeacherInfo_Click() {
            var lCheckListScore = txtTeacherScore.value();
            var lModDate = txtTeacherDate.value;
        
            var lError = false;
            var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';
        
            if (lCheckListScore == "") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The input box must have something entered.<br />";
            }
        
            if (lModDate == "") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A date must be selected from calendar.<br />";
            }
        
            if (lError == true) {
                lMessage += '</font><br />Please correct the above issues and try again.';
                $("#divErrorMsg").empty();
                $('#divErrorMsg').append(lMessage);
                document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
                diaMessage.setSize(500, 240);
                diaMessage.setTitle('Data Problem');
                document.getElementById("btnDiaMessageYes").value = "OK";
                document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
                $("#btnDiaMessageNo").hide();
                diaMessage.Open();
            } else {
                lMessage = "You are about to change Teacher's Input.<br /><br /> Click Yes to continue.";
                $("#divErrorMsg").empty();
                $('#divErrorMsg').append(lMessage);
                document.getElementById("divErrorMsg").setAttribute("style", "Height:50px;Width:295px;");
                diaMessage.setSize(300, 150);
                diaMessage.setTitle('Save Teacher Data');
                document.getElementById("btnDiaMessageYes").value = "OK";
                document.getElementById("btnDiaMessageNo").setAttribute("onClick", "diaMessage.Close();");
                document.getElementById("btnDiaMessageYes").setAttribute("onClick", "document.getElementById('<%=btnServerSaveTeacherInfo.ClientID%>').click();");
                document.getElementById("btnDiaMessageNo").value = "cancel";
                $("#btnDiaMessageNo").show();
                diaMessage.Open();
            }
        }
        
        function btnCancelStudentInfo_Click() {
            document.getElementById('divAddNewStudentInfo').style.display = 'none';
            document.getElementById('btnSaveStudentInfo').style.display = 'none';
            document.getElementById('btnCancelStudentInfo').style.display = 'none';
            document.getElementById('<%=btnAddStudentInfo.ClientID%>').style.display = 'inline';
        }
        // AddStudentInfo_Click()
        function AddStudentInfo_Click() {
            document.getElementById('divAddNewStudentInfo').style.display = 'block';
            document.getElementById('btnSaveStudentInfo').style.display = 'inline';
            document.getElementById('btnCancelStudentInfo').style.display = 'inline';
            document.getElementById('<%=btnAddStudentInfo.ClientID%>').style.display = 'none';
        }
        function btnSaveStudentInfo_Click() {
            var lCheckListScore = txtStudentInput.value();
            var lModDate = txtStudentDate.value;
            var lError = false;
            var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';
        
            if (lCheckListScore == "") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The input box must have something entered.<br />";
            }
        
            if (lModDate == "") {
                lError = true;
                lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A date must be selected from calendar.<br />";
            }
        
            if (lError == true) {
                lMessage += '</font><br />Please correct the above issues and try again.';
                $("#divErrorMsg").empty();
                $('#divErrorMsg').append(lMessage);
                document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
                diaMessage.setSize(500, 240);
                diaMessage.setTitle('Data Problem');
                document.getElementById("btnDiaMessageYes").value = "Ok";
                document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
                $("#btnDiaMessageNo").hide();
                diaMessage.Open();
            } else {
                lMessage = "You are about to save Student Input.<br /><br /> Click Ok to continue.";
                $("#divErrorMsg").empty();
                $('#divErrorMsg').append(lMessage);
                document.getElementById("divErrorMsg").setAttribute("style", "Height:50px;Width:295px;");
                diaMessage.setSize(300, 150);
                diaMessage.setTitle('Save Data');
                document.getElementById("btnDiaMessageYes").value = "Ok";
                document.getElementById("btnDiaMessageNo").setAttribute("onClick", "diaMessage.Close();");
                document.getElementById("btnDiaMessageYes").setAttribute("onClick", "document.getElementById('<%=btnServerSaveStudentInfo.ClientID%>').click();");
                document.getElementById("btnDiaMessageNo").value = "cancel";
                $("#btnDiaMessageNo").show();
                diaMessage.Open();
            }
        }
        
        function OpenSaveSuccessful() {
            txtAchTestDate.value = '';
            lMessage += 'The test results were saves successfully';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:50px;Width:295px;");
            diaMessage.setSize(300, 150);
            diaMessage.setTitle('Data Saved');
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").hide();
            diaMessage.Open();
        }
        function OpenSaveTeacherSuccessful() {
            txtTeacherDate.value = '';
            lMessage = 'The Teacher Input results were saves successfully';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:50px;Width:295px;");
            diaMessage.setSize(300, 150);
            diaMessage.setTitle('Data Saved');
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").hide();
            diaMessage.Open();
        }
        function OpenStudentSaveSuccessful() {
            lMessage = 'The test results were saves successfully';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("divErrorMsg").setAttribute("style", "Height:50px;Width:295px;");
            diaMessage.setSize(300, 150);
            diaMessage.setTitle('Data Saved');
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").hide();
            diaMessage.Open();
        }
        function OpenSaveSuccessful() {
            txtAchTestDate.value = '';
            lMessage += 'The test results were saves successfully';
            $("#divErrorMsg").empty();
            $('#divErrorMsg').append(lMessage);
            document.getElementById("btnDiaMessageYes").value = "OK";
            document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
            $("#btnDiaMessageNo").hide();
            diaMessage.Open();
        }
    </script>

        