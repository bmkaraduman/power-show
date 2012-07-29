<%@ Page Language="C#" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Web.UI" %>

<script runat="server" Language="C#">
    void Page_load(object sender, EventArgs e)
    {
        try
        {
            XmlTextReader oXMLReader = null;
            oXMLReader = new XmlTextReader(Server.MapPath("examples.xml"));
            while (oXMLReader.Read())
            {
                if (oXMLReader.NodeType == XmlNodeType.Element && oXMLReader.Name == "path")
                {
                    lblPath.Text = "<b>Path to folder with Scheduler examples: </b>" + oXMLReader.ReadString();
                }
            }
            oXMLReader.Close();
        }
        catch
        {
        }

    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ImageZoom Examples</title>
    <style type="text/css">
		td.link{
			padding-left:30px;
			width:250px;			
		}
		
		td.header {
			padding-top:20px;
			border-bottom:1px solid #eeeeee;
			color:#555555;
		}
		
		.tdText {
			font:11px Verdana;
			color:#333333;
		}
		.option2{
			font:11px Verdana;
			color:#0033cc;
			background-color___:#f6f9fc;
			padding-left:4px;
			padding-right:4px;
		}
		a {
			font:11px Verdana;
			color:#315686;
			text-decoration:underline;
		}

		a:hover {
			color:crimson;
		}
		
		ul.sitemap
		{
		    list-style-type:none;
		    display:inline-block;
		}
		ul.sub
		{
		    width:550px;
		    color: #333;
            font: normal normal normal 11px/normal Verdana;
            padding-left:20px;
		}
		
		li.subHeader
		{
		    font:11px Verdana;
		    padding-top:40px;
			border-bottom:1px solid #eeeeee;
			color:#555555;
		}
		li.item
		{
		    display:block;
		    clear:both;
		    list-style-type:none;
		    
		}
		
		div.pagelink
		{
		    float:left;
		    padding-top:5px;
		}
		.pagelink a
		{
		    padding-left:5px;
			width:250px;	
			color: #315686;
            font: normal normal normal 11px/normal Verdana;
            text-decoration: underline;
		}
		div.description
		{
		    width:300px;
		    text-align:left;
		    padding-top:5px;
		    float:right;
		}
		
		
	</style>
	<script type="text/javascript">
	    function exChange(nameDIV)
	    {
		    document.getElementById("cs").style.display = "none";
            document.getElementById("vb").style.display = "none";
            document.getElementById("aspnet").style.display = "none";
            document.getElementById(nameDIV).style.display = "block";
            document.getElementById("rcs").checked = false;
            document.getElementById("raspnet").checked = false;
            document.getElementById("rvb").checked = false;  
            document.getElementById("r"+nameDIV).checked = true;                       
	    }
	</script>
</head>
<body>
<form id="form1" runat="server">
 <div class="tdText">
        <a href="../Default.aspx">« Back to Suite Examples</a>
        <br /><br /><br />
        <span style="font-weight:bold;">obout ImageZoom examples</span>
        <br />
        <br />
        Select the examples you want to see:&#160;&#160;&#160;
        <input type="radio" id="raspnet" name="exSelect" value ="asp" onclick="exChange('aspnet')"/> ASP.NET
        <input type="radio" id="rcs" name="exSelect" value ="cs" onclick="exChange('cs')"/> C#.NET
        <input type="radio" id ="rvb" name="exSelect" value ="vb" onclick="exChange('vb')"/> VB.NET
        <br /><br />
        <asp:Label runat="server" ID="lblPath"></asp:Label>
        <br /><br />
          
     
     <div id="aspnet" style="display: block">
         <span class="tdText"><b>ASP.NET</b></span><br /><br />
         <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" SiteMapProvider="izaspnet"
             ShowStartingNode="false" />
         <ul class="sitemap">
             <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SiteMapDataSource1">
                 <HeaderTemplate>
                 </HeaderTemplate>
                 <ItemTemplate>
                     <li class="subHeader"><b>
                         <%# Eval("Title") %></b></li><li>
                             <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# ((SiteMapNode)Container.DataItem).ChildNodes %>'>
                                 <HeaderTemplate>
                                     <ul class="sub">
                                 </HeaderTemplate>
                                 <ItemTemplate>
                                     <li class="item">
                                         <div class="pagelink">
                                             <a href="<%# Eval("Url") %>">
                                                 <%# Eval("Title") %></a></div>
                                         <div class="description">
                                             <%# Eval("Description") %></div>
                                     </li>
                                 </ItemTemplate>
                                 <FooterTemplate>
                                     </ul></FooterTemplate>
                             </asp:Repeater>
                         </li>
                 </ItemTemplate>
                 <FooterTemplate>
                     </li></FooterTemplate>
             </asp:Repeater>
         </ul>
     </div>   		   
		        
		<div id="cs" style="display:none">
		    <span class="tdText"><b>C#.NET</b></span><br /><br />
            <asp:SiteMapDataSource ID="SiteMapDataSource2" runat="server" SiteMapProvider="izcs"
             ShowStartingNode="false" />
			<ul class="sitemap">
             <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SiteMapDataSource2">
                 <HeaderTemplate>
                 </HeaderTemplate>
                 <ItemTemplate>
                     <li class="subHeader"><b>
                         <%# Eval("Title") %></b></li><li>
                             <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# ((SiteMapNode)Container.DataItem).ChildNodes %>'>
                                 <HeaderTemplate>
                                     <ul class="sub">
                                 </HeaderTemplate>
                                 <ItemTemplate>
                                     <li class="item">
                                         <div class="pagelink">
                                             <a href="<%# Eval("Url") %>">
                                                 <%# Eval("Title") %></a></div>
                                         <div class="description">
                                             <%# Eval("Description") %></div>
                                     </li>
                                 </ItemTemplate>
                                 <FooterTemplate>
                                     </ul></FooterTemplate>
                             </asp:Repeater>
                         </li>
                 </ItemTemplate>
                 <FooterTemplate>
                     </li></FooterTemplate>
             </asp:Repeater>
         </ul>
		</div>  
    
		<div id="vb" style="display:none">
		    <span class="tdText"><b>VB.NET</b></span>
            <br /><br />
            <asp:SiteMapDataSource ID="SiteMapDataSource3" runat="server" SiteMapProvider="izvb"
             ShowStartingNode="false" />
			<ul class="sitemap">
             <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SiteMapDataSource3">
                 <HeaderTemplate>
                 </HeaderTemplate>
                 <ItemTemplate>
                     <li class="subHeader"><b>
                         <%# Eval("Title") %></b></li><li>
                             <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# ((SiteMapNode)Container.DataItem).ChildNodes %>'>
                                 <HeaderTemplate>
                                     <ul class="sub">
                                 </HeaderTemplate>
                                 <ItemTemplate>
                                     <li class="item">
                                         <div class="pagelink">
                                             <a href="<%# Eval("Url") %>">
                                                 <%# Eval("Title") %></a></div>
                                         <div class="description">
                                             <%# Eval("Description") %></div>
                                     </li>
                                 </ItemTemplate>
                                 <FooterTemplate>
                                     </ul></FooterTemplate>
                             </asp:Repeater>
                         </li>
                 </ItemTemplate>
                 <FooterTemplate>
                     </li></FooterTemplate>
             </asp:Repeater>
         </ul>
		</div>     
    

		
		<script type="text/javascript">
		    exChange("<% Response.Write((Request.Params["div"]==null)?"aspnet":Request.Params["div"]); %>");
		</script>
		
		<br />
		<br />
		<div class="tdText" style="width: 525px;">
		 </div>
        <br />
        <br />
        <a href="http://www.obout.com/scheduler">obout Scheduler home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>

      </div>       
      </form>
</body>
</html>
