<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

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
		    <obout:OboutRadioButton runat="server" ID="OboutRadioButton1" GroupName="g1" Text="Option 1" Checked="true" />
		    <br /><br />
		    <obout:OboutRadioButton runat="server" ID="OboutRadioButton2" GroupName="g1" Text="Option 2" />
		</fieldset>
		
		<br /><br />
		
		<fieldset class="group">
		    <legend>Group 2</legend>
		    <obout:OboutRadioButton runat="server" ID="OboutRadioButton3" GroupName="g2" Text="Option 3" Checked="true" />
		    <br /><br />
		    <obout:OboutRadioButton runat="server" ID="OboutRadioButton4" GroupName="g2" Text="Option 4" />
		    <br /><br />
		    <obout:OboutRadioButton runat="server" ID="OboutRadioButton5" GroupName="g2" Text="Option 5" />
		</fieldset>
		
		<br /><br />
		
		<fieldset class="group">
		    <legend>Group 3</legend>
		    <obout:OboutRadioButton runat="server" ID="OboutRadioButton6" GroupName="g3" Text="Option 6" Checked="true" />
		    <br /><br />
		    <obout:OboutRadioButton runat="server" ID="OboutRadioButton7" GroupName="g3" Text="Option 7" />
		    <br /><br />
		    <obout:OboutRadioButton runat="server" ID="OboutRadioButton8" GroupName="g3" Text="Option 8" />
		    <br /><br />
		    <obout:OboutRadioButton runat="server" ID="OboutRadioButton9" GroupName="g3" Text="Option 9" />
		</fieldset>
		
		<br /><br />
		
		<span class="tdText">
		    Use the <b>GroupName</b> property to specify the group to which a radio button belongs.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>