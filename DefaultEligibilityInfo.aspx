<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/SingleColumn.master" AutoEventWireup="true" CodeFile="DefaultEligibilityInfo.aspx.cs" Inherits="DefaultEligibilityInfo" %>
<%@ Register TagPrefix="gcs" TagName="tnDefaultEligibilityInfo" Src="~/controls/ctrlDefaultEligibilityInfo.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <gcs:tnDefaultEligibilityInfo ID="cphDefaultEligibilityInfo" runat="server" />
</asp:Content>

