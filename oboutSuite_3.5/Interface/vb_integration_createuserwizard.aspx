<%@ Page Language="VB" EnableEventValidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="VB" runat="server">
    Dim CreateUserWizard1 As CreateUserWizard
    
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        CreateUserWizard1 = New CreateUserWizard()
        CreateUserWizard1.ID = "CreateUserWizard1"
        CreateUserWizard1.CssClass = "tdText"
        
        AddHandler CreateUserWizard1.PreRender, AddressOf CreateUserWizard1_PreRender
        AddHandler CreateUserWizard1.ContinueButtonClick, AddressOf CreateUserWizard1_ContinueButtonClick

        Dim CreateUserWizardStep1 As CreateUserWizardStep = New CreateUserWizardStep()
        CreateUserWizardStep1.ID = "CreateUserWizardStep1"
        CreateUserWizardStep1.CustomNavigationTemplate = New CreateOboutButtonTemplate()

        Dim CreateUserWizardStep2 As CompleteWizardStep = New CompleteWizardStep()
        CreateUserWizardStep2.ContentTemplate = New CreateContentTemplate()

        CreateUserWizard1.WizardSteps.Add(CreateUserWizardStep1)
        CreateUserWizard1.WizardSteps.Add(CreateUserWizardStep2)
         
        PlaceHolder1.Controls.Add(CreateUserWizard1)
    End Sub
    

    Public Class CreateOboutButtonTemplate
        Implements ITemplate
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            
            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)

            Dim Button As OboutButton = New OboutButton()
            templatePlaceHolder.Controls.Add(Button)

            Button.Text = "Create User"
            Button.CommandName = "MoveNext"
            Button.ValidationGroup = "CreateUserWizard1"
            
            Dim spatiu As Literal = New Literal()
            spatiu.Text = "&#160;&#160;"
            templatePlaceHolder.Controls.Add(spatiu)
        End Sub
        
    End Class
    
    Public Class CreateContentTemplate
        Implements ITemplate
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            
            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)

            Dim content1 As Literal = New Literal()
            content1.Text = "Your account has been successfully created."
            Dim content2 As Literal = New Literal()
            content2.Text = "<br /><br />"

            templatePlaceHolder.Controls.Add(content1)
            templatePlaceHolder.Controls.Add(content2)
                   
            Dim Button As OboutButton = New OboutButton()
            templatePlaceHolder.Controls.Add(Button)

            Button.ID = "OboutButton1"
            Button.Text = "Continue"
            Button.CommandName = "Continue"
            Button.CausesValidation = False

            Dim content3 As Literal = New Literal()
            content3.Text = "&#160;&#160;"
            templatePlaceHolder.Controls.Add(content3)
        End Sub
            
    End Class
    
    Sub CreateUserWizard1_PreRender(ByVal sender As Object, ByVal e As EventArgs)
    
        ConvertToOboutTextBox("Username")
        ConvertToOboutTextBox("Email")
        ConvertToOboutTextBox("Password")
        ConvertToOboutTextBox("ConfirmPassword")
        ConvertToOboutTextBox("Question")
        ConvertToOboutTextBox("Answer")
    End Sub
    

    Sub ConvertToOboutTextBox(ByVal controlId As String)
   
        Dim oldControl As TextBox = CType(CType(CreateUserWizard1.WizardSteps(0), CreateUserWizardStep).ContentTemplateContainer.FindControl(controlId), TextBox)
        Dim Parent As Control = oldControl.Parent

        Parent.Controls.Remove(oldControl)

        Dim newControl As OboutTextBox = New OboutTextBox()
        newControl.ID = controlId
        If controlId.IndexOf("Password") <> -1 Then
       
            newControl.TextMode = TextBoxMode.Password
            
        End If
        
        newControl.Text = oldControl.Text
        Parent.Controls.AddAt(0, newControl)
        
    End Sub

    Sub CreateUserWizard1_ContinueButtonClick(ByVal sender As Object, ByVal e As EventArgs)
   
        CreateUserWizard1.ActiveStepIndex = 0
        
    End Sub
</script>

<html>
	<head>
		<title>obout Interface examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}			
			
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
			
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - Create User Wizard</b></span>
        
        <br /><br />
        
        <asp:PlaceHolder runat="server" ID="PlaceHolder1" />

		<br /><br />
		
		<span class="tdText">
		    The Interface Controls can be used inside a CreateUserWizard control to replace the standard controls.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>