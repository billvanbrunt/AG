<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Nav.ascx.cs" Inherits="masterPages_controls_Nav" %>

<table style="width:740px;">
    <tr>
        <td style="width:90%;">
            <input type="button" id="btnAdmin" runat="server" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" onserverclick= "btnAdmin_Click" value="Admin" />
            <input type="button" id="btnReturnToMain" runat="server" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" onserverclick= "btnReturnToMain_Click" value="Home" />
            <input type="button" id="btnReports" runat="server" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" onserverclick= "btnReports_Click" value="Reports" />
            <input type="button" id="btnAppData" runat="server" style="font-size:x-small;width:150px;border-radius:5px; font-weight: bold;" onserverclick= "btnAppData_Click" value="Application Data" />
        
        </td>
        <td style="width:10%;text-align:right;">
            <input type="button" ID="btnLogout" runat="server" style="border: 0px none transparent; text-align:right; background-color: transparent;font-size:x-small;font-weight: bold; color: #C0C0C0;" value="logout" onserverclick="btnLogout_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center>
                <hr style="height:10px;background-color: #295b8b;border-radius:5px;" />
             </center>
        </td>
    </tr>
</table>