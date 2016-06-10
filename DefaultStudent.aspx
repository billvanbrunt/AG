<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/SingleColumn.master" AutoEventWireup="true" CodeFile="DefaultStudent.aspx.cs" Inherits="DefaultStudent" %>
<%@ Register TagPrefix="gcs" TagName="tgCtrlDefaultStudent" Src="~/controls/ctrlDefaultStudent.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <gcs:tgCtrlDefaultStudent ID="cphCtrlDefaultStudent" runat="server" />
</asp:Content>

