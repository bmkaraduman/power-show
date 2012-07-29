<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Addional Node Data</title>
    <script language="C#" runat="server">
        void Page_load(object sender, EventArgs e)
        {
            //Bind the treeview
            ObClassicTree.DataBind();
            //Expand first root node!
            ObClassicTree.Nodes[0].Expanded = true;
        }	
    </script>
    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
        #detailTable
        {
            background-color: #AAC0CF;
            font-weight: bold;
        }
        #detailTable td
        {
            padding: 2px;
        }
        #detailTable .odd
        {
            font-weight: normal;
            background-color: #E5E5E5;
            padding-right: 10px;
        }
        #detailTable .even
        {
            font-weight: normal;
            background-color: #FFFFFF;
            padding-right: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <br />
    <a class="examples" href="Default.aspx?type=ASPNET">« Back to examples</a>
    <br />
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <script type="text/javascript">
        //This event will get fired when a node is selected.
        function clientOnNodeSelect(sender, args) {
            //'getNodeValue' function returns the value stored for the node.
            fillData(sender.getNodeValue(args.node), sender.getNodeText(args.node));
        }
        //Helper function to fill the data in the table
        function fillData(data, name) {
            var arr_data = data.split(';');
            arr_data.splice(1, 0, name);

            var rows = document.getElementById("detailTable").getElementsByTagName("TR");

            for (var i = 0; i < arr_data.length - 1; i++) {
                (rows[i].getElementsByTagName("TD"))[1].innerHTML = arr_data[i];
            }

        }
        function pageLoad(sender, args) {
            var obTreeClientObj = $find("<%=ObClassicTree.ClientID %>");
            //Get the first node
            var firstNode = obTreeClientObj.getNodeByIndex("0");
            //Make the node as selected
            obTreeClientObj.setSelected(firstNode);
        }
    </script>
    <div>
        <h2>
            ASP.NET TreeView - Additional Data</h2>
        <asp:XmlDataSource ID="XmlDataSource1" DataFile="employee.xml" runat="server"></asp:XmlDataSource>
        <p>
            Select the employee in the TreeView to view the details in the right panel.
        </p>
        <table>
            <tr>
                <td valign="top">
                    <obout:Tree ID="ObClassicTree" DataSourceID="XmlDataSource1" EnableViewState="false"
                        CssClass="vista" OnNodeSelect="clientOnNodeSelect" runat="server" Width="280px">
                        <DataBindings>
                            <obout:NodeBinding DataMember="employee" ValueField="value" TextField="name" ImageUrl="img/engineer-icon.png" />
                        </DataBindings>
                    </obout:Tree>
                </td>
                <td valign="top">
                    <asp:Panel ID="Panel1" GroupingText="Employee Info" runat="server">
                        <table cellpadding="0" cellspacing="0" id="detailTable">
                            <tr>
                                <td>
                                    EmployeeId
                                </td>
                                <td class="odd">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Name
                                </td>
                                <td class="even">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Job
                                </td>
                                <td class="odd">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Phone
                                </td>
                                <td class="even">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email
                                </td>
                                <td class="odd">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    OrgUnit
                                </td>
                                <td class="even">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Salary
                                </td>
                                <td class="odd">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Gender
                                </td>
                                <td class="even">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    MaritalStatus
                                </td>
                                <td class="odd">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    EmployeeType
                                </td>
                                <td class="even">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    EmployeeStatus
                                </td>
                                <td class="odd">
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
