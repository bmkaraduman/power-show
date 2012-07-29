<%@ Page Language="C#" EnableEventValidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<script type="text/C#" runat="server">
     CreateUserWizard CreateUserWizard1;
     void Page_load(object sender, EventArgs e)
     {
         CreateUserWizard1 = new CreateUserWizard();
         CreateUserWizard1.ID = "CreateUserWizard1";
         CreateUserWizard1.CssClass = "tdText";
         CreateUserWizard1.PreRender += CreateUserWizard1_PreRender;
         CreateUserWizard1.ContinueButtonClick += CreateUserWizard1_ContinueButtonClick;

         CreateUserWizardStep CreateUserWizardStep1 = new CreateUserWizardStep();
         CreateUserWizardStep1.ID = "CreateUserWizardStep1";
         CreateUserWizardStep1.CustomNavigationTemplate = new CreateOboutButtonTemplate();

         CompleteWizardStep CreateUserWizardStep2 = new CompleteWizardStep(); 
         CreateUserWizardStep2.ContentTemplate = new CreateContentTemplate();

         CreateUserWizard1.WizardSteps.Add(CreateUserWizardStep1);
         CreateUserWizard1.WizardSteps.Add(CreateUserWizardStep2);
         
         PlaceHolder1.Controls.Add(CreateUserWizard1);
     }
    
         public class CreateOboutButtonTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {
            PlaceHolder templatePlaceHolder = new PlaceHolder();
            container.Controls.Add(templatePlaceHolder);

            OboutButton button = new OboutButton();
            templatePlaceHolder.Controls.Add(button);

            button.Text = "Create User"; 
            button.CommandName = "MoveNext" ;
            button.ValidationGroup = "CreateUserWizard1";
            
            Literal spatiu = new Literal();
            spatiu.Text = "&#160;&#160;";
            templatePlaceHolder.Controls.Add(spatiu);
        }

    }
           public class CreateContentTemplate : ITemplate
    {
               public void InstantiateIn(Control container)
               {
                   PlaceHolder templatePlaceHolder = new PlaceHolder();
                   container.Controls.Add(templatePlaceHolder);

                   Literal content1 = new Literal();
                   content1.Text = "Your account has been successfully created.";
                   Literal content2 = new Literal();
                   content2.Text = "<br /><br />";

                   templatePlaceHolder.Controls.Add(content1);
                   templatePlaceHolder.Controls.Add(content2);
                   
                   OboutButton button = new OboutButton();
                   templatePlaceHolder.Controls.Add(button);

                   button.ID = "OboutButton1";
                   button.Text = "Continue";
                   button.CommandName = "Continue";
                   button.CausesValidation = false;

                   Literal content3 = new Literal();
                   content3.Text = "&#160;&#160;";
                   templatePlaceHolder.Controls.Add(content3);
               }    
        
     }
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