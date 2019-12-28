<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/12/18
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path=application.getContextPath();
%>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
	<script src="../layuiadmin/layui/layui.js"></script>
	<link href="../ESMap/lib/bootstrap.min.css" rel="stylesheet" />
	<link href="../ESMap/lib/bootstrap.min.css" rel="stylesheet" />
	<link href="../ESMap/Case/Park/css/common.css" rel="stylesheet" />
	<link href="../ESMap/Case/Park/css/iconfont/iconfont.css" rel="stylesheet" />
	<script src="../ESMap/lib/config.js"></script>
	<script src="../ESMap/lib/esmap.min.js"></script>
	<script src="../ESMap/lib/jquery-2.1.4.min.js"></script>
	<script src="../ESMap/lib/jquery.qrcode.min.js"></script>
	<script src="../ESMap/lib/tips_controls.js"></script>
	<script src="../ESMap/lib/bootstrap.min.js"></script>
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



	.test-tip span {
		color: #0f0;
	}
	#pannel {
		position: absolute;
		left: 2%;
		bottom: 10%;
		z-index: 999;
	}
	button,input[type="button"] {
		padding: 7px 11px;
		background-color: #fff;
		border: none;
		cursor: pointer;
		border-radius: 3px;
	}
	#description {
		position: absolute;
		left: 50%;
		top: 86px;
		padding: 10px 25px;
		background: rgba(255, 255, 255, 255);
		border-radius: 4px;
		margin-left: -140px;
		opacity: 0.7;
	}



	.container-fluid h1 {
		text-align: center;
	}
	.search {
		position: absolute;
		padding-left: 10px;
		top: 100px;
		left: 90%;
		font-size: 13px;
		height: auto;
		/*border: 1px solid #e6e6e6;*/
		/*background: #fff;*/
		box-sizing: border-box;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		z-index: 999;
		border-radius: 4px;
	}


</style>

<body ms-controller="ctrl" class="ms-controller">

<div id="map-container"></div>
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

<div class="search">
	<a type="button" id="search" href="Reception.jsp" class="btn btn-default">
		返回
	</a>
</div>
<div id="description">
	暂无导航提示信息
</div>
<div class="viewmode-group">
	<button id="btn3D" class="btn btn-default"></button>
</div>
<div class="parking fix" id="parking">
	<span id="carid"></span><span id="YorN"></span>
</div>
<div class="codition fix">
	<ul>
		<li><span class="codition-first"></span>占用车位</li>
		<li><span class="codition-second"></span>空闲车位</li>
		<li><span class="codition-third"></span>固定车位</li>
	</ul>
</div>
<div id="pannel">
	<input type="button" class="btn btn-default btnclass" onclick="clearNavi()" value="清除" />
	<input type="button" class="btn btn-default btnclass" onclick="startNavi1()" value="开始第一人称导航" />
	<input type="button" class="btn btn-default btnclass" onclick="startNavi2()" value="开始第三人称导航" />
</div>
<!--    <div class="i-test-tip fix" id="i-test-tip">-->
<!--        <div class="test-tip">-->
<!--            停车场车位总数：<span id="total"></span>个，当前剩余车位数 <span id="freedata"></span>。-->
<!--        </div>-->
<!--    </div>-->


<script type="text/javascript">
	//接受传来的车牌号
	var car;
	$(function () {
		car = "<%=request.getParameter("car")%>";
		console.log(car)
	});
	//定义全局map变量
	var map;
	var esmapID = 10005;
	var styleid = getQueryString("styleid") || defaultOpt.themeID;
	var floorControl;
	// 导航对象
	var navi;
	// 点击计数
	var clickCount = 0;
	var mapCoord = null;
	var container = document.getElementById('map-container');
	// 楼层控制控件配置参数（几楼）
	var ctlOpt = new esmap.ESControlOptions({
		position: esmap.ESControlPositon.RIGHT_TOP,
		imgURL: "../ESMap/Case/Park/image/wedgets/"
	});
	// 放大、缩小控件配置
	var ctlOpt1 = new esmap.ESControlOptions({
		position: esmap.ESControlPositon.RIGHT, // 位置 左上角
		// 位置x,y的偏移量
		offset: {
			x: 20,
			y: 60
		},
		imgURL: "../ESMap/Case/Park/image/wedgets/"
	});
	//地图加载
	map = new esmap.ESMap({
		container: $("#map-container")[0], // 渲染dom
		mapDataSrc: "../ESMap/data", //地图数据位置
		mapThemeSrc: "../ESMap/data/theme", //主题数据位置
		focusAlphaMode: true, // 对不可见图层启用透明设置 默认为true
		focusAnimateMode: true, // 开启聚焦层切换的动画显示
		focusAlpha: 0.4, // 对不聚焦图层启用透明设置，当focusAlphaMode = true时有效
		focusFloor: 1,//初始楼层1楼
		// visibleFloors: "all",
		themeID: styleid //自定义样式主题ID
	});
	map.openMapById(esmapID); //打开地图
	map.showCompass = true; //显示指南针


	var parkData = null,
		pos = 0;
	var color = ["#7eacca", "#00ff00","#ff0000"];
	var statusname=["固定车位","有车","无车"];
	//地图加载完成回调
	map.on("loadComplete", function () {
		//floorControl = new esmap.ESScrollFloorsControl(map, ctlOpt);//创建楼层控件
		var zoomControl = new esmap.ESZoomControl(map, ctlOpt1);//创建放大、缩小控件
		bingEvents();//事件绑定（2D/3D按钮事件）
		marquee();//滚动字幕

		//先执行显示一次；
		setTimeout(function () {CallLoadData(0)},10);
		createNavi();
		setStart();
		//开启定时器从后台获取数据
		setInterval(function () {
			CallLoadData()
			// CallLoadData((++pos % 2));
		}, 5000);

	});


	//判断起点是否是同一处坐标
	var lastCoord = null;
	var curfnum = null;
	var h = 1;
	var carport;
	//点击地图事件。开始选点开始后，点击地图一次为起点，第二次点击为终点
	map.on('mapClickNode', function (event) {
		if (event.nodeType == esmap.ESNodeType.NONE ||
			event.nodeType == esmap.ESNodeType.FLOOR ||
			event.name == "楼梯")
			return;
		$("#parking").css("fontSize", "18px").html();
		$("#carid").css("color", "rgb(255, 255, 0)").html(event.name); //停车位ID

		//设置新的导航
		navi.clearAll();
		setStart();
		$.post("<%=path+"/carPortClick"%>", { id:event.ID },
			function(data){
				console.log(data);
				if(eval(data.stateid)===5){
					setEnd(data.portx,data.porty);
					carport=data.portname;
				}else if(eval(data.stateid)===6){
					alert("该车位已经有车，请重新选择车位！")
				}else{
					alert("该车位不可用！")
				}
			});
	});



	//设置起点
	function setStart() {

		if (navi) {
			navi.setStartPoint({
				x: 12728430.741384394,
				y: 3551708.0970824775,
				fnum: 1,
				height: 1,
				url: '../ESMap/Case/Park/image/start.png',
				size: 64
			});
		}
	}


	//设置终点
	function setEnd(x,y) {
		if (navi) {
			navi.setEndPoint({
				x:x,
				y:y,
				fnum: 1,
				height: 1,
				url: '../ESMap/Case/Park/image/end.png',
				size: 64
			});
			// 画导航线
			navi.drawNaviLine();
		}
	}


	//创建导航对象
	function createNavi() {
		if (map.naviData.length == 0) {
			console.warn("地图导航数据信息不存在！");
			return;
		}
		if (!navi) {
			//初始化导航对象
			navi = new esmap.ESNavigation({
				map: map,
				locationMarkerUrl: '../ESMap/Case/Park/image/card1.png',
				locationMarkerSize: 150,
				speed: 2,
				followAngle: true,
				followPosition: true,
				followGap: 1,
				tiltAngle: 30,
				audioPlay: true,
				// scaleLevel:0,
				mode: 1,
				offsetHeight: 1,
				// 设置导航线的样式
				lineStyle: {
					color: '#58a2e4',
					//设置线为导航线样式
					lineType: esmap.ESLineType.ESARROW,
					// lineType: esmap.ESLineType.FULL,
					lineWidth: 6,
					offsetHeight: 0.5,
					smooth: true,
					seeThrough: false,
					noAnimate: true
				},
				scaleAnimate: true,
				isMultiFloors: false
			});
		}

		navi.on("walking", function (data) {
			//显示导航展示信息
			showDis(data);
		});

		//导航完成
		navi.on("complete", function () {
			console.log("停止");
			document.getElementById('description').innerText = "到达终点";
			//2秒后删除导航信息
			$.post("<%=path+"/parkCart"%>",{carnum:car,carport:carport},function (data) {
				console.log(data);
				//加载车位
				CallLoadData();
			});
			setTimeout(function () {

					alert("停车成功！");
					clearNavi();
					setTimeout(function () {
							window.location.href="Reception.jsp";
						}
						, 2000);

				}
				, 2000);
		})
	}

	//清除导航
	function clearNavi() {
		if (navi){
			navi.clearAll();
			setStart();}
		clickCount = 0;
		document.getElementById("description").innerText = "暂无导航提示信息";
	}
	//第一人称导航
	function startNavi1() {
		navi.followAngle = true;
		navi.followPosition = true;
		navi.scaleAnimate = true;
		if(navi.isSimulating){
			navi.stop();
			navi.reset();
		}
		navi.simulate();
	}
	//第三人称导航
	function startNavi2() {
		if(navi.isSimulating){
			navi.stop();
			navi.reset();
		}
		navi.followAngle = false;
		navi.followPosition = false;
		navi.scaleAnimate = false;
		navi.simulate();
	}

	//显示路径数据
	function showDis(data) {
		//距终点的距离
		var distance = data.remain;
		//路线提示信息
		var info = navi.naviDescriptions[data.index];
		var f = info[0] + parseInt(data.distanceToNext) + info[2];
		//普通人每分钟走80米。
		var time = distance / 80;
		var m = parseInt(time);
		var s = Math.floor((time % 1) * 60);
		document.getElementById('description').innerHTML = '<p>距终点：' + distance.toFixed(1) + ' 米</p><p>大约需要：  ' + m + '  分钟   ' + s +
			'   秒</p><p>路线提示：' + f + ' </p>';
	}

	// 车位加载
	function CallLoadData() {
		$.post(
			'<%=path+"/CardPort"%>',
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

	//滚动字幕
	function marquee() {
		var scrollWidth = $('#i-test-tip').width();
		var textWidth = $('.test-tip').width();
		var i = scrollWidth;
		setInterval(function () {//计时器
			i--;
			if (i < -textWidth) {
				i = scrollWidth;
			}
			$('.test-tip').animate({//创建自定义动画的函数。
				'left': i + 'px'
			}, 8);//左移速度8毫秒
		}, 8);
	}

	//绑定事件
	function bingEvents() {
		document.getElementById("btn3D").onclick = function () {
			if (map.viewMode == esmap.ESViewMode.MODE_2D) {
				map.viewMode = esmap.ESViewMode.MODE_3D; //2D-->3D
				document.getElementById("btn3D").style.backgroundImage =
					"url('../ESMap/Case/Park/image/wedgets/3D.png')";
			} else {
				map.viewMode = esmap.ESViewMode.MODE_2D; //3D-->2D
				document.getElementById("btn3D").style.backgroundImage =
					"url('../ESMap/Case/Park/image/wedgets/2D.png')";
			}
		};
	}
</script>
</body>
</html>
