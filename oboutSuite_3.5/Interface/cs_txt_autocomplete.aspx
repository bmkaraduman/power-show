<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutTextBox txt1;
    
    void Page_load(object sender, EventArgs e)
    {
        txt1 = new OboutTextBox();
        txt1.ID = "txt1";
        txt1.Width = Unit.Pixel(200);
        txt1.AutoCompleteType = AutoCompleteType.Search;
        txt1.FolderStyle = "styles/premiere_blue/OboutTextBox";

        txtPlaceHolder.Controls.Add(txt1);
    }
    
    protected void chk1_CheckedChanged(object sender, EventArgs e)
    {
        if (chk1.Checked)
        {
            txt1.AutoCompleteType = AutoCompleteType.Search;
        }
        else
        {
            txt1.AutoCompleteType = AutoCompleteType.Disabled;
        }
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
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutTextBox - Auto Complete</b></span>
		
		<br /><br />
		
		<asp:CheckBox runat="server" ID="chk1" Text="Enable AutoComplete" CssClass="tdText"
		    Checked="true" AutoPostBack="true" OnCheckedChanged="chk1_CheckedChanged" />
		
		<br /><br />
				
		<asp:PlaceHolder runat="server" ID="txtPlaceHolder" />
				
		<br /><br />
		
		<span class="tdText">
		    Use the <b>AutoCompleteType</b> property to enable / disable the auto complete feature for the textbox.<br />
		    If this feature is enabled, the browser will make suggestions of previously entered texts, when you start to type in the textbox.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>