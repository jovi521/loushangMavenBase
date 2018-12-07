/*
 * 表单--textarea,多行文本
 */
(function($) {
	var overrides = {
		tpl : '<li>'
			+ '<label class="cfLabel">多行文本</label>'
			+ '<div>'
			+ '<textarea id="{fieldId}" name="{fieldName}" value="" class="cfTextArea"'
			// 域长度
			+ ' cf_fieldLength="500"'
			// 元素类型
			+ ' cf_elementType="field"'
			// 自动生成ID
			+ ' cf_isCreateId="{isCreateId}"'
			// 组件ID
			+ ' cf_widgetId="{widgetId}">' 
			+ '</textarea>'
			+ '</div>'
			+ '</li>',
		// 初始化组件
		init : function(builder) {
			this.builder = builder;
			this.initEvent();
		},

		// 初始化事件
		initEvent : function() {
			// 注册放下事件
			this.builder.on(this.id+"_drop", $.proxy(this.drop, this));
			// 注册双击事件
			this.builder.on(this.id+"_dblClick", $.proxy(this.dblClick, this));
		},

		// 放下多行文本
		drop : function(e, target) {
			var $target = $(target).hasClass("cfContainer")? $(target):target.tagName=="BODY"?$(target).find("form>.cfContainer"):$(target).parents("body").find("form>.cfContainer");
			var fieldId = CForm.generateId();
			var fieldName = "多行文本";
			var widgetId = this.id;
			var isCreateId = "1";
			var textAreaTpl = new $.XTemplate(this.tpl);
			var textArea = textAreaTpl.applyTemplate({
				"fieldId" : fieldId,
				"fieldName" : fieldName,
				"isCreateId" : isCreateId,
				"widgetId" : widgetId
			});
			$(textArea).appendTo($target);		
		},

		// 双击多行文本
		dblClick : function(e, target) {
			// 原属性值
			var oldProperty = {
				/**
				 * 基本属性
				 */
				// 域ID
				fieldId : $(target).attr("id"),
				// 域名称
				fieldName : $(target).attr("name"),
				// 是否自动生成ID
				isCreateId : $(target).attr("cf_isCreateId")
			};
			
			showWindow("多行文本", "mwidget/textarea/textareaattr.jsp", 400, 400,
					oldProperty, handleReturn);
			
			/**
			 * 处理返回值
			 */
			function handleReturn(result){
				if (!result) {
					return;
				}

				// 新属性值
				var newProperty = {
					/**
					 * 基本属性
					 */
					// 域ID
					id : result.fieldId,
					// 域ID
					name : result.fieldName,
					// 是否自动生成ID
					cf_isCreateId : result.isCreateId
				};
				$(target).parent().prev()[0].innerText = result.fieldName;
				$(target).attr(newProperty);
			}			
		}			
	};

	CFMTextArea = $.inherit(CFWidget, overrides);
	// 注册组件
	CForm.reg(CFMTextArea);
})(jQuery);