<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script language="VB" runat="server">
    Dim ddl1 As OboutDropDownList

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ddl1 = New OboutDropDownList()
        ddl1.ID = "ddl1"
        ddl1.Width = Unit.Pixel(200)
        ddl1.Height = Unit.Pixel(200)
        ddl1.DataSourceID = "sds1"
        ddl1.DataTextField = "ShipCountry"
        ddl1.DataValueField = "ShipCountry"
        ddl1.AppendDataBoundItems = True
        ddl1.FolderStyle = "styles/grand_gray/OboutDropDownList"

        ddl1.Items.Add(New ListItem("Select a country ..."))
        
        ddlPlaceHolder.Controls.Add(ddl1)
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
			
			.main
			{
			    position: relative;
			}
			
			.buttons-container
			{
			    position: relative;
			    left: 240px;
			    top: 0px;
			    margin-top: -17px;
			}
			
			.button
			{
			    font:11px Verdana;
				color:#333333;
				width: 175px;
			}
		</style>
		<script type="text/javascript">
		    function getValue() {
		        alert(ddl1.value());
		    }

		    function setValue() {
		        ddl1.value('USA');
		    }

		    function getIndex() {
		        alert(ddl1.selectedIndex());
		    }

		    function setIndex() {
		        ddl1.selectedIndex(5);
		    }

		    function getValueByIndex() {
		        alert(ddl1.options[6].value);
		    }

		    function getTextByIndex() {
		        alert(ddl1.options[7].value);
		    }

		    function addOption() {
		        ddl1.options.add('Some Country', '230');		    
		    }

		    function removeOption() {
		        ddl1.options.remove(2);
		    }

		    function clearOptions() {
		        ddl1.options.clear();
		    }

		    function openDdl() {
		        ddl1.open();
		    }

		    function closeDdl() {
		        ddl1.close();
		    }

		    function setChangeEvent() {
		        ddl1.onchange = onChange;
		    }

		    function removeChangeEvent() {
		        ddl1.onchange = null;
		    }

		    function onChange(sender, index) {
		        alert('A new country was selected: ' + sender.options[index].text);
		    }

		    function enable() {
		        ddl1.enable();
		    }

		    function disable() {
		        ddl1.disable();
		    }
		    
		</script>		
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutDropDownList - Client-Side Manipulation</b></span>
		
		<br /><br />
		
		<div class="main">
		    <asp:PlaceHolder runat="server" ID="ddlPlaceHolder" />
		    
		    <div class="buttons-container">
		        <input type="button" value="Get Selected Value" class="button" onclick="getValue()" /> <span class="option2">alert(ddl1.value());</span>
		        
		        <br /><br />
		        
		        <input type="button" value="Set Selected Value" class="button" onclick="setValue()" /> <span class="option2">ddl1.value('USA');</span>
		        
		        <br /><br />
		        
		        <input type="button" value="Get Selected Index" class="button" onclick="getIndex()" /> <span class="option2">alert(ddl1.selectedIndex());</span>
		        
		        <br /><br />
		        
		        <input type="button" value="Set Selected Index" class="button" onclick="setIndex()" /> <span class="option2">ddl1.selectedIndex(5);</span>
		        
		        <br /><br />
		        
		        <input type="button" value="Get Value by Index" class="button" onclick="getValueByIndex()" /> <span class="option2">alert(ddl1.options[6].value);</span>
		        
		        <br /><br />
		        
		        <input type="button" value="Get Text by Index" class="button" onclick="getTextByIndex()" /> <span class="option2">alert(ddl1.options[7].text);</span>
		        
		        <br /><br />
		        
		        <input type="button" value="Add Option" class="button" onclick="addOption()" /> <span class="option2">ddl1.options.add('Some Country', '230');</span>
		        
		        <br /><br />
		        
		        <input type="button" value="Remove Option" class="button" onclick="removeOption()" /> <span class="option2">ddl1.options.remove(2);</span>
		        
		        <br /><br />
		        
		        <input type="button" value="Remove All Options" class="button" onclick="clearOptions()" /> <span class="option2">ddl1.options.clear();</span>
		        
		        <br /><br />		        		        
		
		        <input type="button" value="Enable" class="button" onclick="enable()" /> <span class="option2">ddl1.enable();</span>
        		        
                <br /><br />
                
                <input type="button" value="Disable" class="button" onclick="disable()" /> <span class="option2">ddl1.disable();</span>
		        
		        <br /><br />
		        
		        <input type="button" value="Open" class="button" onclick="openDdl()" /> <span class="option2">ddl1.open();</span>
		        
		        <br /><br />
		        
		        <input type="button" value="Close" class="button" onclick="closeDdl()" /> <span class="option2">ddl1.close();</span>
		        
		        <br /><br />
		        
		        <input type="button" value="Attach 'onchange' handler" class="button" onclick="setChangeEvent()" /> <span class="option2">ddl1.onchange = onChange;</span>
		        
		        <br /><br />
		        
		        <input type="button" value="Remove 'onchange' handler" class="button" onclick="removeChangeEvent()" /> <span class="option2">ddl1.onchange = null;</span>
		    </div>
		</div>								
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br />
		
		<span class="tdText">
		    The <b>OboutDropDownList</b> exposes many client-side methods that allow you manipulate the control on the client-side.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>