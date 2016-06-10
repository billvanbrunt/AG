<%@ Page Title="" Language="C#" MasterPageFile="~/masterPages/login.master" AutoEventWireup="true" CodeFile="DefaultError.aspx.cs" Inherits="DefaultError" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
    <owd:Dialog ID="diaMessage" runat="server"
            title="Error Message"
            ShowCloseButton="true" 
            IsModal="true"
            StyleFolder="~/obout_styles/windia/grandgray"
            IsDraggable="true"   
            VisibleOnLoad="true"
            Width="600" 
            Height="200"
            IconPath="/images/warning.gif"
            Position="SCREEN_CENTER">
        <center>
            <div id="divErrorMsg"  style="background-color:Transparent;Border Style:None;Border Color:0px none Transparent;text-align:left;width:545px;"></div> 
                    <br /><br />
            <input type="button" id="btnDiaMessageYes" value="Ok" runat="server" onserverclick="GoToMainPage" style="font-size:x-small;width:100px;border-radius:5px;" />
         </center>
    </owd:Dialog>
  
    
    <script type="text/javascript">
        function OpenMsg()
        {
            var lMessage = "";
            
            lMessage += '<br/>There was a problem with your account, You do not have any school assignments.<br />Please contat your supervisor to get this problem solved.<br /><br /><center>   Click ok to continue.</center>';
            
            $("#divErrorMsg").empty();
            $("#divErrorMsg").append(lMessage);
         
          
         }

        function GoToMainPage() { return;}
    </script> 
</asp:Content>

