<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlDefaultAddTestInformation.ascx.cs" Inherits="controls_ctrlDefaultAddTestInformation" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Register Assembly="obout_Calendar2_Net" Namespace="OboutInc.Calendar2" TagPrefix="obout" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>

<div id="divButtons">
    
    <input type="button" id="btnEligibilityInfo" runat="server" style="font-size:x-small;width:125px;border-radius:5px;" onserverclick="EligibilityInfo_Click" value="Eligibility Info"  />
     <input type="button" id="btnStudentInfo" runat="server" style="font-size:x-small;width:125px;border-radius:5px;" onserverclick="btnStudentInfo_Click" value="Student Info"  /> 
    <input type="button" id="btnStudentEligibilityRecord" runat="server" style="font-size:x-small;width:125px;border-radius:5px;" onserverclick="btnStudentEligibilityRecord_Click" value="Student Eligibility Record"  />        
    <input type="button" id="btnNewSearch" runat="server" style="font-size:x-small;width:125px;border-radius:5px;"       onserverclick="ShowSearchWindowAgain_Click" value="New Search"  />
</div>
<br />
<div id="DIvDefaultStudentMain" >
    <fieldset style="width:710px;height:80px;font-size:small;">
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
    <div id="divSearchResultsActive" style="display:block;" >
        <obout:Grid ID="grdActiveData" runat="server"
            AutoGenerateColumns="false"
            AllowAddingRecords="true"
            ShowFooter="true"
            PageSize="20"
            AllowManualPaging="false"
            AllowRecordSelection="true"
            EnableRecordHover="true"
            Serialize="true"
            CallbackMode="true"
            AutoPostBackOnSelect="true"
            KeepSelectedRecords="true">
            <Columns>
                <obout:Column DataField="TestName" HeaderText="TestName" Width="240" runat="server">
                    <TemplateSettings HeaderTemplateId="tempTestName" EditTemplateId="tmpTestName" />
                </obout:Column>
                <obout:Column DataField="Description" HeaderText="TestDesc" Width="240" runat="server">
                    <TemplateSettings HeaderTemplateId="tempDescName" EditTemplateId="tmpTestName" />
                </obout:Column>
                <obout:Column DataField="TestDate" HeaderText="TestDate" Width="210" runat="server">
                    <TemplateSettings HeaderTemplateId="tempTestDate" EditTemplateId="tmpTestDate" />
                </obout:Column>
                <obout:Column DataField="Subject" HeaderText="Subject" Width="135" runat="server">
                    <TemplateSettings HeaderTemplateId="tempReading" />
                </obout:Column>
                <obout:Column DataField="Score" HeaderText="Score" Width="75" runat="server">
                    <TemplateSettings HeaderTemplateId="tempMath" />
                </obout:Column>
                <obout:Column DataField="ScaleScore" HeaderText="Score" Width="75" runat="server">
                    <TemplateSettings HeaderTemplateId="tempScale" />
                </obout:Column>
                <obout:Column DataField="TestId" Visible="false" runat="server"></obout:Column>
            </Columns>

            <TemplateSettings HeadingTemplateId="hdAchievment" />
            <Templates>
                <obout:GridTemplate runat="server" ID="hdAchievment">
                    <Template>Achievement Data</Template>
                </obout:GridTemplate>
            </Templates>
            <Templates>
                <obout:GridTemplate runat="server" ID="tempTestName">
                    <Template>
                        <%--[1]--%>
                        <font size="-2">
                                    Test Name
                                </font>
                    </Template>
                </obout:GridTemplate>
            </Templates>
            <Templates>
                <obout:GridTemplate runat="server" ID="tempDescription">
                    <Template>
                        <%--[2]--%>
                        <font size="-2">
                                    Description
                                </font>
                    </Template>
                </obout:GridTemplate>
            </Templates>
            <Templates>
                <obout:GridTemplate runat="server" ID="tempTestDate">
                    <Template>
                        <%--[3]--%>
                        <font size="-2">
                                    Test Date
                                </font>
                    </Template>
                </obout:GridTemplate>
            </Templates>
            <Templates>
                <obout:GridTemplate runat="server" ID="tempReading">
                    <Template>
                        <%--[4]--%>
                        <font size="-2">
                                    Subject
                                </font>
                    </Template>
                </obout:GridTemplate>
            </Templates>
            <Templates>
                <obout:GridTemplate runat="server" ID="tempMath">
                    <Template>
                        <%--[5]--%>
                        <font size="-2">
                                  Score
                                </font>
                    </Template>
                </obout:GridTemplate>
            </Templates>
            <Templates>
                <obout:GridTemplate runat="server" ID="tempScale">
                    <Template>
                        <%--[6]--%>
                        <font size="-2">
                                  Scale <br />Score
                                </font>
                    </Template>
                </obout:GridTemplate>
            </Templates>
            <Templates>
                <obout:GridTemplate runat="server" ID="tmpTestName" ControlID="ddlTestName" ControlPropertyName="value">
                   <Template>
                     <obout:OboutDropDownList id="ddlTestName" runat="server" 
                                                 DataSourceID="sdsAchTestTests" 
                                                 DataTextField="TestName" 
                                                 DataValueField="TestId"
                                                 width="200px"
                                                 MenuWidth="350"
                                                 AppendDataBoundItems="true"  
                     >
                            <asp:ListItem Text="Select a test ..."></asp:ListItem>
                     </obout:OboutDropDownList>
                   </Template>
                </obout:GridTemplate>
            </Templates>
            <Templates>
                <obout:GridTemplate runat="server" ID="tmpDescription" ControlID="TestName" ControlPropertyName="value">
                </obout:GridTemplate>
            </Templates>
            <Templates>

                <obout:GridTemplate runat="server" ID="tmpTestDate" ControlID="tmpTxtTestDate" ControlPropertyName="value">
                    <Template>
                        <obout:OboutTextBox ID="tmpTxtTestDate" runat="server"></obout:OboutTextBox>
                        <obout:Calendar runat="server"
                            TextBoxId="tmpTxtTestDate"
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

                    </Template>
                </obout:GridTemplate>
            </Templates>
        </obout:Grid>
        <obout:Grid ID="grdAptitudeData" runat="server"
                            AutoGenerateColumns="false"
                            AllowAddingRecords="true"
                            ShowFooter="true"
                            PageSize="20"
                            AllowManualPaging="false" 
                            AllowRecordSelection="true"
                            EnableRecordHover="true" 
                            Serialize="true"
                            CallbackMode="true"
                            AutoPostBackOnSelect="true"  
                            KeepSelectedRecords="true"  
                            >
                    <Columns>
                        <obout:Column DataField="TestName" HeaderText=""   Width="400" runat="server" >
                            <TemplateSettings HeaderTemplateId="tempAppTestName" EditTemplateId="tmpgtaPTTestName" />
                        </obout:Column>
                        <obout:Column DataField="TestDate"  HeaderText="" Width="205" runat="server" >
                            <TemplateSettings HeaderTemplateId="tempAppDate" EditTemplateId="tmpAptTestDate" />
                        </obout:Column>
                        <obout:Column DataField="Score" HeaderText="" Width="130" runat="server" >
                            <TemplateSettings HeaderTemplateId="tempAppScore" EditTemplateId="tmpAptScore" />
                        </obout:Column>
                    </Columns>
                    <TemplateSettings HeadingTemplateId="hdAptitude" />
                    <Templates>
                        <obout:GridTemplate runat="server" ID="hdAptitude">
                            <Template>Aptitude Data</Template>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tempAppTestName">
                            <Template><%--[1]--%>
                                <font size="-2">
                                    Test Name
                                </font>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tempAppDate">
                            <Template><%--[2]--%>
                                <font size="-2">
                                    Test Date
                                </font>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tempAppScore">
                            <Template><%--[3]--%>
                                <font size="-2">
                                    Overall<br />Percentile
                                </font>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tmpgtaPTTestName" ControlID="ddlgtaPTTestName" ControlPropertyName="value">
                            <obout:OboutDropDownList id="ddlgtaPTTestName" runat="server" 
                                                        DataSourceID="sdsAppTests"  
                                                        DataTextField="TestName" 
                                                        DataValueField="TestId"  
                                                        width="330px" 
                                                        MenuWidth="375"
                                                        AppendDataBoundItems="true"  >
                                <asp:ListItem>Select a test ...</asp:ListItem>
                            </obout:OboutDropDownList>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tmpAptTestDate" ControlID="TxtAPTTestDate" ControlPropertyName="value">
                            <Template>
                                 <obout:OboutTextBox id="TxtAPTTestDate" runat="server"></obout:OboutTextBox>
                                 <obout:Calendar runat="server" 
                                        TextBoxId="tmpAptTxtTestDate" 
                                        StyleFolder = "~\Obout_styles\calendar\default" 
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
                             </Template>
                         </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tmpAptScore" ControlID="txtAptScore" ControlPropertyName="value">
                            <Template>
                                <obout:OboutTextBox id="txtAptScore" runat="server" Width="75px"></obout:OboutTextBox>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                </obout:Grid>
        <obout:Grid ID="grdTeacherInput" runat="server"
                            AutoGenerateColumns="false"
                            AllowAddingRecords="true"
                            ShowFooter="true"
                            PageSize="20"
                            AllowManualPaging="false" 
                            AllowRecordSelection="true"
                            EnableRecordHover="true" 
                            Serialize="true"
                            CallbackMode="true"
                           
                            AutoPostBackOnSelect="true"  
                            KeepSelectedRecords="true"  
                            >
                    <Columns>
                        <obout:Column DataField="Score" HeaderText="Score"   Width="100" runat="server" >
                            <TemplateSettings HeaderTemplateId="tempTeacherScore" EditTemplateId="tmpTIScore"/>
                        </obout:Column>
                        <obout:Column DataField="TestDate"  HeaderText="Date" Width="635" runat="server" >
                            <TemplateSettings HeaderTemplateId="tempTeacherDate" EditTemplateId="tmpTIDate" />
                        </obout:Column>
                      
                    </Columns>
                    <TemplateSettings HeadingTemplateId="hdTeacherInput" />
                    <Templates>
                        <obout:GridTemplate runat="server" ID="hdTeacherInput">
                            <Template>Teacher Input</Template>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tempTeacherScore">
                            <Template><%--[1]--%>
                                <font size="-2">
                                    Score
                                </font>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tempTeacherDate">
                            <Template><%--[2]--%>
                                <font size="-2">
                                    Date
                                </font>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="tmpTIDate" ControlID="txtTItDate" ControlPropertyName="value">
                            <Template>
                                 <obout:OboutTextBox id="txtTIDate" runat="server"></obout:OboutTextBox>
                                 <obout:Calendar runat="server" 
                                        TextBoxId="txtTIDate" 
                                        StyleFolder = "~\Obout_styles\calendar\default" 
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
                             </Template>
                         </obout:GridTemplate>
                    </Templates>
                     <Templates>
                        <obout:GridTemplate runat="server" ID="tmpTIScore" ControlID="txtTIScore" ControlPropertyName="value">
                            <Template>
                                <obout:OboutTextBox id="txtTIScore" runat="server" Width="75px"></obout:OboutTextBox>
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
        </obout:Grid>
        <obout:Grid ID="grdStudent" runat="server"
            AutoGenerateColumns="false"
            AllowAddingRecords="true"
            ShowFooter="true"
            PageSize="20"
            AllowManualPaging="false"
            AllowRecordSelection="true"
            EnableRecordHover="true"
            Serialize="true"
            CallbackMode="true"
            AutoPostBackOnSelect="true"
            KeepSelectedRecords="true">
            <Columns>
                <obout:Column DataField="Score" HeaderText="Score" Width="100" runat="server">
                    <TemplateSettings HeaderTemplateId="tempStudentScore" EditTemplateId="tmpStudentScore" />
                </obout:Column>
                <obout:Column DataField="TestDate" HeaderText="Date" Width="635" runat="server">
                    <TemplateSettings HeaderTemplateId="tempStudentDate" EditTemplateId ="tmpStudentDate"/>
                </obout:Column>

            </Columns>
            <TemplateSettings HeadingTemplateId="hdStudentInput" />
            <Templates>
                <obout:GridTemplate runat="server" ID="hdStudentInput">
                    <Template>Student Input</Template>
                </obout:GridTemplate>
            </Templates>
            <Templates>
                <obout:GridTemplate runat="server" ID="tempStudentScore">
                    <Template>
                        <%--[1]--%>
                        <font size="-2">
                                    Score
                                </font>
                    </Template>
                </obout:GridTemplate>
            </Templates>
            <Templates>
                <obout:GridTemplate runat="server" ID="tempStudentDate">
                    <Template>
                        <%--[2]--%>
                        <font size="-2">
                                    Date
                                </font>
                    </Template>
                </obout:GridTemplate>
            </Templates>
             <Templates>
                <obout:GridTemplate runat="server" ID="tmpStudentDate" ControlID="txtStudenttDate" ControlPropertyName="value">
                    <Template>
                            <obout:OboutTextBox id="txtStudenttDate" runat="server"></obout:OboutTextBox>
                            <obout:Calendar runat="server" 
                                TextBoxId="txtStudentDate" 
                                StyleFolder = "~\Obout_styles\calendar\default" 
                                Columns="1"
                                DatePickerMode="true" 
                                ShowYearSelector="false"
                                DatePickerImagePath="~\images\icon2.gif" 
                                ShowHourSelector="False" 
                                ShowMinuteSelector="False" 
                                ShowOtherMonthDays="False" 
                                TitleText=" "
                                >
                            </obout:Calendar>
                        </Template>
                    </obout:GridTemplate>
            </Templates>
            <Templates>
                <obout:GridTemplate runat="server" ID="tmpStudentScore" ControlID="txtStudentScore" ControlPropertyName="value">
                    <Template>
                        <obout:OboutTextBox id="txtStudentScore" runat="server" Width="75px"></obout:OboutTextBox>
                    </Template>
                </obout:GridTemplate>
            </Templates>
        </obout:Grid>
         <asp:SqlDataSource runat="server" ID="sdsAchTestTests"  SelectCommand="usp_GetAchevementTests"
                                   ConnectionString="<%$ ConnectionStrings:con%>" SelectCommandType="StoredProcedure"
                                   ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
         <asp:SqlDataSource runat="server" ID="sdsAppTests"  SelectCommand="usp_GetAptitudeTests"
                                   ConnectionString="<%$ ConnectionStrings:con%>" SelectCommandType="StoredProcedure"
                                   ProviderName="System.Data.SqlClient"></asp:SqlDataSource>                         

    </div>
</div>