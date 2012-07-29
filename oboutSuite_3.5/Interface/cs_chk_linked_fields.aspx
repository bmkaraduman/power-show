<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<script type="text/C#" runat="server">
    OboutCheckBox OboutCheckBox1;
    OboutCheckBox OboutCheckBox2;
    OboutCheckBox OboutCheckBox3;
    OboutCheckBox OboutCheckBox4;
    
    void Page_load(object sender, EventArgs e)
    {
        OboutCheckBox1 = new OboutCheckBox();
        OboutCheckBox1.ID = "OboutCheckBox1";
        OboutCheckBox1.FolderStyle = "styles/premiere_blue/OboutCheckBox";
        OboutCheckBox1.Text = "Enable Fields";
        OboutCheckBox1.Checked = true;
        OboutCheckBox1.ControlsToEnable = "OboutTextBox1,OboutTextBox2";

        OboutCheckBox2 = new OboutCheckBox();
        OboutCheckBox2.ID = "OboutCheckBox2";
        OboutCheckBox2.FolderStyle = "styles/premiere_blue/OboutCheckBox";
        OboutCheckBox2.Text = "Disable Fields";
        OboutCheckBox2.Checked = true;
        OboutCheckBox2.ControlsToDisable = "OboutTextBox3,OboutTextBox4";
        
        OboutCheckBox3 = new OboutCheckBox();
        OboutCheckBox3.ID = "OboutCheckBox3";
        OboutCheckBox3.FolderStyle = "styles/premiere_blue/OboutCheckBox";
        OboutCheckBox3.Text = "Show Fields";
        OboutCheckBox3.Checked = true;
        OboutCheckBox3.ControlsToEnable = "Row1,Row2";
        
        OboutCheckBox4 = new OboutCheckBox();
        OboutCheckBox4.ID = "OboutCheckBox4";
        OboutCheckBox4.FolderStyle = "styles/premiere_blue/OboutCheckBox";
        OboutCheckBox4.Text = "Enable Fields";
        OboutCheckBox4.Checked = true;
        OboutCheckBox4.ControlsToDisable = "Row3,Row4";
       
        PlaceHolder1.Controls.Add(OboutCheckBox1);
        PlaceHolder2.Controls.Add(OboutCheckBox2);
        PlaceHolder3.Controls.Add(OboutCheckBox3);
        PlaceHolder4.Controls.Add(OboutCheckBox4);
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
		
		<span class="tdText"><b>obout Interface - OboutCheckBox - Linked Fields</b></span>        
		
        <br /><br />

        <table>
            <tr>
                <td valign="top">
                    <table class="tdText">
                        <tr>
                            <td>&#160;</td>
                            <td>
                                <asp:PlaceHolder runat="server" ID="PlaceHolder1" /> 
                            </td>
                        </tr>
                        <tr>
                            <td>First Name:</td>
                            <td><obout:OboutTextBox runat="server" ID="OboutTextBox1" /></td>
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td><obout:OboutTextBox runat="server" ID="OboutTextBox2" /></td>
                        </tr>
                    </table>
                </td>
                <td width="25" valign="top">&#160;</td>
                <td valign="top">
                    <table class="tdText">
                        <tr>
                            <td>&#160;</td>
                            <td>
                                <asp:PlaceHolder runat="server" ID="PlaceHolder2" />
                            </td>
                        </tr>
                        <tr>
                            <td>First Name:</td>
                            <td><obout:OboutTextBox runat="server" ID="OboutTextBox3" /></td>
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td><obout:OboutTextBox runat="server" ID="OboutTextBox4" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">&#160;</td>
            </tr>
            <tr>
                <td valign="top">
                    <table class="tdText">
                        <tr>
                            <td width="67">&#160;</td>
                            <td>
                                <asp:PlaceHolder runat="server" ID="PlaceHolder3" /> 
                            </td>
                        </tr>
                        <tr id="Row1">
                            <td>First Name:</td>
                            <td><obout:OboutTextBox runat="server" ID="OboutTextBox5" /></td>
                        </tr>
                        <tr id="Row2">
                            <td>Last Name:</td>
                            <td><obout:OboutTextBox runat="server" ID="OboutTextBox6" /></td>
                        </tr>
                    </table>
                </td>
                <td width="25" valign="top">&#160;</td>
                <td valign="top">
                    <table class="tdText">
                        <tr>
                            <td width="67">&#160;</td>
                            <td>
                                <asp:PlaceHolder runat="server" ID="PlaceHolder4" />
                            </td>
                        </tr>
                        <tr id="Row3">
                            <td>First Name:</td>
                            <td><obout:OboutTextBox runat="server" ID="OboutTextBox7" /></td>
                        </tr>
                        <tr id="Row4">
                            <td>Last Name:</td>
                            <td><obout:OboutTextBox runat="server" ID="OboutTextBox8" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
	
		<br /><br />
		
		<span class="tdText">
		    The OboutCheckBox control can be linked to other controls, that will depend on the state of the check box.<br />
            Thus these dependent fields will be enabled / disabled or shown / hidden based on the state of the OboutCheckBox control they depend on.<br />            
            Everything is done internally by the OboutCheckBox control. <b>No extra coding is required.</b><br /><br />

            If you link obout Interface Controls to an OboutCheckBox control, these controls will be enabled / disabled based on the state <br />
            of the check box. If you link HTML elements (e.g. table rows, div elements, etc.) to an OboutCheckBox control, these controls<br />
            will be shown / hidden based on the state of the check box.<br /><br />

            The OboutCheckBox class exposes two properties that can be used for this purpose:<br />
            <ul>
                <li><b>ControlsToEnable</b> - indicates the ids of the controls that will be enabled / shown when the OboutCheckBox control is checked;</li>
                <li><b>ControlsToDisable</b> - indicates the ids of the controls that will be disabled / hidden when the OboutCheckBox control is checked;</li>
            </ul>
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>