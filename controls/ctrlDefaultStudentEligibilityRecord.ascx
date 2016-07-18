<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlDefaultStudentEligibilityRecord.ascx.cs" Inherits="controls_DefaultStudentEligibilityRecord" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>

<div id="main" width="700px">
    <div id="Demographics"  style="width:700px;">
        <%-- <center><font size="larger"><b>Academically Gifted Student Eligibility Record</b> </font></center>--%>
        <table style="width:700px;padding:0px;">
            <tr>
                <td colspan="6" style="font-size: large; font-weight: bold;text-align:center;padding:0px;" >
                    Academically Gifted Student Eligibility Record
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: bold;text-align:left;vertical-align:top;Font-Size:small;">
                    Student:

                    <asp:Label ID="txtFullName" runat="server" Font-Size="small" />
                    <br />
                    <Label style="text-align: right; font-size: small; width: 70px; font-weight: bold;">Student ID:</Label>
                    <asp:Label ID="txtStudentId" runat="server" Style="font-size: small;font-weight:100;" />
                    <br />
                    <label style="text-align: right; font-size: small;font-weight: bold;" >Street Address:</label>
                    <asp:Label ID="txtAddress" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                    <br />
                    <label style="text-align: right; font-size: small;font-weight: bold;" >Appartment No.:</label>
                    <asp:Label ID="txtAppartmentNo" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                    <br />
                    <label style="text-align: right; font-size: small;font-weight: bold;" >P.O. Box:</label>
                    <asp:Label ID="txtPOBox" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                    <br />
                    <label style="text-align: right; font-size: small;font-weight: bold;">City/State/Zip:</label>
                    <asp:Label ID="txtCityStateZip" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
                <td style="vertical-align:top;">
                    <label style="text-align: right; font-size: small;font-weight: bold;">School:</label>
                    <asp:Label ID="txtSchoolName" runat="server" Style="font-size: small;" />
                    <br />
                    <label style="text-align: right; font-size: small;font-weight: bold;">Ethnicity and Gender:</label>
                    <asp:Label ID="txtEthnicity" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                    <br />

                </td>
                <td style="vertical-align:top;">
                    <label style="text-align: right; font-size: small;font-weight: bold;">Grade:</label>
                    <asp:Label ID="txtGrade" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                    <br />
                    <label style="text-align: right; font-size: small;font-weight: bold;">DOB:</label>
                    <asp:Label ID="txtDOB" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                    <br />
                    <label style="text-align: right; font-size: small;font-weight: bold;">Phone:</label>
                    <asp:Label ID="txtHomePhone" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
            </tr>
        </table>
    </div>

    <div id="divTable">
        <table style="width: 700px; font-size: x-small;" border="1">
            <tr>
                <td style="width: 125px;">
                    <b>Evaluation</b>
                </td>
                <td style="width: 375px;">
                    <b>Name of Test</b>
                </td>
                <td>
                    <b>Date</b>
                </td>
                <td>
                    <b>Score</b>
                </td>
            </tr>
            <tr>
                <td style="width: 125px;">Achievment </td>
                <td style="width: 375px;">
                    <asp:Label ID="txtTestNameACH" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestDateACH" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestScoreACH" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 125px;">Math </td>
                <td style="width: 350px;">
                    <asp:Label ID="txtTestNameMath" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestDateMath" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestScoreMath" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Reading </td>
                <td>
                    <asp:Label ID="txtTestNameRead" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestDateRead" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestScoreRead" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Science </td>
                <td>
                    <asp:Label ID="txtTestNameSCI" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestDateSCI" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestScoreSCI" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Social Studies </td>
                <td>
                    <asp:Label ID="txtTestNameSS" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestDateSS" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestScoreSS" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Aptitude </td>
                <td>
                    <asp:Label ID="txtTestNameAPT" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestDateAPT" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestScoreAPT" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Proformance Task </td>
                <td>
                    <asp:Label ID="txtTestNamePT" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestDatePT" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtTestScorePT" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="font-weight: bold;">GRADES </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Math </td>
                <td>
                    <asp:Label ID="txtGradeMathName" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtGradeMathDate" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtGradeMathGrade" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reading </td>
                <td>
                    <asp:Label ID="txtGradeReadingName" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtGradeReadingDate" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtGradeReadingGrade" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Science </td>
                <td>
                    <asp:Label ID="txtGradeSCIName" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtGradeSCIDate" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtGradeSCIGrade" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Social Studies </td>
                <td>
                    <asp:Label ID="txtGradeSSName" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtGradeSSDate" runat="server" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtGradeSSGrade" runat="server" ></asp:Label>
                </td>
            </tr>
        </table>
    </div>

    <div id="divEligibility" style="text-align:left;width: 700px">

        <table  style="width: 700px;text-align:left;">

            <tr>
                <td colspan="5" style="font-weight:bold;">
                    Area of Eligibility
                </td>
            </tr>
            <tr>
                <td>
                    <obout:OboutCheckBox ID="cbIG" runat="server"
                                         Text=" Intellectually Gifted"
                                         TextAlign="Right">
                    </obout:OboutCheckBox>
                </td>
                <td>
                    <obout:OboutCheckBox ID="cbAGR" runat="server"
                                         Text=" AG In Reading"
                                         TextAlign="Right">
                    </obout:OboutCheckBox>
                </td>
                <td>
                    <obout:OboutCheckBox ID="cbAGM" runat="server"
                                         Text=" AG In Math "
                                         TextAlign="Right">
                    </obout:OboutCheckBox>
                </td>
                <td>
                    <obout:OboutCheckBox ID="cbAGRM" runat="server"
                                         Text=" AG In Reading & Math"
                                         TextAlign="Right">
                    </obout:OboutCheckBox>
                </td>
                <td>
                    <obout:OboutCheckBox ID="cbAGNE" runat="server"
                                         Text=" Not Eligible"
                                         TextAlign="Right">
                    </obout:OboutCheckBox>
                </td>
            </tr>
        </table>

    </div>
    <br />
    <div id="divServiceEligibilityOptions"  style="width: 700px;">
        <legend style="font-weight:bold;">Service Eligibility Options</legend>
        <obout:OboutCheckBox ID="cbSEOREGClass" runat="server"
                             Text="Differentiation in Regular Education Classroom"
                             TextAlign="Right">
        </obout:OboutCheckBox>
        <br />
        <obout:OboutCheckBox ID="cbSEOREGPO" runat="server"
                             Text="AIG Pull-Out Enrichment"
                             TextAlign="Right">
        </obout:OboutCheckBox>
        <br />
        <obout:OboutCheckBox ID="cbSEOREGAC" runat="server"
                             Text="Advanced Coursework"
                             TextAlign="Right">
        </obout:OboutCheckBox>
        <br />
        <obout:OboutCheckBox ID="cbSEOREGVS" runat="server"
                             Text="Very Strong (VS) at Academy @ Lincoln (full-time, self-contained)"
                             TextAlign="Right">
        </obout:OboutCheckBox>
    </div>
    <br />
    <div id="divSignatures" style="width: 700px;">
        <table style="width:700px;font-size:x-small;" >
            <tr>
                <td colspan="1" style="font-weight:bold;">
                    Signatures of Team Academically Gifted (TAG):
                </td>
            </tr>

            <tr>
                <td >
                    <br />
                    <br />
                    <hr />

                    &nbsp;&nbsp;Name
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp;
                    Chairperson
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    Date
                </td>
            </tr>
            <tr>
                <td >
                    <br />
                    <br />
                    <hr />
                    &nbsp;&nbsp;Name
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp;
                    Position
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp;
                    Date
                </td>
            </tr>
            <tr>
                <td >
                    <br />
                    <br />
                    <hr />
                    &nbsp;&nbsp;Name
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp;
                    Position
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp;
                    Date
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <hr style="width:400px;" align="left"/>

                    &nbsp;&nbsp; District Oversite Committee (DOC) concours:
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp;
                    ______ DOC Placement <br />
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    (No TAG Signatures needed)
                </td>
            </tr>
            <tr>
                <td >
                    <br />
                    <br />
                    <hr />
                    &nbsp;&nbsp;Name
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp;
                    AG Coordinator
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;

                    Date
                </td>
            </tr>
            <tr>
                <td >
                    <br />
                    <br />
                    <hr />
                    &nbsp;&nbsp;Name
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    AG Coordinator
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;

                    Date
                </td>
            </tr>
            <tr>
                <td  style="text-align-last:right;font-size:x-small;">
                    <br />
                    Parent Copy Sent _____/______/______
                </td>
            </tr>
        </table>
    </div>
</div>

