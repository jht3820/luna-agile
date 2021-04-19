
var OSLCoreChartSetting = function () {
	
	
	var chartSetting = function(chartLib, targetId, config){
		
		var charts = {};
		
		
		var arrays = {};
		
		
		if($.osl.isNull(targetId)){
		}
		
		if($.osl.isNull(chartLib)){
			chartLib = "apex";
		}
			
		
		var targetObj = $("#"+targetId);
		if(targetObj.length > 0){
			
			
			arrays[config.data.param.xKey]=[];
			arrays[config.data.param.yKey]=[];
			for(var idx = 1; idx <= Object.keys(config.data.param.key).length ;idx++){
				arrays[config.data.param.key["key"+idx]]=[]
			}
			
			var ajaxObj = new $.osl.ajaxRequestAction({"url": config.data.url, "async": false}, config.data.param);
			
	    	ajaxObj.setFnSuccess(function(data){
	    		if(data.errorYn == "Y"){
					$.osl.alert(data.message,{type: 'error'});
				}else{
					var array = data.chartData;
					
					$.each(array, function(idx, value){
						for(var idx = 1; idx <= Object.keys(config.data.param.key).length ;idx++){
							arrays[config.data.param.key["key"+idx]].push( value[config.data.param.key["key"+idx]] );
						}
						if(!$.osl.isNull(config.data.param.xKey)){
							arrays[config.data.param.xKey].push( value[config.data.param.xKey] );
						}
						if(!$.osl.isNull(config.data.param.yKey)){
							arrays[config.data.param.yKey].push( value[config.data.param.yKey] );
						}
					});
					
					
				}
	    	});

	    	
			ajaxObj.send();
			
			
			var chartConfig = {
				data: {
					url:"",
					param:"",
					
					key:{},
					
					xKey:"",
					
					yKey:"",
				},
				chart: {
					height: 320,
					type: chartLib, 
					
					toolbar : {
						show: true,
						offsetX: 0,
						offsetY: 0,
						tools: {
							download: true,
							selection: true,
							zoom: false,
							zoomin: '<i class="fa fa-plus-circle osl-icon-transform__scale--150"></i>',
							zoomout: '<i class="fa fa-minus-circle osl-icon-transform__scale--150"></i>',
							pan: '<i class="fa fa-expand-arrows-alt osl-icon-transform__scale--150"></i>',
							reset: '<i class="fa flaticon2-refresh-1"></i>',
							customIcons: [
								
							]
						}
					},
					events:{
						
						beforeMount: $.noop,
						
						mounted: $.noop,
						
						click: $.noop,
					}
				},
				grid:{
					show: false
				},
				noData:{
					text : $.osl.lang("stm2100.chart.noData"),
					align : "center",
					verticalAlign: "middle",
					offsetX: 0,
					offsetY: 0,
				},
				fill:{
					type : "gradient",
					gradient : {
						shadeIntensity: 1,
						opacityFrom: 0.7,
						opacityTo: 0.9,
						stops: [0, 90, 100]
					}
				},
				xaxis: {
					show: false
				},
				yaxis:{
					show: false
				},
				colors: [],
				series: [],
				callback: {
					
				}
			}
			
			
			var targetConfig = $.extend(true, {}, chartConfig);
				
			
			targetConfig = $.extend(true, targetConfig, config);
			
			
			for(var idx = 0; idx < Object.keys(config.data.param.key).length ;idx++){
				targetConfig.series[idx].data=arrays[config.data.param.key["key"+(idx+1)] ]
			}
			
			
			if(!$.osl.isNull(config.data.param.xKey)){
				targetConfig.xaxis.categories = arrays[config.data.param.xKey ];
			}
			if(!$.osl.isNull(config.data.param.yKey)){
				targetConfig.yaxis.categories = arrays[config.data.param.yKey ];
			}
			
			
			var chartsInfo = new ApexCharts(document.querySelector("#"+targetId), targetConfig);
			charts = {"config": targetConfig, "targetCt": chartsInfo};
			
			
			$.osl.chart.list[targetId] = charts;
			chartsInfo.render();
		}
		return charts;
	}
	
	
    return {
        
        init: function() {
        	
    		$.osl.chart.setting = chartSetting;
        }
    };
}();