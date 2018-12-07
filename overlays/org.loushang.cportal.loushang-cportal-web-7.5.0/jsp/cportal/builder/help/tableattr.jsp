<!DOCTYPE html >
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>表格属性</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/cportal/builder/skin/css/help.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/cportal/builder/skin/css/dialog.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/jsp/cportal/builder/skin/css/colorpicker.css"/>
<style type="text/css">
	.littleBtn{
		display:block;
		width: 200px;
		height: 20px;
		border: 1px solid #ccc;
	}
</style>
<script src="<%=request.getContextPath()%>/jsp/cportal/builder/skin/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/jsp/cportal/builder/skin/js/pinyin.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/jsp/cportal/builder/skin/js/jquery.colorpicker.js"></script> --%>
<script src="<%=request.getContextPath()%>/jsp/cportal/builder/skin/js/cportal.help.js"></script>
<script src="<%=request.getContextPath()%>/jsp/cportal/builder/skin/js/cportal.showdialog.js"></script>
</head>
<body>
	<div class="ui-tabs">
			<ul class="ui-tabs-nav">
				<li class="ui-tabs-selected">基本属性</li>
				<li>界面属性</li>
			</ul>
			<div id="baseAttrDiv" class="ui-tabs-panel">
				<ul>
					<li><label for="zoneName">表格名称</label><input type="text" id="zoneName" maxlength="100" name="zoneName"></input></li>				
					<li><input type="checkbox" id="createId" name="createId" style="display:inline;"></input><label for="createId" style="display:inline;">自动生成ID</label></li>				
					<li><label for="zoneId">表格定义ID</label><input type="text" id="zoneId" maxlength="30" name="zoneId"></input></li>				
				</ul>
			</div>
			<div class="ui-tabs-panel ui-tabs-hide">
				<ul>
					<li><label style="font-weight: bold;">表格边框</label><br/>
					<label>大小</label><br/>
					<input type="text" id="borderSize" name="表格边框大小" style="display:inline;"/>px<br/>
					<label>颜色</label>
					<a id="borderColor" class="littleBtn" style="display:block;width:200px;height:20px;position:relative;"></a>
					</li>	
					<li>
						<label>边框设置作用于</label>
						<select id="scope" name="" style="display:block;">
							<option value="0">仅表格</option>	
							<option value="1">所有单元格</option>	
						</select>
					</li>
				</ul>	
			</div>
	</div>
	<div class="foot">
			<a href="javascript:void(0);" id="confirmBtn" class="cportalhelp-confirmbtn"></a>
	</div>
</body>
<script>
	$(function() {
		// 从父窗口传递来的值
		var fromParent = window.parent.document.getElementById("popupFrame").inParam;
		var $table = $(fromParent.table);
		
		CPHelp.setCreateId(fromParent.isCreateId, 'createId', $('#zoneName'), $('#zoneId'), 'blur');
		
		if (fromParent.zoneId) {
			$("#zoneId").val(fromParent.zoneId);
		}

		if (fromParent.zoneName) {
			$("#zoneName").val(fromParent.zoneName);
		}

		initUIAttr();

		/* $('#borderColor').colorpicker({
			id : "borderColor",
			callback : function(color){
				$(this).css('backgroundColor', color);
			}
		}); */

		$('#confirmBtn').click(function(){
			// 区域ID
			var zoneId = $("#zoneId").val();
			// 区域名称
			var zoneName = $("#zoneName").val();

			//是否自动生成ID
			var isCreateId = $('#createId').is(':checked') ? '1' : '0';

			saveTableUiAttr();

			// 返回值
			var obj = new Object();
			obj.zoneId = zoneId;
			obj.zoneName = zoneName;
			obj.isCreateId = isCreateId;

			// 关闭弹出框
			closeDialog(obj);
		});

		/**
		* 保存表格的UI属性
		*/
		function saveTableUiAttr(){
			var $table = $(fromParent.table);
			var borderWidth = $('#borderSize').val();
			var borderColor = $('#borderColor').css('backgroundColor');
			var scope = $('#scope').val();
			
			setCss($table, 'borderWidth', borderWidth);
			setCss($table, 'borderColor', borderColor);
			setCss($table, 'borderStyle', 'solid');
			if(scope == '1'){
				$table.attr('cf_borderAttrScope', '1');
				setCss($('td', $table), 'borderWidth', borderWidth);
				setCss($('td', $table), 'borderColor', borderColor);
			}else{
				$table.removeAttr('cf_borderAttrScope');
			}
		};

		function setCss($obj, className, value){
			if(!$.trim(value)){
				return;
			}
			$obj.css(className, value);
		};

		function setAttr($obj, attrName, value){
			if(!$.trim(value)){
				return;
			}
			$obj.attr(attrName, value);
		};

		function initUIAttr(){
			$('#borderSize').val($table.css('borderWidth').replace(/\D+/, ''));
			$('#borderColor').css('backgroundColor', $table.css('borderColor'));

			var attr = $table.attr('cf_borderAttrScope');
			if(!attr){
				$('#scope').val('0');
			}else{
				$('#scope').val('1');
			}
		};

	});

</script>
</html>