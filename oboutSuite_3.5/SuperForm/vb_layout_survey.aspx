<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_layout_survey.aspx.vb" Inherits="SuperForm_vb_layout_survey" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Multi-Step Survey </b></span>
    
    <br /><br />

    <asp:PlaceHolder runat="server" ID="SuperForm1Container" />
    
     <div class="tdText">
        <asp:Panel runat="server" ID="Panel1" Visible="false">
            The following data can be stored in the database or sent by e-mail:<br /><br />
            
            <b>1) Please describe your position with the company:</b><br />
            <asp:Literal ID="Question1Answer" runat="server" />

            <br /><br />

            <b>2) Please describe your position with the company:</b><br />
            <asp:Literal ID="Question2Answer" runat="server" />

            <br /><br />

            <b>3) Employees have a voice in major decisions regarding changes in the work environment:</b><br />
            <asp:Literal ID="Question3Answer" runat="server" />

            <br /><br />

            <b>4) I have received the in-house training I need to get my job done:</b><br />
            <asp:Literal ID="Question4Answer" runat="server" />
                    
            <br /><br />

            <b>5) The environment of the workplace is comfortable and safe:</b><br />
            <asp:Literal ID="Question5Answer" runat="server" />

            <br /><br />

            <b>6) Employees are treated fairly and equally:</b><br />
            <asp:Literal ID="Question6Answer" runat="server" />

            <br /><br />

            <b>7) Management listens to employees:</b><br />
            <asp:Literal ID="Question7Answer" runat="server" />

            <br /><br />

            <b>8) I feel under a great deal of stress on my job:</b><br />
            <asp:Literal ID="Question8Answer" runat="server" />

            <br /><br />

            <b>9) Please rate the following areas by level of importance with 1 being most important and 6 being least important:</b><br />
            <asp:Literal ID="Literal1" runat="server" />
             
            <ul class="no-bullet">
                <li><b>Employee recognition program:</b> <asp:Literal ID="Question91Answer" runat="server" /></li>
                <li><b>Ability to make decisions:</b> <asp:Literal ID="Question92Answer" runat="server" /></li>
                <li><b>Comfortable work environment:</b> <asp:Literal ID="Question93Answer" runat="server" /></li>
                <li><b>Employee training program:</b> <asp:Literal ID="Question94Answer" runat="server" /></li>
                <li><b>Company picnic:</b> <asp:Literal ID="Question95Answer" runat="server" /></li>
                <li><b>Christmas party:</b> <asp:Literal ID="Question96Answer" runat="server" /></li>
            </ul>
             
        </asp:Panel>
    </div>

    <br /><br />
    
    <span class="tdText">
        The fields of the Super Form can be grouped in field sets. Use the <b>FieldSets</b> collection to define field sets for the form.<br />
        The field sets are grouped in field set rows, which allow developers to organize the field sets in a tabular structure.<br />
        To designate a field as member of a field set, use the <b>FieldSetID</b> property of the field.<br /><br />
        This example showcases the use of the Super Form control to implement a multi-step survey.<br />
        We used <b>TemplateFields</b> to add the input controls required by a survey to the Super Form.
    </span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .ob_fRwF span
        {
            position: static !important;            
        }
        
        td.field-set
        {
            padding-left: 0px !important;
            padding-right:0px !important;
            padding-bottom: 0px !important;
            padding-top: 0px !important;
        }
        
        td.field-set .ob_fRwH, td.field-set .ob_fRwF 
        {
            padding-bottom: 0px !important;
            padding-top: 0px !important;
            width: 470px;
        }
        
        .field-set-visible
        {
            display: block;
        }
        
        .field-set-hidden
        {
            display: none;
        }
        
        .field-set-hidden-editor
        {
            visibility: hidden;
            position: absolute;
            display: block;
        }
        
        .field-set-hidden-editor #Q1
        {
            position: absolute;
            width: 1px;
            height: 1px;
            overflow: hidden;
        }     
        
        .field-set-buttons .ob_fRwF
        {
            width: 500px;
            text-align: center !important;
        }
        
        .tabs-border
        {
            height: 2px;
            width: 100%;
            background-image: url(styles/black_glass/images/separator.png);
            top: 38px;
            position: absolute;
        }
        #scaleNumber
        {
            position:absolute;
            left: 256px;
            top: 85px;
        }
        #radiosAreas
        {
            position:absolute;
            left: 250px;
            top: 100px;
    
        }   
        li.no-bullet
        {
            float:left;  
        }  
         .no-bullet li 
        {
            height:24px;
        }
        .no-bullet
        {
            list-style-type: none;
            line-height: 22px;
        }
        span.ob_iRBtnEl {
            position:absolute !important;
        }
        .Q1, .Q2
        {
            height:67px;
        }
        .Q3
        {
            height:27px;
        }
        .Q4
        {
            height:33px;
        }
        .Q5
        {
            height:130px;
        }
        
        .results th
        {
            width: 200px;
        }     
        
    </style>

    <script type="text/javascript">
        var lastVisibleFieldSetIndex = 1;

        function moveToPreviousStep() {
            if (lastVisibleFieldSetIndex > 1) {
                toggleFieldSets(-1);
                document.getElementById('NextButtonContainer').style.display = '';
                document.getElementById('SaveButtonContainer').style.display = 'none';

                if (lastVisibleFieldSetIndex == 1) {
                    document.getElementById('PreviousButtonContainer').style.display = 'none';
                }
            }
        }

        function moveToNextStep() {
            if (!Page_ClientValidate()) {
                return;
            }

            if (lastVisibleFieldSetIndex < 4) {
                toggleFieldSets(1);
                document.getElementById('PreviousButtonContainer').style.display = '';

                if (lastVisibleFieldSetIndex == 4) {
                    document.getElementById('NextButtonContainer').style.display = 'none';
                    document.getElementById('SaveButtonContainer').style.display = '';
                }
            }
        }

        function toggleFieldSets(increment) {
            var currentFieldSet = getFieldSetByIndex(lastVisibleFieldSetIndex);
            currentFieldSet.className = currentFieldSet.className.replace(/field-set-visible/g, 'field-set-hidden');

            var newFieldSet = getFieldSetByIndex(lastVisibleFieldSetIndex + increment);
            newFieldSet.className = newFieldSet.className.replace(/field-set-hidden/g, 'field-set-visible');

            lastVisibleFieldSetIndex += increment;
        }

        function getFieldSetByIndex(index) {
            var container = document.getElementById('__dvctl00_ContentPlaceHolder1_SuperForm1__div').firstChild;
            while (container.className != 'ob_fC') {
                container = container.nextSibling;
            }

            container = container.firstChild;
            while (container.nodeName != 'TABLE') {
                container = container.nextSibling;
            }

            container = container.firstChild;
            while (container.nodeName != 'TBODY') {
                container = container.nextSibling;
            }

            var increment = 1;

            if (container.firstChild.nodeName != 'TR') {
                increment++;
            }

            var fieldSet = container.childNodes[index - increment].firstChild
            while (fieldSet.nodeName != 'TD') {
                fieldSet = fieldSet.nextSibling;
            }

            return fieldSet;
        }

        function validateQuestion3(source, arguments) {
            if (lastVisibleFieldSetIndex != 2 || OboutRadioButton31.checked() || OboutRadioButton32.checked() || OboutRadioButton33.checked() || OboutRadioButton34.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion4(source, arguments) {
            if (lastVisibleFieldSetIndex != 2 || OboutRadioButton41.checked() || OboutRadioButton42.checked() || OboutRadioButton43.checked() || OboutRadioButton44.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }
        function validateQuestion5(source, arguments) {
            if (lastVisibleFieldSetIndex != 2 || OboutRadioButton51.checked() || OboutRadioButton52.checked() || OboutRadioButton53.checked() || OboutRadioButton54.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion6(source, arguments) {
            if (lastVisibleFieldSetIndex != 3 || OboutRadioButton61.checked() || OboutRadioButton62.checked() || OboutRadioButton63.checked() || OboutRadioButton64.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion7(source, arguments) {
            if (lastVisibleFieldSetIndex != 3 || OboutRadioButton71.checked() || OboutRadioButton72.checked() || OboutRadioButton73.checked() || OboutRadioButton74.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion8(source, arguments) {
            if (lastVisibleFieldSetIndex != 3 || OboutRadioButton81.checked() || OboutRadioButton82.checked() || OboutRadioButton83.checked() || OboutRadioButton84.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion91(source, arguments) {
            if (lastVisibleFieldSetIndex != 4 || OboutRadioButton91.checked() || OboutRadioButton92.checked() || OboutRadioButton93.checked() || OboutRadioButton94.checked() || OboutRadioButton95.checked() || OboutRadioButton96.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion92(source, arguments) {
            if (lastVisibleFieldSetIndex != 4 || OboutRadioButton97.checked() || OboutRadioButton98.checked() || OboutRadioButton99.checked() || OboutRadioButton910.checked() || OboutRadioButton911.checked() || OboutRadioButton912.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion93(source, arguments) {
            if (lastVisibleFieldSetIndex != 4 || OboutRadioButton913.checked() || OboutRadioButton914.checked() || OboutRadioButton915.checked() || OboutRadioButton916.checked() || OboutRadioButton917.checked() || OboutRadioButton918.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion94(source, arguments) {
            if (lastVisibleFieldSetIndex != 4 || OboutRadioButton919.checked() || OboutRadioButton920.checked() || OboutRadioButton921.checked() || OboutRadioButton922.checked() || OboutRadioButton923.checked() || OboutRadioButton924.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }

        function validateQuestion95(source, arguments) {
            if (lastVisibleFieldSetIndex != 4 || OboutRadioButton925.checked() || OboutRadioButton926.checked() || OboutRadioButton927.checked() || OboutRadioButton928.checked() || OboutRadioButton929.checked() || OboutRadioButton930.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }
        function validateQuestion96(source, arguments) {
            if (lastVisibleFieldSetIndex != 4 || OboutRadioButton931.checked() || OboutRadioButton932.checked() || OboutRadioButton933.checked() || OboutRadioButton934.checked() || OboutRadioButton935.checked() || OboutRadioButton936.checked()) {
                arguments.IsValid = true;
            } else {
                arguments.IsValid = false;
            }
        }
	</script>
</asp:Content>

