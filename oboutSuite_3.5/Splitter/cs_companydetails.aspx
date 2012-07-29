<%@ Page Language="C#" Inherits="cs_companydetails" Src="cs_companydetails.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>obout ASP.NET Splitter examples</title>
		<style type="text/css">
            .tdText {
                font:11px Verdana;
                color:#333333;
            }
         </style>
     </head>
	<body>
        <form id="Form1" runat="server">
	        <br />
		    <span class="tdText"><b>ASP.NET Splitter - Company Details</b></span>
    	
		    <br /><br />
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>
	        <br /><br />
		    <div id="divDetails" runat="server">
			    <font size="4" face="Verdana,Arial,Helvetica">
				    Click on a company name to see more details.
			    </font>
		    </div>
		    <table id="tableDetails" runat="server" width="100%" height="100%" cellpadding="0" cellspacing="0">			
			    <tr>
				    <td width="100%" valign="top">
					    <font size="4" face="Verdana,Arial,Helvetica">
						    <asp:Literal id="lName" runat="server" />
					    </font>	
				    </td>
			    </tr>
			    <tr>
				    <td width="100%" colspan="3">		  
					    <table align="center" align="center" width="100%" cellpadding="7">
						    <tr>
							    <td bgcolor="#f7f7f7">
								    <font size="1" face="Verdana,Arial,Helvetica">
									    <p align="justify">
										    <asp:Literal id="lDescription" runat="server" />
									    </p>
								    </font>
							    </td>
						    </tr>
					    </table>
				    </td>
			    </tr>
			    <tr>
				    <td width="100%" colspan="3">
					    <table border="0">
						    <tr>
							    <td align="right">
								    <font size="1" face="Verdana,Arial,Helvetica"><b>Address:</b></font>
							    </td>
							    <td>
								    <font size="1" face="Verdana,Arial,Helvetica">
									    <asp:Literal id="lAddress" runat="server" />
								    </font>
							    </td>
						    </tr>
						    <tr>
							    <td align="right">
								    <font size="1" face="Verdana,Arial,Helvetica"><b>Phone:</b></font>
							    </td>
							    <td>
								    <font size="1" face="Verdana,Arial,Helvetica">
									    <asp:Literal id="lPhone" runat="server" />
								    </font>
							    </td>
						    </tr>
						    <tr>
							    <td align="right">
								    <font size="1" face="Verdana,Arial,Helvetica"><b>Fax:</b></font>
							    </td>
							    <td>
								    <font size="1" face="Verdana,Arial,Helvetica">
									    <asp:Literal id="lFax" runat="server" />
								    </font>
							    </td>
						    </tr>		    
						    <tr>
							    <td align="right">
								    <font size="1" face="Verdana,Arial,Helvetica"><b>Email:</b></font>
							    </td>
							    <td>
								    <font size="1" face="Verdana,Arial,Helvetica">
									    <a class="site" href="mailto:laneapc@sover.net">
										    <asp:Literal id="lEmail" runat="server" />
									    </a>
								    </font>
							    </td>
						    </tr>
						    <tr>
							    <td align="right">
								    <font size="1" face="Verdana,Arial,Helvetica"><b>Homepage:</b>
							    </td>
							    <td>
								    <font size="1" face="Verdana,Arial,Helvetica">
									    <a style="cursor:pointer">
										    <asp:Literal id="lHomepage" runat="server" />
									    </a>
								    </font>
							    </td>
						    </tr>
						    <tr>
							    <td align="right">
								    <font size="1" face="Verdana,Arial,Helvetica"><b>Contact:</b>
							    </td>
							    <td>
								    <font size="1" face="Verdana,Arial,Helvetica">
									    <asp:Literal id="lContact" runat="server" />
								    </font>
							    </td>
						    </tr>
					    </table>
				    </td>
			    </tr>
		    </table>
		 </form>
	</body>
</html>