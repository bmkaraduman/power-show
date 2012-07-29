<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>

<%@ Page Language="C#" AspCompat="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage" %>

<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>

<script language="C#" runat="server">
   
    void Page_Load(object sender, EventArgs e)
    {
        if (!IsCallback)
        {
            OleDbConnection oConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/AddressBook.mdb"));
            oConn.Open();

            Node rootNode = new Node() { Text = "Address Book", Expanded = true, ImageUrl = "../TreeView/icons/folder.gif" };
            ObTree.Nodes.Add(rootNode);
            string sQuery = "SELECT DepartmentID, DepartmentName FROM Departments ORDER BY DepartmentName ASC";
            OleDbCommand oCommand = new OleDbCommand(sQuery);
            oCommand.Connection = oConn;
            OleDbDataReader oReader = oCommand.ExecuteReader();

            string sDepartmentID, sDepartmentName;

            //string sUndraggableNodes = "";

            while (oReader.Read())
            {
                sDepartmentID = oReader.GetInt32(0).ToString();
                sDepartmentName = oReader.GetValue(1).ToString();

                rootNode.ChildNodes.Add(new Node() { Text = sDepartmentName, Value = sDepartmentID, Expanded = true, ImageUrl = "../TreeView/icons/oInboxF.gif" });
            }
            oConn.Close();
            oConn.Open();

            sQuery = "SELECT ContactID, FirstName, LastName, DepartmentID FROM Contacts ORDER BY FirstName ASC, LastName ASC";
            oCommand = new OleDbCommand(sQuery);
            oCommand.Connection = oConn;
            OleDbDataReader oReader2 = oCommand.ExecuteReader();

            string sContactId, sFirstName, sLastName;

            while (oReader2.Read())
            {
                sContactId = oReader2.GetInt32(0).ToString();
                sFirstName = oReader2.GetValue(1).ToString();
                sLastName = oReader2.GetValue(2).ToString();
                sDepartmentID = oReader2.GetInt32(3).ToString();
                Node parent = rootNode.ChildNodes.FindNode(c => c.Value == sDepartmentID, false);
                if (parent != null)
                {
                    parent.ChildNodes.Add(new Node() { Value = sContactId, Text = string.Format("{0} {1}", sFirstName, sLastName), ImageUrl = "../TreeView/icons/person.gif" });
                }
            }
            oConn.Close();
        }
    }

    public void SetContactInformation(int id)
    {
        OleDbConnection oConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/AddressBook.mdb"));
        oConn.Open();

        string sQuery = "SELECT FirstName, LastName, CompanyName, Email, Phone, CellPhone, Fax, Picture FROM Contacts WHERE ContactID = " + id.ToString();
        OleDbCommand oCommand = new OleDbCommand(sQuery);
        oCommand.Connection = oConn;
        OleDbDataReader oReader = oCommand.ExecuteReader();

        oReader.Read();

        string sFirstName;
        string sLastName;
        string sCompanyName;
        string sEmail;
        string sPhone;
        string sCellPhone;
        string sFax;
        string sPicture;

        sFirstName = oReader.GetString(0);
        sLastName = oReader.GetString(1);
        sCompanyName = oReader.GetString(2);
        sEmail = oReader.GetString(3);
        sPhone = oReader.GetString(4);
        sCellPhone = oReader.GetString(5);
        sFax = oReader.GetString(6);
        sPicture = oReader.GetString(7);

        lContactImage.Text = "<img style=\"width:70px\" alt=\"contact image\" src=\"images/" + sPicture + "\" />";
        lContactName.Text = sFirstName + " " + sLastName;
        lContactCompany.Text = sCompanyName;
        lContactEmail.Text = sEmail;
        lContactPhone.Text = sPhone;
        lContactCell.Text = sCellPhone;
        lContactFax.Text = sFax;

        oConn.Close();
    }

    public bool cpContactInfomation_OnBeforePanelUpdate(string panelId, string containerId)
    {
        string id = UpdatePanelParams["id"].ToString();

        SetContactInformation(int.Parse(id));

        return true;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>obout AJAXPage examples</title>
    <style type="text/css">
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
    </style>

    <script type="text/javascript">
		function displayContactInfo()
		{   
			ob_post.UpdatePanel("cpContactInfomation");
		}
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

    <script type="text/javascript">
    function clientNodeSelect(sender,args){
        var id=sender.getNodeValue(args.node);
        var index=sender.getNodeIndex(args.node);
        if(id==null ||id=="" ||index.split(':').length<3)
            return;
        
        ob_post.AddParam("id", id);	

        ob_post.UpdatePanel("cpContactInfomation");
    }
    </script>

    <br />
    <table border="0">
        <tr>
            <td valign="top" style="width: 630px" colspan="4">
                <span class="title">Address book example</span><br />
                <br />
                <br />
                Please select a person from the address book to retrieve the contact
                <br />
                information from the database <span style="color: #DC143C;">without reloading the page</span>.<br />
                <br />
            </td>
        </tr>
        <tr>
            <td valign="top" class="h5" style="width: 150px">
                <obout:Tree ID="ObTree" runat="server" OnNodeSelect="clientNodeSelect">
                </obout:Tree>
            </td>
            <td valign="top" align="left" style="width: 460px">
                <oajax:CallbackPanel ID="cpContactInfomation" runat="server" RenderMethod="OnCallback"
                    OnBeforePanelUpdate="cpContactInfomation_OnBeforePanelUpdate">
                    <Content Style="width: 300px">
                        <table width="100%" style="height: 100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 150px" class="h5" valign="top">
                                    <asp:Literal ID='lContactImage' runat='server' />
                                </td>
                                <td valign="top" class="h5" style="width: 100%; padding-left: 5px">
                                    <asp:Literal ID="lContactName" runat="server" /><br />
                                    Company Name:
                                    <asp:Literal ID="lContactCompany" runat="server" /><br />
                                    E-mail:
                                    <asp:Literal ID="lContactEmail" runat="server" /><br />
                                    Phone Number:
                                    <asp:Literal ID="lContactPhone" runat="server" /><br />
                                    Cell Phone Number:
                                    <asp:Literal ID="lContactCell" runat="server" /><br />
                                    Fax Number:
                                    <asp:Literal ID="lContactFax" runat="server" /><br />
                                </td>
                            </tr>
                        </table>
                    </Content>
                    <Loading Style="width: 200px; height: 160px">
                        <table width="100%" style="height: 100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" valign="middle">
                                    <img alt="loading icon" src="loading_icons/5.gif" />
                                </td>
                            </tr>
                        </table>
                    </Loading>
                </oajax:CallbackPanel>
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

<script type="text/javascript">
// implement the OnNodeSelect event that will request the information from the server
// we redeclared the ob_OnNodeSelect function here - the other option would have been to edit
// the ob_events_xxxx.js file located in the Script folder
function ob_OnNodeSelect(id)
{   
     // add client side code here
	 //alert("OnNodeSelect on " + id);
	 if(ob_ev("OnNodeSelect"))
	 {	    
	    if(typeof ob_post == "object")
	    {
	        // if a person was selected - not a department
	        if(id.indexOf("oCont_") != -1)
	        {	            
	            // add the parameter needed on server-side
	            // id will be a server-side argument for the OnNodeSelect method
	            // we use only the id of the contact from the database (not the whole id of the selected node)
	            ob_post.AddParam("id", id.replace("oCont_", ""));	

	            ob_post.UpdatePanel("cpContactInfomation");
	        }
	    }
	    else
	    {
	        alert("Please add obout_Postback ASP.NET control to your page to use the server-side events");
	    } 
	 }
}
</script>

