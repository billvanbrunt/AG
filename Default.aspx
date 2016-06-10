<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/SingleColumn.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register TagPrefix="gcs" TagName="tnCrtrlDefault" Src="~/controls/ctrlDefault.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <gcs:tnCrtrlDefault ID="cphCtrlDefault" runat="server" />
</asp:Content>

