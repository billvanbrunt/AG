<%@ Page Language="C#" MasterPageFile="~/masterPages/SingleColumn.master" AutoEventWireup="true"  CodeFile="DefaultAddStudent.aspx.cs" Inherits="DefaultAddStudent" %>
<%@ Register TagPrefix="gcs" TagName="tgCtrlDefaultAddStudent" Src="~/controls/ctrlDefaultAddStudent.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <gcs:tgCtrlDefaultAddStudent ID="cphCtrlDefaultStudent" runat="server" />
</asp:Content>