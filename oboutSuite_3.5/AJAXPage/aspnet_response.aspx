<%@ Page Language="C#" AspCompat="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage" %>

<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e)
    {
        if (!IsCallback)
        {

            OleDbConnection oConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Web.HttpContext.Current.Server.MapPath("../App_Data/Products.mdb"));
            // read the information from the database		
            string sQuery = "SELECT NodeID, ParentID, NodeHTML, NodeIcon, NodeLevel, Expanded FROM Category ORDER BY NodeLevel ASC";
            OleDbCommand oCommand = new OleDbCommand(sQuery);
            oCommand.Connection = oConn;
            OleDbDataAdapter oAdapter = new OleDbDataAdapter(oCommand);
            System.Data.DataSet ds = new System.Data.DataSet();
            oAdapter.Fill(ds);

            NodeBinding binding = new NodeBinding() { ClientIDField = "NodeID", Expanded = true, DataSourceColumnID = "NodeID", DataSourceColumnParentID = "ParentID", TextField = "NodeHTML" };
            ObTree.DataBindings.Add(binding);

            ObTree.DataSource = ds.Tables[0];
            ObTree.DataBind();

            ObTree.Nodes[0].ChildNodes[0].ChildNodes[0].Selected = true;
        }

        if (IsCallback)
        {
            LoadCategory();
            LoadBasket();
        }
    }

    public void SetCategoryID(int CategoryID)
    {
        GetCategoryContent(CategoryID);
    }

    // load the basket from session object and populate the datalist
    public bool LoadBasket()
    {
        string totalPrice = "0";

        if (Session["Basket"] != null)
        {
            if (((ArrayList)Session["Basket"]).Count > 0)
            {
                OleDbConnection oleDBConnetion = new OleDbConnection();
                oleDBConnetion.ConnectionString =
                    "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("../App_Data/Products.mdb") + "; User Id=; Password=";

                // gets the datasource for the emails list
                OleDbCommand oleDBCommand = new OleDbCommand();
                oleDBCommand.Connection = oleDBConnetion;

                string query = "SELECT ProductID, ProductName, ProductImage, ProductShortDescription, ProductPrice FROM Products where ";
                for (int index = 0; index < ((ArrayList)Session["Basket"]).Count; index++)
                {
                    if (index == 0)
                        query += " ProductID = " + ((ArrayList)Session["Basket"])[index];
                    else
                        query += " or ProductID = " + ((ArrayList)Session["Basket"])[index];
                }

                oleDBCommand.CommandText = query;

                OleDbDataReader dataReader;
                oleDBConnetion.Open();
                dataReader = oleDBCommand.ExecuteReader();
                basket.DataSource = dataReader;
                basket.DataBind();
                dataReader.Close();


                // calculate total price
                string query2 = "SELECT sum(ProductPrice) FROM Products where ";
                for (int index = 0; index < ((ArrayList)Session["Basket"]).Count; index++)
                {
                    if (index == 0)
                        query2 += " ProductID = " + ((ArrayList)Session["Basket"])[index];
                    else
                        query2 += " or ProductID = " + ((ArrayList)Session["Basket"])[index];
                }

                OleDbCommand oleDBCommand2 = new OleDbCommand();
                oleDBCommand2.Connection = oleDBConnetion;
                oleDBCommand2.CommandText = query2;

                totalPrice = oleDBCommand2.ExecuteScalar().ToString();

                oleDBConnetion.Close();
            }
        }

        ExecOnLoad("UpdateTotalPrice('" + totalPrice + "')");

        return true;
    }

    public int selectedCategoryID = 0;

    public void GetCategoryContent(int CategoryID)
    {
        Session["CategoryID"] = CategoryID;
    }

    private void LoadCategory()
    {
        if (Session["CategoryID"] == null) Session["CategoryID"] = 1;
        int CategoryID = Int32.Parse(Session["CategoryID"].ToString());

        OleDbConnection oleDBConnetion = new OleDbConnection();
        oleDBConnetion.ConnectionString =
            "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("../App_Data/Products.mdb") + "; User Id=; Password=";

        // gets the datasource for the emails list
        OleDbCommand oleDBCommand = new OleDbCommand();
        oleDBCommand.Connection = oleDBConnetion;
        oleDBCommand.CommandText = "SELECT ProductID, ProductName, ProductImage, ProductShortDescription, ProductPrice FROM Products where CategoryID = " + CategoryID + "";

        OleDbDataReader dataReader;
        oleDBConnetion.Open();
        dataReader = oleDBCommand.ExecuteReader();
        productList.DataSource = dataReader;
        productList.DataBind();
        dataReader.Close();

        oleDBConnetion.Close();
    }

    // add a new product to the session basket
    public void AddProductToBasket(int ProductID)
    {
        if (Session["Basket"] == null)
            Session["Basket"] = new ArrayList();

        if (!((ArrayList)Session["Basket"]).Contains(ProductID))
        {
            ((ArrayList)Session["Basket"]).Add(ProductID);
            return;
        }

        // use the response object and change the allowReturn value to false
        // so that the function executed after the callback is done to not be executed 
        ExecBeforeLoad("response.allowReturn = false;alert('The product already exists in the basket!\\n\\nSet response.allowReturn = false to block basket reload. ')");
    }

    // remove product from the session basket
    public bool RemoveProductFromBasket(int ProductID)
    {
        ((ArrayList)Session["Basket"]).Remove(ProductID);

        return true;
    }
	
</script>

<html>
<head runat="server">
    <style>
        td
        {
            font: 10pt Tahoma;
            margin: 20px;
        }
        .title
        {
            font-size: X-Large;
            padding: 20px;
            border-bottom: 2px solid gray;
            width: 100%;
        }
        a.basket
        {
            color: navy;
            cursor: pointer;
            font-weight: bold;
            font-size: 9px;
        }
        div.totalPriceText
        {
            font: 10pt Tahoma;
            color: navy;
            font-weight: bold;
        }
        div.totalPrice
        {
            font: 10pt Tahoma;
            color: crimson;
            font-weight: bold;
        }
        .pointer
        {
            cursor: pointer;
        }
        .smallText
        {
            font-size: 9px;
        }
    </style>
</head>
<body>
    <form id="form" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

    <script language="JavaScript">
			// add load event
			function addLoadEvent(func) {
			  var oldonload = window.onload;
			  if (typeof window.onload != 'function') {
				window.onload = func;
			  } else {
				window.onload = function() {
				  if (oldonload) {
					oldonload();
				  }
				  func();
				}
			  }
			}
			
			// first time loading - default category selected - first email is listed in the details area
			addLoadEvent(function() {								
				LoadBasket();
			});
			
			// load, specified by param, a product category
			function ProductsLoad(CategoryID)
			{
				CategoryID = CategoryID.replace("node1_", "");
				CategoryID = CategoryID.replace("node2_", "");
				CategoryID = CategoryID.replace("node3_", "");
				
				if (isNaN(CategoryID))
					CategoryID = 0;
				
				// using the specified category of products, load the page that contains the list of products
				ob_post.AddParam("CategoryID", CategoryID);
				ob_post.post(null, "SetCategoryID", finishProductsLoad);
			}
			
			function finishProductsLoad() {
				ob_post.UpdatePanel("postbackPanelProductsList");
			}
			
			function LoadBasket() {
				ob_post.post(null, "LoadBasket", clientLoadBasket);
			}
			// add new product to the basket session
			function AddToBasket(ProductID) {
				ob_post.AddParam("ProductID", ProductID);
				ob_post.post(null, "AddProductToBasket", clientLoadBasket);
			}
			
			// remove product from the basket
			function RemoveFromBasket(ProductID) {
				ob_post.AddParam("ProductID", ProductID);
				ob_post.post(null, "RemoveProductFromBasket", clientLoadBasket);
			}
			
			// update basket
			function clientLoadBasket() {
				ob_post.UpdatePanel("postbackPanelBasket");
			}
			
			// update total price from server to client
			function UpdateTotalPrice(totalPrice) {
				document.getElementById('totalPrice').innerHTML = totalPrice;
			}
			function clientNodeSelect(sender,args){
    var id=args.node.id;
if(id.indexOf("node1_") != -1 || id.indexOf("node2_") != -1 || id.indexOf("node3_") != -1)
			{	     
				// load the specified products from a category
				ProductsLoad(id);
			}
}
		
    </script>

    <table border="0">
        <tr>
            <td valign="top" width="630" colspan="4">
                <span class="title">Response</span><br />
                <br />
                <br />
            </td>
        </tr>
    </table>
    <br />
    Response object is available only in a script run using <span class="option2">ExecBeforeLoad</span>
    method.<br />
    <br />
    Add a product twice to the basket.
    <br />
    On server-side check if the product already exists in the basket.
    <br />
    If it exists, set <span class="option2">response.allowReturn = false</span> for
    blocking basket reload.
    <br />
    <br />
    <table width="100%">
        <tr>
            <td style="width: 630px" colspan="2">
                <table>
                    <tr>
                        <td valign="top" style="width: 100px; border: 1px solid gray; height: 200px">
                            <div style="padding-left: 10px; padding-top: 10px; padding-right: 10px;">
                                <obout:Tree ID="ObTree" runat="server" OnNodeSelect="clientNodeSelect">
                                </obout:Tree>
                            </div>
                        </td>
                        <td valign="top" style="border-top: 1px solid gray; border-bottom: 0px solid gray">
                            <!-- products list callback panel -->
                            <oajax:CallbackPanel runat="server" ID="postbackPanelProductsList">
                                <Content Style="width: 330px; background-color: white; font-size: 16px; color: crimson;">
                                    <asp:DataList ID="productList" runat="server" RepeatColumns="2" Width="330px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <div style="padding-left: 3px; padding-right: 3x; padding-top: 10px; width: 160px;
                                                border: 0px solid red">
                                                <table style="border: 1px solid gray;">
                                                    <tr>
                                                        <td>
                                                            <img width="65px" src="<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>" />
                                                        </td>
                                                        <td align="left">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="left" class="smallText">
                                                                        <b>
                                                                            <%# DataBinder.Eval(Container.DataItem, "ProductName") %></b>
                                                                    </td>
                                                                    <td align="right" class="smallText">
                                                                        <span style="color: red">$
                                                                            <%# DataBinder.Eval(Container.DataItem, "ProductPrice") %></span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" class="smallText">
                                                                        <%# DataBinder.Eval(Container.DataItem, "ProductShortDescription") %>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <a class="basket" onclick="AddToBasket(<%# DataBinder.Eval(Container.DataItem, "ProductID") %>)">
                                                                            Add To Basket</a>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </Content>
                                <Loading Style="width: 330px;">
                                    <table width="100%" height="190px" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td align="center" valign="middle">
                                                <img src="loading_icons/1.gif">
                                            </td>
                                        </tr>
                                    </table>
                                </Loading>
                            </oajax:CallbackPanel>
                        </td>
                        <td valign="top" style="width: 150px; padding-left: 1px; border: 1px solid gray;
                            height: 200px;">
                            &nbsp;
                            <h5 style="padding: 0px; margin: 0px; text-align: center;">
                                Basket</h5>
                            <br />
                            <nobr>
									<div class="totalPriceText" style="display:inline;padding-left:5px">Total:</div>
									<div class="totalPrice" style="align:center;display:inline"> 
										&nbsp;$ <div style="display:inline" id="totalPrice" />
									</div>
								</nobr>
                            <!-- basket callback panel -->
                            <oajax:CallbackPanel runat="server" ID="postbackPanelBasket">
                                <Content Style="border: gray 0px solid; background-color: white; font-size: 16px;
                                    color: crimson;">
                                    <asp:DataList ID="basket" runat="server">
                                        <ItemTemplate>
                                            <div style="padding-left: 3px; padding-right: 3x; padding-top: 3px; width: 144px;">
                                                <table style="width: 100%; border: 1px solid gray">
                                                    <tr>
                                                        <td align="left" class="smallText" style="background-color: gray; color: white; padding: 1px;
                                                            padding-left: 2px;">
                                                            <nobr><a style="padding:4px;cursor:pointer;text-decoration:underline;font-weight:bold;color:navy" onclick="RemoveFromBasket(<%# DataBinder.Eval(Container.DataItem, "ProductID") %>)">Remove</a>
																&nbsp;&nbsp;<b><%# DataBinder.Eval(Container.DataItem, "ProductName") %></b>
																&nbsp;$ <%# DataBinder.Eval(Container.DataItem, "ProductPrice") %></nobr>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="smallText" width="100%" align="left">
                                                            <img width="20%" src="<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>" />
                                                            &nbsp;<%# DataBinder.Eval(Container.DataItem, "ProductShortDescription") %>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </Content>
                                <Loading Style="height: 130px">
                                    <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center" valign="middle">
                                                <img src="loading_icons/1.gif">
                                            </td>
                                        </tr>
                                    </table>
                                </Loading>
                            </oajax:CallbackPanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <a style="font-family: Tahoma; font-size: 12px" href="Default.aspx?type=ASPNET">« Back
        to examples</a>
    </form>
</body>
</html>
