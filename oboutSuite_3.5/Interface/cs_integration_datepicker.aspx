<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>

<script type="text/C#" runat="server">
    OboutTextBox txt1;
    OboutInc.Calendar2.Calendar cal1;

    void Page_load(object sender, EventArgs e)
    {
        txt1 = new OboutTextBox();
        txt1.ID = "txt1";
        txt1.Width = Unit.Pixel(200);
        txt1.FolderStyle = "styles/premiere_blue/OboutTextBox";

        txtPlaceHolder.Controls.Add(txt1);
        
                
        cal1 = new OboutInc.Calendar2.Calendar();
        cal1.ID= "cal1";
        cal1.StyleFolder = "../Calendar/styles/expedia";
        cal1.DatePickerMode = true;
        cal1.DatePickerImagePath = "../Calendar/styles/icon2.gif";

        cal1.TextBoxId = txt1.ClientID;
        
        calPlaceHolder.Controls.Add(cal1);
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
		
		<span class="tdText"><b>obout Interface - OboutTextBox with DatePicker</b></span>
		
		<br /><br />
		
		<table cellpadding="0" cellspacing="1">
		    <tr>
		        <td>	            
		            <asp:PlaceHolder runat="server" ID="txtPlaceHolder" />
		        </td>
		        <td>
		            <asp:PlaceHolder runat="server" ID="calPlaceHolder" />
		        </td>
		    </tr>
		</table>
				
		<br /><br />
		
		<span class="tdText">
		    The OboutTextBox and the date picker can work together. When selecting a date from the Calendar, <br />the text box will be populated with that specific date.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>