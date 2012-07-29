<%@ Page Language="C#" EnableEventValidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/C#" runat="server">

    protected void CreateUserWizard1_PreRender(object sender, EventArgs e)
    {
        ConvertToOboutTextBox("Username");
        ConvertToOboutTextBox("Email");
        ConvertToOboutTextBox("Password");
        ConvertToOboutTextBox("ConfirmPassword");
        ConvertToOboutTextBox("Question");
        ConvertToOboutTextBox("Answer");
    }

    protected void ConvertToOboutTextBox(string controlId)
    {
        TextBox oldControl = (CreateUserWizard1.WizardSteps[0] as CreateUserWizardStep).ContentTemplateContainer.FindControl(controlId) as TextBox;
        Control parent = oldControl.Parent;

        parent.Controls.Remove(oldControl);

        OboutTextBox newControl = new OboutTextBox();
        newControl.ID = controlId;
        if (controlId.IndexOf("Password") != -1)
        {
            newControl.TextMode = TextBoxMode.Password;
        }
        newControl.Text = oldControl.Text;
        parent.Controls.AddAt(0, newControl);
    }

    protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e)
    {
        CreateUserWizard1.ActiveStepIndex = 0;
    }
    
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
        
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnPreRender="CreateUserWizard1_PreRender" CssClass="tdText" 
            OnContinueButtonClick="CreateUserWizard1_ContinueButtonClick">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <CustomNavigationTemplate>
                        <obout:OboutButton runat="server" Text="Create User" CommandName="MoveNext" ValidationGroup="CreateUserWizard1" /> &#160;&#160;
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep runat="server">
                    <ContentTemplate>
                        Your account has been successfully created.<br /><br />
                        <obout:OboutButton ID="OboutButton1" runat="server" Text="Continue" CommandName="Continue" CausesValidation="false" /> &#160;&#160;
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>

		<br /><br />
		
		<span class="tdText">
		    The Interface Controls can be used inside a CreateUserWizard control to replace the standard controls.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>