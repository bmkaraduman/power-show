<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<script type="text/C#" runat="server">
  
    OboutTextBox txt1;
    OboutTextBox txt2;
    OboutTextBox txt3;
    OboutTextBox txt4;
        
    void Page_load(object sender, EventArgs e)
    {
        txt1 = new OboutTextBox();
        txt1.ID = "OboutTextBox1";
        txt1.Width = Unit.Pixel(50);
        txt1.MaxLength = 4;
        txt1.ClientSideEvents.OnKeyPress = "TextBox_KeyPress";
        txt1.ClientSideEvents.OnKeyPress = "TextBox_KeyPress";
        
        txt2 = new OboutTextBox();
        txt2.ID = "OboutTextBox2";
        txt2.Width = Unit.Pixel(50);
        txt2.MaxLength = 4;
        txt2.ClientSideEvents.OnKeyPress = "TextBox_KeyPress";
        txt2.ClientSideEvents.OnKeyPress = "TextBox_KeyPress";
        
        txt3 = new OboutTextBox();
        txt3.ID = "OboutTextBox3";
        txt3.Width = Unit.Pixel(50);
        txt3.MaxLength = 4;
        txt3.ClientSideEvents.OnKeyPress = "TextBox_KeyPress";
        txt3.ClientSideEvents.OnKeyPress = "TextBox_KeyPress";

        txt4 = new OboutTextBox();
        txt4.ID = "OboutTextBox4";
        txt4.Width = Unit.Pixel(50);
        txt4.MaxLength = 4;
        txt4.ClientSideEvents.OnKeyPress = "TextBox_KeyPress";
        txt4.ClientSideEvents.OnKeyPress = "TextBox_KeyPress";
        
        PlaceHolder1.Controls.Add(txt1);
        PlaceHolder2.Controls.Add(txt2);
        PlaceHolder3.Controls.Add(txt3);
        PlaceHolder4.Controls.Add(txt4);
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
                    <asp:PlaceHolder runat="server" ID="PlaceHolder1" />
                    <asp:PlaceHolder runat="server" ID="PlaceHolder2" />
                    <asp:PlaceHolder runat="server" ID="PlaceHolder3" />
                    <asp:PlaceHolder runat="server" ID="PlaceHolder4" />
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