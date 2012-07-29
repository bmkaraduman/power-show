<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_InsideDetailsView.aspx.vb" Inherits="FileUpload_vb_InsideDetailsView" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.FileUpload"
    TagPrefix="obout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>FileUpload example</title>
    <style type="text/css">
            a {
                   font-size:10pt;font-family:Tahoma
            }
            a:hover {
                   color:crimson;
            }
            .tdText {
                    font:11px Verdana;
                    color:#333333;
            }
    </style>
</head>
<body>
    <script type="text/JavaScript">
        function onClientBeforeUpload(sender, args) {
            $get("<%= label.ClientID %>").innerHTML = "";
            return true;
        }
        function cancelFileUpload() {
            // find FileUpload
            var fileUpload = $find('<%= DetailsView1.FindControl("fileUpload1").ClientID %>');
            if (fileUpload && fileUpload._filesList) {
                // can not cancel already
                if (fileUpload.get_isInProgress()) {
                    return false;
                }
                // reset files list
                fileUpload._filesList.clear(true);
            }
            return true;
        }
    </script>
    <span class="tdText"><b>Obout.Ajax.UI.FileUpload</b> - Inside <b>DetailsView</b> control</span>
    <br /><br />
    <a href="Default.aspx?type=VBNET">< Back to examples</a>
    <br /><br />
    <form id="form1" runat="server" enctype="multipart/form-data" method="post">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" >
        <Scripts>
            <%-- Trick against Chrome & Safari bad dynamic scripts loading. We should force preloading --%>
            <asp:ScriptReference Assembly="Obout.Ajax.UI" Name="Obout.Ajax.UI.Common.Common.js" />
            <asp:ScriptReference Assembly="Obout.Ajax.UI" Name="Obout.Ajax.UI.Common.Library.js" />
            <asp:ScriptReference Assembly="Obout.Ajax.UI" Name="Obout.Ajax.UI.ExtenderBase.BaseScripts.js" />
            <asp:ScriptReference Assembly="Obout.Ajax.UI" Name="Obout.Ajax.UI.FileUpload.FileUpload.js" />
        </Scripts>
        </asp:ScriptManager>
         Click 'Edit' to see <b>FileUpload</b>.
        <br /><br />
        <asp:UpdatePanel runat="server" ID="UpdatePanel1"><ContentTemplate>
	        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
                ProviderName="System.Data.OleDb"
                SelectCommand="SELECT TOP 1 [OrderID], [OrderDate], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC"
                UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode, ShipCountry=@ShipCountry WHERE OrderID=@OrderID"
                >
                <UpdateParameters>
                    <asp:Parameter Name="ShipName" Type="String" />
                    <asp:Parameter Name="ShipCity" Type="String" />
                    <asp:Parameter Name="ShipRegion" Type="String" />
                    <asp:Parameter Name="ShipPostalCode" Type="String" />
                    <asp:Parameter Name="ShipCountry" Type="String" />
                    <asp:Parameter Name="OrderID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSource1" OnItemUpdated="myItemUpdated" Width="350px" AutoGenerateRows="false" >
                <Fields>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:linkbutton id="Edit"
                              text="Edit"
                              commandname="Edit"
                              runat="server"/> 
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:linkbutton id="Update"
                              text="Update"
                              commandname="Update"
                              runat="server"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:linkbutton id="Cancel" OnClientClick="return cancelFileUpload();"
                              text="Cancel"
                              commandname="Cancel"
                              runat="server"/> 
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OrderID" HeaderText="Order:" />
                    <asp:BoundField DataField="ShipName" HeaderText="Name:" />
                    <asp:BoundField DataField="ShipCity" HeaderText="City:" />
                    <asp:BoundField DataField="ShipRegion" HeaderText="Region:" />
                    <asp:BoundField DataField="ShipCountry" HeaderText="Country:" />
                    <asp:BoundField DataField="ShipPostalCode" HeaderText="Postal Code:" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <%--We need invisible FileUpload here for correct work--%>
                            <obout:FileUpload Visible="false"
                                ValidFileExtensions="jpeg;jpg;gif;tiff;png" MaximumTotalFileSize="10240"
                                runat="server" id="fileUpload1"
                            />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <obout:FileUpload OnClientBeforeUpload="onClientBeforeUpload"
                                ValidFileExtensions="jpeg;jpg;gif;tiff;png" MaximumTotalFileSize="10240"
                                Width="250px" runat="server" id="fileUpload1" BrowseFieldDescription="Images"
                            />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <br /><br />
            <asp:Label runat="server" ID="label" Text="" />
        </ContentTemplate></asp:UpdatePanel>
    </form>
</body>
</html>