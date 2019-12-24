<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/19
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String jspath = application.getContextPath();
%>
<html>
<head>
	<title>设备统计</title>
<%--	<script src=<%=path + "/js/jquery-3.4.1.js" %>></script>--%>
<%--	<script src=<%=path + "/js/echarts.js" %>></script>--%>

	<script src=<%=jspath+"/js/jquery-3.4.1.js"%>></script>
	<script  src=<%=path+"/js/echarts.js" %>></script>

</head>
<body>
<div id="main" style="width: 100%;height:100%; align-content: center"></div>


<script type="text/javascript">
	var vareaName=[];
	var numbers=[];
    var arr=[];
	$(function() {
		$.ajax({
			method : "POST",
			url : "/StopCard/ECharts2.action",
			dataType : "json",
			success : function(list) {
				// var arr = JSON.parse(msg);

				// for (var i = 0; i < cost.length; i++) {
				// 普通柱状图使用的数据
				// nameArr.push(arr[i].name);
				// valueArr.push(arr[i].record);
				// 南丁格尔玫瑰圆饼图使用的数据
				// money=cost.money;
				// // alert("money---------"+money);
				// sellmoney=cost.sellmoney;
				// alert("sellmoney---------"+sellmoney);


				// }
				// createEchars    ();// 创建普通柱状图

				for (var i = 0; i <list.length; i++) {
					vareaName.push(list[i].areaName);
					numbers.push(list[i].numbers);

					arr.push({
						value:list[i].numbers,
						name:list[i].areaName
					})
				}



				rose();// 创建南丁格尔玫瑰圆饼图
			},
			error : function() {
				alert("服务器正忙");
			}
		});
	});

	var myChart = echarts.init(document.getElementById('main'));
	function rose() {

		var  option = {
			title : {
				text: '斌哥停车场',
				subtext: '收支统计',
				x:'center',
				textStyle:{
					color:'#232d33',
					fontSize:50
				},
				subtextStyle:{

					fontSize:35
				}

			},
			tooltip : {
				trigger: 'item',
				formatter: "{a} <br/>{b} : {c} ({d}%)"
				// fontSize : 60   //文字的字体大小
			},
			    // visualMap: {
				//     show: false,
				//     min: 80,
				//     max: 600,
				//     inRange: {
				// 	    colorLightness: [0, 1]
				//     }
			    // },
			legend: {
				orient: 'vertical',
				x: 50,
				y: 150,
				// Center:"Center",
				// right:"right",

				data: vareaName,
				textStyle: {
					// fontWeight: 300,
					fontSize: 16,    //文字的字体大小
					color: '#000000'//文字的字体颜色
				}

			},

			series : [
				{
					name: '斌哥停车场',
					type: 'pie',
					radius : '65%',
					center: ['50%', '60%'],
					// x: 300,
					// y: 300,
					// width: 50,
					// height:['50%'],
					label: {            //饼图图形上的文本标签
						normal: {
							// show: true,
							// position: 'inner', //标签的位置
							textStyle: {
								//fontWeight: 300,
								fontSize: 20    //文字的字体大小
							}
							// formatter: '{d}%'


						}
					},



					data:arr,
					itemStyle: {
						emphasis: {
							shadowBlur: 10,
							shadowOffsetX: 0,
							shadowColor: 'rgba(14,242,226,0.5)',

						}
					}
				}
			]
		};




		//
		// var option = {
		//     backgroundColor: '#2c343c',
		//
		//     title: {
		// 	    text: 'Customized Pie',
		// 	    left: 'center',
		// 	    top: 20,
		// 	    textStyle: {
		// 		    color: '#ccc'
		// 	    }
		//     },
		//
		//     tooltip : {
		// 	    trigger: 'item',
		// 	    formatter: "{a} <br/>{b} : {c} ({d}%)"
		//     },
		//
		//     visualMap: {
		// 	    show: false,
		// 	    min: 80,
		// 	    max: 600,
		// 	    inRange: {
		// 		    colorLightness: [0, 1]
		// 	    }
		//     },
		//     series : [
		// 	    {
		// 		    name:'访问来源',
		// 		    type:'pie',
		// 		    radius : '55%',
		// 		    center: ['50%', '50%'],
		// 		    data:[
		// 			    {value:money, name:'临时缴费'},
		// 			    {value:sellmoney, name:'缴费产品'}
		//
		// 		    ].sort(function (a, b) { return a.value - b.value; }),
		// 		    roseType: 'radius',
		// 		    label: {
		// 			    normal: {
		// 				    textStyle: {
		// 					    color: 'rgba(255, 255, 255, 0.3)'
		// 				    }
		// 			    }
		// 		    },
		// 		    labelLine: {
		// 			    normal: {
		// 				    lineStyle: {
		// 					    color: 'rgba(255, 255, 255, 0.3)'
		// 				    },
		// 				    smooth: 0.2,
		// 				    length: 10,
		// 				    length2: 20
		// 			    }
		// 		    },
		// 		    itemStyle: {
		// 			    normal: {
		// 				    color: '#c23531',
		// 				    shadowBlur: 200,
		// 				    shadowColor: 'rgba(0, 0, 0, 0.5)'
		// 			    }
		// 		    },
		//
		// 		    animationType: 'scale',
		// 		    animationEasing: 'elasticOut',
		// 		    animationDelay: function (idx) {
		// 			    return Math.random() * 200;
		// 		    }
		// 	    }
		//     ]
		// };




		myChart.setOption(option);
	}
	// function rose() {
	//
	// 	// 基于准备好的dom，初始化echarts实例
	//
	//
	// 	var option = {
	// 		title: {
	// 			text: '职位人员统计',
	// 			x: 'center',
	// 			textStyle: {
	//
	// 				fontSize: 18
	// 			}
	// 		},
	// 		tooltip: {
	// 			trigger: 'item',
	// 			formatter: "{a} <br/>{b} : {c} ({d}%)"
	// 		},
	// 		legend: {
	// 			orient: 'vertical',
	// 			left: 'left',
	// 			data: nameArr,
	// 			label: {
	// 				normal: {
	// 					textStyle: {
	//
	// 						fontSize: 18
	// 					}
	// 				}
	//
	// 			}
	// 		},
	// 		series: [
	// 			{
	// 				name: '人员',
	// 				type: 'pie',
	// 				radius: '55%',
	// 				center: ['50%', '60%'],
	// 				label: {
	// 					normal: {
	// 						textStyle: {
	//
	// 							fontSize: 18
	// 						}
	// 					}
	//
	// 				},
	// 				data:
	// 				obArr
	// 				,
	// 				itemStyle: {
	// 					emphasis: {
	// 						shadowBlur: 10,
	// 						shadowOffsetX: 0,
	// 						shadowColor: 'rgba(0, 0, 0, 0.5)'
	// 					}
	// 				}
	// 			}
	// 		]
	// 	};
	//
	// 	// 使用刚指定的配置项和数据显示图表。
	// 	myChart.setOption(option);
	//
	//
	// }


</script>


</body>
</html>
