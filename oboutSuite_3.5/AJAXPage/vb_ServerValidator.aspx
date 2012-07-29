<%@ Page Language="vb" Inherits="vb_ServerValidator" Src="vb_ServerValidator.aspx.vb"%>

<html>
	<head runat="server"> 
		<style>
			.error {font: 8pt Tahoma; color:red; display:none;}
			.note {font: 7pt Tahoma; color:gray;}
			td {font: 10pt Tahoma; margin: 20px;}
			.title {font-size: X-Large; padding: 20px; border-bottom: 2px solid gray; width: 100%; }
		</style>
		
		<script type="text/javascript">
		
		function TriggerServerValidate(element, serverValidateMethod)
		{	
			ob_post.AddParam("elementValue", element.value);
			ob_post.AddParam("elementID", element.id);
			if (serverValidateMethod == "unique")
				ob_post.post(null, serverValidateMethod, endValidate);
			else
				ob_post.post(null, serverValidateMethod, "function(){}");
		}
		
		function endValidate(result)
		{	
			var elementID = result.elementID + "Result";
			if (result.valid)
				document.getElementById(elementID).style.display = "inline";
			else
				document.getElementById(elementID).style.display = "none";
				
		}
		
		function ProcessValidationOnClient(response)
		{
			var valid = false;
			var elementID = "";
			for (key in response.content)
			{
				var value = response.content[key];
				
				switch(key)
				{
					case "valid":
						valid = value;
					break;
					
					case "elementID":
						elementID = value + "Validator";
					break;
				}
			}
			
			if (!valid)
				document.getElementById(elementID).style.display = "inline";
			else
				document.getElementById(elementID).style.display = "none";
		}
		</script>
	</head>
	<body>
	<table border="0">
		<tr>
			<td valign="top" width="690" colspan="4">
				<span class="title">Server Data Validator "On the fly" - Examples</span><br /><br /><br />
			</td>
		</tr>
		<tr>
			<td>
				<b>Example 1</b>
				<br>
				<table border="0">
					<tr>
						<td valign="top" class="h5" width="630">
							Try to add a new username.<br />
							The username must be unique in the list of taken usernames. <br />
							The validation is made on server side, <span style="color:crimson;">without reloading the page</span>.
							<br />
							<br />
						</td>
					</tr>
					<tr>
						<td valign="top" style="width:100%">    
							<table width="100%">
								<tr>
									<td style="width:120px" valign="top" class="tdText">
										Username:
									</td>
									<td valign="top" style="width:300px">
										<input type="text" value="David" id="txtUsername"/>
										<br />
										<div class="error" id="txtUsernameValidator">
											<nobr><img src="images/requiredIcon_ani.gif" /> 
											Please enter an unique username.<br />
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Allowed characters are letters, numbers, _ and -.<br />
											</nobr>
										</div>
										<br />
										<input type="button" value="Add Username" onClick="TriggerServerValidate(document.getElementById('txtUsername'), 'unique')" />
										<br />
										<br />
										<div class="error" id="txtUsernameResult">
											<nobr>
												The username is correct.<br />
											</nobr>
										</div>
									</td>
									<td class="tdText">
										<div>
											<b>Already taken usernames:</b>
											<ul>
												<li>John</li>
												<li>David</li>
												<li>Tim</li>
												<li>Sheldon</li>
												<li>Kim</li>
											</ul>
										</div>
									</td>
								</tr>
							</table>
						</td>	
					</tr>
				</table>
				<br />
				<br />
				<b>Example 2</b>
				<br>
				<table border="0">
					<tr>
						<td valign="top" class="h5" width="630">
							When focus moves out from the input field, data is validated on server side and
							<br />
							error is shown in red color below the input field, <span style="color:crimson;">without reloading the page</span>.
							<br />
							<br />
							<br />
						</td>
					</tr>
					<tr>
						<td valign="top" style="width:100%">    
							<table width="100%">
								<tr>
									<td style="width:120px" valign="top" class="tdText">
										Name:
									</td>
									<td valign="top">
										<input type="text" id="txtName" onBlur="TriggerServerValidate(document.getElementById('txtName'), 'required')" />
										<br />
										<div class="error" id="txtNameValidator">
											<nobr><img src="images/requiredIcon_ani.gif" /> 
											Please enter a valid name. Allowed characters are letters, numbers, _ and -.</nobr>
										</div>
									</td>
								</tr>
								<tr>
									<td valign="top" class="tdText">
										Phone:
									</td>
									<td valign="top">
										<input type="text" id="txtPhone" onBlur="TriggerServerValidate(document.getElementById('txtPhone'), 'phoneNumber')" /> 
										<span class="note">* Phone number format is: (###) ###-####</span>
										<br />
										<div class="error" id="txtPhoneValidator">
											<nobr><img src="images/requiredIcon_ani.gif" /> 
											&nbsp;&nbsp;Please enter a phone number in the format:(###) ###-####</nobr></div>
									</td>
								</tr>
							</table>
						</td>	
					</tr>
				</table>
				<br />
			</td>
		</tr>
	</table>
	<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=VBNET">« Back to examples</a>
</body>
</html>