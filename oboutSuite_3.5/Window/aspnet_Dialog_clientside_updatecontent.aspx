<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Dialog updates content at client-side</title>
<script>

function initContent()
{
    document.getElementById("txtName").value = document.getElementById("divName").firstChild.nodeValue;
    document.getElementById("slAge").value = document.getElementById("divAge").firstChild.nodeValue;
    document.getElementById("txtEmail").value = document.getElementById("divEmail").firstChild.nodeValue;
}

function updateContent()
{
    document.getElementById("divName").firstChild.nodeValue = document.getElementById("txtName").value;
    document.getElementById("divAge").firstChild.nodeValue = document.getElementById("slAge").value;
    document.getElementById("divEmail").firstChild.nodeValue = document.getElementById("txtEmail").value;
    myDialog.Close();
}

</script>

</head>
<body style="font-family:Tahoma;font-size:10pt;">

    <form id="form1" runat="server">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />    
        <center>
        <table border="0" style="border:solid thin gray;background-color:Yellow;" cellpadding="0" cellspacing="0">
            <tr style="background-color:lightblue;">
                <td colspan="2">Contact Detail</td>
                <td align="right"> <a href="javascript:void 0" onclick="myDialog.Open()">Edit</a></td>
            </tr>   
            
            <tr>
                <td style="width:50px; font-weight:bold;">Name:</td>
                <td><div id="divName">William</div></td>
            </tr>
            <tr>
                <td style="font-weight:bold;">Age:</td>
                <td><div id="divAge">18-23</div></td>
            </tr>
            <tr>
                <td style="font-weight:bold;">Email:</td>
                <td><div id="divEmail">william@obout.com</div></td>
            </tr>  
                               
        </table>
        </center>
        
        <owd:Dialog ID="myDialog" runat="server" Height="180" StyleFolder="wdstyles/default" Title="Contact Details" Width="300" IsModal="true" OnClientOpen="initContent()">
           <center>
           <br />
            <table>
                <tr>
                    <td style="width:50px;" align="left">Name:</td>
                    <td align="left"><input type="text" id="txtName" /></td>
                </tr>
                <tr>
                    <td align="left">Age</td>
                    <td align="left">
                        <select id="slAge">
                            <option value="18-23">18-23</option>
                            <option value="24-30">24-30</option>
                            <option value="30-40">30-40</option>
                        </select>
                    
                    </td>
                </tr>
                <tr>
                    <td align="left">Email:</td>
                    <td align="left"><input type="text" id="txtEmail" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <br />
                        
                        <table style="width:150px">
                            <tr>
                                <td align="left"><input type="button" value="Update" onclick="updateContent()" /></td>
                                <td align="right"><input type="button" value="Cancel" onclick="myDialog.Close()" /></td>
                            </tr>
                        </table>
                        
                        
                    </td>
                </tr>
            </table>
            </center>
        </owd:Dialog>
        
    </form>
</body>
</html>
