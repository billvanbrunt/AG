<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/SingleColumn.master" AutoEventWireup="true" CodeFile="DefaultAddTestingInformation.aspx.cs" Inherits="DefaultAddTestingInformation" %>
<%@ Register TagPrefix="gcs" TagName="tnDefaultAddTestInformation" Src="~/controls/ctrlDefaultAddTestInformation.ascx"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
<gcs:tnDefaultAddTestInformation id="cphDefaultAddTestInforamtion" runat="server" ></gcs:tnDefaultAddTestInformation>
</asp:Content>

