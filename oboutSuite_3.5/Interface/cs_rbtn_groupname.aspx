<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script language="C#" runat="server">
    OboutRadioButton OboutRadioButton1;
    OboutRadioButton OboutRadioButton2;
    OboutRadioButton OboutRadioButton3;
    OboutRadioButton OboutRadioButton4;
    OboutRadioButton OboutRadioButton5;
    OboutRadioButton OboutRadioButton6;
    OboutRadioButton OboutRadioButton7;
    OboutRadioButton OboutRadioButton8;
    OboutRadioButton OboutRadioButton9;
    
    void Page_load(object sender, EventArgs e)
    {
        OboutRadioButton1 = new OboutRadioButton();
        OboutRadioButton1.ID = "OboutRadioButton1";
        OboutRadioButton1.Text = "Option 1";
        OboutRadioButton1.GroupName = "g1";
        OboutRadioButton1.Checked = true;

        PlaceHolder1.Controls.Add(OboutRadioButton1);
        
        
        OboutRadioButton2 = new OboutRadioButton();
        OboutRadioButton2.ID = "OboutRadioButton2";
        OboutRadioButton2.Text = "Option 2";
        OboutRadioButton2.GroupName = "g1";

        PlaceHolder2.Controls.Add(OboutRadioButton2);
        
        
        
        
        OboutRadioButton3 = new OboutRadioButton();
        OboutRadioButton3.ID = "OboutRadioButton3";
        OboutRadioButton3.Text = "Option 3";
        OboutRadioButton3.GroupName = "g2";
        OboutRadioButton3.Checked = true;

        PlaceHolder3.Controls.Add(OboutRadioButton3);
        
        
        OboutRadioButton4 = new OboutRadioButton();
        OboutRadioButton4.ID = "OboutRadioButton4";
        OboutRadioButton4.Text = "Option 4";
        OboutRadioButton4.GroupName = "g2";

        PlaceHolder4.Controls.Add(OboutRadioButton4);

                
        OboutRadioButton5 = new OboutRadioButton();
        OboutRadioButton5.ID = "OboutRadioButton5";
        OboutRadioButton5.Text = "Option 5";
        OboutRadioButton5.GroupName = "g2";

        PlaceHolder5.Controls.Add(OboutRadioButton5);
        
        
        
        
        OboutRadioButton6 = new OboutRadioButton();
        OboutRadioButton6.ID = "OboutRadioButton6";
        OboutRadioButton6.Text = "Option 6";
        OboutRadioButton6.GroupName = "g3";
        OboutRadioButton6.Checked = true;

        PlaceHolder6.Controls.Add(OboutRadioButton6);
        
        
        OboutRadioButton7 = new OboutRadioButton();
        OboutRadioButton7.ID = "OboutRadioButton7";
        OboutRadioButton7.Text = "Option 7";
        OboutRadioButton7.GroupName = "g3";

        PlaceHolder7.Controls.Add(OboutRadioButton7);
        
        
        OboutRadioButton8 = new OboutRadioButton();
        OboutRadioButton8.ID = "OboutRadioButton8";
        OboutRadioButton8.Text = "Option 8";
        OboutRadioButton8.GroupName = "g3";

        PlaceHolder8.Controls.Add(OboutRadioButton8);
        
        
        OboutRadioButton9 = new OboutRadioButton();
        OboutRadioButton9.ID = "OboutRadioButton9";
        OboutRadioButton9.Text = "Option 9";
        OboutRadioButton9.GroupName = "g3";

        PlaceHolder9.Controls.Add(OboutRadioButton9);
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

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
			
			.validator
			{
			    font:11px Verdana;
			}
			
			.group
			{
			    width: 150px;
			    font-size: 10px;
			    font-family: Verdana;
			    padding: 5px;
			}
		</style>		
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutRadioButton - GroupName property</b></span>
		
		<br /><br />
		
		<fieldset class="group">
		    <legend>Group 1</legend>		    
		    <asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		    <br /><br />		    
		    <asp:PlaceHolder runat="server" ID="PlaceHolder2" />
		</fieldset>
		
		<br /><br />
		
		<fieldset class="group">
		    <legend>Group 2</legend>		    
		    <asp:PlaceHolder runat="server" ID="PlaceHolder3" />
		    <br /><br />
		    <asp:PlaceHolder runat="server" ID="PlaceHolder4" />
		    <br /><br />
		    <asp:PlaceHolder runat="server" ID="PlaceHolder5" />
		</fieldset>
		
		<br /><br />
		
		<fieldset class="group">
		    <legend>Group 3</legend>
		    <asp:PlaceHolder runat="server" ID="PlaceHolder6" />
		    <br /><br />
		    <asp:PlaceHolder runat="server" ID="PlaceHolder7" />
		    <br /><br />
		    <asp:PlaceHolder runat="server" ID="PlaceHolder8" />
		    <br /><br />
		    <asp:PlaceHolder runat="server" ID="PlaceHolder9" />
		</fieldset>
		
		<br /><br />
		
		<span class="tdText">
		    Use the <b>GroupName</b> property to specify the group to which a radio button belongs.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>