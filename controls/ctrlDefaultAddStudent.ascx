<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlDefaultAddStudent.ascx.cs" Inherits="controls_ctrlDefaultAddStudent" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>


<div id="divButtons">
    <input type="button" id="btnEligibilityInfo" runat="server" style="font-size:x-small;width:125px;border-radius:5px;" onserverclick="EligibilityInfo_Click" value="Eligibility Info"  />
    <input type="button" id="btnTest" runat="server" style="font-size:x-small;width:125px;border-radius:5px;" onserverclick="btnTest_Click" value="Data Evidence"  />
    <input type="button" id="btnNewSearch" runat="server" style="font-size:x-small;width:125px;border-radius:5px;" onserverclick="ShowSearchWindowAgain_Click" value="New Search"  />

</div>
<br />
<div id="DIvDefaultStudentMain" >
    <fieldset style="width: 730px; height: 70px; font-size: small;">
        <legend style="font-size: small; font-weight: bolder; color: #295B8B">Student Profile</legend>
        <table style="width: 550px;">
            <tr>
                <td colspan="2" style="font-weight: bold;">
                    <asp:Label ID="txtFullName" runat="server" Font-Size="large" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small; width: 70px; font-weight: bold;">Student ID:
                </td>
                <td style="text-align: left;">
                    <asp:Label ID="txtStudentId" runat="server" Style="font-size: small;" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small; width: 70px; font-weight: bold;">School: 
                </td>
                <td style="text-align: left">
                    <asp:Label ID="txtSchoolName" runat="server" Style="font-size: small;" />
                </td>
            </tr>
        </table>
    </fieldset>
</div>
<br />
<div id="divStudentDems">
    <fieldset style="width:730px; height:175px; font-size:small; color: #295B8B; font-weight: bold;">
        <legend style="font-size: small; font-weight: bolder; color: #295B8B">Student Demographics</legend>
        <table style="width: 725px; color: #000000;" border="0" >
            <tr>
                <td style="text-align: right; font-size: small;font-weight: bold;width:100px;">
                    Date of Birth:
                </td>
                <td style="text-align: left">
                    <asp:Label ID="txtDOB" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
                <td style="text-align: right; font-size: small;font-weight: bold;width:75px;">
                    Ethnicity:
                </td>
                <td style="text-align: left">
                    <asp:Label ID="txtEthnicity" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
                <td style="text-align: right; font-size: small;font-weight: bold;bold;width:100px;">
                    Gender:
                </td>
                <td style="text-align: left">
                    <asp:Label ID="txtGender" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
                <td style="text-align: right; font-size: small;font-weight: bold;bold;width:100px;">
                    Grade:
                </td>
                <td style="text-align: left">
                    <asp:Label ID="txtGrade" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    Street Address:
                </td>
                <td style="text-align: left" colspan="3">
                    <asp:Label ID="txtAddress" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    Appartment No.:
                </td>
                <td style="text-align: left">
                    <asp:Label ID="txtAppartmentNo" runat="server" Style="font-size: small;"></asp:Label>
                </td>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    P.O. Box:
                </td>
                <td style="text-align: left">
                    <asp:Label ID="txtPOBox" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    City:
                </td>
                <td style="text-align: left">
                    <asp:Label ID="txtCity" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    State:
                </td>
                <td style="text-align: left">
                    <asp:Label ID="txtState" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    Zip Code:
                </td>
                <td style="text-align: left" colspan="3">
                    <asp:Label ID="txtZipCode" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    Home Phone:
                </td>
                <td style="text-align: left" colspan="3">
                    <asp:Label ID="txtHomePhone" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    Lives With:
                </td>
                <td style="text-align: left" colspan="3">
                    <asp:Label ID="txtLivesWith" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    Mother's Name:
                </td>
                <td style="text-align: left" colspan="3">
                    <asp:Label ID="txtMothersName" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    Father's Name:
                </td>
                <td style="text-align: left" colspan="3">
                    <asp:Label ID="txtFathersName" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    Mother's Phone:
                </td>
                <td style="text-align: left" colspan="3">
                    <asp:Label ID="txtMothersPhone" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    Father's Phone:
                </td>
                <td style="text-align: left" colspan="3">
                    <asp:Label ID="txtFathersPhone" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    EC Status:
                </td>
                <td style="text-align: left" colspan="7">
                    <asp:Label ID="txtECStatus" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
            </tr>
        </table>


    </fieldset>
</div>

