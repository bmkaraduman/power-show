<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>


<script language="C#" runat="server">
    OboutButton btn1;
    OboutButton btn2;
    OboutButton btn3;
    OboutButton btn4;
    OboutCheckBox chk1;
    OboutCheckBox chk2;
    OboutCheckBox chk3;
    OboutCheckBox chk4;
    OboutDropDownList ddl1;
    OboutDropDownList ddl2;
    OboutDropDownList ddl3;
    OboutDropDownList ddl4;
    OboutRadioButton rbtn1;
    OboutRadioButton rbtn2;
    OboutRadioButton rbtn3;
    OboutRadioButton rbtn4;
    OboutRadioButton rbtn5;
    OboutRadioButton rbtn6;
    OboutRadioButton rbtn7;
    OboutRadioButton rbtn8;
    OboutTextBox txt1;
    OboutTextBox txt2;
    OboutTextBox txt3;
    OboutTextBox txt4;
    OboutTextBox txt5;
    OboutTextBox txt6;
    OboutTextBox txt7;
    OboutTextBox txt8;
    void Page_load(object sender, EventArgs e)
    {
        btn1 = new OboutButton();
        btn1.ID = "btn1";
        btn1.Width = Unit.Pixel(200);
        btn1.FolderStyle = "styles/black_glass/OboutButton";
        btn1.Text = "Press Me!";

        btnPlaceHolder1.Controls.Add(btn1);

        btn2 = new OboutButton();
        btn2.ID = "btn2";
        btn2.Width = Unit.Pixel(200);
        btn2.FolderStyle = "_";
        btn2.Text = "Press Me!";

        btnPlaceHolder2.Controls.Add(btn2);

        btn3 = new OboutButton();
        btn3.ID = "btn3";
        btn3.Width = Unit.Pixel(200);
        btn3.FolderStyle = "_";
        btn3.Text = "Press Me!";

        btnPlaceHolder3.Controls.Add(btn3);

        btn4 = new OboutButton();
        btn4.ID = "btn4";
        btn4.Width = Unit.Pixel(200);
        btn4.FolderStyle = "_";
        btn4.Text = "Press Me!";

        btnPlaceHolder4.Controls.Add(btn4);
            
        chk1 = new OboutCheckBox();
        chk1.ID = "chk1";
        chk1.FolderStyle = "styles/black_glass/OboutCheckBox";
        chk1.Text = "Select Me!";

        chkPlaceHolder1.Controls.Add(chk1);

        chk2 = new OboutCheckBox();
        chk2.ID = "chk2";
        chk2.FolderStyle = "_";
        chk2.Text = "Select Me!";

        chkPlaceHolder2.Controls.Add(chk2);

        chk3 = new OboutCheckBox();
        chk3.ID = "chk3";
        chk3.FolderStyle = "_";
        chk3.Text = "Select Me!";

        chkPlaceHolder3.Controls.Add(chk3);
        
        chk4 = new OboutCheckBox();
        chk4.ID = "chk4";
        chk4.FolderStyle = "_";
        chk4.Text = "Select Me!";

        chkPlaceHolder4.Controls.Add(chk4);
        
        ddl1 = new OboutDropDownList();
        ddl1.ID = "ddl1";
        ddl1.FolderStyle = "styles/black_glass/OboutDropDownList";
        ddl1.Width = Unit.Pixel(200);

        ddl1.Items.Add(new ListItem("Item 1"));
        ddl1.Items.Add(new ListItem("Item 2"));
        ddl1.Items.Add(new ListItem("Item 3"));
        ddl1.Items.Add(new ListItem("Item 4"));
        ddl1.Items.Add(new ListItem("Item 5"));
        ddl1.Items.Add(new ListItem("Item 6"));
        ddl1.Items.Add(new ListItem("Item 7"));
        ddl1.Items.Add(new ListItem("Item 8"));
        ddl1.Items.Add(new ListItem("Item 9"));
        ddl1.Items.Add(new ListItem("Item 10"));

        ddlPlaceHolder1.Controls.Add(ddl1);

        ddl2 = new OboutDropDownList();
        ddl2.ID = "ddl2";
        ddl2.FolderStyle = "_";
        ddl2.Width = Unit.Pixel(200);

        ddl2.Items.Add(new ListItem("Item 1"));
        ddl2.Items.Add(new ListItem("Item 2"));
        ddl2.Items.Add(new ListItem("Item 3"));
        ddl2.Items.Add(new ListItem("Item 4"));
        ddl2.Items.Add(new ListItem("Item 5"));
        ddl2.Items.Add(new ListItem("Item 6"));
        ddl2.Items.Add(new ListItem("Item 7"));
        ddl2.Items.Add(new ListItem("Item 8"));
        ddl2.Items.Add(new ListItem("Item 9"));
        ddl2.Items.Add(new ListItem("Item 10"));

        ddl2.CssSettings.ItemsContainer = "ob_iDdlIC grand-gray";
        ddlPlaceHolder2.Controls.Add(ddl2);

        ddl3 = new OboutDropDownList();
        ddl3.ID = "ddl3";
        ddl3.FolderStyle = "_";
        ddl3.Width = Unit.Pixel(200);

        ddl3.Items.Add(new ListItem("Item 1"));
        ddl3.Items.Add(new ListItem("Item 2"));
        ddl3.Items.Add(new ListItem("Item 3"));
        ddl3.Items.Add(new ListItem("Item 4"));
        ddl3.Items.Add(new ListItem("Item 5"));
        ddl3.Items.Add(new ListItem("Item 6"));
        ddl3.Items.Add(new ListItem("Item 7"));
        ddl3.Items.Add(new ListItem("Item 8"));
        ddl3.Items.Add(new ListItem("Item 9"));
        ddl3.Items.Add(new ListItem("Item 10"));
        
        ddl3.CssSettings.ItemsContainer = "ob_iDdlIC premiere_blue";
        ddlPlaceHolder3.Controls.Add(ddl3);

        ddl4 = new OboutDropDownList();
        ddl4.ID = "ddl4";
        ddl4.FolderStyle = "_";
        ddl4.Width = Unit.Pixel(200);

        ddl4.Items.Add(new ListItem("Item 1"));
        ddl4.Items.Add(new ListItem("Item 2"));
        ddl4.Items.Add(new ListItem("Item 4"));
        ddl4.Items.Add(new ListItem("Item 5"));
        ddl4.Items.Add(new ListItem("Item 6"));
        ddl4.Items.Add(new ListItem("Item 7"));
        ddl4.Items.Add(new ListItem("Item 8"));
        ddl4.Items.Add(new ListItem("Item 9"));
        ddl4.Items.Add(new ListItem("Item 10"));

        ddl4.CssSettings.ItemsContainer = "ob_iDdlIC plain";
        ddlPlaceHolder4.Controls.Add(ddl4);
            
        rbtn1 = new OboutRadioButton();
        rbtn1.ID = "rbtn1";
        rbtn1.Text = "Option 1";
        rbtn1.FolderStyle = "styles/black_glass/OboutRadioButton";
        rbtn1.GroupName = "SomeGroup";

        rbtnPlaceHolder1.Controls.Add(rbtn1);

        rbtn2 = new OboutRadioButton();
        rbtn2.ID = "rbtn2";
        rbtn2.Text = "Option 2";
        rbtn2.FolderStyle = "styles/black_glass/OboutRadioButton";
        rbtn2.GroupName = "SomeGroup";

        rbtnPlaceHolder2.Controls.Add(rbtn2);

        rbtn3 = new OboutRadioButton();
        rbtn3.ID = "rbtn3";
        rbtn3.Text = "Option 1";
        rbtn3.FolderStyle = "_";
        rbtn3.GroupName = "SomeGroup1";

        rbtnPlaceHolder3.Controls.Add(rbtn3);

        rbtn4 = new OboutRadioButton();
        rbtn4.ID = "rbtn4";
        rbtn4.Text = "Option 2";
        rbtn4.FolderStyle = "_";
        rbtn4.GroupName = "SomeGroup1";

        rbtnPlaceHolder4.Controls.Add(rbtn4);

        rbtn5 = new OboutRadioButton();
        rbtn5.ID = "rbtn5";
        rbtn5.Text = "Option 1";
        rbtn5.FolderStyle = "_";
        rbtn5.GroupName = "SomeGroup2";

        rbtnPlaceHolder5.Controls.Add(rbtn5);

        rbtn6 = new OboutRadioButton();
        rbtn6.ID = "rbtn6";
        rbtn6.Text = "Option 2";
        rbtn6.FolderStyle = "_";
        rbtn6.GroupName = "SomeGroup2";

        rbtnPlaceHolder6.Controls.Add(rbtn6);

        rbtn7 = new OboutRadioButton();
        rbtn7.ID = "rbtn7";
        rbtn7.Text = "Option 1";
        rbtn7.FolderStyle = "_";
        rbtn7.GroupName = "SomeGroup3";

        rbtnPlaceHolder7.Controls.Add(rbtn7);

        rbtn8 = new OboutRadioButton();
        rbtn8.ID = "rbtn8";
        rbtn8.Text = "Option 2";
        rbtn8.FolderStyle = "_";
        rbtn8.GroupName = "SomeGroup3";

        rbtnPlaceHolder8.Controls.Add(rbtn8);
            
        txt1 = new OboutTextBox();
        txt1.ID = "txt1";
        txt1.Width = Unit.Pixel(200);
        txt1.Text = "Some text ...";
        txt1.FolderStyle = "styles/black_glass/OboutTextBox";

        txtPlaceHolder1.Controls.Add(txt1);

        txt2 = new OboutTextBox();
        txt2.ID = "txt2";
        txt2.Width = Unit.Pixel(200);
        txt2.Text = "Some text ...";
        txt2.FolderStyle = "styles/black_glass/OboutTextBox";

        txtPlaceHolder2.Controls.Add(txt2);

        txt3 = new OboutTextBox();
        txt3.ID = "txt3";
        txt3.Width = Unit.Pixel(200);
        txt3.Text = "Some text ...";
        txt3.FolderStyle = "styles/black_glass/OboutTextBox";

        txtPlaceHolder3.Controls.Add(txt3);

        txt7 = new OboutTextBox();
        txt7.ID = "txt7";
        txt7.Width = Unit.Pixel(200);
        txt7.Text = "Some text ...";
        txt7.FolderStyle = "_";

        txtPlaceHolder4.Controls.Add(txt7);
            
        txt4 = new OboutTextBox();
        txt4.ID = "txt4";
        txt4.Width = Unit.Pixel(200);
        txt4.Height = Unit.Pixel(150);
        txt4.Text = "Some text ...";
        txt4.TextMode = TextBoxMode.MultiLine;
            
        txt4.FolderStyle = "styles/black_glass/OboutTextBox";

        taPlaceHolder1.Controls.Add(txt4);

        txt5 = new OboutTextBox();
        txt5.ID = "txt5";
        txt5.Width = Unit.Pixel(200);
        txt5.Height = Unit.Pixel(150);
        txt5.Text = "Some text ...";
        txt5.TextMode = TextBoxMode.MultiLine;

        txt5.FolderStyle = "_";

        taPlaceHolder2.Controls.Add(txt5);

        txt6 = new OboutTextBox();
        txt6.ID = "txt6";
        txt6.Width = Unit.Pixel(200);
        txt6.Height = Unit.Pixel(150);
        txt6.Text = "Some text ...";
        txt6.TextMode = TextBoxMode.MultiLine;

        txt6.FolderStyle = "_";

        taPlaceHolder3.Controls.Add(txt6);
        
        txt8 = new OboutTextBox();
        txt8.ID = "txt8";
        txt8.Width = Unit.Pixel(200);
        txt8.Height = Unit.Pixel(150);
        txt8.Text = "Some text ...";
        txt8.TextMode = TextBoxMode.MultiLine;

        txt8.FolderStyle = "_";

        taPlaceHolder4.Controls.Add(txt8);
    }
   
</script>

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
                    <asp:PlaceHolder runat="server" ID="btnPlaceHolder1" />
		            <br /><br />
		          </td> 
		          <td width="240" valign="top">  
		            <span class="grand-gray">
		                <asp:PlaceHolder runat="server" ID="btnPlaceHolder2" />
		                
		            </span><br /><br />
	            </td>
	            <td width="240" valign="top">
		            <span class="premiere_blue">
		                <asp:PlaceHolder runat="server" ID="btnPlaceHolder3" />
		                
		            </span><br /><br />
            	</td>
                <td width="240" valign="top">
		            <span class="plain">
		                <asp:PlaceHolder runat="server" ID="btnPlaceHolder4" />
		                
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
	                <asp:PlaceHolder runat="server" ID="chkPlaceHolder1" />
		            <br /><br />
            		    
		        </td>
		        <td valign="top">
		            <span class="grand-gray">
		                <asp:PlaceHolder runat="server" ID="chkPlaceHolder2" />
		                
		            </span><br /><br />
		       </td>
		       <td valign="top">
		            <span class="premiere_blue">
		                <asp:PlaceHolder runat="server" ID="chkPlaceHolder3" />
		                
		            </span><br /><br />
		       </td>
               <td valign="top">
		            <span class="plain">
		                <asp:PlaceHolder runat="server" ID="chkPlaceHolder4" />
		                
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
		        <asp:PlaceHolder runat="server" ID="ddlPlaceHolder1" />
		            <br /><br />
		       </td>  
		       <td valign="top">
		            <span class="grand-gray">
		                <asp:PlaceHolder runat="server" ID="ddlPlaceHolder2" />
		                
		            </span><br /><br />
		       </td>
		       <td valign="top">
		            <span class="premiere_blue">
		                <asp:PlaceHolder runat="server" ID="ddlPlaceHolder3" />
		                
		            </span><br /><br />
		        </td>
                <td valign="top">
		            <span class="plain">
		                <asp:PlaceHolder runat="server" ID="ddlPlaceHolder4" />
		                
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
	                <asp:PlaceHolder runat="server" ID="rbtnPlaceHolder1" />&#160;
		            <asp:PlaceHolder runat="server" ID="rbtnPlaceHolder2" />
            		<br /><br />
		        </td>
		        <td valign="top">
		            <span class="grand-gray">
		                <asp:PlaceHolder runat="server" ID="rbtnPlaceHolder3" />&#160;
		                <asp:PlaceHolder runat="server" ID="rbtnPlaceHolder4" />
		            </span><br /><br />
		        </td> 
		        <td valign="top"> 
		            <span class="premiere_blue">
		                <asp:PlaceHolder runat="server" ID="rbtnPlaceHolder5" />&#160;
		                <asp:PlaceHolder runat="server" ID="rbtnPlaceHolder6" />
		            </span><br /><br />
		        </td>
                <td valign="top"> 
		            <span class="plain">
		                <asp:PlaceHolder runat="server" ID="rbtnPlaceHolder7" />&#160;
		                <asp:PlaceHolder runat="server" ID="rbtnPlaceHolder8" />
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
		            <asp:PlaceHolder runat="server" ID="txtPlaceHolder1" />
		            
            		 <br /><br />   
		       </td> 
		       <td valign="top">  
		            <span class="grand-gray">
		                <asp:PlaceHolder runat="server" ID="txtPlaceHolder2" />
		                
		            </span><br /><br />
		       </td>
		       <td valign="top">
		            <span class="premiere_blue">
		                <asp:PlaceHolder runat="server" ID="txtPlaceHolder3" />
		                
		            </span><br /><br />
		        </td>
                <td valign="top">
		            <span class="plain">
		                <asp:PlaceHolder runat="server" ID="txtPlaceHolder4" />
		                
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
		            <asp:PlaceHolder runat="server" ID="taPlaceHolder1" />
		            
		                <br /><br />
		        </td>
		        <td valign="top">   
		            <span class="grand-gray">
		                <asp:PlaceHolder runat="server" ID="taPlaceHolder2" />
		                
		            </span><br /><br />
		        </td>
		        <td valign="top">
		            <span class="premiere_blue">
		                <asp:PlaceHolder runat="server" ID="taPlaceHolder3" />
		                
		            </span><br /><br />
		        </td>
                <td valign="top">
		            <span class="plain">
		                <asp:PlaceHolder runat="server" ID="taPlaceHolder4" />
		                
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