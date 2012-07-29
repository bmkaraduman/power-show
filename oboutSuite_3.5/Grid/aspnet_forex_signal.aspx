<%@ Page Language="C#" EnableViewState="true" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
    
		void Page_Load(object sender, EventArgs e)
		{	

			if(!Page.IsPostBack)
			{
				CreateGrid( 0 );	
			}

		}

		void CreateGrid( int  iState)
		{
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/forex.mdb"));

			OleDbCommand myComm = new OleDbCommand("SELECT * FROM Trading WHERE State = @State ORDER BY ID ASC", myConn);
			myConn.Open();

            myComm.Parameters.Add("@State", OleDbType.Integer).Value = "" + iState;
            
    		OleDbDataReader myReader = myComm.ExecuteReader();
            


            grid1.DataSource = myReader;
			grid1.DataBind();

			myConn.Close();
		}

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        if (ViewState["State"] == null)
        {
            CreateGrid( 1 );
            ViewState["State"] = "1";
        }
        else
        {
            int state = Int32.Parse(ViewState["State"].ToString());
            CreateGrid((++state) % 5);
            ViewState["State"] = "" + state;
        }
    }
</script>

<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
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
        <link display="all" href="styles/style_2/style.css" rel="stylesheet" type="text/css" />
        
	</head>
	<body>	
		<form runat="server">
		<br />
		<span class="tdText"><b>ASP.NET Grid - Live Price Quotes with Grid and MS ASP.NET Ajax  </b></span>
		<br /><br />			
        <asp:ScriptManager ID="ScriptManager1" runat="server">
           <Scripts>
                <asp:ScriptReference Path="resources/custom_scripts/endRequest.js" />
            </Scripts>
        </asp:ScriptManager>


		<br />
		<div style="height:20px">             
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
               DisplayAfter="0">
                <ProgressTemplate>
				    <table width=10% height=100% cellpadding=0 cellspacing=0>
					    <tr>
						    <td align="center" valign="middle">
							   <img src="../AJAXPage/loading_icons/1.gif">
						    </td>
					    </tr>
				    </table>
                </ProgressTemplate>
            </asp:UpdateProgress>
         </div>
         <div style="height: auto;">    
		    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
		        <ContentTemplate>
		            <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="3000">
                    </asp:Timer>
			        <obout:Grid id="grid1" runat="server" CallbackMode="false" AutoGenerateColumns="false" AllowFiltering="false" Serialize="true"  AllowAddingRecords="false"
				        FolderLocalization="localization"  FolderStyle="styles/style_2"	>
				        <Columns>
					        <obout:Column DataField="id" ReadOnly="true" HeaderText="Row ID" Visible="false" Width="70" runat="server"/>
					        <obout:Column DataField="CurrencyPair" HeaderText="Currency Pairs" Width="130" runat="server">
						        <TemplateSettings TemplateId="CurrencyPairTmpl"/>
					        </obout:Column>
					        <obout:Column DataField="Bid" HeaderText="BID" Width="80" runat="server"/>
					        <obout:Column DataField="Ask" HeaderText="ASK" Width="80" runat="server"/>
					        <obout:Column DataField="High" HeaderText="HIGH" Width="80" runat="server"/>
					        <obout:Column DataField="Low" HeaderText="LOW" Width="80" runat="server"/>
					        <obout:Column DataField="Change" HeaderText="Change" Width="110" runat="server">
						        <TemplateSettings TemplateId="ChangeTmpl"/>
					        </obout:Column>
					        <obout:Column DataField="" HeaderText="Last Updated" Width="180" runat="server">
						        <TemplateSettings TemplateId="DateTmpl"/>
					        </obout:Column>
				        </Columns>
				        <Templates>
					        <obout:GridTemplate runat="server" ID="CurrencyPairTmpl">
						        <Template>
							        <u><%# Container.Value %></u>
						        </Template>
					        </obout:GridTemplate>
					        <obout:GridTemplate runat="server" ID="ChangeTmpl">
						        <Template>
							        <img src="resources/images/<%# (Container.Value.IndexOf("-") < 0 )? "up.gif" : "down.gif"%>" />&nbsp;&nbsp;<span style="font-weight: bold; color: <%# (Container.Value.IndexOf("-") < 0 )? "green;" : "red;"%> "><%# (Container.Value.IndexOf("-") < 0) ? " " + Container.Value : Container.Value%></span>
						        </Template>
					        </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="DateTmpl">
						        <Template>
							        <%# Convert.ToString(System.DateTime.Now) %>
						        </Template>
					        </obout:GridTemplate>					
				        </Templates>	
			        </obout:Grid>
	            </ContentTemplate>
		    </asp:UpdatePanel>
		</div>
		<br />
            
            

        <br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>