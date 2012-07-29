<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<script language="C#" runat="server">
	public void ServerSetValueText() {
		// this will set the value of element with id "textElement" to a custom value
		// just to show that it works with input elements (textboxes)
		SetValue("textElement", "someCustomValue");
	}
	
	public void ServerSetValueSelect() {
		// this will set the value of element with id "selectElement" to a custom value
		// just to show that it works with dropdown elements (comboboxes)
		SetValue("selectElement", "3");
	}
	
	public void ServerSetValueTextarea() {
		// this will set the value of element with id "textareaElement" to a custom value
		// just to show that it works with textareas
		SetValue("textareaElement", "some custom text");
	}
</script>

<html>
	<head runat="server">
		<script language="JavaScript">
			function SetValueText() {
				ob_post.post(null, 'ServerSetValueText', function(){});
			}
			
			function SetValueSelect() {
				ob_post.post(null, 'ServerSetValueSelect', function(){});
			}
			
			function SetValueTextarea() {
				ob_post.post(null, 'ServerSetValueTextarea', function(){});
			}
		</script>
		<style>
			.title {font-size: X-Large; padding: 20px; border-bottom: 2px solid gray; width: 100%; }
		</style>
	</head>
	<body>
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">SetValue</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<b style="font-size:12px">input elemets (textbox)</b><br />
		<input type="text" id="textElement" value="initialValue" style="width: 320px">
		<br />
		<input type="button" id="button10" onclick="SetValueText()" value="Callback now!"></input>
		<br />
		<br />
		<b style="font-size:12px">dropdownlist</b><br />
		<select id="selectElement" style="width: 320px;">
			<option value="1" selected>option 1</option>
			<option value="2">option 2</option>
			<option value="3">option 3</option>
			<option value="4">option 4</option>
			<option value="5">option 5</option>
			<option value="6">option 6</option>
			<option value="7">option 7</option>
			<option value="8">option 8</option>
			<option value="9">option 9</option>
		</select>
		<br />
		<input type="button" id="button11" onclick="SetValueSelect()" value="Callback now!"></input>
		<br />
		<br />
		<b style="font-size:12px">textarea</b>
		<br />
		<textarea id="textareaElement" style="width: 320px;">initial text</textarea>
		<br />
		<input type="button" id="button12" onclick="SetValueTextarea()" value="Callback now!"></input>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	</body>
</html>
		