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
		</style>
        <script type="text/javascript">
            function TextBox_KeyPress(sender, key) {
                var index = parseInt(sender.ID.replace('OboutTextBox', ''));

                if (sender.value().length == 4 && index < 4) {
                    var nextTextBox = eval('OboutTextBox' + (index + 1));
                    if (nextTextBox) {
                        nextTextBox.focus();
                    }
                }
            }
        </script>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutTextBox - MaxLength with Auto Focus</b></span>
		
		<br /><br />
		
        <table>
            <tr>
                <td valign="middle" class="tdText">
                    Enter your credit card number:
                </td>
                <td>
                    <obout:OboutTextBox runat="server" ID="OboutTextBox1" Width="50" MaxLength="4">
                        <ClientSideEvents OnKeyPress="TextBox_KeyPress" OnKeyUp="TextBox_KeyPress" />
                    </obout:OboutTextBox>
                    <obout:OboutTextBox runat="server" ID="OboutTextBox2" Width="50" MaxLength="4">
                        <ClientSideEvents OnKeyPress="TextBox_KeyPress" OnKeyUp="TextBox_KeyPress" />
                    </obout:OboutTextBox>
                    <obout:OboutTextBox runat="server" ID="OboutTextBox3" Width="50" MaxLength="4">
                        <ClientSideEvents OnKeyPress="TextBox_KeyPress" OnKeyUp="TextBox_KeyPress" />
                    </obout:OboutTextBox>
                    <obout:OboutTextBox runat="server" ID="OboutTextBox4" Width="50" MaxLength="4">
                        <ClientSideEvents OnKeyPress="TextBox_KeyPress" OnKeyUp="TextBox_KeyPress" />
                    </obout:OboutTextBox>
                </td>
            </tr>
        </table>

		<br />
		
		<span class="tdText">
		    This example showcases the use of the MaxLength feature of the OboutTextBox along with an auto tabbing mechanism.<br />
            While the user types into the text boxes, when the maximum number of characters for a text box is reached, <br />
            the focus will automatically be set to the next text box.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>