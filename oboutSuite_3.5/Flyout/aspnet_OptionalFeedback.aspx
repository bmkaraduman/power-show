<%@ Page Language="C#" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<!--
        Basic example
-->

<html>
	<head>
        <title>Microsoft Optional Feedback</title>
 		    <style type="text/css">
			    body {
				    font:11px Verdana;
				    color:#333333;
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
        
          <!-- Server Script to display Customer Feedback -->
              <script runat="server">
                void Page_Load(object sender, EventArgs e)
                {
                    if (!IsPostBack)
                    {
                        ViewState["customernumber"]=0;
                        
                    }
                }
                protected void btnSend_Click(object sender, EventArgs e)
                {
                    if (txtFeedback.Text != String.Empty)
                    {
                        panelFeedback.Visible = true;
                        ViewState["customernumber"] = (int)ViewState["customernumber"] + 1;
                        txtSavedFeedback.Text += "<span style='font-family:Verdana; font-size:8pt;'><b>Customer " + ((int)ViewState["customernumber"]).ToString() + ":</b><br><table><tr><td style:'width:30px'>&nbsp;</td><td style='width:150px;font-family:Verdana;font-size:8pt;'>" + txtFeedback.Text + "</td></tr></table></span><br />";
                        txtFeedback.Text = "";
                    }
                    
                }
            </script>      
        
        
        <!-- star rating script -->
            <script type="text/javascript">
                function star_over(num)
                {
                    for(var i=1;i<=num;i++)
                        if (document.getElementById("star"+i).src.indexOf("starRed")<0)
                            if (i<=num)
                                document.getElementById("star"+i).src = "images/starGold.gif";
                            else
                                document.getElementById("star"+i).src = "images/starWhite.gif";
                }
                function star_out()
                {
                    if (document.getElementById("star1").src.indexOf("starRed")<0)
                        document.getElementById("star1").src = "images/starGold.gif";
                    for(var i=2;i<=5;i++)
                        if (document.getElementById("star"+i).src.indexOf("starRed")<0)
                            document.getElementById("star"+i).src = "images/starWhite.gif";
                }
                function star_click(num)
                {
                    for(var i=1;i<=5;i++)
                        if (i<=num)
                            document.getElementById("star"+i).src = "images/starRed.gif";
                        else
                            document.getElementById("star"+i).src = "images/starWhite.gif";
                }
            </script>
        

	</head> 
	<body>
        
        <a href="Default.aspx?div=aspnet">« Back to examples</a>
	
	    <form runat="server">
	    
	    <asp:Panel runat="server" ID="panelFeedback" Visible="false" style="position:absolute;left:5px;top:35px;border:solid 1px;background-color:lemonchiffon;padding:10px;width:auto;height:auto">
	        <asp:Label ID="txtSavedFeedback" runat="server"></asp:Label>
	    </asp:Panel>
        
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        	
        <!-- Create 5 stars for user to rate -->
        
        <center>
                    <table id="star_rate" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="height: 16px"><img id="star1" src="images/starWhite.gif" onmouseover="star_over(1)" onmouseout="star_out()" onclick="star_click(1)"/></td>
                            <td style="height: 16px"><img id="star2" src="images/starWhite.gif" onmouseover="star_over(2)" onmouseout="star_out()" onclick="star_click(2)"/></td>
                            <td style="height: 16px"><img id="star3" src="images/starWhite.gif" onmouseover="star_over(3)" onmouseout="star_out()" onclick="star_click(3)"/></td>
                            <td style="height: 16px"><img id="star4" src="images/starWhite.gif" onmouseover="star_over(4)" onmouseout="star_out()" onclick="star_click(4)"/></td>
                            <td style="height: 16px"><img id="star5" src="images/starWhite.gif" onmouseover="star_over(5)" onmouseout="star_out()" onclick="star_click(5)"/></td>
                        </tr>
                    </table>
        </center>
        
        
        
        
        <!-- Use Flyout for Optional FeedBack -->
        
        <obout:Flyout ID="fbFeedBack" AttachTo="star_rate" Position="BOTTOM_CENTER" Align="RIGHT" runat="server">
        
             <table style="padding:20px;background-color:lemonchiffon;font-family:Tahoma;font-size:9pt;border:solid 1px;">
                <tr><td>Optional Feedback <br />&nbsp;</td></tr>
                <tr><td><asp:TextBox ID="txtFeedback" runat="server" Rows="7" TextMode="MultiLine" Columns="25"></asp:TextBox><br /></td></tr>
                <tr><td align="right"><asp:Button ID="Button1" runat="server" Text="Send" OnClick="btnSend_Click" /></td></tr>
             </table>
             
        </obout:Flyout>
        

        </form>
      

	</body>
</html>
