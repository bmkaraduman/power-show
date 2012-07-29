<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Addional Node Data</title>
    <script language="vbscript" runat="server">
        Private obClassicTree As Tree = Nothing
Private Sub Page_Init(sender As Object, e As EventArgs)
            obClassicTree = New Tree() With { _
             .ID = "ObClassicTree", _
             .DataSourceID = "XmlDataSource1", _
             .EnableViewState = False, _
             .CssClass = "vista", _
             .OnNodeSelect = "clientOnNodeSelect", _
             .Width = 280 _
            }

	obClassicTree.DataBindings.Add(New NodeBinding() With { _
		.DataMember = "employee", _
		.ValueField = "value", _
		.TextField = "name", _
		.ImageUrl = "img/engineer-icon.png" _
	})
	Me.TreePlaceHolder.Controls.Add(obClassicTree)
End Sub
Private Sub Page_load(sender As Object, e As EventArgs)
	'Bind the treeview
	obClassicTree.DataBind()
	'Expand first root node!
	obClassicTree.Nodes(0).Expanded = True
End Sub

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
        function pageLoad(sender,args) {
            var obTreeClientObj=$find("<%=obClassicTree.ClientID %>");
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
                    <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
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
