<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Page Language="vb" Inherits="synchronizescroll" Src="vb_synchronizescroll.aspx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head id="Head1" runat="server">
		<title>obout ASP.NET Splitter examples</title>
		
		<style type="text/css">
		   .tdText {
		        font:11px Verdana;
		        color:#333333;
            }
			.number {
				color:red;
				font-weight:bold;
				background-color:#66CCFF;
			}
			.text {
				background-color:#99CC99;
				color:red;
			}
		</style>
	</head>
	<body>
    <form id="Form1" runat="server">
	    <br />
		<span class="tdText"><b>ASP.NET Splitter - Synchronize Scroll</b></span>
		<br /><br />
	     <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
	    <br /><br />
		<div style="width:686px;height:440px;border:1px solid #ebe9ed">
			<obspl:Splitter id="spl1" runat="server">
				<LeftPanel>
					<header>
						<div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
						<br />
						<b>file 1</b>
						</div>
					</header>
					<content>
						<div class="tdText" style="padding-left:0px;padding-top:0px">
<pre>1 &lt;%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %&gt;
<span class="number">2</span> &lt;%@ Page Language="C#" %&gt;
3 &lt;html&gt;
<span class="number">4</span>   &lt;head <span class="text">/</span>&gt;
5   &lt;body&gt;
<span class="number">6</span>       &lt;obspl:Splitter id="splDV" runat="server" ScriptPath="/splitter/splitterscript" StyleFolder="/splitter/splitterstyles/default" <span class="text">CookieDays="0"</span>&gt;
7           &lt;LeftPanel WidthDefault="140" WidthMin="50" WidthMax="400"&gt;
8               &lt;header height="50"&gt;
9                  &lt;div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center"&gt;
10                      &lt;br /&gt;
11                      optional left header
12                  &lt;/div&gt;
13              &lt;/header&gt;
14              &lt;content&gt;
15                  &lt;div class="tdText" style="padding-left:10px;padding-top:10px"&gt;
16                      &lt;br /&gt;
17                      left panel content
18                  &lt;/div&gt;
19              &lt;/content&gt;
20              &lt;footer height="50"&gt;
21                  &lt;div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center"&gt;
22                      &lt;br /&gt;
23                      optional left footer
24                  &lt;/div&gt;
25              &lt;/footer&gt;
26          &lt;/LeftPanel&gt;
27          &lt;RightPanel&gt;
<span class="text"><span class="number">28</span>              &lt;header height="70"&gt;
<span class="number">29</span>                  &lt;div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="left"&gt;
<span class="number">30</span>                      &lt;br /&gt;
<span class="number">31</span>                      Try to move the splitter separator. &lt;br /&gt;
<span class="number">32</span>                      The splitter is not resizable.
<span class="number">33</span>                  &lt;/div&gt;
<span class="number">34</span>              &lt;/header&gt;</span>
35              &lt;content&gt;
36                  &lt;div class="tdText" style="padding-left:10px;padding-top:10px"&gt;
37                      &lt;br /&gt;
38                      right panel content
39                  &lt;/div&gt;
40              &lt;/content&gt;
<span class="text"><span class="number">41</span>              &lt;footer height="50"&gt;
<span class="number">42</span>                  &lt;div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center"&gt;
<span class="number">43</span>                      &lt;br /&gt;
<span class="number">44</span>                      optional right footer
<span class="number">45</span>                  &lt;/div&gt;
<span class="number">46</span>              &lt;/footer&gt;</span>
47          &lt;/RightPanel&gt;
48      &lt;/obspl:Splitter&gt;
49  &lt;/body&gt;
50 &lt;/html&gt;</pre>			
						</div>
					</content>
				</LeftPanel>
				<RightPanel WidthMin="100">
					<header height="40">
						<div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
						<br />
						<b>file 2</b>
						</div>
					</header>
					<content>
						<div class="tdText" style="padding-left:0px;padding-top:0px;">
<pre>
1 &lt;%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %&gt;
<span class="number">2</span> &lt;%@ Page Language="C#" <span class="text">Debug="true"</span> %&gt;
3 &lt;html&gt;
4   &lt;head&gt;
<span class="text"><span class="number">5</span>       &lt;script language="javascript"&gt;
<span class="number">6</span>           // add load event
<span class="number">7</span>           function addLoadEvent(func) {
<span class="number">8</span>               var oldonload = window.onload;
<span class="number">9</span>               if (typeof window.onload != 'function') {
<span class="number">10</span>              window.onload = func;
<span class="number">11</span>              } else {
<span class="number">12</span>                  window.onload = function() {
<span class="number">13</span>                      if (oldonload) {
<span class="number">14</span>                          oldonload();
<span class="number">15</span>                      }
<span class="number">16</span>                      func();
<span class="number">17</span>                  }
<span class="number">18</span>              }
<span class="number">19</span>          }
<span class="number">20</span>      &lt;/script&gt;
<span class="number">21</span>  &lt;/head&gt;</span>
22  &lt;body&gt;
<span class="number">23</span>      &lt;obspl:Splitter id="splDV" runat="server" ScriptPath="/splitter/splitterscript" StyleFolder="/splitter/splitterstyles/default"&gt;
24          &lt;LeftPanel WidthDefault="140" WidthMin="50" WidthMax="400"&gt;
25              &lt;header height="50"&gt;
26                  &lt;div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center"&gt;
27                      &lt;br /&gt;
28                      optional left header
29                  &lt;/div&gt;
30              &lt;/header&gt;
31              &lt;content&gt;
32                  &lt;div class="tdText" style="padding-left:10px;padding-top:10px"&gt;
33                      &lt;br /&gt;
34                      left panel content
35                  &lt;/div&gt;
36              &lt;/content&gt;
37              &lt;footer height="50"&gt;
38                  &lt;div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center"&gt;
39                      &lt;br /&gt;
40                      optional left footer
41                  &lt;/div&gt;
42              &lt;/footer&gt;
42          &lt;/LeftPanel&gt;
44          &lt;RightPanel&gt;
45              &lt;content&gt;
46                  &lt;div class="tdText" style="padding-left:10px;padding-top:10px"&gt;
47                      &lt;br /&gt;
<span class="number">48</span>                      right panel content <span class="text">here ...</span>
49                  &lt;/div&gt;
50              &lt;/content&gt;
51          &lt;/RightPanel&gt;
52      &lt;/obspl:Splitter&gt;
53  &lt;/body&gt;
54 &lt;/html&gt;
</pre>
						</div>
					</content>
				</RightPanel>
			</obspl:Splitter>
		</div>
		</form>
	</body>
</html>