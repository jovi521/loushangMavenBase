var retObj={}
var fromParentParam = window.parent.document.getElementById("popupFrame").inParam;
var mobileForm = fromParentParam.mobileForm;
var root;
var treeObj;
var form;
var fields={};
var subforms={};
//var treeObj = $.fn.zTree.getZTreeObj("tree");
//var nodes = treeObj.getSelectedNodes();
$(function() {
	$.ajax({
				type : "POST",
				url : WFlow.fullWebPath
						+ "/command/dispatcher/"
						+ "org.loushang.cform.procdef.html.cmd.FormDispatcherCmd/"
						+ "getFormArea",
				data : {
					"formId" : fromParentParam.mobileForm.id
				},
				dataType : "json",
				async : false,
				success : function(data) {
					showFormArea1(data);
				},
				error : function() {
					showDialog("alert",L.getLocaleMessage("CForm.BPM.D192","请求数据出错"), L.getLocaleMessage("CForm.BPM.D191","提示信息"), 300);
				}
			});
	$("#confirm").bind("click",function(){
		mobileForm.form=form;
		closeDialog(fields);
	});
	
	$("#cancel").bind("click",function(){
		closeDialog();
	});
	
	function showFormArea1(data){
		var setting = {
				view : {
					showLine : true,
					showIcon : false
				},
				callback:{
					onClick:onClick
				}
			};
		var zNodes = new Array();
		form=new parent.CFForm();
		form.init();
		root={};
		root.id=data.form.id;
		root.name=data.form.name;
		form.id=root.id;
		form.name=root.name;
		root.children=getChildren(root,data.form.childNodes);
		
		//初始化form
		var subform=new parent.CFSubForm();
		subform.init();
		subform.id=root.children[0].id;
		subform.name=root.children[0].name;
		if(root.children[0].area){
			for(var m in root.children[0].area){
				var area=new parent.CFField();
				area.id=root.children[0].area[m].id;
				area.name=root.children[0].area[m].name;
				area.ttype="field";
				subform.childList[area.id]=area;
			}
		}
		form.childList[subform.id]=subform;
		makeSubform(form,root.children[0].children);
		
		//初始化fields subforms数组
		for(var n in form.childList){
				var child=form.childList[n];
				if(mobileForm.form)
					var oldChild=mobileForm.form.childList[n];
				if(oldChild){
					child.isHidden=oldChild.isHidden;
					initFields(child.childList,oldChild.childList);
				}else{
					initFields(child.childList);
				}
				subforms[child.id]=child;
		}
		
		
		
		if (root.children.length == 0){
			root.isParent = false;
		}else{
			for(var n in root.children){
				root.children[n].hd=true;//如果只有一级subform，则隐藏右上角的checkbox
			}
		}
		zNodes[0] = root;
		$.fn.zTree.init($("#tree"), setting, root.children);
		treeObj = $.fn.zTree.getZTreeObj("tree");
		$("#tree_1_ico").trigger("click");
		treeObj.expandAll(true);
		//绑定表头复选框单击事件
		$("th input:checkbox").bind("click",function(){
			var index=$(this).parent().index();
			var checked=$(this).prop("checked");
			var trs=$("tbody tr").each(function(){
				$(this).children("td:eq("+index+")").children().prop("checked",checked);
			});

			$("tbody tr").each(function (){
				var tds=$(this).children("td");
				var field=fields[$(this).attr("id")];
				field.id=$(tds[0]).attr("id");
				field.name=$(tds[0]).text();
				field.isHidden=$(tds[1]).children().prop("checked");
				field.isReadOnly=$(tds[2]).children().prop("checked");
				field.isNotNull=$(tds[3]).children().prop("checked");
				field.isInitialize=$(tds[4]).children().prop("checked");
			});
		});
		
		//绑定域隐藏chk点击事件
		$('.hide[type="checkbox"]').bind("click",function(){
			subforms[$("#containerName").attr("idd")].isHidden=$(this).prop("checked");
		});
	}
	function initFields(childList,oldChildList){
		if(oldChildList){
			for(var n in childList){
				if(childList[n].ttype){
					if(oldChildList[n]){
						childList[n].isHidden=oldChildList[n].isHidden;
						childList[n].isReadOnly=oldChildList[n].isReadOnly;
						childList[n].isNotNull=oldChildList[n].isNotNull;
						childList[n].isInitialize=oldChildList[n].isInitialize;
					}else{
						childList[n].isHidden=false;
						childList[n].isReadOnly=false;
						childList[n].isNotNull=false;
						childList[n].isInitialize=false;
					}
					fields[childList[n].id]=childList[n];
				}else{
					childList[n].isHidden=oldChildList[n].isHidden;
					subforms[childList[n].id]=childList[n];
					initFields(childList[n].childList,oldChildList[n].childList);
				}
			}
		}else{
			for(var n in childList){
				if(childList[n].ttype){
					fields[childList[n].id]=childList[n];
					
				}else{
					subforms[childList[n].id]=childList[n];
					initFields(childList[n].childList);
				}
			}
		}
	}
	function makeSubform(pform,children){
		for(var n in children){
			var subform=new parent.CFSubForm();
			subform.init();
			subform.id=children[n].id;
			subform.name=children[n].name;
			if(children[n].area){
				for(var m in children[n].area){
					var area=new parent.CFField();
					area.id=children[n].area[m].id;
					area.name=children[n].area[m].name;
					area.ttype="field";
					subform.childList[area.id]=area;
				}
			}
			
			for(var j in children[n].children){
				makeSubform(subform, children[n].children);
			}
			pform.childList[subform.id]=subform;
		}
	}
	function getChildren(parent,nodes){
		var children=new Array();
		for(var n in nodes){
			if(nodes[n].subform){
				children.push(getChild1(nodes[n]));
			}else{
				if(typeof parent.area=='undefined'){
					parent.area=new Array();
				}
				parent.area.push(getField(nodes[n]));
			}
		}
		return children;
	}
	function getChild1(node){
		var child=new Object();
		child.id=node.subform.id;
		child.name=node.subform.name;
		child.children=getChildren(child,node.subform.childNodes);
		return child;
	}
	
	function getField(node){
		var field=new Object();
		field.id=node.field.id;
		field.name=node.field.name;
		field.children=node.field.childNodes;
		return field;
	}
	
	
	function onClick(event, treeId, treeNode, clickFlag) {
		if(parseInt(treeNode.level)>0){
			$(".hide").show();
		}else{
			$(".hide").hide();
		}
		initField(treeNode);
	}
	
	function initField(treeNode){
		$("#containerName").val(treeNode.name);
		$("#containerName").attr("iid",treeNode.id);
		$('.hide[type="checkbox"]').prop("checked",subforms[treeNode.id].isHidden);
		if(treeNode.area){
			$("tbody tr").remove();
			for(var n in treeNode.area){
				var field=fields[treeNode.area[n].id]||new Object();
				var tr=$("<tr></tr>");
				$(tr).append($("<td></td>").text(treeNode.area[n].name).attr("id",treeNode.area[n].id));
				if(field.id){
					$(tr).append($("<td></td>").append($("<input />").attr("type","checkbox").prop("checked",field.isHidden)));
					$(tr).append($("<td></td>").append($("<input />").attr("type","checkbox").prop("checked",field.isReadOnly)));
					$(tr).append($("<td></td>").append($("<input />").attr("type","checkbox").prop("checked",field.isNotNull)));
					$(tr).append($("<td></td>").append($("<input />").attr("type","checkbox").prop("checked",field.isInitialize)));
				}else{
					$(tr).append($("<td></td>").append($("<input />").attr("type","checkbox")));
					$(tr).append($("<td></td>").append($("<input />").attr("type","checkbox")));
					$(tr).append($("<td></td>").append($("<input />").attr("type","checkbox")));
					$(tr).append($("<td></td>").append($("<input />").attr("type","checkbox")));
				}
				$(tr).data("bindObj",field);
				$(tr).attr("id",treeNode.area[n].id);
				$("tbody").append(tr);
			}
			$("tbody tr:odd").addClass("odd");
			
			$('tbody input[type=checkbox]').bind("click",function(){
				$("tbody tr").has(this).each(function (){
					var tds=$(this).children("td");
					var field=fields[$(this).attr("id")];
					field.id=$(tds[0]).attr("id");
					field.name=$(tds[0]).text();
					field.isHidden=$(tds[1]).children().prop("checked");
					field.isReadOnly=$(tds[2]).children().prop("checked");
					field.isNotNull=$(tds[3]).children().prop("checked");
					field.isInitialize=$(tds[4]).children().prop("checked");
				});
			});
		}else{
			$("tbody tr").remove();
		}
	}
	function getChild(childNodes,bindObj) {
		if(bindObj.childList==null){
			bindObj.childList={};
		}
		var children = new Array();
		if (childNodes.length == 0) {
			return children;
		}
		for ( var n in childNodes) {
			var child = new Object();
			child.children=new Array();
			child.bindObj=new parent.CFSubForm();
			child.bindObj.ttype="subform";
			if(childNodes[n].subform){
				child.id = childNodes[n].subform.id;
				child.bindObj.id=child.id;
				child.name = childNodes[n].subform.name;
				child.bindObj.name=child.name;
				var subform=childNodes[n].subform.childNodes;
				if(childNodes[n].subform.childNodes[0].subform){
					child.children = getChild(childNodes[n].subform.childNodes,child.bindObj);
				}else{
					child.area=getArea(child,childNodes[n].subform.childNodes,child.bindObj);
					
				}
			}
			children[n] = child;
			bindObj.childList[n]=child.bindObj;
			
		}

		return children;
	}

	function getArea(child,nodes,bindObj) {
		if(bindObj.childList==null){
			bindObj.childList={};
		}
		var area = new Array();
		for ( var n in nodes) {
			if(nodes[n].subform){
				if(nodes[n].subform.childNodes[0].subform){
					child.children = getChild(nodes[n].subform.childNodes,child.bindObj);
				}else{
					child.area=getArea(child,nodes[n].subform.childNodes,child.bindObj);
					
				}
			}else{
				var a = new Object();
				a.id = nodes[n].field.id;
				a.bindObj=new parent.CFField();
				a.bindObj.id=a.id;
				a.name = nodes[n].field.name;
				a.bindObj.name=a.name;
				a.bindObj.ttype="field";
				area[n] = a;
				bindObj.childList[n]=a.bindObj;
			}
			
		}
		return area;
	}
});