<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/SingleColumn.master" AutoEventWireup="true" CodeFile="DefaultTestInformation.aspx.cs" Inherits="DefaultTestInformation" %>
<%@ Register TagPrefix="gcs" TagName="tnCtrlDefaultTestInformation" Src="~/controls/ctrlDefaultTestInformation.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <gcs:tnCtrlDefaultTestInformation id="cphDefaultTestInformation" runat="server" />
</asp:Content>

