<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/reportMaster.master" AutoEventWireup="true" CodeFile="DefaultStudentEligibilityRecord.aspx.cs" Inherits="DefaultStudentEligibilityRecord" %>
<%@ Register TagPrefix="gcs" TagName="tnSER" Src="~/controls/ctrlDefaultStudentEligibilityRecord.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <gcs:tnSER id="cphStudentEligibilityRecord" runat="server"></gcs:tnSER>
</asp:Content>

