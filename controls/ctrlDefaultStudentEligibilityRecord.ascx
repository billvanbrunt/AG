<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrlDefaultStudentEligibilityRecord.ascx.cs" Inherits="controls_DefaultStudentEligibilityRecord" %>

<div id="main">
    <div id="Demographics" >
        <table style="width: 725px;">
          <tr>
              <td colspan="6" style="font-size: larger; font-weight: bold;text-align:center;">
                  Academically Gifted
              </td>
          </tr>
           <tr>
              <td colspan="6" style="font-size: x-large; font-weight: bold;text-align:center; ">
                  Student Eligibility Record
              </td>
          </tr>  
             <tr>
               <td style="font-weight: bold;text-align: right; Font-Size:small;"> Student: </td>
               <td style="font-weight: bold;">
                   <asp:Label ID="txtFullName" runat="server" Font-Size="small" />
               </td>
                <td style="text-align: right; font-size: small; width: 70px; font-weight: bold;">School: 
               </td>
               <td style="text-align: left">
                   <asp:Label ID="txtSchoolName" runat="server" Style="font-size: small;" />
               </td>
               <td style="text-align: right; font-size: small;font-weight: bold;bold;width:100px;">
                    Grade:
                </td>
                <td style="text-align: left">
                    <asp:Label ID="txtGrade" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td> 
           </tr>
           <tr>
               <td style="text-align: right; font-size: small; width: 70px; font-weight: bold;">Student ID:
               </td>
               <td style="text-align: left;">
                   <asp:Label ID="txtStudentId" runat="server" Style="font-size: small;" />
               </td>
               <td style="text-align: right; font-size: small;font-weight: bold;width:75px;">
                    Ethnicity/Gender:
                </td> 
               <td style="text-align: left">
                    <asp:Label ID="txtEthnicity" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
                <td style="text-align: right; font-size: small;font-weight: bold;width:100px;">
                    Date of Birth:
                </td>
                <td style="text-align: left">
                    <asp:Label ID="txtDOB" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
           </tr>
           <tr>
                <td style="text-align: right; font-size: small;font-weight: bold;" colspan="1">
                    Street Address:
                </td>
          
                <td style="text-align: left" colspan="5">
                    <asp:Label ID="txtAddress" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
           </tr>
           <tr>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    Appartment&nbsp;No.:
                </td>
           </tr>
            <tr>
                 <td style="text-align: left" colspan="5">
                    <asp:Label ID="txtAppartmentNo" runat="server" Style="font-size: small;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    P.O. Box:
                </td>
                <td style="text-align: left"colspan="5">
                    <asp:Label ID="txtPOBox" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
            </tr>
             <tr>
                <td style="text-align: right; font-size: small;font-weight: bold;">
                    City/State/Zip:
                </td>
                <td style="text-align: left">
                    <asp:Label ID="txtCityStateZip" runat="server" Style="font-size: small;font-weight:normal;"></asp:Label>
                </td>
            </tr>
          
       </table>
    </div>
    <div id="divTable" >
        The multiple indicators listed below are considered in eligibility for differentiated services.<br />
        <table width="740px" border="1">
            <tr style="height:55px;">
                <td >

                </td>
                <td>

                </td>
                <td>

                </td>
                <td colspan="2">

                </td>
            </tr>
            <tr style="height:65px;">
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td colspan="2" style="background-color: #007ACC">

                </td>
                
            </tr>
            <tr style="height:10px;width:20%;">
                <td>
                    Achievment
                </td>
                <td style="width:20%;">
                    Language Arts
                </td>
                <td style="width:20%;">
                    Math
                </td>
                <td style="background-color: #007ACC;width:20%;">
                    Science
                </td>
                <td style="background-color: #007ACC;width:20%;">
                    Social Studies
                </td>
            </tr>
             <tr style="height:65px;">
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td style="background-color: #007ACC">

                </td>
                <td style="background-color: #007ACC">

                </td>
            </tr>
            <tr style="height:25px;">
                <td>

                </td>
                <td style="background-color: #007ACC">

                </td>
                <td style="background-color: #007ACC">

                </td>
                <td style="background-color: #007ACC">

                </td>
                <td style="background-color: #007ACC">

                </td>
            </tr>
            <tr style="height:75px;">
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td style="background-color: #007ACC">

                </td>
                <td style="background-color: #007ACC">

                </td>
            </tr>
        </table>

    </div>
</div>