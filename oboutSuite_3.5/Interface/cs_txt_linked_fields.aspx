<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<script type="text/C#" runat="server">
    OboutTextBox txt1;
    OboutTextBox txt2;
    void Page_load(object sender, EventArgs e)
    {
        txt1 = new OboutTextBox();
        txt1.ID = "txt1";
        txt1.ControlsToEnable = "OboutButton";
        
        txt2 = new OboutTextBox();
        txt2.ID = "txt2";
        txt2.ControlsToEnable = "OboutButton";

        txt1PlaceHolder.Controls.Add(txt1);
        txt2PlaceHolder.Controls.Add(txt2);
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
		
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutTextBox - Linked Fields</b></span>
		
		<br /><br />
		<table>
		    <tr>
                <td>First Name:</td>
                <td><asp:PlaceHolder runat="server" ID="txt1PlaceHolder" /></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><asp:PlaceHolder runat="server" ID="txt2PlaceHolder" /></td>
            </tr>
            <tr>
                <td colspan="2" align="right"><obout:OboutButton runat="server" ID="OboutButton" Text="Submit" Enabled="false" /></td>
            </tr>
        </table>
		
		<br /><br />
		
		<span class="tdText">
		    The OboutTextBox control can be configured to enable other controls from the page when its text is changed.<br /> 
		    Everything is done internally by the OboutTextBox control. <b>No extra coding is required.</b><br /><br />

            The OboutTextBox class exposes the ControlsToEnable property, which indicates the ids of the controls <br />
            that will be enabled when the text inside the OboutTextBox control is changed.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>
		
