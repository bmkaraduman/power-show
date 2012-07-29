<html>
	<head>
	</head>
	<body>
		<script language="javascript">
			function AddNode()
			{
				var nodeName = document.getElementById('txtNodeName').value;
				var parentID = window.parent.tree_selected_id;
				var nodeID =  + parseInt(window.parent.ob_getChildCount(window.parent.document.getElementById(parentID)) + 1);
				window.parent.ob_t2_Add(parentID, parentID + "_" + nodeID, "<span style='cursor:pointer'>" + nodeName + "</span>", null, "ball_blueS.gif", null);
			}
		</script>
		<div style="font:11px verdana; color: #333333; padding-left:20px; padding-top:20px;">
			<span style="color:crimson">In this splitter panel is loaded another page.</span><br /><br />
			Add node to the treeview in left panel<br /> using button from the page loaded in the right panel.
			<br />
			<br />
			Node text: <input type='text' id='txtNodeName' value='New Node'  style="font:11px verdana;" />
			&nbsp;<input type='button' value='Add' onclick='AddNode()' style="font:11px verdana;" />
			<br /><br /><br />
		</div>
	</body>
</html>