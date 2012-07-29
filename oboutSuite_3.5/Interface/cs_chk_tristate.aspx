<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutCheckBox ChkTechnologies;
    OboutCheckBox ChkNetFramework;
    OboutCheckBox ChkAspNet;
    OboutCheckBox OboutCheckBox1;
    OboutCheckBox OboutCheckBox2;
    OboutCheckBox OboutCheckBox3;
    OboutCheckBox ChkCSharp;
    OboutCheckBox ChkVB;
    OboutCheckBox ChkOther;
    OboutCheckBox ChkPhp;
    OboutCheckBox ChkRuby;
    OboutCheckBox ChkJava;
    
    void Page_load(object sender, EventArgs e)
    {
        ChkTechnologies = new OboutCheckBox();
        ChkTechnologies.ID = "ChkTechnologies";
        ChkTechnologies.Text = "Technologies";

        PlaceHolder1.Controls.Add(ChkTechnologies);
        
        
        ChkNetFramework = new OboutCheckBox();
        ChkNetFramework.ID = "ChkNetFramework";
        ChkNetFramework.ParentCheckBoxID = "ChkTechnologies";
        ChkNetFramework.Text = ".NET Framework";

        PlaceHolder2.Controls.Add(ChkNetFramework);
        
        
        ChkAspNet = new OboutCheckBox();
        ChkAspNet.ID = "ChkAspNet";
        ChkAspNet.ParentCheckBoxID = "ChkNetFramework";
        ChkAspNet.Text = "ASP.NET";

        PlaceHolder3.Controls.Add(ChkAspNet);
        
        
        OboutCheckBox1 = new OboutCheckBox();
        OboutCheckBox1.ID = "OboutCheckBox1";
        OboutCheckBox1.ParentCheckBoxID = "ChkAspNet";
        OboutCheckBox1.Text = "ASP.NET";

        PlaceHolder4.Controls.Add(OboutCheckBox1);
        
        
        OboutCheckBox2 = new OboutCheckBox();
        OboutCheckBox2.ID = "OboutCheckBox2";
        OboutCheckBox2.ParentCheckBoxID = "ChkAspNet";
        OboutCheckBox2.Text = "ASP.NET MVC";

        PlaceHolder5.Controls.Add(OboutCheckBox2);
        
        
        OboutCheckBox3 = new OboutCheckBox();
        OboutCheckBox3.ID = "OboutCheckBox3";
        OboutCheckBox3.ParentCheckBoxID = "ChkAspNet";
        OboutCheckBox3.Text = "ASP.NET Dynamic Data";

        PlaceHolder6.Controls.Add(OboutCheckBox3);
        
        
        ChkCSharp = new OboutCheckBox();
        ChkCSharp.ID = "ChkCSharp";
        ChkCSharp.ParentCheckBoxID = "ChkNetFramework";
        ChkCSharp.Text = "C#";

        PlaceHolder7.Controls.Add(ChkCSharp);
        
        
        ChkVB = new OboutCheckBox();
        ChkVB.ID = "ChkVB";
        ChkVB.ParentCheckBoxID = "ChkNetFramework";
        ChkVB.Text = "VB";

        PlaceHolder8.Controls.Add(ChkVB);
        
        
        ChkOther = new OboutCheckBox();
        ChkOther.ID = "ChkOther";
        ChkOther.ParentCheckBoxID = "ChkTechnologies";
        ChkOther.Text = "Other";

        PlaceHolder9.Controls.Add(ChkOther);
        
        
        ChkPhp = new OboutCheckBox();
        ChkPhp.ID = "ChkPhp";
        ChkPhp.ParentCheckBoxID = "ChkOther";
        ChkPhp.Text = "PHP";

        PlaceHolder10.Controls.Add(ChkPhp);
        
        
        ChkRuby = new OboutCheckBox();
        ChkRuby.ID = "ChkRuby";
        ChkRuby.ParentCheckBoxID = "ChkOther";
        ChkRuby.Text = "Ruby";

        PlaceHolder11.Controls.Add(ChkRuby);
        
        
        ChkJava = new OboutCheckBox();
        ChkJava.ID = "ChkJava";
        ChkJava.ParentCheckBoxID = "ChkOther";
        ChkJava.Text = "Java";

        PlaceHolder12.Controls.Add(ChkJava);
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html>
	<head>
		<title>obout Interface examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}			
			
			.option2{
				font:11px Verdana;
				color:#0033cc;				
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
			
			.button
			{
			    font:11px Verdana;
				color:#333333;
				width: 175px;
			}
			
			.tab
			{
			    float: left;
			    width: 20px;
			    font-size: 10px;
			    font-family: Verdana;
			}
			
			.spacer
			{
			    height: 3px;
			}
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutCheckBox - Linked CheckBoxes with Tri-States</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div>
		<asp:PlaceHolder runat="server" ID="PlaceHolder2" />
		
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div><div class="tab">&#160;</div>
		<asp:PlaceHolder runat="server" ID="PlaceHolder3" />
		
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div><div class="tab">&#160;</div><div class="tab">&#160;</div>
		<asp:PlaceHolder runat="server" ID="PlaceHolder4" />
		
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div><div class="tab">&#160;</div><div class="tab">&#160;</div>
		<asp:PlaceHolder runat="server" ID="PlaceHolder5" />
		
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div><div class="tab">&#160;</div><div class="tab">&#160;</div>
		<asp:PlaceHolder runat="server" ID="PlaceHolder6" />
		
		<div class="spacer">&#160;</div>
		    
		<div class="tab">&#160;</div><div class="tab">&#160;</div>
		<asp:PlaceHolder runat="server" ID="PlaceHolder7" />
		
		<div class="spacer">&#160;</div>
		    
		<div class="tab">&#160;</div><div class="tab">&#160;</div>
		<asp:PlaceHolder runat="server" ID="PlaceHolder8" />
		    
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div>
		<asp:PlaceHolder runat="server" ID="PlaceHolder9" />
		
		<div class="spacer">&#160;</div>
		
		<div class="tab">&#160;</div><div class="tab">&#160;</div>
		<asp:PlaceHolder runat="server" ID="PlaceHolder10" />
		
		<div class="spacer">&#160;</div>
		    
		<div class="tab">&#160;</div><div class="tab">&#160;</div>
		<asp:PlaceHolder runat="server" ID="PlaceHolder11" />
		
		<div class="spacer">&#160;</div>
		    
		<div class="tab">&#160;</div><div class="tab">&#160;</div>
		<asp:PlaceHolder runat="server" ID="PlaceHolder12" />
		
		<br /><br />
		
		<span class="tdText">
		    Use the <b>ParentCheckBoxID</b> property to link child check boxes to their parent check boxes.<br />
		    When a parent check box has checked and unchecked child check boxes, it will be partially checked.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>