$(document).ready(function(){
       
    grdActiveData.ShowFooter = false;
    grdActiveData.FooterRow.Visible = false;
    btnADDachtEST.Attributes.Add("style", "display:none");
    btnADDAptitude.Attributes.Add("style", "display:none");
});
function ADDachtEST_Click()
{
    document.getElementById('divAddNewAchievmentTest').style.display = 'block';
    document.getElementById('btnSaveAchevment').style.display = 'inline';
    document.getElementById('btnCancelAchevment').style.display = 'inline';
    document.getElementById('btnADDachtEST').style.display = 'none';
}
function btnSaveAchevment_Click() {
    var lTestName = ddlTestName.value();
    var lTestDate =  txtAchTestDate.value;
    var lSubject = ddlSubject.value();
    var lScore = txtAchScore.value;
    var lScaleScore = txtAchScaleScore.value;
    var lUseForEligibility = ddlUseForEligibility.value();
    var lError = false;
    var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';

    if (lTestName == "Test Name....") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Test Name must be selected from the list.<br />";
    }
    if (lTestDate == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Test date must be selected from calendar.<br />";
              
    }
    if (lSubject == "Subject....") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Subject for tis test must be selected from the list.<br />";
    }
    if (lScore == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Test score must be entered.<br />";
    }
    if (lUseForEligibility == "-1") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select whether this test is being used for eligibility purposes.<br />";
    }
    if (lError == true) {
        lMessage += '</font><br />Please correct the above issues and try again.';
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        document.getElementById("btnDiaMessageYes").value = "OK";
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
        $("#btnDiaMessageNo").hide();
        diaMessage.Open();
    }
    else {
        document.getElementById("<%=btnServerSaveAchevment.ClientID%>").click();
    }
}
function btnCancelAchevment_Click() {
    document.getElementById('divAddNewAchievmentTest').style.display = 'none';
    document.getElementById('btnSaveAchevment').style.display = 'none';
    document.getElementById('btnCancelAchevment').style.display = 'none';
    document.getElementById('btnADDachtEST').style.display = 'inline';
}
function ADDAptitude_Click() {
    document.getElementById('divAddNewAchievementTest').style.display = 'block';
    document.getElementById('btnSaveAptitude').style.display = 'inline';
    document.getElementById('btnCancelAptitude').style.display = 'inline';
    document.getElementById('btnADDAptitude').style.display = 'none';
}
function btnSaveAptitude_Click(){
    var lTestName = ddlAppTestName.value();
    var lTestDate =  txtAppTestDate.value;
    var lScore = txtAppScore.value();
    var lError = false;
    var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';

    if (lTestName == "Test Name....") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Test Name must be selected from the list.<br />";
    }
    if (lTestDate == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Test date must be selected from calendar.<br />";
              
    }
    if (lScore == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Test score must be entered.<br />";
    }
    if (lError == true) {
        lMessage += '</font><br />Please correct the above issues and try again.';
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        document.getElementById("btnDiaMessageYes").value = "OK";
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
        $("#btnDiaMessageNo").hide();
        diaMessage.Open();
                  
    }
    else {
        document.getElementById("<%=btnServerSaveAptitude.ClientID%>").click();
    }
}
function btnCancelAptitude_Click() {
    document.getElementById('divAddNewAchievementTest').style.display = 'none';
    document.getElementById('btnSaveAptitude').style.display = 'none';
    document.getElementById('btnCancelAptitude').style.display = 'none';
    document.getElementById('btnADDAptitude').style.display = 'inline';
}
function ADDTeacherInfo_Click() {
    alert('Im here');
    document.getElementById('divAddNewTeacherInfo').style.display = 'block';
    document.getElementById('btnSaveTeacherInfo').style.display = 'inline';
    document.getElementById('btnCancelTeacherInfo').style.display = 'inline';
    document.getElementById('btnAddTeacherInfo').style.display = 'none';
}   
function btnSaveTeacherInfo_Click()
{
    var lModDate = txtTeacherTestDate.value;
    var lCheckListScore = txtTeacherScore.value;
    var lError = false;
    var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';

    if (lCheckListScore == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The input box must have something entered.<br />";
    }

    if (lModDate == "")
    {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A date must be selected from calendar.<br />";
    }

    if (lError == true) 
    {
        lMessage += '</font><br />Please correct the above issues and try again.';
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        document.getElementById("btnDiaMessageYes").value = "OK";
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
        $("#btnDiaMessageNo").hide();
        diaMessage.Open();
    }
    else 
    {
        lMessage = "You are about to change Teacher's Input.<br /> Click Yes to continue.";
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        document.getElementById("btnDiaMessageYes").value = "OK";
        document.getElementById("btnDiaMessageNo").setAttribute("onClick", "diaMessage.Close();");
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", " document.getElementById('<%= btnServerSaveTeacherInfo.ClientID %>').click();");
        document.getElementById("btnDiaMessageNo").value = "cancel";
        $("#btnDiaMessageNo").show();
        diaMessage.Open();
        //document.getElementById("<%=btnServerSaveTeacherInfo.ClientID%>").click();
        }

}
function btnCancelTeacherInfo_Click() {
    document.getElementById('divAddNewTeacherInfo').style.display = 'none';
    document.getElementById('btnSaveTeacherInfo').style.display = 'none';
    document.getElementById('btnCancelTeacherInfo').style.display = 'none';
    document.getElementById('btnAddTeacherInfo').style.display = 'inline';
}
function AddStudentInfo_Click() {
    document.getElementById('divAddNewStudentInfo').style.display = 'block';
    document.getElementById('btnSaveStudentInfo').style.display = 'inline';
    document.getElementById('btnCancelStudentInfo').style.display = 'inline';
    document.getElementById('btnAddStudentInfo').style.display = 'none';
}
function btnSaveStudentInfo_Click() {
    document.getElementById('divAddNewStudentInfo').style.display = 'none';
    document.getElementById('btnSaveStudentInfo').style.display = 'none';
    document.getElementById('btnCancelStudentInfo').style.display = 'none';
    document.getElementById('btnAddStudentInfo').style.display = 'inline';
}
function btnCancelStudentInfo_Click() {
    document.getElementById('divAddNewStudentInfo').style.display = 'none';
    document.getElementById('btnSaveStudentInfo').style.display = 'none';
    document.getElementById('btnCancelStudentInfo').style.display = 'none';
    document.getElementById('btnAddStudentInfo').style.display = 'inline';
}
function OpenSaveSuccessful() {
    txtAchTestDate.value = '';
    lMessage += 'The test results were saves successfully';
    $("#divErrorMsg").empty();
    $('#divErrorMsg').append(lMessage);
    document.getElementById("btnDiaMessageYes").value = "OK";
    document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
    $("#btnDiaMessageNo").hide();
    diaMessage.Open();
}
function OpenSaveAPTSuccessful(){
    txtAptTestDate.value = '';
    lMessage += 'The test results were saves successfully';
    $("#divErrorMsg").empty();
    $('#divErrorMsg').append(lMessage);
    document.getElementById("btnDiaMessageYes").value = "OK";
    document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
    $("#btnDiaMessageNo").hide();
    diaMessage.Open();
}
