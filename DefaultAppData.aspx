<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/SingleColumn.master" AutoEventWireup="true" CodeFile="DefaultAppData.aspx.cs" Inherits="DefaultAppData" %>
<%@ Register TagPrefix="gcs" TagName="tnCtrlDefaultAppData" Src="~/controls/ctrlDefaultAppData.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <gcs:tnCtrlDefaultAppData ID="cphCtrlDefaultppData" runat="server" />
</asp:Content>

