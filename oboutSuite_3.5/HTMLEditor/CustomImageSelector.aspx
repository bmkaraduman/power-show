<%--<%@ Page Language="VB" AutoEventWireup="true"  CodeFile="CustomImageSelector.aspx.vb" Inherits="HTMLEditor_CustomImageSelector_vb" %>--%>
<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="CustomImageSelector.aspx.cs" Inherits="HTMLEditor_CustomImageSelector" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Custom images browser</title>
    <script type="text/JavaScript">
        // will be called before close
        onbeforeunload = function (oEvent) {
            if (opener && opener.contentWindow && opener.contentWindow._processResult) {
                opener.contentWindow._processResult(null);
            }
        };
        // when body loaded
        function bodyLoaded() {
            if (opener && opener.contentWindow && opener.contentWindow._processWindowLoaded) {
                opener.contentWindow._processWindowLoaded(window);
            }
        }
        // when OK clicked
        var result = null;
        function _returnResult(img) {
            if (typeof img == "undefined") {
                img = result;
            }
            if (opener && opener.contentWindow && opener.contentWindow._processResult) {
                var url = img.getAttribute("source-url");
                var width = img.getAttribute("source-width");
                var height = img.getAttribute("source-height");
                var title = img.getAttribute("source-title");
                opener.contentWindow._processResult({ url: (url ? url : ""), width: (width ? width : ""), height: (height ? height : ""), title: (title ? title : "") });
            }
            window.close();
        }
        //when image selected
        function _setResult(img) {
            if (result) {
                result.selected = false;
                result.style.borderColor = "white";
            }
            result = img;
            result.selected = true;
            result.style.borderColor = "red";
            document.getElementById("btnOK").disabled = false;
        }
    </script>
</head>
<body onload="bodyLoaded()">
    <form id="theForm" runat="server">
    <div style="height: 450px; overflow: auto; margin-bottom: 5px; padding: 5px;
        border: 1px solid #000; text-align: left;">
        <asp:Literal ID="Literal1" Text="" runat="server"></asp:Literal>
    </div>
    <div align="center">
        <asp:Button Disabled="True" ID="btnOK" runat="server" UseSubmitBehavior="false" OnClientClick="_returnResult();return false;"
            Text="OK" />
        <asp:Button ID="btnCancel" UseSubmitBehavior="false" OnClientClick="window.close();return false;"
            runat="server" Text="Cancel" />
    </div>
    </form>
</body>
</html>
