<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/VB" runat="server">
    Dim OboutCheckBox1 As OboutCheckBox
    Dim EventLogger As OboutTextBox
    
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        OboutCheckBox1 = new OboutCheckBox()
        OboutCheckBox1.ID = "OboutCheckBox1"
        OboutCheckBox1.FolderStyle = "styles/premiere_blue/OboutCheckBox"
        OboutCheckBox1.Text = "Select Me"
        
        OboutCheckBox1.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"
        OboutCheckBox1.ClientSideEvents.OnBlur = "onBlur"
        OboutCheckBox1.ClientSideEvents.OnClick = "onClick"
        OboutCheckBox1.ClientSideEvents.OnFocus = "onFocus"

        PlaceHolder1.Controls.Add(OboutCheckBox1)
        
        
        EventLogger = new OboutTextBox()
        EventLogger.ID = "EventLogger"
        EventLogger.TextMode = TextBoxMode.MultiLine
        EventLogger.Width = Unit.Pixel(400)
        EventLogger.Height = Unit.Pixel(200)
        EventLogger.FolderStyle = "styles/premiere_blue/OboutTextBox"
        
        PlaceHolder2.Controls.Add(EventLogger)
    End Sub
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
		</style>
		<script type="text/javascript">
		    function onCheckedChanged(sender, isChecked) {
		        logEvent('The checked state of ' + sender.ID + ' has been changed to: ' + isChecked + '.');
		    }

		    function onClick(sender) {
		        logEvent(sender.ID + ' has been clicked.');
		    }

		    function onFocus(sender) {
		        logEvent(sender.ID + ' has been focused.');
		    }

		    function onBlur(sender) {
		        logEvent(sender.ID + ' has been blured.');
		    }

		    function logEvent(txt) {
		        EventLogger.value(txt + '\n' + EventLogger.value());
		    }
		</script>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutCheckBox - Client-Side Events</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		    
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder2" />
		
        <br /><br />
		
		<span class="tdText">
		    The <b>OboutCheckBox</b> control exposes several client-side events: <br />
		    <b>OnCheckedChanged, OnClick, OnFocus, OnBlur</b>.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>