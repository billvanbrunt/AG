//<script  type="text/javascript">
$(document).ready(function () {
    ADDachTest.Attributes.Add("style", "display:none");
    btnADDAptitude.Attributes.Add("style", "display:none");
});
function ADDAptitude_Click() {
    document.getElementById('divAddAptitudeTest').style.display = 'block';
    document.getElementById('btnSaveAptitude').style.display = 'inline';
    document.getElementById('btnCancelAptitude').style.display = 'inline';
    document.getElementById('<%=btnADDAptitude.ClientID%>').style.display = 'none';
}
function btnCancelAptitude_Click() {
    document.getElementById('divAddAptitudeTest').style.display = 'none';
    document.getElementById('btnSaveAptitude').style.display = 'none';
    document.getElementById('btnCancelAptitude').style.display = 'none';
    document.getElementById('<%=btnADDAptitude.ClientID%>').style.display = 'inline';
}
function btnSaveAptitude_Click() {
    var lTestName = ddlAppTestName.value();
    var lTestDate = txtAppTestDate.value;
    var lScore = txtAppScore.value();
    var lError = false;
    var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';

    if (lTestName == "Test Name....") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test name must be selected from the list.<br />";
    }
    if (lTestDate == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test date must be selected from calendar.<br />";
    }
    if (lScore == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test score must be entered.<br />";
    }
    if (lError == true) {
        lMessage += '</font><br />Please correct the above issues and try again.';
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
        document.getElementById("btnDiaMessageYes").value = "OK";
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
        $("#btnDiaMessageNo").hide();
        diaMessage.Open();
    } else {
        document.getElementById("<%=btnServerSaveAptitude.ClientID%>").click();
    }
}

function btnADDAdditionalAptitude_Click() {
    document.getElementById('divAdditionalAptitudeTest').style.display = 'block';
    document.getElementById('btnSaveAdditionalAptitude').style.display = 'inline';
    document.getElementById('btnCancelAdditionalAptitude').style.display = 'inline';
    document.getElementById('<%=btnADDAdditionalAptitude.ClientID%>').style.display = 'none';
}
function btnCancelAdditionalAptitude_Click() {
    document.getElementById('divAdditionalAptitudeTest').style.display = 'none';
    document.getElementById('btnSaveAdditionalAptitude').style.display = 'none';
    document.getElementById('btnCancelAdditionalAptitude').style.display = 'none';
    document.getElementById('<%=btnADDAdditionalAptitude.ClientID%>').style.display = 'inline';
}
function btnSaveAdditionalAptitude_Click() {
    var lTestName = ddlAdditionalAptTestName.value();
    var lTestDate = txtAdditionalAptTestDate.value;
    var lScore = txtAdditionalAptTestScore.value();

    var lError = false;
    var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';

    if (lTestName == "Test Name....") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test name must be selected from the list.<br />";
    }

    if (lTestDate == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test date must be selected from calendar.<br />";
    }
    if (lScore == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test score must be entered.<br />";
    }

    if (lError == true) {
        lMessage += '</font><br />Please correct the above issues and try again.';
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
        document.getElementById("btnDiaMessageYes").value = "OK";
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
        $("#btnDiaMessageNo").hide();
        diaMessage.Open();
    } else {
        document.getElementById("<%=btnServerSaveAdditionalAptitude.ClientID%>").click();
    }
}

function btnAddAcheivmentTest_Click() {
    document.getElementById('<%=btnAddAcheivmentTest.ClientID%>').style.display = 'none';
    document.getElementById('divAddAchievmentTest').style.display = 'block';
    document.getElementById('btnSaveAchevmentTest').style.display = 'inline';
    document.getElementById('btnCancelAchevment').style.display = 'inline';
}
function btnCancelAchevment_Click() {
    document.getElementById('divAddAchievmentTest').style.display = 'none';
    document.getElementById('btnSaveAchevmentTest').style.display = 'none';
    document.getElementById('btnCancelAchevment').style.display = 'none';
    document.getElementById('<%=btnAddAcheivmentTest.ClientID%>').style.display = 'inline';
}
function btnSaveAchevmentTest_Click() {
    var lTestName = ddlTestName.value();
    var lTestDate = txtAchTestDate.value;
    var lSubject = ddlSubject.value();
    var lScore = txtAchScore.value;
    var lScaleScore = txtAchScaleScore.value;
    var lUseForEligibility = ddlUseForEligibility.value();
    var lError = false;
    var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';

    if (lTestName == "Test Name....") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test name must be selected from the list.<br />";
    }

    if (lTestDate == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test date must be selected from calendar.<br />";
    }

    if (lSubject == "Subject....") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A subject for tis test must be selected from the list.<br />";
    }
    if (lScore == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test score must be entered.<br />";
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
    } else {
        document.getElementById("<%=btnServerSaveAchevment.ClientID%>").click();
    }
}

function btnCancelAdditionalAchievmentTest_Click() {
    document.getElementById('divAdditionalAchievmentTest').style.display = 'none';
    document.getElementById('btnSaveAdditionalAchievmentTest').style.display = 'none';
    document.getElementById('btnCancelAdditionalAchievmentTest').style.display = 'none';
    document.getElementById('<%=btnAddAdditionalAchievmentTest.ClientID%>').style.display = 'inline';
}
function btnAddAdditionalAchievmentTest_Click() {
    document.getElementById('divAdditionalAchievmentTest').style.display = 'block';
    document.getElementById('btnSaveAdditionalAchievmentTest').style.display = 'inline';
    document.getElementById('btnCancelAdditionalAchievmentTest').style.display = 'inline';
    document.getElementById('<%=btnAddAdditionalAchievmentTest.ClientID%>').style.display = 'none';
}
function btnSaveAdditionalAchievmentTest_Click() {
    //ToDo: Stopped Here

    var lTestName = ddlAdditionalAchievmentTestName.value();
    var lTestDate = txtAddAdditionalAchievementTestDate.value;
    var lSubject = ddlAddAdditionalAchievementTestSubject.value(); 
    var lScore = txtAddAdditionalAchievementTestScore.value;
    var lScaleScore = txtAddAdditionalAchievementTestScaleScore.value;
    var lUseForEligibility = ddlAddAdditionalAchievementUseForEligibility.value(); 
    var lError = false;
    var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';


    if (lTestName == "Test Name....") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test name must be selected from the list.<br />";
    }
    if (lTestDate == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test date must be selected from calendar.<br />";
    }
    if (lSubject == "Subject....") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A subject for tis test must be selected from the list.<br />";
    }
    if (lScore == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A test score must be entered.<br />";
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
    } else {
        alert('Im here 1 ' + lError);
        document.getElementById("<%=btnServerSaveAdditionalAchievmentTest.ClientID%>").click();
        alert('Im here 2 ' + lError);
    }
}

function btnCancelTeacherInfo_Click() {
    document.getElementById('divAddNewTeacherInfo').style.display = 'none';
    document.getElementById('btnSaveTeacherInfo').style.display = 'none';
    document.getElementById('btnCancelTeacherInfo').style.display = 'none';
    document.getElementById('btnAddTeacherInfo.ClientID%>').style.display = 'inline';
}
function ADDTeacherInfo_Click() {
    document.getElementById('divAddNewTeacherInfo').style.display = 'block';
    document.getElementById('btnSaveTeacherInfo').style.display = 'inline';
    document.getElementById('btnCancelTeacherInfo').style.display = 'inline';
    document.getElementById('<%=btnAddTeacherInfo.ClientID%>').style.display = 'none';
}
function btnSaveTeacherInfo_Click() {
    var lCheckListScore = txtTeacherScore.value();
    var lModDate = txtTeacherDate.value;

    var lError = false;
    var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';

    if (lCheckListScore == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The input box must have something entered.<br />";
    }

    if (lModDate == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A date must be selected from calendar.<br />";
    }

    if (lError == true) {
        lMessage += '</font><br />Please correct the above issues and try again.';
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
        diaMessage.setSize(500, 240);
        diaMessage.setTitle('Data Problem');
        document.getElementById("btnDiaMessageYes").value = "OK";
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
        $("#btnDiaMessageNo").hide();
        diaMessage.Open();
    } else {
        lMessage = "You are about to change Teacher's Input.<br /><br /> Click Yes to continue.";
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        document.getElementById("divErrorMsg").setAttribute("style", "Height:50px;Width:295px;");
        diaMessage.setSize(300, 150);
        diaMessage.setTitle('Save Teacher Data');
        document.getElementById("btnDiaMessageYes").value = "OK";
        document.getElementById("btnDiaMessageNo").setAttribute("onClick", "diaMessage.Close();");
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "document.getElementById('<%=btnServerSaveTeacherInfo.ClientID%>').click();");
        document.getElementById("btnDiaMessageNo").value = "cancel";
        $("#btnDiaMessageNo").show();
        diaMessage.Open();
    }
}

function btnCancelStudentInfo_Click() {
    document.getElementById('divAddNewStudentInfo').style.display = 'none';
    document.getElementById('btnSaveStudentInfo').style.display = 'none';
    document.getElementById('btnCancelStudentInfo').style.display = 'none';
    document.getElementById('btnAddStudentInfo').style.display = 'inline';
}
function AddStudentInfo_Click() {
    document.getElementById('divAddNewStudentInfo').style.display = 'block';
    document.getElementById('btnSaveStudentInfo').style.display = 'inline';
    document.getElementById('btnCancelStudentInfo').style.display = 'inline';
    document.getElementById('btnAddStudentInfo').style.display = 'none';
}
function btnSaveStudentInfo_Click() {
    var lCheckListScore = txtStudentInput.value();
    var lModDate = txtStudentDate.value;
    var lError = false;
    var lMessage = 'There is a problem with the data entered <br /><br /><font color="red">';

    if (lCheckListScore == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The input box must have something entered.<br />";
    }

    if (lModDate == "") {
        lError = true;
        lMessage += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A date must be selected from calendar.<br />";
    }

    if (lError == true) {
        lMessage += '</font><br />Please correct the above issues and try again.';
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        document.getElementById("divErrorMsg").setAttribute("style", "Height:135px;Width:485px;");
        diaMessage.setSize(500, 240);
        diaMessage.setTitle('Data Problem');
        document.getElementById("btnDiaMessageYes").value = "Ok";
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
        $("#btnDiaMessageNo").hide();
        diaMessage.Open();
    } else {
        lMessage = "You are about to save Student Input.<br /><br /> Click Ok to continue.";
        $("#divErrorMsg").empty();
        $('#divErrorMsg').append(lMessage);
        document.getElementById("divErrorMsg").setAttribute("style", "Height:50px;Width:295px;");
        diaMessage.setSize(300, 150);
        diaMessage.setTitle('Save Data');
        document.getElementById("btnDiaMessageYes").value = "Ok";
        document.getElementById("btnDiaMessageNo").setAttribute("onClick", "diaMessage.Close();");
        document.getElementById("btnDiaMessageYes").setAttribute("onClick", "document.getElementById('<%=btnServerSaveStudentInfo.ClientID%>').click();");
        document.getElementById("btnDiaMessageNo").value = "cancel";
        $("#btnDiaMessageNo").show();
        diaMessage.Open();
    }
}


function OpenSaveSuccessful() {
    txtAchTestDate.value = '';
    lMessage += 'The test results were saves successfully';
    $("#divErrorMsg").empty();
    $('#divErrorMsg').append(lMessage);
    document.getElementById("divErrorMsg").setAttribute("style", "Height:50px;Width:295px;");
    diaMessage.setSize(300, 150);
    diaMessage.setTitle('Data Saved');
    document.getElementById("btnDiaMessageYes").value = "OK";
    document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
    $("#btnDiaMessageNo").hide();
    diaMessage.Open();
}
function OpenSaveTeacherSuccessful() {
    txtTeacherDate.value = '';
    lMessage = 'The Teacher Input results were saves successfully';
    $("#divErrorMsg").empty();
    $('#divErrorMsg').append(lMessage);
    document.getElementById("divErrorMsg").setAttribute("style", "Height:50px;Width:295px;");
    diaMessage.setSize(300, 150);
    diaMessage.setTitle('Data Saved');
    document.getElementById("btnDiaMessageYes").value = "OK";
    document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
    $("#btnDiaMessageNo").hide();
    diaMessage.Open();
}
function OpenStudentSaveSuccessful() {
    lMessage = 'The test results were saves successfully';
    $("#divErrorMsg").empty();
    $('#divErrorMsg').append(lMessage);
    document.getElementById("divErrorMsg").setAttribute("style", "Height:50px;Width:295px;");
    diaMessage.setSize(300, 150);
    diaMessage.setTitle('Data Saved');
    document.getElementById("btnDiaMessageYes").value = "OK";
    document.getElementById("btnDiaMessageYes").setAttribute("onClick", "diaMessage.Close();");
    $("#btnDiaMessageNo").hide();
    diaMessage.Open();
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

//</script>