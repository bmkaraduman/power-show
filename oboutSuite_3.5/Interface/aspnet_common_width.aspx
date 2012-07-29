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
		</style>		
	</head>
	<body style="margin: 0px;">
		<form id="Form1" runat="server">
		
		<br /><br />				
		
		<span class="tdText"><b>obout Interface - Width property</b></span>
		
		<br /><br />
		
		<span class="tdText">Width="100%"</span><br />
		<obout:OboutButton runat="server" ID="OboutButton1" Width="100%" Text="Click Me!" />
		
		<br /><br />
		
		<span class="tdText">Width="50%"</span><br />
		<obout:OboutButton runat="server" ID="OboutButton2" Width="50%" Text="Click Me!" />
		
		<br /><br />
		
		<span class="tdText">Width="25%"</span><br />
		<obout:OboutButton runat="server" ID="OboutButton3" Width="25%" Text="Click Me!" />
		
		<br /><br />
		
		<span class="tdText">Width="200"</span><br />
		<obout:OboutButton runat="server" ID="OboutButton4" Width="200" Text="Click Me!" />
		
		<br /><br />
		
		<span class="tdText">auto width</span><br />
		<obout:OboutButton runat="server" ID="OboutButton5" Text="Click Me!" />
		
		<br /><br />
		
		<span class="tdText">Width="100%"</span><br />
		<obout:OboutDropDownList runat="server" ID="ddl1" Width="100%">
		    <asp:ListItem>Item 1</asp:ListItem>
		    <asp:ListItem>Item 2</asp:ListItem>
		    <asp:ListItem>Item 3</asp:ListItem>
		    <asp:ListItem>Item 4</asp:ListItem>
		    <asp:ListItem>Item 5</asp:ListItem>
		    <asp:ListItem>Item 6</asp:ListItem>
		    <asp:ListItem>Item 7</asp:ListItem>
		    <asp:ListItem>Item 8</asp:ListItem>
		    <asp:ListItem>Item 9</asp:ListItem>
		</obout:OboutDropDownList>
		
		<br /><br />
		
		<span class="tdText">Width="50%"</span><br />
		<obout:OboutDropDownList runat="server" ID="OboutDropDownList1" Width="50%">
		    <asp:ListItem>Item 1</asp:ListItem>
		    <asp:ListItem>Item 2</asp:ListItem>
		    <asp:ListItem>Item 3</asp:ListItem>
		    <asp:ListItem>Item 4</asp:ListItem>
		    <asp:ListItem>Item 5</asp:ListItem>
		    <asp:ListItem>Item 6</asp:ListItem>
		    <asp:ListItem>Item 7</asp:ListItem>
		    <asp:ListItem>Item 8</asp:ListItem>
		    <asp:ListItem>Item 9</asp:ListItem>
		</obout:OboutDropDownList>
		
		<br /><br />
		
		<span class="tdText">Width="25%"</span><br />
		<obout:OboutDropDownList runat="server" ID="OboutDropDownList2" Width="25%">
		    <asp:ListItem>Item 1</asp:ListItem>
		    <asp:ListItem>Item 2</asp:ListItem>
		    <asp:ListItem>Item 3</asp:ListItem>
		    <asp:ListItem>Item 4</asp:ListItem>
		    <asp:ListItem>Item 5</asp:ListItem>
		    <asp:ListItem>Item 6</asp:ListItem>
		    <asp:ListItem>Item 7</asp:ListItem>
		    <asp:ListItem>Item 8</asp:ListItem>
		    <asp:ListItem>Item 9</asp:ListItem>
		</obout:OboutDropDownList>
		
		<br /><br />
		
		<span class="tdText">Width="200"</span><br />
		<obout:OboutDropDownList runat="server" ID="OboutDropDownList3" Width="200">
		    <asp:ListItem>Item 1</asp:ListItem>
		    <asp:ListItem>Item 2</asp:ListItem>
		    <asp:ListItem>Item 3</asp:ListItem>
		    <asp:ListItem>Item 4</asp:ListItem>
		    <asp:ListItem>Item 5</asp:ListItem>
		    <asp:ListItem>Item 6</asp:ListItem>
		    <asp:ListItem>Item 7</asp:ListItem>
		    <asp:ListItem>Item 8</asp:ListItem>
		    <asp:ListItem>Item 9</asp:ListItem>
		</obout:OboutDropDownList>
		
		<br /><br />
		
		<span class="tdText">auto width</span><br />		
	    <obout:OboutDropDownList runat="server" ID="OboutDropDownList4">
	        <asp:ListItem>Item 1</asp:ListItem>
	        <asp:ListItem>Item 2</asp:ListItem>
	        <asp:ListItem>Item 3</asp:ListItem>
	        <asp:ListItem>Item 4</asp:ListItem>
	        <asp:ListItem>Item 5</asp:ListItem>
	        <asp:ListItem>Item 6</asp:ListItem>
	        <asp:ListItem>Item 7</asp:ListItem>
	        <asp:ListItem>Item 8</asp:ListItem>
	        <asp:ListItem>Item 9</asp:ListItem>
	    </obout:OboutDropDownList>
	    
		<br /><br />
		
		<span class="tdText">Width="100%"</span><br />
		<obout:OboutTextBox runat="server" ID="txt1" Width="100%" />
		
		<br /><br />
		
		<span class="tdText">Width="50%"</span><br />
		<obout:OboutTextBox runat="server" ID="OboutTextBox1" Width="50%" />
		
		<br /><br />
		
		<span class="tdText">Width="25%"</span><br />
		<obout:OboutTextBox runat="server" ID="OboutTextBox2" Width="25%" />
		
		<br /><br />
		
		<span class="tdText">Width="200"</span><br />
		<obout:OboutTextBox runat="server" ID="OboutTextBox3" Width="200" />
		
		<br /><br />
		
		<span class="tdText">auto width</span><br />
		<obout:OboutTextBox runat="server" ID="OboutTextBox4" />
		
		<br /><br /><br />
		
		<span class="tdText">
		    The <b>Width</b> property may be set either by using fixed values (pixels) or by using a relative value (percentages).<br />
		    If the <b>Width</b> is not specified the controls will have the same width as their container.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>