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
			
			.tab
			{
			    float: left;
			    width: 20px;
			    font-size: 10px;
			    font-family: Verdana;
			}
			
			.spacer
			{
			    height: 3px;
			    font-size: 1px;
			}
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutCheckBox - Linked CheckBoxes with Tri-States</b></span>
		
		<br /><br />
		
		<obout:OboutCheckBox runat="server" ID="ChkTechnologies" Text="Technologies" />
		
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div>
		<obout:OboutCheckBox runat="server" ID="ChkNetFramework" ParentCheckBoxID="ChkTechnologies" Text=".NET Framework" />		   
		
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div><div class="tab">&#160;</div>
		<obout:OboutCheckBox runat="server" ID="ChkAspNet" ParentCheckBoxID="ChkNetFramework" Text="ASP.NET" />
		
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div><div class="tab">&#160;</div><div class="tab">&#160;</div>
		<obout:OboutCheckBox runat="server" ID="OboutCheckBox1" ParentCheckBoxID="ChkAspNet" Text="ASP.NET" />
		
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div><div class="tab">&#160;</div><div class="tab">&#160;</div>
		<obout:OboutCheckBox runat="server" ID="OboutCheckBox2" ParentCheckBoxID="ChkAspNet" Text="ASP.NET MVC" />
		
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div><div class="tab">&#160;</div><div class="tab">&#160;</div>
		<obout:OboutCheckBox runat="server" ID="OboutCheckBox3" ParentCheckBoxID="ChkAspNet" Text="ASP.NET Dynamic Data" />
		
		<div class="spacer">&#160;</div>
		    
		<div class="tab">&#160;</div><div class="tab">&#160;</div>
		<obout:OboutCheckBox runat="server" ID="ChkCSharp" ParentCheckBoxID="ChkNetFramework" Text="C#" />
		
		<div class="spacer">&#160;</div>
		    
		<div class="tab">&#160;</div><div class="tab">&#160;</div>
		<obout:OboutCheckBox runat="server" ID="ChkVB" ParentCheckBoxID="ChkNetFramework" Text="VB" />
		    
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div>
		<obout:OboutCheckBox runat="server" ID="ChkOther" ParentCheckBoxID="ChkTechnologies" Text="Other" />
		
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div><div class="tab">&#160;</div>
		<obout:OboutCheckBox runat="server" ID="ChkPhp" ParentCheckBoxID="ChkOther" Text="PHP" />
		
		<div class="spacer">&#160;</div>
		    
		<div class="tab">&#160;</div><div class="tab">&#160;</div>
		<obout:OboutCheckBox runat="server" ID="ChkRuby" ParentCheckBoxID="ChkOther" Text="Ruby" />
		
		<div class="spacer">&#160;</div>
		    
		<div class="tab">&#160;</div><div class="tab">&#160;</div>
		<obout:OboutCheckBox runat="server" ID="ChkJava" ParentCheckBoxID="ChkOther" Text="Java" />
		
		<br /><br />
		
		<span class="tdText">
		    Use the <b>ParentCheckBoxID</b> property to link child check boxes to their parent check boxes.<br />
		    When a parent check box has checked and unchecked child check boxes, it will be partially checked.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>