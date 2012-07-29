<%@ Page Language="c#" Inherits="OboutInc.oboutAJAXPage" %>

<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<%@ Import Namespace="System.Data.OleDb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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

        if (IsCallback && Session["ContactID"] != null)
            SetContactInformation();
    }

    public void OnNodeSelect(int id)
    {
        Session["ContactID"] = id;
    }

    public void SetContactInformation()
    {
        int id = Int32.Parse(Session["ContactID"].ToString());

        OleDbConnection oConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/addressbook.mdb"));
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

        lContactImage.Text = "<img style=\"width:70px\" src=\"../Splitter/images/" + sPicture + "\" />";
        lContactName.Text = sFirstName + " " + sLastName;
        lContactCompany.Text = sCompanyName;
        lContactEmail.Text = sEmail;
        lContactPhone.Text = sPhone;
        lContactCell.Text = sCellPhone;
        lContactFax.Text = sFax;

        oConn.Close();
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>obout ASP.NET Splitter Examples</title>
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
        body
        {
            font-family: Verdana;
        }
        .text
        {
            background-color: #ebe9ed;
            font-size: 11px;
            text-align: center;
        }
        .pointer
        {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <script type="text/javascript">
        function clientNodeSelect(sender, args) {
            var id = sender.getNodeValue(args.node);
            var index = sender.getNodeIndex(args.node);
            if (id == null || id == "" || index.split(':').length < 3)
                return;

            ob_post.AddParam("id", id);

            ob_post.post(null, "OnNodeSelect", displayContactInfo);
        }
        function displayContactInfo() {
            ob_post.UpdatePanel("cpContactInfomation");
        }
    </script>
    <center>
        <input value="Open Address Book" onclick="winAddress.Open()" type="button" />
    </center>
    <owd:Window runat="server" ID="winAddress" Width="640" Height="480" Title="Address Book"
        Left="50" Top="50" IsDraggable="true" Status="Status" StyleFolder="wdstyles/default"
        IconPath="images/outlook.png" OnClientResize="windowResize();" ShowMaximizeButton="true">
        <div id="divSplitter" style="width: 632px; height: 432px;">
            <obspl:Splitter CookieDays="0" ID="sp1DVF" runat="server" StyleFolder="../splitter/styles/default">
                <LeftPanel WidthMin="100" WidthMax="400" WidthDefault="210">
                    <Header Height="40">
                        <div style="width: 100%; height: 100%;" class="text">
                            <br />
                            optional header
                        </div>
                    </Header>
                    <Content>
                        <div style="width: 190px; padding-left: 10px; padding-top: 10px">
                            <obout:Tree ID="ObTree" runat="server" OnNodeSelect="clientNodeSelect">
                            </obout:Tree>
                        </div>
                    </Content>
                    <Footer Height="40">
                        <div style="width: 100%; height: 100%;" class="text">
                            <br />
                            optional footer
                        </div>
                    </Footer>
                </LeftPanel>
                <RightPanel>
                    <Content>
                        <table border="0">
                            <tr>
                                <td colspan="2">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div style="padding-left: 20px; font-weight: bold; font-size: 12px">
                                        <h3>
                                            Address book example</h3>
                                        Please select a person from the address book to retrieve the contact
                                        <br />
                                        information from the database.
                                        <br />
                                        <br />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="padding-left: 20px" valign="top">
                                    <oajax:CallbackPanel ID="cpContactInfomation" runat="server" RenderMethod="OnCallback">
                                        <Content Style="width: 300px">
                                            <table width="100%" style="height: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="width: 150px" class="h5" valign="top">
                                                        <asp:Literal ID="lContactImage" runat="server" />
                                                    </td>
                                                    <td valign="top" class="h5" style="padding-left: 5px; width: 100%">
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
                                        <Loading Style="width: 200px; height: 140px">
                                            <table width="100%" style="height: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td align="center" valign="middle">
                                                        <img src="../splitter/images/5.gif" alt="image 5" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </Loading>
                                    </oajax:CallbackPanel>
                                </td>
                            </tr>
                        </table>
                    </Content>
                </RightPanel>
            </obspl:Splitter>
        </div>
    </owd:Window>
    </form>
</body>
</html>
<script type="text/javascript">

    function windowResize() {
        var winsize = winAddress.getSize();
        document.getElementById("divSplitter").style.width = (winsize.width - 8) + "px";
        document.getElementById("divSplitter").style.height = (winsize.height - 48) + "px";

        sp1DVF.MoveSeparatorByValue("left", 1); //Use to refesh the size of Splitter to fit Window when Window is resized
        sp1DVF.MoveSeparatorByValue("right", 1); //Use to refesh the size of Splitter to fit Window when Window is resized
    }


</script>
