<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Right To Left Support</title>
    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <br />
    <a class="examples" href="Default.aspx?type=ASPNET">« Back to examples</a>
    <br />
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <h2>
        ASP.NET TreeView - Right To Left Support
    </h2>
    <obout:Tree ID="ObTree" runat="server" AllowNodeEdit="true" EnableDragAndDrop="true"
        Width="200px" dir="rtl">
        <Nodes>
            <obout:Node Text="ألوان" ImageUrl="img/folder_rtl.png" Expanded="true">
                <obout:Node Text="أحمر" ImageUrl="img/document_rtl.png">
                </obout:Node>
                <obout:Node Text="أزرق" ImageUrl="img/document_rtl.png">
                </obout:Node>
                <obout:Node Text="أخضر" ImageUrl="img/document_rtl.png">
                </obout:Node>
            </obout:Node>
            <obout:Node Text="أشكال" ImageUrl="img/folder_rtl.png" Expanded="true">
                <obout:Node Text="دائرة" ImageUrl="img/document_rtl.png">
                </obout:Node>
                <obout:Node Text="مربع " ImageUrl="img/document_rtl.png">
                </obout:Node>
                <obout:Node Text="مثلث " ImageUrl="img/document_rtl.png">
                </obout:Node>
            </obout:Node>
        </Nodes>
    </obout:Tree>
    </form>
</body>
</html>
