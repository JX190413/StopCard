<%--
  Created by IntelliJ IDEA.
  User: 21
  Date: 2019/12/19
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%--前台界面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	String cssPath=request.getContextPath()+"/css/";
	String imgPath=request.getContextPath()+"/images/";
	String jsPath=request.getContextPath()+"/js/";
	String servletPath=request.getContextPath();


%>
<html>
<head>
	<title>Title</title>
	<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans'>

	<link rel="stylesheet" href=<%=cssPath+"style2.css"%>>
	<link rel="stylesheet" href=<%=cssPath+"yue.css"%>>
	<link rel="stylesheet" href=<%=cssPath+"2.css"%>>
</head>
<body>
<div class="cont s--inactive">
	<!-- cont inner start -->
	<div class="cont__inner">
		<!-- el start -->
		<div class="el">
			<div class="el__overflow">
				<div class="el__inner">
					<div class="el__bg"></div>
					<div class="el__preview-cont">
						<h1 class="el__heading" style="font-size: 40px">车辆进场</h1>
					</div>
					<div class="el__content">
						<!-- <div class="el__text"><a href="wwww.baidu.com">车辆进场</a></div> -->


						<div class="cssBox">
							<div class="borderRadius">
								<div class="scene">
									<svg
											version="1.1"
											id="dc-spinner"
											xmlns="http://www.w3.org/2000/svg"
											x="0px" y="0px"
											width:"38"
									height:"38"
									viewBox="0 0 38 38"
									preserveAspectRatio="xMinYMin meet"
									>
									<text x="9" y="21" font-family="Monaco" font-size="2px" style="letter-spacing: 0.6px;color: red" fill="grey"><a style=" font-size: 5px;" href="CarIn.jsp">车辆入库</a>
<%--										<animate--%>
<%--												attributeName="opacity"--%>
<%--												values="0;1;0" dur="1.8s"--%>
<%--												repeatCount="indefinite"/>--%>
									</text>
									<path fill="#373a42" d="M20,35c-8.271,0-15-6.729-15-15S11.729,5,20,5s15,6.729,15,15S28.271,35,20,35z M20,5.203
			            C11.841,5.203,5.203,11.841,5.203,20c0,8.159,6.638,14.797,14.797,14.797S34.797,28.159,34.797,20
			            C34.797,11.841,28.159,5.203,20,5.203z">
									</path>

									<path fill="#373a42" d="M20,33.125c-7.237,0-13.125-5.888-13.125-13.125S12.763,6.875,20,6.875S33.125,12.763,33.125,20
			            S27.237,33.125,20,33.125z M20,7.078C12.875,7.078,7.078,12.875,7.078,20c0,7.125,5.797,12.922,12.922,12.922
			            S32.922,27.125,32.922,20C32.922,12.875,27.125,7.078,20,7.078z">
									</path>

									<path fill="#2AA198" stroke="#2AA198" stroke-width="0.6027" stroke-miterlimit="10" d="M5.203,20
			        			c0-8.159,6.638-14.797,14.797-14.797V5C11.729,5,5,11.729,5,20s6.729,15,15,15v-0.203C11.841,34.797,5.203,28.159,5.203,20z">
										<animateTransform
												attributeName="transform"
												type="rotate"
												from="0 20 20"
												to="360 20 20"
												calcMode="spline"
												keySplines="0.4, 0, 0.2, 1"
												keyTimes="0;1"
												dur="2s"
												repeatCount="indefinite" />
									</path>

									<path fill="#859900" stroke="#859900" stroke-width="0.2027" stroke-miterlimit="10" d="M7.078,20
			          c0-7.125,5.797-12.922,12.922-12.922V6.875C12.763,6.875,6.875,12.763,6.875,20S12.763,33.125,20,33.125v-0.203
			          C12.875,32.922,7.078,27.125,7.078,20z">
										<animateTransform
												attributeName="transform"
												type="rotate"
												from="0 20 20"
												to="360 20 20"
												dur="1.8s"
												repeatCount="indefinite" />
									</path>
									</svg>
								</div>

							</div>

						</div>
						<div class="el__close-btn"></div>
					</div>
				</div>
			</div>
			<div class="el__index">
				<div class="el__index-back">1</div>
				<div class="el__index-front">
					<div class="el__index-overlay" data-index="1">1</div>
				</div>
			</div>
		</div>
		<!-- el end -->
		<!-- el start -->
		<div class="el">
			<div class="el__overflow">
				<div class="el__inner">
					<div class="el__bg"></div>
					<div class="el__preview-cont">
						<h2 class="el__heading" style="font-size: 40px">反向寻车</h2>
					</div>
					<div class="el__content">
						<!-- <div class="el__text"><a href="wwww.baidu.com">反向寻车</a></div> -->
						<div class="cssBox">
							<div class="borderRadius">
								<div class="scene">
									<svg
											version="1.1"
											id="dc-spinner"
											xmlns="http://www.w3.org/2000/svg"
											x="0px" y="0px"
											width:"38"
									height:"38"
									viewBox="0 0 38 38"
									preserveAspectRatio="xMinYMin meet"
									>
									<text x="9" y="21" font-family="Monaco" font-size="2px" style="letter-spacing:0.6" fill="grey"><a style=" color: white; font-size: 5px;" href="FindCar.jsp">反向寻车</a>
										<animate
												attributeName="opacity"
												values="0;1;0" dur="1.8s"
												repeatCount="indefinite"/>
									</text>
									<path fill="#373a42" d="M20,35c-8.271,0-15-6.729-15-15S11.729,5,20,5s15,6.729,15,15S28.271,35,20,35z M20,5.203
			            C11.841,5.203,5.203,11.841,5.203,20c0,8.159,6.638,14.797,14.797,14.797S34.797,28.159,34.797,20
			            C34.797,11.841,28.159,5.203,20,5.203z">
									</path>

									<path fill="#373a42" d="M20,33.125c-7.237,0-13.125-5.888-13.125-13.125S12.763,6.875,20,6.875S33.125,12.763,33.125,20
			            S27.237,33.125,20,33.125z M20,7.078C12.875,7.078,7.078,12.875,7.078,20c0,7.125,5.797,12.922,12.922,12.922
			            S32.922,27.125,32.922,20C32.922,12.875,27.125,7.078,20,7.078z">
									</path>

									<path fill="#2AA198" stroke="#2AA198" stroke-width="0.6027" stroke-miterlimit="10" d="M5.203,20
			        			c0-8.159,6.638-14.797,14.797-14.797V5C11.729,5,5,11.729,5,20s6.729,15,15,15v-0.203C11.841,34.797,5.203,28.159,5.203,20z">
										<animateTransform
												attributeName="transform"
												type="rotate"
												from="0 20 20"
												to="360 20 20"
												calcMode="spline"
												keySplines="0.4, 0, 0.2, 1"
												keyTimes="0;1"
												dur="2s"
												repeatCount="indefinite" />
									</path>

									<path fill="#859900" stroke="#859900" stroke-width="0.2027" stroke-miterlimit="10" d="M7.078,20
			          c0-7.125,5.797-12.922,12.922-12.922V6.875C12.763,6.875,6.875,12.763,6.875,20S12.763,33.125,20,33.125v-0.203
			          C12.875,32.922,7.078,27.125,7.078,20z">
										<animateTransform
												attributeName="transform"
												type="rotate"
												from="0 20 20"
												to="360 20 20"
												dur="1.8s"
												repeatCount="indefinite" />
									</path>
									</svg>
								</div>

							</div>

						</div>




						<div class="el__close-btn"></div>
					</div>
				</div>
			</div>
			<div class="el__index">
				<div class="el__index-back">2</div>
				<div class="el__index-front">
					<div class="el__index-overlay" data-index="2">2</div>
				</div>
			</div>
		</div>
		<!-- el end -->
		<!-- el start -->
		<div class="el">
			<div class="el__overflow">
				<div class="el__inner">
					<div class="el__bg"></div>
					<div class="el__preview-cont">
						<h2 class="el__heading" style="font-size: 40px">车辆出场</h2>
					</div>
					<div class="el__content">
						<!-- <div class="el__text"><a href="wwww.baidu.com">车辆出场</a></div> -->
						<div class="cssBox">
							<div class="borderRadius">
								<div class="scene">
									<svg
											version="1.1"
											id="dc-spinner"
											xmlns="http://www.w3.org/2000/svg"
											x="0px" y="0px"
											width:"38"
									height:"38"
									viewBox="0 0 38 38"
									preserveAspectRatio="xMinYMin meet"
									>
									<text x="9" y="21" font-family="Monaco" font-size="2px" style="letter-spacing:0.6" fill="grey"><a style=" color: white; font-size: 5px;" href="CarOut.jsp">车辆出场</a>
										<animate
												attributeName="opacity"
												values="0;1;0" dur="1.8s"
												repeatCount="indefinite"/>
									</text>
									<path fill="#373a42" d="M20,35c-8.271,0-15-6.729-15-15S11.729,5,20,5s15,6.729,15,15S28.271,35,20,35z M20,5.203
		               C11.841,5.203,5.203,11.841,5.203,20c0,8.159,6.638,14.797,14.797,14.797S34.797,28.159,34.797,20
		               C34.797,11.841,28.159,5.203,20,5.203z">
									</path>

									<path fill="#373a42" d="M20,33.125c-7.237,0-13.125-5.888-13.125-13.125S12.763,6.875,20,6.875S33.125,12.763,33.125,20
		               S27.237,33.125,20,33.125z M20,7.078C12.875,7.078,7.078,12.875,7.078,20c0,7.125,5.797,12.922,12.922,12.922
		               S32.922,27.125,32.922,20C32.922,12.875,27.125,7.078,20,7.078z">
									</path>

									<path fill="#2AA198" stroke="#2AA198" stroke-width="0.6027" stroke-miterlimit="10" d="M5.203,20
		           			c0-8.159,6.638-14.797,14.797-14.797V5C11.729,5,5,11.729,5,20s6.729,15,15,15v-0.203C11.841,34.797,5.203,28.159,5.203,20z">
										<animateTransform
												attributeName="transform"
												type="rotate"
												from="0 20 20"
												to="360 20 20"
												calcMode="spline"
												keySplines="0.4, 0, 0.2, 1"
												keyTimes="0;1"
												dur="2s"
												repeatCount="indefinite" />
									</path>

									<path fill="#859900" stroke="#859900" stroke-width="0.2027" stroke-miterlimit="10" d="M7.078,20
		             c0-7.125,5.797-12.922,12.922-12.922V6.875C12.763,6.875,6.875,12.763,6.875,20S12.763,33.125,20,33.125v-0.203
		             C12.875,32.922,7.078,27.125,7.078,20z">
										<animateTransform
												attributeName="transform"
												type="rotate"
												from="0 20 20"
												to="360 20 20"
												dur="1.8s"
												repeatCount="indefinite" />
									</path>
									</svg>
								</div>

							</div>

						</div>
						<div class="el__close-btn"></div>
					</div>
				</div>
			</div>
			<div class="el__index">
				<div class="el__index-back">3</div>
				<div class="el__index-front">
					<div class="el__index-overlay" data-index="3">3</div>
				</div>
			</div>
		</div>
		<!-- el end -->
		<!-- el start -->
		<div class="el">
			<div class="el__overflow">
				<div class="el__inner">
					<div class="el__bg"></div>
					<div class="el__preview-cont">
						<h2 class="el__heading" style="font-size: 40px">业务办理</h2>
					</div>
					<div class="el__content">
						<!-- <div class="el__text"><a href="wwww.baidu.com">业务办理</a></div> -->
						<div class="cssBox">
							<div class="borderRadius">
								<div class="scene">
									<svg
											version="1.1"
											id="dc-spinner"
											xmlns="http://www.w3.org/2000/svg"
											x="0px" y="0px"
											width:"38"
									height:"38"
									viewBox="0 0 38 38"
									preserveAspectRatio="xMinYMin meet"
									>
									<text x="9" y="21" font-family="Monaco" font-size="2px" style="letter-spacing:0.6" fill="grey"><a style=" color: white; font-size: 5px;" href="UserLogin.jsp">业务办理</a>
										<animate
												attributeName="opacity"
												values="0;1;0" dur="1.8s"
												repeatCount="indefinite"/>
									</text>
									<path fill="#373a42" d="M20,35c-8.271,0-15-6.729-15-15S11.729,5,20,5s15,6.729,15,15S28.271,35,20,35z M20,5.203
		               C11.841,5.203,5.203,11.841,5.203,20c0,8.159,6.638,14.797,14.797,14.797S34.797,28.159,34.797,20
		               C34.797,11.841,28.159,5.203,20,5.203z">
									</path>

									<path fill="#373a42" d="M20,33.125c-7.237,0-13.125-5.888-13.125-13.125S12.763,6.875,20,6.875S33.125,12.763,33.125,20
		               S27.237,33.125,20,33.125z M20,7.078C12.875,7.078,7.078,12.875,7.078,20c0,7.125,5.797,12.922,12.922,12.922
		               S32.922,27.125,32.922,20C32.922,12.875,27.125,7.078,20,7.078z">
									</path>

									<path fill="#2AA198" stroke="#2AA198" stroke-width="0.6027" stroke-miterlimit="10" d="M5.203,20
		           			c0-8.159,6.638-14.797,14.797-14.797V5C11.729,5,5,11.729,5,20s6.729,15,15,15v-0.203C11.841,34.797,5.203,28.159,5.203,20z">
										<animateTransform
												attributeName="transform"
												type="rotate"
												from="0 20 20"
												to="360 20 20"
												calcMode="spline"
												keySplines="0.4, 0, 0.2, 1"
												keyTimes="0;1"
												dur="2s"
												repeatCount="indefinite" />
									</path>

									<path fill="#859900" stroke="#859900" stroke-width="0.2027" stroke-miterlimit="10" d="M7.078,20
		             c0-7.125,5.797-12.922,12.922-12.922V6.875C12.763,6.875,6.875,12.763,6.875,20S12.763,33.125,20,33.125v-0.203
		             C12.875,32.922,7.078,27.125,7.078,20z">
										<animateTransform
												attributeName="transform"
												type="rotate"
												from="0 20 20"
												to="360 20 20"
												dur="1.8s"
												repeatCount="indefinite" />
									</path>
									</svg>
								</div>

							</div>

						</div>
						<div class="el__close-btn"></div>
					</div>
				</div>
			</div>
			<div class="el__index">
				<div class="el__index-back">4</div>
				<div class="el__index-front">
					<div class="el__index-overlay" data-index="4">4</div>
				</div>
			</div>
		</div>
		<!-- el end -->
		<!-- el start -->
		<div class="el">
			<div class="el__overflow">
				<div class="el__inner">
					<div class="el__bg"></div>
					<div class="el__preview-cont">
						<h2 class="el__heading" style="font-size: 40px">广告合作</h2>
					</div>
					<div class="el__content">
						<!-- <div class="el__text"><a href="wwww.baidu.com">广告合作</a></div> -->
						<div class="cssBox">
							<div class="borderRadius">
								<div class="scene">
									<svg
											version="1.1"
											id="dc-spinner"
											xmlns="http://www.w3.org/2000/svg"
											x="0px" y="0px"
											width:"38"
									height:"38"
									viewBox="0 0 38 38"
									preserveAspectRatio="xMinYMin meet"
									>
									<text x="9" y="21" font-family="Monaco" font-size="2px" style="letter-spacing:0.6" fill="grey"><a style=" color: white; font-size: 5px;" href="index.html">广告合作</a>
										<animate
												attributeName="opacity"
												values="0;1;0" dur="1.8s"
												repeatCount="indefinite"/>
									</text>
									<path fill="#373a42" d="M20,35c-8.271,0-15-6.729-15-15S11.729,5,20,5s15,6.729,15,15S28.271,35,20,35z M20,5.203
			            C11.841,5.203,5.203,11.841,5.203,20c0,8.159,6.638,14.797,14.797,14.797S34.797,28.159,34.797,20
			            C34.797,11.841,28.159,5.203,20,5.203z">
									</path>

									<path fill="#373a42" d="M20,33.125c-7.237,0-13.125-5.888-13.125-13.125S12.763,6.875,20,6.875S33.125,12.763,33.125,20
			            S27.237,33.125,20,33.125z M20,7.078C12.875,7.078,7.078,12.875,7.078,20c0,7.125,5.797,12.922,12.922,12.922
			            S32.922,27.125,32.922,20C32.922,12.875,27.125,7.078,20,7.078z">
									</path>

									<path fill="#2AA198" stroke="#2AA198" stroke-width="0.6027" stroke-miterlimit="10" d="M5.203,20
			        			c0-8.159,6.638-14.797,14.797-14.797V5C11.729,5,5,11.729,5,20s6.729,15,15,15v-0.203C11.841,34.797,5.203,28.159,5.203,20z">
										<animateTransform
												attributeName="transform"
												type="rotate"
												from="0 20 20"
												to="360 20 20"
												calcMode="spline"
												keySplines="0.4, 0, 0.2, 1"
												keyTimes="0;1"
												dur="2s"
												repeatCount="indefinite" />
									</path>

									<path fill="#859900" stroke="#859900" stroke-width="0.2027" stroke-miterlimit="10" d="M7.078,20
			          c0-7.125,5.797-12.922,12.922-12.922V6.875C12.763,6.875,6.875,12.763,6.875,20S12.763,33.125,20,33.125v-0.203
			          C12.875,32.922,7.078,27.125,7.078,20z">
										<animateTransform
												attributeName="transform"
												type="rotate"
												from="0 20 20"
												to="360 20 20"
												dur="1.8s"
												repeatCount="indefinite" />
									</path>
									</svg>
								</div>

							</div>

						</div>
						<div class="el__close-btn"></div>
					</div>
				</div>
			</div>
			<div class="el__index">
				<div class="el__index-back">5</div>
				<div class="el__index-front">
					<div class="el__index-overlay" data-index="5">5</div>
				</div>
			</div>
		</div>
		<!-- el end -->
	</div>
	<!-- cont inner end -->
</div>



<script type="text/javascript" src=<%=jsPath+"index.js" %>></script>




</body>
</html>
