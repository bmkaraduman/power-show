<%@ Page Language="C#" Inherits="cs_addparam2" Src="cs_addparam2.aspx.cs" %>
<html>
	<head runat="server">
		<script language="JavaScript">
			var i = 1;
			function incr() {
				UpdateDiv();
				document.getElementById("pvalue").value="";
				if (i < 10){
					i++;
					document.getElementById("parameter").value="Param" + i;
					document.getElementById("pvalue").value="Value" + i;
				}
				else{
					ob_post.post(null,"onAddParam", function(result, ex){alert(result); ClearDiv();});
				}
			}
			
			function UpdateDiv() {
				var divOld = DivGetContent();
				
				var newLine = i == 1 ? "" : "<br />";
				var newValue = newLine + document.getElementById('parameter').value + 
					": <span style='color:crimson'>" + document.getElementById('pvalue').value + "</span>";
				
				DivSetContent(divOld + newValue);
			}
			
			function ClearDiv() {
				i = 1;
				document.getElementById('pvalue').value='Value' + i;
				document.getElementById("parameter").value="Param" + i;
				DivSetContent("");
			}
			
			function DivGetContent() {
				return document.getElementById("divParams").innerHTML;
				
				if (typeof(document.getElementById("divParams").textContent) == 'undefined')
					return document.getElementById("divParams").innerText;
				else // mozilla compatibility
					return document.getElementById("divParams").textContent;
			}
			
			function DivSetContent(content) {
				document.getElementById("divParams").innerHTML = content;
				
				return;
				
				if (typeof(document.getElementById("divParams").textContent) == 'undefined')
					document.getElementById("divParams").innerText = content;
				else // mozilla compatibility
					document.getElementById("divParams").textContent = content;
					
			}
			
			function AddParam() {	
				ob_post.AddParam(document.getElementById('parameter').value, document.getElementById('pvalue').value);
				incr();
			}
			
			function ResetParams() {
				ob_post.ResetParams();
				ClearDiv();
			}
			
			function Callback() {
				ob_post.post(null,'onAddParam', 
					function(result, ex) {
						alert(result); 
						ClearDiv();
					}
				);
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
					<span class="title">AddParam</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td style="width:200px" align="left">
					<table border=0>
						<tr>
							<td class="tdText" style="padding-left:20px;">
								Parameter:
							</td>
							<td>
								<input  type="text" name="parameter" id="parameter" value="Param1" readonly="true">
							</td>
						</tr>
						<tr>
							<td class="tdText" style="padding-left:20px;">
								Value:
							</td>
							<td>
								<input type="text" name="pvalue" id="pvalue" value="Value1">
							</td>
						</tr>
					</table>
				</td>
				<td rowspan="2" style="padding-left:100px" valign="top" class="bodyStyle">
					List of added parameters:
					<div id="divParams" style="width:140px;height:140px;border:1px solid gray;padding-top:5px;padding-left:5px;padding-bottom:5px;padding-right:5px;overflow:auto" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" id="button1" onclick="AddParam();" value="AddParam"></input>
					&nbsp;&nbsp;
					<input type="button" id="button1" onclick="ResetParams();" value="ResetParams"></input>
					<br><br>
					<input type="button" id="button2" onclick="Callback();" value="Callback now!"></input>
				</td>
			</tr>
		</table>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	</body>
</html>
