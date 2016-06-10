<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/SingleColumn.master" AutoEventWireup="true" CodeFile="DefaultAdmin.aspx.cs" Inherits="DefaultAdmin" %>
<%@ Register TagPrefix="gcs" TagName="tnCrtrlDefaultAdmin" Src="~/controls/ctrlDefaultAdmin.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <gcs:tnCrtrlDefaultAdmin ID="cphCtrlDefaultAdmin" runat="server" />
</asp:Content>


