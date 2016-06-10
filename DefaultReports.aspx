<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/SingleColumn.master" AutoEventWireup="true" CodeFile="DefaultReports.aspx.cs" Inherits="DefaultReports" %>
<%@ Register TagPrefix="gcs" TagName="tnDefaultReports" Src="~/controls/ctrlDefaultReports.ascx" %>


 

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
      <gcs:tnDefaultReports id="cphDefaultReports" runat="server" />
</asp:Content>

