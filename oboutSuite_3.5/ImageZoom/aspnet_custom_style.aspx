<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Title="ASPNET ImageZoom example" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<style type="text/css">
.IZ_outer{
	width:780px;
	height:100px;
}
.IZ_left{
	width:40px;
	height:100px;
	background-image:url(images/icons/arrow_left.png);
	background-repeat:no-repeat;
	background-position:center;
	float:left;
	cursor:pointer;
	list-style-type:none;
}
.IZ_left:hover{
	width:40px;
	height:100px;
	background-image:url(images/icons/arrow_left_hover.png);
	background-repeat:no-repeat;
	background-position:center;
	float:left;
	cursor:pointer;
}
.IZ_left_inactive{
	width:40px;
	height:100px;
	background-image:url(images/icons/arrow_left_inactive.png);
	background-repeat:no-repeat;
	background-position:center;
	float:left;
	cursor:pointer;
}
.IZ_right{
	width:40px;
	height:100px;
	background-image:url(images/icons/arrow_right.png);
	background-repeat:no-repeat;
	background-position:center;
	float:left;
	cursor:pointer;
	list-style-type:none;
}
.IZ_right:hover{
	width:40px;
	height:100px;
	background-image:url(images/icons/arrow_right_hover.png);
	background-repeat:no-repeat;
	background-position:center;
	float:left;
	cursor:pointer;
}
.IZ_right_inactive{
	width:40px;
	height:100px;
	background-image:url(images/icons/arrow_right_inactive.png);
	background-repeat:no-repeat;
	background-position:center;
	float:left;
	cursor:pointer;
}
.IZ_thumb{
	width:650px;
	height:100px;
	float:left;
	text-align:center;
}
.ImageZoomEntryContainer
{
    border:0 !important;
}
</style>

<h3> Gallery -  Custom Style </h3> 
<center>

<div class="IZ_outer">
<div  onclick="Prev()"><li class="IZ_left"></li></div>

<div class="IZ_thumb">
<obout:ImageZoom runat="server" ID="imageZoom1" ImageUrl="images" Description="Miss World 2007" Width="650px" PageSize="5" ShowFooter="false" AllowImageSizeSelection="false" AllowPageSizeSelection="false" CallbackMode="true"  />
</div>

<div class="IZ_right" onclick="Next()"><li class="IZ_right"></li></div>
</div>
    

<script type="text/javascript">
    function Next() {
        var iz=<%=imageZoom1.ClientID %>;
        if(iz.pageIndex().value < iz.totalPage().value)
        iz.NextPage();
    }

    function Prev() {
        var iz=<%=imageZoom1.ClientID %>;
       if(iz.pageIndex().value > 1)
        iz.PrevPage();
    }

</script>

</center>
</asp:Content>
