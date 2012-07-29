<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script language="VB" runat="server">
    Dim btn1 As OboutButton
    Dim chk1 As OboutCheckBox
    Dim ddl1 As OboutDropDownList
    Dim rbtn1 As OboutRadioButton
    Dim rbtn2 As OboutRadioButton
    Dim txt1 As OboutTextBox
    Dim ta1 As OboutTextBox
	
     Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        chk1 = New OboutCheckBox()
        chk1.ID = "chk1"
        chk1.Text = "Check Me!"
        
        chkPlaceHolder.Controls.Add(chk1)
        
        ddl1 = New OboutDropDownList()
        ddl1.ID = "ddl1"
        ddl1.Width = Unit.Pixel(200)

        ddl1.Items.Add(New ListItem("Item 1"))
        ddl1.Items.Add(New ListItem("Item 2"))
        ddl1.Items.Add(New ListItem("Item 3"))
        ddl1.Items.Add(New ListItem("Item 4"))
        ddl1.Items.Add(New ListItem("Item 5"))
        ddl1.Items.Add(New ListItem("Item 6"))
        ddl1.Items.Add(New ListItem("Item 7"))
        ddl1.Items.Add(New ListItem("Item 8"))
        ddl1.Items.Add(New ListItem("Item 9"))
        ddl1.Items.Add(New ListItem("Item 10"))
        
        ddl1.SelectedIndex = 2
        ddlPlaceHolder.Controls.Add(ddl1)

        rbtn1 = New OboutRadioButton()
        rbtn1.ID = "rbtn1"
        rbtn1.Text = "Option 1"
        rbtn1.GroupName = "SomeGroup"
        rbtn1.Checked = True
        
        rbtnPlaceHolder1.Controls.Add(rbtn1)

        rbtn2 = New OboutRadioButton()
        rbtn2.ID = "rbtn2"
        rbtn2.Text = "Option 2"
        rbtn2.GroupName = "SomeGroup"

        rbtnPlaceHolder2.Controls.Add(rbtn2)
       
        txt1 = New OboutTextBox()
        txt1.ID = "txt1"
        txt1.Width = Unit.Pixel(200)
        txt1.Text = "Some text"

        txtPlaceHolder.Controls.Add(txt1)

        ta1 = New OboutTextBox()
        ta1.ID = "ta1"
        ta1.Width = Unit.Pixel(200)
        ta1.Height = Unit.Pixel(150)
        ta1.TextMode = TextBoxMode.MultiLine
        ta1.Text = "Some text"

        taPlaceHolder.Controls.Add(ta1)

        btn1 = New OboutButton()
        btn1.ID = "btn1"
        btn1.FolderStyle = "../interface/styles/black_glass/OboutButton"
        btn1.Text = "Reset"
        btn1.OnClientClick = "return onReset()"
       
        btnPlaceHolder.Controls.Add(btn1)
          
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
		    var initialSelectedIndex = -1;
		    var initialChecked = true;
		    var initialText = "";
		    var initialMultiText = "";
		    var initialOption1 = true;
		    var initialOption2 = true;
		    window.onload = function() {
		        initialSelectedIndex = ddl1.selectedIndex();
		        initialChecked = chk1.checked();
		        initialText = txt1.value();
		        initialMultiText = ta1.value();
		        initialOption1 = rbtn1.checked();
		        initialOption2 = rbtn2.checked();

		    }

   function onReset() {
       chk1.checked(initialChecked);
       ddl1.selectedIndex(initialSelectedIndex);
       txt1.value(initialText);
       ta1.value(initialMultiText);
       rbtn1.checked(initialOption1);
       rbtn2.checked(initialOption2);
       return false;
   }
    </script>			
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />				
		
		<span class="tdText"><b>obout Interface - Reset Values</b></span>
		
		<br /><br />
		<table>
		    <tr>
		        <td>
		            <asp:PlaceHolder runat="server" ID="chkPlaceHolder" />
		        </td>
		    </tr>
		    <tr>
		        <td>
		            <asp:PlaceHolder runat="server" ID="ddlPlaceHolder" />
                 </td>
             </tr>
             <tr>
                 <td>   
                    <asp:PlaceHolder runat="server" ID="rbtnPlaceHolder1" />
                    <asp:PlaceHolder runat="server" ID="rbtnPlaceHolder2" />      
		         </td>
		    </tr>
		    <tr>
		         <td>
		            <asp:PlaceHolder runat="server" ID="txtPlaceHolder" />
		        </td>
		   </tr>
		   <tr>
		       <td>
		            <asp:PlaceHolder runat="server" ID="taPlaceHolder" />
		      </td>
		      <td valign="bottom">
		         <asp:PlaceHolder runat="server" ID="btnPlaceHolder" />
		      </td>
		   </tr>
	    </table>
		<br /><br /><br />
		
		<span class="tdText">
	   You can reset the Interface Controls to their default values / states (which were set on page load). <br />
	   The initial values / states are cached in client-side variables when the page is loading and then <br />
	   they are used when the Reset button is clicked.</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>

