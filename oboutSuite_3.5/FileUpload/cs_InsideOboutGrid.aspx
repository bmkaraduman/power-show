<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_InsideOboutGrid.aspx.cs" Inherits="FileUpload_cs_InsideOboutGrid" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.FileUpload" TagPrefix="obout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

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
    <script type="text/javascript">

        var delayedCallRemoved = false;
        var recordInEditMode = null;
        var fileUpload = null;
        var filesClearedHandler = null;
        var fileWasPicked = false;

        function pageLoad() {
            delayedCallRemoved = false;
            recordInEditMode = null;
            fileUpload = null;
            filesClearedHandler = null;
            fileWasPicked = false;
        }

        function onBeforeClientUpdate(record) {
            document.getElementById("<%= ServerResponse.ClientID %>").value = record.ProductID;
            if (delayedCallRemoved || !fileWasPicked) {
                return true;
            }
            __doPostBack('<%= postIt.ClientID %>', '');
            return false;
        }
        function onClientUpdate(record) {
            if (delayedCallRemoved) {
                if (recordInEditMode != null) {
                    grid1.edit_record(recordInEditMode);
                    recordInEditMode = null;
                    setTimeout(function () { grid1.update_record(grid1.RecordInEditMode); }, 0);
                } else {
                    grid1.edit_record(grid1.Rows.length - 1);
                    recordInEditMode = null;
                    setTimeout(function () { grid1.update_record(grid1.Rows.length - 1); }, 0);
                }
                delayedCallRemoved = false;
            }
        }
        function onBeforeClientCancelEdit() {
            if (fileUpload && fileUpload._filesList) {
                fileUpload._filesList.clear(true);
            }
            return true;
        }

        function serverResponsed(sender, args) {
            sender._delayedCall = null;
            delayedCallRemoved = true;
            recordInEditMode = grid1.RecordInEditMode;
            if (recordInEditMode != null) {
                grid1.update_record(recordInEditMode);
            } else {
                grid1.insertRecord();
            }
        }
        function clearedHandler(sender, args) {
            fileWasPicked = false;
        }
        function filesPicked(sender, args) {
            fileUpload = sender;
            if (filesClearedHandler == null) {
                filesClearedHandler = Function.createDelegate(sender, clearedHandler);
                sender.add_filesCleared(filesClearedHandler);
            }
            if (args.get_files().length > 1) {
                alert("Too many files selected!");
                args.set_cancel(true);
            } else {
                fileWasPicked = true;
            }
        }
    </script>

    <span class="tdText"><b>Obout.Ajax.UI.FileUpload</b> - Inside <b>obout Grid</b> control</span>
    <br /><br />
    <a href="Default.aspx?type=CSHARP">< Back to examples</a>
    <br /><br />
  <form runat="server" enctype="multipart/form-data" method="post">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <asp:UpdatePanel runat="server" ID="UpdatePanel1"><ContentTemplate>
            <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
                 FolderStyle="~/Grid/styles/grand_gray" AllowFiltering="false" AllowAddingRecords="true"
                 OnRebind="RebindGrid" OnUpdateCommand="UpdateRecord" OnDeleteCommand="DeleteRecord" OnInsertCommand="InsertRecord">
                 <ClientSideEvents
                      OnClientUpdate="onClientUpdate"
                      OnBeforeClientUpdate="onBeforeClientUpdate"
                      OnClientInsert="onClientUpdate"
                      OnBeforeClientInsert="onBeforeClientUpdate"
                      OnBeforeClientCancelEdit="onBeforeClientCancelEdit"
                 />
                <Columns>
		            <obout:Column ID="Column1" DataField="ProductID" ReadOnly="true" HeaderText="Product ID" Width="125" runat="server" AllowSorting="false" />				
		            <obout:Column ID="Column2" DataField="ProductName" HeaderText="Product Name" Width="225" runat="server" AllowSorting="false" />				
		            <obout:Column ID="Column3" DataField="UnitPrice" HeaderText="Unit Price" Width="150" runat="server" AllowSorting="false" />
		            <obout:Column ID="Column4" DataField="Image" HeaderText="Image" Width="300" runat="server" AllowSorting="false">	
		                <TemplateSettings TemplateId="ImageTemplate" EditTemplateId="EditImageTemplate" />	    
		            </obout:Column>
		            <obout:Column ID="Column5" HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="125" runat="server" />
	            </Columns>
                <Templates>
                    <obout:GridTemplate runat="server" ID="EditImageTemplate" ControlID="photopath_text" ControlPropertyName="value">
                        <Template>
                            <input type="hidden" id="photopath_text" name="photopath_text" />
                            <obout:FileUpload ValidFileExtensions="jpeg;jpg;gif;tiff;png" MaximumFileSize="20480" FeedbackMode="HttpHandler"
                                runat="server" ID="fuIcone" ClearIfRendered="true"
                                OnClientAfterServerResponse="serverResponsed"
                                OnClientFilesPicked="filesPicked" />
                        </Template>
                    </obout:GridTemplate>
                    <obout:GridTemplate runat="server" ID="ImageTemplate">
				        <Template>
                            <img src="../Grid/resources/images/products/<%# Container.Value %>" alt="" width="50" height="50" />
                        </Template>
			        </obout:GridTemplate>
               </Templates>
            </obout:Grid>
    
            <span id="hidden_span" style="display:none"></span>
            <div style="display: none">
                <asp:Button runat="server" ID="postIt" Text="" OnClick="getImages" />
            </div>
            <asp:HiddenField runat="server" ID="ServerResponse" Value="" />
        </ContentTemplate></asp:UpdatePanel>
  </form>
</body>
</html>
