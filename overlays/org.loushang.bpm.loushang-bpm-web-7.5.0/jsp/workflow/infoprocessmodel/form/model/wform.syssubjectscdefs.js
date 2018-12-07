(function($){
	var overrideSysSubjectScDefs = {
		childList : null,
		init:function(){
			this.childList=new Array();
		},
		generateXml : function(xmlDoc) {
			var root = xmlDoc.createElement("SysSubjectScDefs");
			
			for (var i in this.childList) {
				var childElement = this.childList[i];
				root.appendChild(childElement.generateXml(xmlDoc));
			}
			return root;
		},
		
		parseXml : function(element) {
			for (var i = 0; i < element.childNodes.length; i++) {
				var child = element.childNodes[i];
				if(child.nodeName == "SysSubjectScDefs") {
					var childModel = new WFormSysSubjectScDef();
					childModel.init();
					childModel.parseXml(child);
					this.childList[childModel.id] = childModel;
	         	}
			}
		}
	};
	WFormSysSubjectScDefs = $.inherit(WFormBase, overrideSysSubjectScDefs);
})(jQuery);