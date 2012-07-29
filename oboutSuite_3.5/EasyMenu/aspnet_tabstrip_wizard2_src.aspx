<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
	<title>obout ASP.NET Easy Menu examples</title>
	<style type="text/css">
			.tdText {
                font:11px Verdana;
                color:#333333;
            }
    </style>
	<script type="text/javascript">
	var lastTab = '1';
	var disTabArr = new Array();

	function SelectTab(idx)
	{
		for ( var i = 0; i< disTabArr.length ; i++)
		{
			//check this select tab is in disable tabs
			if ( disTabArr[i] == "" + idx )
			{
				return;
			}
		}
		if ( lastTab + "" == idx + "")
		{
			return;
		}
		ob_em_SelectItem("item" + idx);
		
		var lastTag = document.getElementById( "tab" + lastTab );
		var selectedTag = document.getElementById( "tab" + idx );

		//hide last tab and show selected tab
		//lastTag.style.display= "none";
		//selectedTag.style.display= "";
		var agt=navigator.userAgent.toLowerCase();
		var is_ie     = ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1));
		if ( is_ie )
		{
			lastTag.setAttribute("className", "mytab2");
			selectedTag.setAttribute("className", "mytab");
		}else{
			lastTag.setAttribute("class", "mytab2");
			selectedTag.setAttribute("class", "mytab");
		}

		lastTab = idx;

		if ( "4" == "" + idx)
		{
			//submit tab selected.
			//show Order Info
			var finalDIV = document.getElementById("final");
			var orderInfo = "<br /><br />";
			orderInfo += "Customer name: <b>" + document.myForm.name.value + "</b> - ";
			orderInfo += "Customer address: <b>" + document.myForm.address.value + "</b> <br />";
			orderInfo += "Item name: <b>" + document.myForm.item.value + "</b> - ";
			orderInfo += "Quantity: <b>" + document.myForm.qty.value + "</b> <br />";
			orderInfo += "Shipping address: <b>" + document.myForm.shipAdd.value + "</b> - ";
			orderInfo += "Shipping before day: <b>" + document.myForm.shipDate.value + "</b> <br />";

			finalDIV.innerHTML = orderInfo;
		}
	}

	//validate customer form
	function validateCS(){
		var name = document.myForm.name;
		
		SelectTab('2');
	}

	//validate Order Item form
	function validateOrder(){
		var item = document.myForm.item;
		
		SelectTab('3');
	}

	//validate shipping form
	function validateShipping(){
		
		SelectTab('4');
	}
		</script>

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
			.mytab{
				border:3px solid #D6D6D6;width:526px;height:150px;
			}
			.mytab2{
				border:3px solid #D6D6D6;width:526px;height:150px;display:none;
			}

		</style>	
		<!--[if IE]>
		<style type="text/css">
			.mytab{
				border:3px solid #D6D6D6;width:530px;height:150px;
			}
			.mytab2{
				border:3px solid #D6D6D6;width:530px;height:150px;display:none;
			}

		</style>
		<![endif]-->

	</head>
	<body>
	<form name="myForm">
	<span class="tdText"><b>ASP.NET Easy Menu - Creating a wizard with Tab Strip </b></span>
		<br />		<br />		<br />
		<table>
			<tr>
				<td>
					<oem:EasyMenu SelectedItemId="item1" id="EasymenuTabStrip" runat="server" ShowEvent="Always" StyleFolder="styles/horizontal1"
						Position="Horizontal" CSSMenu="ParentMenu" CSSMenuItemContainer="ParentItemContainer" Width="530">
						<CSSClassesCollection>
							<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" ComponentSubMenuCellOver="ParentItemSubMenuCellOver"
								ComponentContentCell="ParentItemContentCell" Component="ParentItem" ComponentSubMenuCell="ParentItemSubMenuCell"
								ComponentIconCellOver="ParentItemIconCellOver" ComponentIconCell="ParentItemIconCell"
								ComponentOver="ParentItemOver" ComponentContentCellOver="ParentItemContentCellOver"></oem:CSSClasses>
							<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver"
								ComponentContentCell="ParentSeparatorContentCell" Component="ParentSeparator"
								ComponentSubMenuCell="ParentSeparatorSubMenuCell" ComponentIconCellOver="ParentSeparatorIconCellOver"
								ComponentIconCell="ParentSeparatorIconCell" ComponentOver="ParentSeparatorOver"
								ComponentContentCellOver="ParentSeparatorContentCellOver"></oem:CSSClasses>
						</CSSClassesCollection>
						<Components>
							<oem:MenuItem InnerHtml="<span style='cursor:default'>Customer</span>" OnClientClick="SelectTab('1')" ID="item1"></oem:MenuItem>
							<oem:MenuItem InnerHtml="<span style='cursor:default'>Order Item</span>" OnClientClick="SelectTab('2')" ID="item2"></oem:MenuItem>
							<oem:MenuItem InnerHtml="<span style='cursor:default'>Shipping</span>" OnClientClick="SelectTab('3')" ID="item3"></oem:MenuItem>
							<oem:MenuItem InnerHtml="<span style='cursor:default'>Submit</span>" OnClientClick="SelectTab('4')" ID="item4"></oem:MenuItem>
						</Components>
					</oem:EasyMenu>
					<div class="mytab" id="tab1">
							<table width="100%" height="100%">
								<tr>
									<td valign="middle" align="center">
										<table width="100%">
											<tr>
												<td valign="middle" align="left" width="150" class="tdtext">
													Customer name: 
												</td>
												<td valign="middle" align="left" class="tdtext">
													<input type="text" id="name" value="" maxlength="40" class="tdtext">
												</td>
											</tr>
											<tr>
												<td valign="middle" align="left" width="150" class="tdtext">
													Customer address: 
												</td>
												<td valign="middle" align="left" class="tdtext">
													<input type="text" id="address" value="" class="tdtext">
												</td>
											</tr>
											<tr>
												<td valign="middle" align="center" colspan="2"><br />
													<table width="100%" >
														<tr>
															<td width="50%" align="right">&nbsp;</td>
															<td align="left"><input type="button" value="  Next Step  " onclick="validateCS();" class="tdtext"></td>
														</tr>
													</table>													
												</td>
											</tr>
											
										</table>
									</td>
								</tr>
							</table>
					</div>
					<div class="mytab2" id="tab2">
							<table width="100%" height="100%">
								<tr>
									<td valign="middle" align="center">
										<table width="100%">
											<tr>
												<td valign="middle" align="left" width="150" class="tdtext">
													Item name: 
												</td>
												<td valign="middle" align="left" class="tdtext">
													<select id="item" class="tdtext">
														<option value ="">Select one</option>
														<option value ="LCD Samsung 15">LCD Samsung 15</option>
														<option value ="LCD Samsung 19">LCD Samsung 19</option>
														<option value ="LCD Samsung 22">LCD Samsung 22</option>
														<option value ="LCD Dell 15">LCD Dell 15</option>
														<option value ="LCD Dell 19">LCD Dell 19</option>
														<option value ="LCD Dell 22">LCD Dell 22</option>
														<option value ="CRT Samsung 15">CRT Samsung 15</option>
														<option value ="CRT Samsung 19">CRT Samsung 19</option>
														<option value ="CRT Samsung 22">CRT Samsung 22</option>
														<option value ="CRT Dell 15">CRT Dell 15</option>
														<option value ="CRT Dell 19">CRT Dell 19</option>
														<option value ="CRT Dell 22">CRT Dell 22</option>
													</select>
												</td>
											</tr>
											<tr>
												<td valign="middle" align="left" width="150" class="tdtext">
													Quantity: 
												</td>
												<td valign="middle" align="left" class="tdtext">
													<input type="text" id="qty" value="" class="tdtext">
												</td>
											</tr>
											<tr>
												<td valign="middle" align="center" colspan="2"><br />
													<table width="100%" >
														<tr>
															<td width="50%" align="right">
																<input type="button" value="     Back    " onclick="SelectTab('1');" class="tdtext">&nbsp;&nbsp;&nbsp;&nbsp;
															</td>
															<td align="left"><input type="button" value="  Next Step  " onclick="validateOrder();" class="tdtext"></td>
														</tr>
													</table>													
												</td>
											</tr>
																					</table>
									</td>
								</tr>
							</table>
					</div>
					<div class="mytab2" id="tab3">
						<table width="100%" height="100%">
							<tr>
								<td valign="middle" align="center">
									<table width="100%">
										<tr>
											<td valign="middle" align="left" width="150" class="tdtext">
												Shipping address: 
											</td>
											<td valign="middle" align="left" class="tdtext">
												<input type="text" id="shipAdd" value="" maxlength="40" class="tdtext">
											</td>
										</tr>
										<tr>
											<td valign="middle" align="left" width="150" class="tdtext">
												Shipping before day: 
											</td>
											<td valign="middle" align="left" class="tdtext">
												<input type="text" name="shipDate" id="shipDate" value="" class="tdtext">
											</td>
										</tr>
										<tr>
											<td valign="middle" align="center" colspan="2"><br />
												<table width="100%" >
													<tr>
														<td width="50%" align="right">
															<input type="button" value="     Back    " onclick="SelectTab('2');" class="tdtext">&nbsp;&nbsp;&nbsp;&nbsp;
														</td>
														<td align="left"><input type="button" value="  Next Step  " onclick="validateShipping();" class="tdtext"></td>
													</tr>
												</table>	
											</td>
										</tr>
										
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div class="mytab2" id="tab4">
							<table width="100%" height="100%">
								<tr>
									<td valign="middle" align="center">
										<div style="border:1px solid #D6D6D6;width:500px;height:100px;" id="final" class="tdtext"></div><br />
										<input type="button" value="     Back    " onclick="SelectTab('3');" class="tdtext">&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="submit" value="   Submit    " onclick="alert('In real application, this Order is submitted.'); return false;" class="tdtext">
									</td>
								</tr>
							</table>
					</div>
					</form>
				</td>
			</tr>
		</table>

        <br /><br /><br />
		    
		<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>

	</body>
</html>