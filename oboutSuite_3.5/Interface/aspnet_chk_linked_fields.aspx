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
                                <obout:OboutCheckBox runat="server" ID="OboutCheckBox1" Text="Enable Fields" Checked="true"
                                    ControlsToEnable="OboutTextBox1,OboutTextBox2"  />
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
                                <obout:OboutCheckBox runat="server" ID="OboutCheckBox2" Text="Disable Fields" Checked="true"
                                    ControlsToDisable="OboutTextBox3,OboutTextBox4"  />
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
                                <obout:OboutCheckBox runat="server" ID="OboutCheckBox3" Text="Show Fields" Checked="true"
                                    ControlsToEnable="Row1,Row2"  />
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
                                <obout:OboutCheckBox runat="server" ID="OboutCheckBox4" Text="Hide Fields" Checked="true"
                                    ControlsToDisable="Row3,Row4"  />
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