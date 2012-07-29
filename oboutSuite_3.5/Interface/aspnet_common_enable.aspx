<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script language="C#" runat="server">
	
    void Disable(object sender, EventArgs e)
	{
        btn1.Enabled = false;
        chk1.Enabled = false;
        ddl1.Enabled = false;
        rbtn1.Enabled = false;
        rbtn2.Enabled = false;
        txt1.Enabled = false;
	}

    void Enable(object sender, EventArgs e)
    {
        btn1.Enabled = true;
        chk1.Enabled = true;
        ddl1.Enabled = true;
        rbtn1.Enabled = true;
        rbtn2.Enabled = true;
        txt1.Enabled = true;
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
			
			.btn 
			{
			    font: 11px Verdana;
				color: #333333;
				width: 150px;
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
		<script type="text/javascript">
		    function disable() {
		        btn1.disable();
		        chk1.disable();
		        ddl1.disable();
		        rbtn1.disable();
		        rbtn2.disable();
                txt1.disable();
            }

            function enable() {
                btn1.enable();
                chk1.enable();
                ddl1.enable();
                rbtn1.enable();
                rbtn2.enable();
                txt1.enable();
            }
        </script>		
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - Enable / Disable</b></span>
		
		<br /><br />
		
		<span class="tdText">Button:</span><br />
		<obout:OboutButton runat="server" ID="btn1" Width="200" Text="Click Me!" />
		
		<br /><br />
		
		<span class="tdText">CheckBox:</span><br />
		<obout:OboutCheckBox runat="server" ID="chk1" Text="Select Me!" />
		
		<br /><br />
		
		<span class="tdText">DropDownList:</span><br />
		<obout:OboutDropDownList runat="server" ID="ddl1" Width="200">
		    <asp:ListItem>Item 1</asp:ListItem>
		    <asp:ListItem>Item 2</asp:ListItem>
		    <asp:ListItem>Item 3</asp:ListItem>
		    <asp:ListItem>Item 4</asp:ListItem>
		    <asp:ListItem>Item 5</asp:ListItem>
		    <asp:ListItem>Item 6</asp:ListItem>
		    <asp:ListItem>Item 7</asp:ListItem>
		</obout:OboutDropDownList>
		
		<br /><br />
		
		<span class="tdText">RadioButton:</span><br />
		<obout:OboutRadioButton runat="server" ID="rbtn1" Text="Option 1" GroupName="SomeGroup" /> 
		<obout:OboutRadioButton runat="server" ID="rbtn2" Text="Option 2" GroupName="SomeGroup" />
		
		<br /><br />
		
		<span class="tdText">TextBox:</span><br />
		<obout:OboutTextBox runat="server" ID="txt1" Width="200" Text="Some text ..." />
		
		<br /><br />
		
		<input type="button" class="btn" value="Disable on client-side" onclick="disable()" />&#160;<input type="button" class="btn" value="Enable on client-side" onclick="enable()" />
		
		<br />
		
		<asp:Button runat="server" CssClass="btn" Text="Disable on server-side" OnClick="Disable" />&#160;<asp:Button runat="server" CssClass="btn" Text="Enable on server-side" OnClick="Enable"/>
		
		<br /><br /><br />
		
		<span class="tdText">
		    To enable / disable the controls on the client-side, use the <span class="option2">enable</span> / <span class="option2">disable</span> methods.<br />
		    On the server-side, use the <b>Enabled</b> property.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>