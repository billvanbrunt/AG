<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/SingleColumn.master" AutoEventWireup="true" CodeFile="DefaultAddEligibilityInfo.aspx.cs" Inherits="DefaultEligibilityInfo" %>
<%@ Register TagPrefix="gcs" TagName="tnDefaultAddEligibilityInfo" Src="~/controls/ctrlDefaultAddEligibilityInfo.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <gcs:tnDefaultAddEligibilityInfo ID="cphDefaultEligibilityInfo" runat="server" />
</asp:Content>

