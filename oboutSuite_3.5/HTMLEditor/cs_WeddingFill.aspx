<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_WeddingFill.aspx.cs" Inherits="HTMLEditor_cs_WeddingFill" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" TagPrefix="obout" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Editor Sample</title>
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
<body style="font:12px Verdana;">
    <script type="text/javascript">
        function pageLoad() {
            // trick against incorrect script loading on partial postback
            // if Safari or Google Chrome
            if (Sys.Browser.agent === Sys.Browser.Safari) {
                if (typeof Sys._ScriptLoader.prototype._loadScriptsInternal_saved != "function") {
                    // save some original functions
                    Sys._ScriptLoader.prototype._loadScriptsInternal_saved = Sys._ScriptLoader.prototype._loadScriptsInternal;
                    Sys.UI.DomEvent.removeHandler_saved = Sys.UI.DomEvent.removeHandler;
                    // override them
                    Sys._ScriptLoader.prototype._loadScriptsInternal = function () {
                        var client = Sys.Browser.agent;
                        Sys.Browser.agent = Sys.Browser.InternetExplorer;
                        $removeHandler = Sys.UI.DomEvent.removeHandler = function (element, eventName, handler) {
                            try {
                                Sys.UI.DomEvent.removeHandler_saved(element, eventName, handler);
                            } catch (ex) {
                            }
                        };
                        this._loadScriptsInternal_saved();
                        Sys.Browser.agent = client;
                    }
                } else {
                    $removeHandler = Sys.UI.DomEvent.removeHandler = Sys.UI.DomEvent.removeHandler_saved;
                }
            }
            // prepare radio buttons in the Grid
            var isEditor = $find("<%= editor.ClientID %>") != null;
            var checks = document.getElementsByName("grpSelect");
            for (var i = 0; i < checks.length; i++) {
                checks[i].disabled = isEditor;
            }
            // 'wait' images processing
            function invokingRequest() {
                Sys.Net.WebRequestManager.remove_invokingRequest(invokingRequest);
                var wait = $get("wait1");
                if (wait != null) {
                    wait.style.visibility = "visible";
                }
                wait = $get("wait2");
                if (wait != null) {
                    wait.style.visibility = "visible";
                }
            }
            Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
            var wait = $get("wait1");
            if (wait != null) {
                wait.style.visibility = "hidden";
                wait.style.height = document.getElementById("<%=Submit.ClientID%>").offsetHeight + "px";
            }
            wait = $get("wait2");
            if (wait != null) {
                wait.style.visibility = "hidden";
                wait.style.height = document.getElementById("<%=Cancel.ClientID%>").offsetHeight + "px";
            }
        }
        function editorLoaded(sender, args) {
            if (Sys.Browser.agent == Sys.Browser.InternetExplorer && Sys.Browser.version >= 8) {
                var editorElement = sender.get_owner().get_element();
                editorElement.style.height = $get("container").offsetHeight + "px";
            }
        }
        function ensureChecked() {
            var checks = document.getElementsByName("grpSelect");
            var checked = false;
            for (var i = 0; i < checks.length; i++) {
                if (checks[i].checked) {
                    checked = true;
                    break;
                }
            }
            if (!checked) {
                setTimeout(function () { alert("Select row in the Grid before!"); }, 0);
            }
            return checked;
        }
    </script>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Documents generator</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        Select row in the Grid and click <i>'Populate document'</i>.<br /><br />
        <asp:Label runat="server" id="forDataGrid" >
              <asp:DataGrid id="MyDataGrid" runat="server"
                PagerStyle-Mode="NumericPages"
                PagerStyle-HorizontalAlign="Right"
                BorderColor="black"
                BorderWidth="1"
                GridLines="Both"
                CellPadding="3"
                CellSpacing="0"
                Font-Name="Verdana"
                Font-Size="8pt"
                HeaderStyle-BackColor="#aaaadd"
                AlternatingItemStyle-BackColor="#eeeeee"
                AutoGenerateColumns="false"
                DataKeyField="id"
               >
                  <Columns>
                    <asp:TemplateColumn headertext="Select" > 
                          <ItemTemplate> 
                             <input type="radio" name="grpSelect" tabindex="9" value='<%# ((DataRowView)Container.DataItem)["id"] %>'
                              <%# GetChecked((bool)(((DataRowView)Container.DataItem)["checked"])) %> /> 
                          </ItemTemplate> 
                    </asp:TemplateColumn> 
                    <asp:BoundColumn HeaderText="Parents" DataField="fldParents" ReadOnly="true"/>
                    <asp:BoundColumn HeaderText="Child's sex" DataField="fldChildSex" ReadOnly="true"/>
                    <asp:BoundColumn HeaderText="Child's name" DataField="fldChildName" ReadOnly="true"/>
                    <asp:BoundColumn HeaderText="Fiance(e)" DataField="fldFiance" ReadOnly="true"/>
                    <asp:TemplateColumn headertext="Date" > 
                          <ItemTemplate> 
                             <%# ((DateTime)(((DataRowView)Container.DataItem)["fldDate"])).ToShortDateString() %>
                          </ItemTemplate> 
                    </asp:TemplateColumn> 
                    <asp:BoundColumn HeaderText="Church" DataField="fldChurch" ReadOnly="true"/>
                    <asp:BoundColumn HeaderText="City" DataField="fldCity" ReadOnly="true"/>
                    <asp:BoundColumn HeaderText="State" DataField="fldState" ReadOnly="true"/>
                  </Columns>
              </asp:DataGrid>
        </asp:Label>
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <div style="height: 300px; width:650px" id="container">
                   <asp:Label runat="server" ID="Preview" >
                       <asp:button runat="server" ID="Submit" Text="Populate document" OnClick="SubmitClicked" OnClientClick="return ensureChecked();" />
                       <img alt="" id="wait1" align="absMiddle" style="visibility:hidden; height: 30px" src="<%=Page.ClientScript.GetWebResourceUrl(typeof(Obout.Ajax.UI.HTMLEditor.Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_wait.gif")%>" />
                       <br />
                       <div style="width:100%; height:100%; border: 1px solid gray">
                            <asp:Label runat="server" id="forWedding" />
                       </div>
                   </asp:Label>
                   <asp:Label runat="server" ID="Edit" Visible="false" >
                       <asp:button runat="server" ID="Cancel" Text="Cancel" OnClick="CancelClicked" />
                       <img alt="" id="wait2" align="absMiddle" style="visibility:hidden; height: 30px" src="<%=Page.ClientScript.GetWebResourceUrl(typeof(Obout.Ajax.UI.HTMLEditor.Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_wait.gif")%>" />
                       <obout:Editor runat="server" Id="editor" Height="100%" Width="100%" EditPanel-OnClientLoaded="editorLoaded">
                         <TopToolbar Appearance="Lite">
                            <AddButtons>
                                <obout:HorizontalSeparator runat="server" />
                                <obout:Print runat="server" />
                            </AddButtons>
                         </TopToolbar>
                         <BottomToolBar ShowDesignButton="false" ShowHtmlTextButton="false" ShowPreviewButton="false" >
                         </BottomToolBar>
                       </obout:Editor>
                   </asp:Label>
               </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>