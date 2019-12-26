<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019-12-15
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String layuicsspath = request.getContextPath()+"/layuiadmin/layui/css/";
	String layuipath = request.getContextPath()+"/layuiadmin/layui/";
	String Caselib= request.getContextPath()+"/ESMap/lib/";
	String Casecss= request.getContextPath()+"/ESMap/Case/DeviceAdd/css/";
%>
<html>
<head>
	<meta charset="UTF-8">
	<%--	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />--%>
	<title>停车场</title>
	<%--	<meta name="keywords" content="停车场导航,商场导航,停车场定位,室内地图,易景地图,ESMap" />--%>
	<%--	<meta name="description" content="停车场车位占用例子定时5秒从后台获取数据,停车场导航,商场导航,停车场定位,易景室内三维地图引擎提供地图浏览、缩放、旋转、图层显隐等基础功能，支持自定义室内地图显示风格及样式，可自动绘制楼层热力图、散点图等专题地图，快速进行空间大数据分析展示。支持跨楼层精准的点到点之间的最短、最优路径计算，支持对路径结果进行导航和动画,并提供丰富的地图主题资源供二次开发调用。" />--%>

	<link rel="stylesheet" href=<%=layuicsspath+"layui.css"%>>
	<script type="text/javascript" src="<%=layuipath+"layui.all.js"%>"></script>
	<script type="text/javascript" src="<%=layuipath+"layui.js"%>"></script>
	<script type="text/javascript" src="<%=Caselib+"esmap.min.js"%>"></script>
	<script type="text/javascript" src="<%=Caselib+"config.js"%>"></script>
	<script type="text/javascript" src="<%=Caselib+"jquery-2.1.4.min.js"%>"></script>
	<script type="text/javascript" src="<%=Caselib+"jquery.qrcode.min.js"%>"></script>
	<script type="text/javascript" src="<%=Caselib+"tips_controls.js"%>"></script>
	<script type="text/javascript" src="<%=Caselib+"bootstrap.min.js"%>"></script>
	<link rel="stylesheet" href=<%=Caselib+"bootstrap.min.css"%>>
	<link rel="stylesheet" href=<%=Casecss+"common.css"%>>
	<link rel="stylesheet" href=<%=Casecss+"iconfont/iconfont.css"%>>
</head>

<style type="text/css">
	.viewmode-group {
		position: absolute;
		right: 12px;
		top: 32%;
		border-radius: 6px;
		border: none;
	}

	.viewmode-group button {
		display: inline-block;
		width: 38px;
		height: 38px;
		border-radius: 4px;
		border: none;
		background-image: url("../ESMap/Case/Park/image/wedgets/3D.png");
	}

	.parking {
		width: 320px;
		height: 46px;
		line-height: 46px;
		left: 100px;
		bottom: 14px;
		border: 1px solid #083344;
		border-radius: 4px;
		color: rgb(255, 255, 255);
		background-color: rgba(71, 92, 105, 0.8);
		font-size: 16px;
		text-align: center;
	}

	.fix {
		position: fixed;
	}

	.codition {
		width: 120px;
		left: 10px;
		bottom: 120px;
	}

	.codition ul {
		width: 100%;
		padding: 6px;
		list-style-type: none;
	}

	.codition ul li {
		display: list-item;
		height: 36px;
		background-color: rgb(255, 255, 255);
		line-height: 36px;
		text-align: center;
	}

	.codition ul li span {
		display: inline-block;
		width: 18px;
		height: 18px;
		border-radius: 50%;
		margin-right: 10px;
		vertical-align: middle;
	}

	.codition-first {
		background-color: #f00;
	}

	.codition-second {
		background-color: #0f0;
	}

	.codition-third {
		background-color: rgb(126, 172, 202);
	}

	.i-test-tip {
		width: 360px;
		height: 46px;
		left: 470px;
		bottom: 14px;
		border-radius: 4px;
		overflow: hidden;
		/* position: relative; */
		background-color: rgba(71, 92, 105, 0.8);
		text-align: center;
	}

	.test-tip {
		position: absolute;
		top: 0;
		left: 100%;
		color: #fff;
		font-size: 24px;
		line-height: 46px;
		white-space: nowrap;
		word-break: keep-all;
		text-overflow: ellipsis;
	}

	.test-tip span {
		color: #0f0;
	}
	.modelInfo {
		position: absolute;
		right: 10px;
		bottom: 100px;
		z-index: 999;
	}

	.panel {
		margin-bottom: 20px;
		background-color: #fff;
		border: 1px solid transparent;
		border-radius: 4px;
		-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
		box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
	}
	.panel-default>.panel-heading {
		color: #333;
		background-color: #f5f5f5;
		border-color: #ddd;
	}

	.panel-heading {
		padding: 10px 15px;
		border-bottom: 1px solid transparent;
		border-top-left-radius: 3px;
		border-top-right-radius: 3px;
	}
	.addmarker-floor.btn-floor-vertical {
		position: absolute;
		left: 1%;
		bottom: 11%;
	}
</style>

<body ms-controller="ctrl" class="ms-controller">


	<div id="map-container" style="height: 700px"></div>
	<div class="loading">
		<div class="lodingImg"></div>
	</div>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<h1>
				停车场
			</h1>
		</div>
	</nav>

	<div class="viewmode-group">
		<button id="btn3D" class="btn btn-default"></button>
	</div>
	<div class="parking fix" id="parking"><span id="carid"></span>车位情况：<span id="msg"></span></div>
	<div class="codition fix">
		<ul>
			<li><span class="codition-first"></span>占用车位</li>
			<li><span class="codition-second"></span>空闲车位</li>
			<%--		<li><span class="codition-third"></span>固定车位</li>--%>
		</ul>
	</div>
	<div class="i-test-tip fix" id="i-test-tip">
		<div class="test-tip">
			停车场车位总数：<span id="total"></span>个，当前剩余车位数 <span id="freedata"></span>。
		</div>
	</div>
	<div class="addmarker-floor btn-floor-vertical" data-toggle="buttons" >
		<button id="btn1" class="btn btn-default leftbtn">修改分区</button>
	</div>
	<div class="panel panel-default modelInfo">
	<!-- Default panel contents -->
	<div class="panel-heading">地图坐标</div>
	<!-- Table -->
		<table class="table table-striped">
			<thead>
			<tr>
				<th>X:</th>
				<td>0</td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<th>Y:</th>
				<td>0</td>
			</tr>
			</tbody>
		</table>
	</div>

	<%--车辆分区弹窗主体内容--%>
	<div id="add-main" style="display: none;padding-top: 15px;">
		<div class="layui-form-item center" >
			<label class="layui-form-label" style="width: 200px" ><span id="area1"></span>改为：</label>
			<div class="layui-input-block">
				<input type="text" id="changeArea1" value="" style="width: 100px"    autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item center" >
			<label class="layui-form-label" style="width: 200px" ><span id="area2"></span>改为：</label>
			<div class="layui-input-block">
				<input type="text" id="changeArea2" value="" style="width: 100px"    autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item center" >
			<label class="layui-form-label" style="width: 200px" ><span id="area3"></span>改为：</label>
			<div class="layui-input-block">
				<input type="text" id="changeArea3" value="" style="width: 100px"    autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item center" >
			<label class="layui-form-label" style="width: 200px" ><span id="area4"></span>改为：</label>
			<div class="layui-input-block">
				<input type="text" id="changeArea4" value="" style="width: 100px"    autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item center" >
			<label class="layui-form-label" style="width: 200px" ><span id="area5"></span>改为：</label>
			<div class="layui-input-block">
				<input type="text" id="changeArea5" value="" style="width: 100px"    autocomplete="off" class="layui-input">
			</div>
		</div>
	</div>

	<script type="text/javascript">
		//定义全局map变量
		var map;
		var mapCoord;
		var esmapID = 10005;
		var styleid = getQueryString("styleid") || defaultOpt.themeID;
		var floorControl;
		// 楼层控制控件配置参数（几楼）
		var ctlOpt = new esmap.ESControlOptions({
			position: esmap.ESControlPositon.RIGHT_TOP,
			imgURL: "ESMap/Case/Park/image/wedgets/"
		});
		// 放大、缩小控件配置
		var ctlOpt1 = new esmap.ESControlOptions({
			position: esmap.ESControlPositon.LEFT_TOP, // 位置 左上角
			// 位置x,y的偏移量
			offset: {
				x: 20,
				y: 60
			},
			imgURL: "ESMap/Case/Park/image/wedgets/"
		});

		map = new esmap.ESMap({
			container: $("#map-container")[0], // 渲染dom
			mapDataSrc: "ESMap/data", //地图数据位置
			mapThemeSrc: "ESMap/data/theme", //主题数据位置
			focusAlphaMode: true, // 对不可见图层启用透明设置 默认为true
			focusAnimateMode: true, // 开启聚焦层切换的动画显示
			focusAlpha: 0.4, // 对不聚焦图层启用透明设置，当focusAlphaMode = true时有效
			focusFloor: 1,
			// visibleFloors: "all",
			themeID: styleid //自定义样式主题ID
		});
		map.openMapById(esmapID); //打开地图
		map.showCompass = true; //显示指南针
		//为模型填充div添加点击事件
		$("#map-container")[0].onclick = bindClick;
		$("#map-container")[0].ontouchend = bindClick;

		var parkData = null,
			pos = 0;
		var color = ["#7eacca", "#00ff00", "#ff0000"];
		var statusname=["固定车位","有车","无车"];
		var floorLayer;

		//地图加载完成回调
		map.on("loadComplete", function () {
			floorControl = new esmap.ESScrollFloorsControl(map, ctlOpt);
			var zoomControl = new esmap.ESZoomControl(map, ctlOpt1);
			bingEvents();
			marquee();
			floorLayer = map.getFloor(1);
			//创建PolygonMarker自定义形状的顶点数组
			// ABCDE区颜色
			var colora='#F1561A';
			var colorb='#FFFF01';
			var colorc='#00FEFF';
			var colord='#053FFF';
			var colore='#CC33FD';
			// A区形状
			var coordsa = [
				{ x: 12728366.089379841, y: 3551695.6650546310, z: 26 },
				{ x: 12728370.663004082, y: 3551692.6466401126, z: 26 },
				{ x: 12728406.852736453, y: 3551748.8557828222, z: 26 },
				{ x: 12728402.461086245, y: 3551751.8453179705, z: 26 },
			];
			// B区形状
			var coordsb = [
				{ x: 12728375.023905732, y: 3551684.204573685, z: 26 },
				{ x: 12728406.469062362, y: 3551663.727604544, z: 26 },
				{ x: 12728409.697163133, y: 3551668.46730872, z: 26 },
				{ x: 12728378.104255488, y: 3551688.6284005973, z: 26 },
			];
			// C区形状
			var coordsc = [
				{ x: 12728380.995204762, y: 3551695.7711644075, z: 26 },
				{ x: 12728406.706589013, y: 3551679.144626538, z: 26 },
				{ x: 12728409.61614573, y: 3551683.568891971, z: 26 },
				{ x: 12728383.84337312, y: 3551700.264748275, z: 26 },
			];
			// D区形状
			var coordsd = [
				{ x: 12728387.50228182, y: 3551705.6901414148, z: 26 },
				{ x: 12728416.033448612, y: 3551687.1450568475, z: 26 },
				{ x: 12728422.708519083, y: 3551697.6401870525, z: 26 },
				{ x: 12728394.131554488, y: 3551716.005490896, z: 26 },
			];
			// E区形状1
			var coordse1 = [
				{ x: 12728418.470690856, y: 3551679.4805865292, z: 26 },
				{ x: 12728422.557270981, y: 3551676.9126155297, z: 26 },
				{ x: 12728436.03731459, y: 3551697.2733105905, z: 26 },
				{ x: 12728431.709102456, y: 3551699.998201061, z: 26 },
			];
			// E区形状2
			var coordse2 = [
				{ x: 12728424.464204825, y: 3551707.719233598, z: 26 },
				{ x: 12728426.187987944, y: 3551706.612460552, z: 26 },
				{ x: 12728438.637279732, y: 3551725.9340011673, z: 26 },
				{ x: 12728437.038748048, y: 3551727.0661544534, z: 26 },
			];
			// E区形状3
			var coordse3 = [
				{ x: 12728395.82206507, y: 3551721.2112177177, z: 26 },
				{ x: 12728415.346508754, y: 3551708.3459356865, z: 26 },
				{ x: 12728427.464061176, y: 3551727.224269338, z: 26 },
				{ x: 12728407.899610214, y: 3551739.604736256, z: 26 },
			];
			addMyPolygonMaker(colora,coordsa);
			addMyPolygonMaker(colorb,coordsb);
			addMyPolygonMaker(colorc,coordsc);
			addMyPolygonMaker(colord,coordsd);
			addMyPolygonMaker(colore,coordse1);
			addMyPolygonMaker(colore,coordse2);
			addMyPolygonMaker(colore,coordse3);

			CallLoadData();
			carArea();
			//开启定时器从后台获取数据
			setInterval(function () {
				// CallLoadData((++pos % 2));
				CallLoadData();
				carArea();
			}, 5000);
		});

		//配置界面点击
		map.on("mapClickNode", function (e) {
			mapCoord = e.hitCoord || null;
			// addMyPolygonMaker();
		});

		//添加纯文字标注方法
		function addAreaMark(area,x,y) {
			var layer = new esmap.ESLayer('textMarker');
			var floorLayer = map.getFloor(1);
			tm = new esmap.ESTextMarker({
				x: x,
				y: y,
				height: 5,
				name: area,
				showLevel: 20,
				// spritify: false, //是否跟随地图缩放默认为true
				fillcolor: "255,0,0", //填充色
				fontsize: "12.0", //字体大小
				strokecolor: "255,255,0" //边框色
			});
			layer.addMarker(tm);
			floorLayer.addLayer(layer);
		}

		// 分区标注加载
		function carArea(){
			// 移除所有文字标注
			floorLayer.removeLayersByTypes([esmap.ESLayerType.TEXT_MARKER, esmap.ESLayerType.IMAGE_MARKER]);
			$.post(
				'carArea',
				function(res){
					var parkData=res;
					// 分区标注
					addAreaMark(parkData[0].portarea,12728385.530411419,3551720.3696497176);
					addAreaMark(parkData[1].portarea,12728387.965131944,3551678.6016493444);
					addAreaMark(parkData[2].portarea,12728395.170268524,3551689.641291842);
					addAreaMark(parkData[3].portarea,12728403.646164976,3551702.343425286);
					addAreaMark(parkData[4].portarea,12728413.753809894,3551733.116378429);
					addAreaMark(parkData[4].portarea,12728429.23078979,3551714.4706224897);
					addAreaMark(parkData[4].portarea,12728431.080314752,3551695.1046481747);
					addAreaMark(parkData[4].portarea,12728422.97622704,3551682.033053876);
					$("#area1").html(parkData[0].portarea);
					$("#area2").html(parkData[1].portarea);
					$("#area3").html(parkData[2].portarea);
					$("#area4").html(parkData[3].portarea);
					$("#area5").html(parkData[4].portarea);
				}
			);
		}
		// 车位加载
		function CallLoadData() {
			$.post(
				'CardPort',
				function(res){
					var parkData=res;
					var total =  0;

					var d1={"idlist1":[[],[],[],[],[],[],[]]};
					// ---------------------------------------
					for (var i = 0, len = parkData.length; i < len; ++i) {
						var m = parkData[i];
						// 统计总车位数
						total++;
						// 区分状态
						var status;
						if (Number(m.stateid)%4===1) {
							status=1;
						}else if (Number(m.stateid)%4===2) {
							status=2;
						}else {
							status=0;
						}
						d1.idlist1[status].push(m.portcardid);
					}

					var showtext="";
					//2.更新车位颜色
					var fnum = 1;
					for(var j=0;j<color.length;j++)
					{
						//调用批量修改颜色接口来修改
						map.changeModelColor({
							id:d1.idlist1[j],
							// fnum: fnum,
							color: color[j]
						});
					}
					//3.显示更新统计
					showtext += ":"+d1.idlist1[1].length+"个  ";
					//3.显示更新统计
					$("#freedata").html(showtext); //滚动字幕 相应楼层剩余停车位数
					$("#total").html(total);
				}
			);
		}
		//地图点击车位事件
		map.on("mapClickNode", function (event) {
			if (event.nodeType == esmap.ESNodeType.NONE ||
				event.nodeType == esmap.ESNodeType.FLOOR ||
				event.name == "楼梯")
				return;
			$("#parking").css("fontSize", "18px").html();
			$("#carid").css("color", "rgb(255, 255, 0)").html(event.name); //停车位ID
			console.log(event.ID);
			console.log(event.name);

			//查找车位信息
			$.post(
				'carPortClick',
				{
					id:event.ID
				},
				function(res){
					// var parkData=res;
					pop(res);
					$("#area").css("color", "rgb(0,0,0)").html(res.portarea);
					$("#name").css("color", "rgb(0,0,0)").html(res.portname);
					$("#carNum").css("color", "rgb(0,0,0)").html(res.carnum);
					$("#msg").css("color", "rgb(255, 255, 0)").html(res.carnum);
				}
			);
		});

		//滚动字幕
		function marquee() {
			var scrollWidth = $('#i-test-tip').width();
			var textWidth = $('.test-tip').width();
			var i = scrollWidth;
			setInterval(function () {
				i--;
				if (i < -textWidth) {
					i = scrollWidth;
				}
				$('.test-tip').animate({
					'left': i + 'px'
				}, 8);
			}, 8);
		}
		//绑定事件
		function bingEvents() {
			document.getElementById("btn3D").onclick = function () {
				if (map.viewMode == esmap.ESViewMode.MODE_2D) {
					map.viewMode = esmap.ESViewMode.MODE_3D; //2D-->3D
					document.getElementById("btn3D").style.backgroundImage =
						"url('ESMap/Case/Park/image/wedgets/3D.png')";
				} else {
					map.viewMode = esmap.ESViewMode.MODE_2D; //3D-->2D
					document.getElementById("btn3D").style.backgroundImage =
						"url('ESMap/Case/Park/image/wedgets/2D.png')";
				}
			};
		}
		//清除气泡
		var popMarker;
		function removeAll() {
			popMarker && popMarker.close();
		}
		// 气泡标注
		function pop(parkData) {
			removeAll();
			//添加信息窗
			var popMarker2 = new esmap.ESPopMarker({
				mapCoord: {
					//设置弹框的x轴
					x: parkData.portx,
					//设置弹框的y轴
					y: parkData.porty,
					height: 4, //控制信息窗的高度
					//设置弹框位于的楼层
					fnum: 1
				},
				// className:"myPopMarker",  //自定义popMarker样式。在css里配置
				//设置弹框的宽度
				width: 180,
				//设置弹框的高度
				height: 100,
				marginTop:1,  //弹框距离地面的高度
				//设置弹框的内容
				content: '<span id="area"></span><br><span id="name"></span><br>停放情况:<span id="carNum"></span>',
				closeCallBack: function () {
					//信息窗点击关闭操作
					// alert('信息窗关闭了！');
				},
				created: function (e) {
					//创建完成钩子
					$(".myPopClose").click(function(){
						//关闭删除
						popMarker2.close();
					})
				}
			});
			popMarker = popMarker2;
		}
		// 点击获取坐标
		function bindClick() {
			// var fnum = map.focusFloorNum;
			var posInfo = document.querySelectorAll(".panel td");
			if (mapCoord) {
				posInfo[0].innerText = mapCoord.x;
				posInfo[1].innerText = mapCoord.y;
			}
		}

		//创建自定义形状标注
		function addMyPolygonMaker(color,coords) {
			var floorLayer = map.getFloor(1);
			var layer = floorLayer.getOrCreateLayerByName('poly', esmap.ESLayerType.POLYGON_MARKER);

			polygonMarker = new esmap.ESPolygonMarker({
				color: color,
				//设置透明度
				alpha: .5,
				//设置边框线的宽度
				lineWidth: 1,
				//设置高度
				height: 0,
				//设置多边形坐标点
				points: coords
			});
			layer.addMarker(polygonMarker);
		}

		// 按钮触发弹窗
		document.getElementById("btn1").onclick = function () {
			Popups();
		};
		// 状态修改弹窗
		function Popups() {
			$('#changeArea1').val($('#area1').html());
			$('#changeArea2').val($('#area2').html());
			$('#changeArea3').val($('#area3').html());
			$('#changeArea4').val($('#area4').html());
			$('#changeArea5').val($('#area5').html());
			layer.open({
				type:1,
				title: '修改分区',
				area: ['400px', '420px'],
				content: $("#add-main"),
				btn:['确定','取消'],
				yes:function(){
					var changeArea1 = $('#changeArea1').val();
					var changeArea2 = $('#changeArea2').val();
					var changeArea3 = $('#changeArea3').val();
					var changeArea4 = $('#changeArea4').val();
					var changeArea5 = $('#changeArea5').val();
					$.post(
						'changeArea',
						{
							changeArea1:changeArea1,
							changeArea2:changeArea2,
							changeArea3:changeArea3,
							changeArea4:changeArea4,
							changeArea5:changeArea5
						},
						function(res){
							layer.msg(res.msg,function(){
								//关闭当前窗口
								layer.closeAll();
								//添加文字标注
								carArea();
								//隐藏弹窗
								document.getElementById("add-main").style.display="none";
							});
						}
					);
				},
				btn2:function(){
					layer.closeAll(); //关闭当前窗口
					document.getElementById("add-main").style.display="none";//隐藏
				},
				cancel : function(){
					document.getElementById("add-main").style.display="none";//隐藏
				}
			});
		}
	</script>


</body>
</html>
