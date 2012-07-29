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
		            <obout:OboutCheckBox runat="server" ID="chk1" Text="Check me"/>
		        </td>
		    </tr>
		    <tr>
		        <td>
		            <obout:OboutDropDownList runat="server" ID="ddl1" Width="200"  >
		                <asp:ListItem>Item 1</asp:ListItem>
		                <asp:ListItem>Item 2</asp:ListItem>
		                <asp:ListItem Selected="True">Item 3</asp:ListItem>
		                <asp:ListItem>Item 4</asp:ListItem>
		                <asp:ListItem>Item 5</asp:ListItem>
		                <asp:ListItem>Item 6</asp:ListItem>
		                <asp:ListItem>Item 7</asp:ListItem>
		                <asp:ListItem>Item 8</asp:ListItem>
		                <asp:ListItem>Item 9</asp:ListItem>
		                <asp:ListItem>Item 10</asp:ListItem>
		            </obout:OboutDropDownList>
                 </td>
             </tr>
             <tr>
                 <td>         
		            <obout:OboutRadioButton runat="server" ID="rbtn1" Text="Option 1" GroupName="SomeGroup"  Checked="true" />
		            <obout:OboutRadioButton runat="server" ID="rbtn2" Text="Option 2" GroupName="SomeGroup" />
		         </td>
		    </tr>
		    <tr>
		         <td>
		            <obout:OboutTextBox runat="server" ID="txt1" Width="200" Text="Some text"  />
		        </td>
		   </tr>
		   <tr>
		       <td>
		            <obout:OboutTextBox runat="server" ID="ta1" Width="200" Height="150" TextMode="MultiLine" Text="Some text" />
		      </td>
		      <td valign="bottom">
		         <obout:OboutButton ID="OboutButton1" runat="server" Text="Reset" OnClientClick="return onReset()"
		            FolderStyle="../interface/styles/black_glass/OboutButton" />	
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