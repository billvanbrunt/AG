<%@ Page  Language="C#" MasterPageFile="~/MasterPages/login.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>



<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <center>
        <div style="padding: 5px; background-color: #ffffff;">
            <strong>Login</strong><hr />
            <table class="ContentSection" cellpadding="2">
                <tr>
                    <td style="width: 100px;">User ID:</td>
                    <td><obout:OboutTextBox ID="txtLoginUserID" runat="server" TabIndex="1" /></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><obout:OboutTextBox ID="txtLoginPassword" runat="server" TextMode="Password" TabIndex="2" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <obout:OboutButton ID="btnSubmit" runat="server" Text="Login" OnClick="btnSubmit_Click" /></td>
                </tr>
            </table>

            <asp:label id="lblError" runat="server"   style="display:none;"></asp:label>
        </div>
    </center>
 </asp:Content>
    
