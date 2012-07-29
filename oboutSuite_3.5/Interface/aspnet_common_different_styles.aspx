<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head runat="server">
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
		<link href="resources/custom_styles/grand_gray/OboutButton/style.css" rel="Stylesheet" type="text/css" />		
		<link href="resources/custom_styles/premiere_blue/OboutButton/style.css" rel="Stylesheet" type="text/css" />	
        <link href="resources/custom_styles/plain/OboutButton/style.css" rel="Stylesheet" type="text/css" />	
		<link href="resources/custom_styles/grand_gray/OboutCheckBox/style.css" rel="Stylesheet" type="text/css" />		
		<link href="resources/custom_styles/premiere_blue/OboutCheckBox/style.css" rel="Stylesheet" type="text/css" />	
        <link href="resources/custom_styles/plain/OboutCheckBox/style.css" rel="Stylesheet" type="text/css" />		
		<link href="resources/custom_styles/grand_gray/OboutDropDownList/style.css" rel="Stylesheet" type="text/css" />		
		<link href="resources/custom_styles/premiere_blue/OboutDropDownList/style.css" rel="Stylesheet" type="text/css" />
        <link href="resources/custom_styles/plain/OboutDropDownList/style.css" rel="Stylesheet" type="text/css" />		
		<link href="resources/custom_styles/grand_gray/OboutRadioButton/style.css" rel="Stylesheet" type="text/css" />		
		<link href="resources/custom_styles/premiere_blue/OboutRadioButton/style.css" rel="Stylesheet" type="text/css" />		
        <link href="resources/custom_styles/plain/OboutRadioButton/style.css" rel="Stylesheet" type="text/css" />	
		<link href="resources/custom_styles/grand_gray/OboutTextBox/style.css" rel="Stylesheet" type="text/css" />		
		<link href="resources/custom_styles/premiere_blue/OboutTextBox/style.css" rel="Stylesheet" type="text/css" />
        <link href="resources/custom_styles/plain/OboutTextBox/style.css" rel="Stylesheet" type="text/css" />			
		<link href="resources/custom_styles/grand_gray/OboutTextBox/style_multiline.css" rel="Stylesheet" type="text/css" />		
		<link href="resources/custom_styles/premiere_blue/OboutTextBox/style_multiline.css" rel="Stylesheet" type="text/css" />		
        <link href="resources/custom_styles/plain/OboutTextBox/style_multiline.css" rel="Stylesheet" type="text/css" />		
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />				
		
		<span class="tdText"><b>obout Interface - Different Styles</b></span>
		
		<br /><br />
		<table>
		    <tr>
		        <td width="240" >
		            <span class="tdText">Button:</span>
                </td>
            </tr>
            <tr>
                <td width="240" valign="top">
		            <obout:OboutButton runat="server" ID="btn1" 
		                FolderStyle="styles/black_glass/OboutButton"
		                Width="200" Text="Press Me!" /><br /><br />
		          </td> 
		          <td width="240" valign="top">  
		            <span class="grand-gray">
		                <obout:OboutButton runat="server" ID="OboutButton1" 
		                    FolderStyle="_"
		                    Width="200" Text="Press Me!" />
		            </span><br /><br />
	            </td>
	            <td width="240" valign="top">
		            <span class="premiere_blue">
		                <obout:OboutButton runat="server" ID="OboutButton2" 
		                    FolderStyle="_"
		                    Width="200" Text="Press Me!" />
		            </span><br /><br />
            	</td>
                <td width="240" valign="top">
		            <span class="plain">
		                <obout:OboutButton runat="server" ID="OboutButton3" 
		                    FolderStyle="_"
		                    Width="200" Text="Press Me!" />
		            </span><br /><br />
            	</td>
	        </tr>
	        
        	<tr>
        	    <td>	
		            <span class="tdText">CheckBox:</span>
            	</td>
	        </tr>	
	        <tr>
	            <td valign="top">
		            <obout:OboutCheckBox runat="server" ID="chk1" Text="Select Me!" 
		                FolderStyle="styles/black_glass/OboutCheckBox"/><br /><br />
            		    
		        </td>
		        <td valign="top">
		            <span class="grand-gray">
		                <obout:OboutCheckBox runat="server" ID="OboutCheckBox1" 
		                    FolderStyle="_" Text="Select Me!"  />
		            </span><br /><br />
		       </td>
		       <td valign="top">
		            <span class="premiere_blue">
		                <obout:OboutCheckBox runat="server" ID="OboutCheckBox2" 
		                    FolderStyle="_" Text="Select Me!"  />
		            </span><br /><br />
		       </td>
               <td valign="top">
		            <span class="plain">
		                <obout:OboutCheckBox runat="server" ID="OboutCheckBox3" 
		                    FolderStyle="_" Text="Select Me!"  />
		            </span><br /><br />
		       </td>
		   </tr>
		   
           <tr>		
               <td >
		            <span class="tdText">DropDownList:</span>
		       </td>
		  </tr>
		  <tr>
		       <td valign="top">
		            <obout:OboutDropDownList runat="server" ID="ddl1" Width="200"
		                FolderStyle="styles/black_glass/OboutDropDownList">
		                <Items>
		                        <asp:ListItem>Item 1</asp:ListItem>
		                        <asp:ListItem>Item 2</asp:ListItem>
		                        <asp:ListItem>Item 3</asp:ListItem>
		                        <asp:ListItem>Item 4</asp:ListItem>
		                        <asp:ListItem>Item 5</asp:ListItem>
		                        <asp:ListItem>Item 6</asp:ListItem>
		                        <asp:ListItem>Item 7</asp:ListItem>
		                        <asp:ListItem>Item 8</asp:ListItem>
		                        <asp:ListItem>Item 9</asp:ListItem>
		                        <asp:ListItem>Item 10</asp:ListItem>
                            </Items>
		            </obout:OboutDropDownList><br /><br />
		       </td>  
		       <td valign="top">
		            <span class="grand-gray">
		                <obout:OboutDropDownList runat="server" ID="OboutDropDownList1" 
		                    FolderStyle="_"  Width="200"  >
		                    <Items>
		                        <asp:ListItem>Item 1</asp:ListItem>
		                        <asp:ListItem>Item 2</asp:ListItem>
		                        <asp:ListItem>Item 3</asp:ListItem>
		                        <asp:ListItem>Item 4</asp:ListItem>
		                        <asp:ListItem>Item 5</asp:ListItem>
		                        <asp:ListItem>Item 6</asp:ListItem>
		                        <asp:ListItem>Item 7</asp:ListItem>
		                        <asp:ListItem>Item 8</asp:ListItem>
		                        <asp:ListItem>Item 9</asp:ListItem>
		                        <asp:ListItem>Item 10</asp:ListItem>
                            </Items>
                            <CssSettings ItemsContainer="ob_iDdlIC grand-gray" />
		                </obout:OboutDropDownList>
		            </span><br /><br />
		       </td>
		       <td valign="top">
		            <span class="premiere_blue">
		                <obout:OboutDropDownList runat="server" ID="OboutDropDownList2" 
		                    FolderStyle="_"  Width="200" >
		                    <Items>
		                        <asp:ListItem>Item 1</asp:ListItem>
		                        <asp:ListItem>Item 2</asp:ListItem>
		                        <asp:ListItem>Item 3</asp:ListItem>
		                        <asp:ListItem>Item 4</asp:ListItem>
		                        <asp:ListItem>Item 5</asp:ListItem>
		                        <asp:ListItem>Item 6</asp:ListItem>
		                        <asp:ListItem>Item 7</asp:ListItem>
		                        <asp:ListItem>Item 8</asp:ListItem>
		                        <asp:ListItem>Item 9</asp:ListItem>
		                        <asp:ListItem>Item 10</asp:ListItem>
                            </Items>
                            <CssSettings ItemsContainer="ob_iDdlIC premiere_blue" />
		                </obout:OboutDropDownList>
		            </span><br /><br />
		        </td>
                 <td valign="top">
		            <span class="plain">
		                <obout:OboutDropDownList runat="server" ID="OboutDropDownList3" 
		                    FolderStyle="_"  Width="200" >
                            <Items>
		                        <asp:ListItem>Item 1</asp:ListItem>
		                        <asp:ListItem>Item 2</asp:ListItem>
		                        <asp:ListItem>Item 3</asp:ListItem>
		                        <asp:ListItem>Item 4</asp:ListItem>
		                        <asp:ListItem>Item 5</asp:ListItem>
		                        <asp:ListItem>Item 6</asp:ListItem>
		                        <asp:ListItem>Item 7</asp:ListItem>
		                        <asp:ListItem>Item 8</asp:ListItem>
		                        <asp:ListItem>Item 9</asp:ListItem>
		                        <asp:ListItem>Item 10</asp:ListItem>
                            </Items>
                            <CssSettings ItemsContainer="ob_iDdlIC plain" />
		                </obout:OboutDropDownList>
		            </span><br /><br />
		        </td>
		     </tr>
		   
		     <tr>
                <td>		
		            <span class="tdText">RadioButton:</span>
		        </td>
	        </tr>
	        <tr>
	            <td valign="top">
		            <obout:OboutRadioButton runat="server" ID="rbtn1" Text="Option 1" GroupName="SomeGroup" FolderStyle="styles/black_glass/OboutRadioButton"/> &#160;
		            <obout:OboutRadioButton runat="server" ID="rbtn2" Text="Option 2" GroupName="SomeGroup" FolderStyle="styles/black_glass/OboutRadioButton"/>
            		<br /><br />
		        </td>
		        <td valign="top">
		            <span class="grand-gray">
		                <obout:OboutRadioButton runat="server" ID="OboutRadioButton1" 
		                    FolderStyle="_" Text="Option 1" GroupName="SomeGroup1"/>&#160;
		                <obout:OboutRadioButton runat="server" ID="OboutRadioButton3" 
		                    FolderStyle="_" Text="Option 2" GroupName="SomeGroup1"/>
		            </span><br /><br />
		        </td> 
		        <td valign="top"> 
		            <span class="premiere_blue">
		                <obout:OboutRadioButton runat="server" ID="OboutRadioButton2" 
		                    FolderStyle="_" Text="Option 1" GroupName="SomeGroup2"/>&#160;
		                <obout:OboutRadioButton runat="server" ID="OboutRadioButton4" 
		                    FolderStyle="_" Text="Option 2" GroupName="SomeGroup2"/>
		            </span><br /><br />
		        </td>
                <td valign="top"> 
		            <span class="plain">
		                <obout:OboutRadioButton runat="server" ID="OboutRadioButton5" 
		                    FolderStyle="_" Text="Option 1" GroupName="SomeGroup3"/>&#160;
		                <obout:OboutRadioButton runat="server" ID="OboutRadioButton6" 
		                    FolderStyle="_" Text="Option 2" GroupName="SomeGroup3"/>
		            </span><br /><br />
		        </td>
           </tr>
          
           <tr>
               <td>
		            <span class="tdText">TextBox:</span>
		       </td>
		   </tr>
		   <tr>
		        <td valign="top">
		            <obout:OboutTextBox runat="server" ID="txt1" Width="200" Text="Some text" FolderStyle="styles/black_glass/OboutTextBox"/>
            		 <br /><br />   
		       </td> 
		       <td valign="top">  
		            <span class="grand-gray">
		                <obout:OboutTextBox runat="server" ID="OboutTextBox1" 
		                    FolderStyle="_"
		                    Width="200" Text="Some text" />
		            </span><br /><br />
		       </td>
		       <td valign="top">
		            <span class="premiere_blue">
		                <obout:OboutTextBox runat="server" ID="OboutTextBox2" 
		                    FolderStyle="_"
		                    Width="200" Text="Some text" />
		            </span><br /><br />
		        </td>
                <td valign="top">
		            <span class="plain">
		                <obout:OboutTextBox runat="server" ID="OboutTextBox5" 
		                    FolderStyle="_"
		                    Width="200" Text="Some text" />
		            </span><br /><br />
		        </td>
            </tr>
          
            <tr>
                <td >
		            <span class="tdText">MultiLine TextBox:</span>
		        </td>
		   </tr>
		   <tr>
		        <td valign="top">
		            <obout:OboutTextBox runat="server" ID="ta1" Width="200" Height="150" 
		                TextMode="MultiLine" Text="Some text" FolderStyle="styles/black_glass/OboutTextBox"/>
		                <br /><br />
		        </td>
		        <td valign="top">   
		            <span class="grand-gray">
		                <obout:OboutTextBox runat="server" ID="OboutTextBox3"   Height="150"
		                    FolderStyle="_" Width="200" TextMode="MultiLine" Text="Some text" />
		            </span><br /><br />
		        </td>
		        <td valign="top">
		            <span class="premiere_blue">
		                <obout:OboutTextBox runat="server" ID="OboutTextBox4"  Height="150"
		                    FolderStyle="_" Width="200" TextMode="MultiLine" Text="Some text" />
		            </span><br /><br />
		        </td>
                <td valign="top">
		            <span class="plain">
		                <obout:OboutTextBox runat="server" ID="OboutTextBox6"  Height="150"
		                    FolderStyle="_" Width="200" TextMode="MultiLine" Text="Some text" />
		            </span><br /><br />
		        </td>
		    </tr>
		</table>
		
		<span class="tdText">You can have controls with different styles on the same page, by using the <b>CssSettings</b> property or by using <b>custom stylesheets</b>. <br /><br />
		<b>CssSettings</b> should be used for minor customizations, <b>custom stylesheets</b> should be used when using many controls with different styles on the same page (as in this example).</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>