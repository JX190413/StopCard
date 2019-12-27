<%--
  Created by IntelliJ IDEA.
  User: 21
  Date: 2019/12/26
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String layuicsspath = request.getContextPath()+"/layuiadmin/layui/css/";
	String layuistyle = request.getContextPath()+"/layuiadmin/style/";
	String layuipath = request.getContextPath()+"/layuiadmin/layui/";
	String path =application.getContextPath();
	String jsPath=request.getContextPath()+"/js/";
	String cssPath=request.getContextPath()+"/css/";
	String distpath=request.getContextPath()+"/dist/";
	String vendorpath=request.getContextPath()+"/vendor/";
%>
<html>
<head>

	<link href=<%=cssPath+"socketChart.css"%> rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src=<%=jsPath+"jquery-3.4.1.js" %>></script>
	<script type="text/javascript" src=<%=jsPath+"jquery.js" %>></script>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Slek - Chat and Discussion Platform</title>

<%--	<!-- Favicon -->--%>
<%--	<link rel="icon" href= href=<%=distpath+"media/img/favicon.png" %> type="image/png">--%>

	<!-- Bundle Styles -->
	<link rel="stylesheet"  href=<%=vendorpath+"bundle.css" %>>

	<link rel="stylesheet"   href=<%=vendorpath+"enjoyhint/enjoyhint.css" %>>

	<!-- App styles -->
	<link rel="stylesheet"  href=<%=distpath+"css/app.min.css" %>>


</head>
<body>
<!-- page loading -->
<div class="page-loading"></div>
<!-- ./ page loading -->

<!-- page tour modal -->
<div class="modal fade" id="pageTour" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-zoom" role="document">
		<div class="modal-content">
			<div class="modal-body text-center pt-5">
				<div class="row">
					<div class="col-md-6 offset-3">
						<figure>

							<img src=<%=distpath+"media/svg/undraw_product_tour_foyt.svg" %> class="img-fluid" alt="image">
						</figure>
						<p class="lead mt-5">Would you like to take a short page tour?</p>
					</div>
				</div>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-primary start-tour">Start Tour</button>
				<button type="button" class="btn btn-link" data-dismiss="modal" aria-label="Close">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- ./ page tour modal -->

<!-- disconnected modal -->
<div class="modal fade" id="disconnected" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-zoom" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row mb-5">
					<div class="col-md-6 offset-3">

						<img src=	<%=distpath+"media/svg/undraw_warning_cyit.svg" %> class="img-fluid" alt="image">
					</div>
				</div>
				<p class="lead text-center">Application disconnected</p>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-success btn-lg">Reconnect</button>
				<a href="login.html" class="btn btn-link">Logout</a>
			</div>
		</div>
	</div>
</div>
<!-- ./ disconnected modal -->

<!-- voice call modal -->
<div class="modal call fade" id="call" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="call">
					<div>
						<figure class="mb-4 avatar avatar-xl">

							<img src=<%=distpath+"media/img/women_avatar1.jpg" %> class="rounded-circle" alt="image">
						</figure>
						<h4>Brietta Blogg <span class="text-success">calling...</span></h4>
						<div class="action-button">
							<button type="button" class="btn btn-danger btn-floating btn-lg" data-dismiss="modal">
								<i data-feather="x"></i>
							</button>
							<button type="button" class="btn btn-success btn-pulse btn-floating btn-lg">
								<i data-feather="phone"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ./ voice call modal -->

<!-- voice call modal -->
<div class="modal call fade" id="videoCall" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="call">
					<div>
						<figure class="mb-4 avatar avatar-xl">

							<img src=	<%=distpath+"media/img/women_avatar1.jpg" %> class="rounded-circle" alt="image">
						</figure>
						<h4>Brietta Blogg <span class="text-success">video calling...</span></h4>
						<div class="action-button">
							<button type="button" class="btn btn-danger btn-floating btn-lg" data-dismiss="modal">
								<i data-feather="x"></i>
							</button>
							<button type="button" class="btn btn-success btn-pulse btn-floating btn-lg">
								<i data-feather="video"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ./ voice call modal -->

<!-- add friends modal -->
<div class="modal fade" id="addFriends" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i data-feather="user-plus" class="mr-2"></i> Add Friends
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<i class="ti-close"></i>
				</button>
			</div>
			<div class="modal-body">
				<div class="alert alert-info">Send invitations to friends.</div>
				<form>
					<div class="form-group">
						<label for="emails" class="col-form-label">Email addresses</label>
						<input type="text" class="form-control" id="emails">
					</div>
					<div class="form-group">
						<label for="message" class="col-form-label">Invitation message</label>
						<textarea class="form-control" id="message"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">Submit</button>
			</div>
		</div>
	</div>
</div>
<!-- ./ add friends modal -->

<!-- new group modal -->
<div class="modal fade" id="newGroup" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i data-feather="users" class="mr-2"></i> New Group
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<i class="ti-close"></i>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="group_name" class="col-form-label">Group name</label>
						<div class="input-group">
							<input type="text" class="form-control" id="group_name">
							<div class="input-group-append">
								<button class="btn btn-light" data-toggle="tooltip" title="Emoji" type="button">
									<i data-feather="smile"></i>
								</button>
							</div>
						</div>
					</div>
					<p class="mb-2">The group members</p>
					<div class="form-group">
						<div class="avatar-group">
							<figure class="avatar" data-toggle="tooltip" title="Tobit Spraging">
								<span class="avatar-title bg-success rounded-circle">T</span>
							</figure>
							<figure class="avatar" data-toggle="tooltip" title="Cloe Jeayes">

								<img src=<%=distpath+"media/img/women_avatar4.jpg" %> class="rounded-circle" alt="image">
							</figure>
							<figure class="avatar" data-toggle="tooltip" title="Marlee Perazzo">
								<span class="avatar-title bg-warning rounded-circle">M</span>
							</figure>
							<figure class="avatar" data-toggle="tooltip" title="Stafford Pioch">

								<img src=<%=distpath+"media/img/man_avatar1.jpg" %> class="rounded-circle" alt="image">
							</figure>
							<figure class="avatar" data-toggle="tooltip" title="Bethena Langsdon">
								<span class="avatar-title bg-info rounded-circle">B</span>
							</figure>
							<a href="#" title="Add friends">
								<figure class="avatar">
                                    <span class="avatar-title bg-primary rounded-circle">
                                        <i data-feather="plus"></i>
                                    </span>
								</figure>
							</a>
						</div>
					</div>
					<div class="form-group">
						<label for="description" class="col-form-label">Description</label>
						<textarea class="form-control" id="description"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">Create Group</button>
			</div>
		</div>
	</div>
</div>
<!-- ./ new group modal -->

<!-- setting modal -->
<div class="modal fade" id="settingModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i data-feather="settings" class="mr-2"></i> Settings
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<i class="ti-close"></i>
				</button>
			</div>
			<div class="modal-body">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#account" role="tab" aria-controls="account"
						   aria-selected="true">Account</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#notification" role="tab"
						   aria-controls="notification" aria-selected="false">Notification</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
						   aria-selected="false">Security</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane show active" id="account" role="tabpanel">
						<div class="form-item custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" checked id="customSwitch1">
							<label class="custom-control-label" for="customSwitch1">Allow connected contacts</label>
						</div>
						<div class="form-item custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" checked id="customSwitch2">
							<label class="custom-control-label" for="customSwitch2">Confirm message requests</label>
						</div>
						<div class="form-item custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" checked id="customSwitch3">
							<label class="custom-control-label" for="customSwitch3">Profile privacy</label>
						</div>
						<div class="form-item custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" id="customSwitch4">
							<label class="custom-control-label" for="customSwitch4">Developer mode options</label>
						</div>
						<div class="form-item custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" checked id="customSwitch5">
							<label class="custom-control-label" for="customSwitch5">Two-step security
								verification</label>
						</div>
					</div>
					<div class="tab-pane" id="notification" role="tabpanel">
						<div class="form-item custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" checked id="customSwitch6">
							<label class="custom-control-label" for="customSwitch6">Allow mobile notifications</label>
						</div>
						<div class="form-item custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" id="customSwitch7">
							<label class="custom-control-label" for="customSwitch7">Notifications from your
								friends</label>
						</div>
						<div class="form-item custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" id="customSwitch8">
							<label class="custom-control-label" for="customSwitch8">Send notifications by email</label>
						</div>
					</div>
					<div class="tab-pane" id="contact" role="tabpanel">
						<div class="form-item custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" id="customSwitch9">
							<label class="custom-control-label" for="customSwitch9">Suggest changing passwords every
								month.</label>
						</div>
						<div class="form-item custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" checked id="customSwitch10">
							<label class="custom-control-label" for="customSwitch10">Let me know about suspicious
								entries to your account</label>
						</div>
						<div class="form-item">
							<p>
								<a class="btn btn-light" data-toggle="collapse" href="#collapseExample" role="button"
								   aria-expanded="false"
								   aria-controls="collapseExample">
									<i data-feather="plus" class="mr-2"></i> Security Questions
								</a>
							</p>
							<div class="collapse" id="collapseExample">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Question 1">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Answer 1">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Question 2">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Answer 2">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">Save</button>
			</div>
		</div>
	</div>
</div>
<!-- ./ setting modal -->

<!-- edit profile modal -->
<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i data-feather="edit-2" class="mr-2"></i> Edit Profile
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<i class="ti-close"></i>
				</button>
			</div>
			<div class="modal-body">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#personal" role="tab"
						   aria-controls="personal" aria-selected="true">Personal</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#about" role="tab" aria-controls="about"
						   aria-selected="false">About</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#social-links" role="tab"
						   aria-controls="social-links" aria-selected="false">Social Links</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane show active" id="personal" role="tabpanel">
						<form>
							<div class="form-group">
								<label for="fullname" class="col-form-label">Fullname</label>
								<div class="input-group">
									<input type="text" class="form-control" id="fullname">
									<div class="input-group-append">
                                        <span class="input-group-text">
                                            <i data-feather="user"></i>
                                        </span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-form-label">Avatar</label>
								<div class="d-flex align-items-center">
									<div>
										<figure class="avatar mr-3 item-rtl">

											<img src=	<%=distpath+"media/img/man_avatar4.jpg" %> class="rounded-circle"
											     alt="image">
										</figure>
									</div>

									<div class="custom-file">
										<input type="file" class="custom-file-input" id="customFile">
										<label class="custom-file-label" for="customFile">Choose file</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="city" class="col-form-label">City</label>
								<div class="input-group">
									<input type="text" class="form-control" id="city" placeholder="Ex: Columbia">
									<div class="input-group-append">
                                        <span class="input-group-text">
                                            <i data-feather="target"></i>
                                        </span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="phone" class="col-form-label">Phone</label>
								<div class="input-group">
									<input type="text" class="form-control" id="phone" placeholder="(555) 555 55 55">
									<div class="input-group-append">
                                        <span class="input-group-text">
                                            <i data-feather="phone"></i>
                                        </span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="website" class="col-form-label">Website</label>
								<input type="text" class="form-control" id="website" placeholder="https://">
							</div>
						</form>
					</div>
					<div class="tab-pane" id="about" role="tabpanel">
						<form>
							<div class="form-group">
								<label for="about-text" class="col-form-label">Write a few words that describe
									you</label>
								<textarea class="form-control" id="about-text"></textarea>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" checked id="customCheck1">
								<label class="custom-control-label" for="customCheck1">View profile</label>
							</div>
						</form>
					</div>
					<div class="tab-pane" id="social-links" role="tabpanel">
						<form>
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Username">
									<div class="input-group-append">
                                        <span class="input-group-text bg-facebook">
                                            <i class="ti-facebook"></i>
                                        </span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Username">
									<div class="input-group-append">
                                        <span class="input-group-text bg-twitter">
                                            <i class="ti-twitter"></i>
                                        </span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Username">
									<div class="input-group-append">
                                        <span class="input-group-text bg-instagram">
                                            <i class="ti-instagram"></i>
                                        </span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Username">
									<div class="input-group-append">
                                        <span class="input-group-text bg-linkedin">
                                            <i class="ti-linkedin"></i>
                                        </span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Username">
									<div class="input-group-append">
                                        <span class="input-group-text bg-dribbble">
                                            <i class="ti-dribbble"></i>
                                        </span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Username">
									<div class="input-group-append">
                                        <span class="input-group-text bg-youtube">
                                            <i class="ti-youtube"></i>
                                        </span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Username">
									<div class="input-group-append">
                                        <span class="input-group-text bg-google">
                                            <i class="ti-google"></i>
                                        </span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Username">
									<div class="input-group-append">
                                        <span class="input-group-text bg-whatsapp">
                                            <i class="fa fa-whatsapp"></i>
                                        </span>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">Save</button>
			</div>
		</div>
	</div>
</div>
<!-- ./ edit profile modal -->

<!-- layout -->
<div class="layout">

	<!-- navigation -->
	<nav class="navigation">
		<div class="nav-group">
			<ul>
				<li class="logo">
					<a href="#">
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
						     xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
						     width="612px" height="612px" viewBox="0 0 612 612"
						     style="enable-background:new 0 0 612 612;" xml:space="preserve">
                            <g>
	                            <g id="_x32__26_">
		                            <g>
			                            <path d="M401.625,325.125h-191.25c-10.557,0-19.125,8.568-19.125,19.125s8.568,19.125,19.125,19.125h191.25
                                    c10.557,0,19.125-8.568,19.125-19.125S412.182,325.125,401.625,325.125z M439.875,210.375h-267.75
                                    c-10.557,0-19.125,8.568-19.125,19.125s8.568,19.125,19.125,19.125h267.75c10.557,0,19.125-8.568,19.125-19.125
                                    S450.432,210.375,439.875,210.375z M306,0C137.012,0,0,119.875,0,267.75c0,84.514,44.848,159.751,114.75,208.826V612
                                    l134.047-81.339c18.552,3.061,37.638,4.839,57.203,4.839c169.008,0,306-119.875,306-267.75C612,119.875,475.008,0,306,0z
                                    M306,497.25c-22.338,0-43.911-2.601-64.643-7.019l-90.041,54.123l1.205-88.701C83.5,414.133,38.25,345.513,38.25,267.75
                                    c0-126.741,119.875-229.5,267.75-229.5c147.875,0,267.75,102.759,267.75,229.5S453.875,497.25,306,497.25z"/>
		                            </g>
	                            </g>
                            </g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
                        </svg>
					</a>
				</li>
				<li>
					<a class="active" data-navigation-target="chats" href="#" data-toggle="tooltip" title="Chats"
					   data-placement="right">
						<span class="badge badge-warning"></span>
						<i data-feather="message-circle"></i>
					</a>
				</li>
				<li>
					<a data-navigation-target="friends" href="#" data-toggle="tooltip"
					   title="Friends" data-placement="right">
						<span class="badge badge-danger"></span>
						<i data-feather="user"></i>
					</a>
				</li>
				<li>
					<a data-navigation-target="favorites" data-toggle="tooltip" title="Favorites" data-placement="right"
					   href="#">
						<i data-feather="star"></i>
					</a>
				</li>
				<li class="brackets">
					<a data-navigation-target="archived" href="#" data-toggle="tooltip"
					   title="Archived" data-placement="right">
						<i data-feather="archive"></i>
					</a>
				</li>
				<li>
					<a href="#" class="dark-light-switcher" data-toggle="tooltip" title="Dark mode"
					   data-placement="right">
						<i data-feather="moon"></i>
					</a>
				</li>
				<li data-toggle="tooltip" title="User menu" data-placement="right">
					<a href="./login.html" data-toggle="dropdown">
						<figure class="avatar">

							<img src=	<%=distpath+"media/img/women_avatar5.jpg" %> class="rounded-circle" alt="image">
						</figure>
					</a>
					<div class="dropdown-menu">
						<a href="#" class="dropdown-item" data-toggle="modal" data-target="#editProfileModal">Edit
							profile</a>
						<a href="#" class="dropdown-item" data-navigation-target="contact-information">Profile</a>
						<a href="#" class="dropdown-item" data-toggle="modal" data-target="#settingModal">Settings</a>
						<div class="dropdown-divider"></div>
						<a href="login.html" class="dropdown-item text-danger">Logout</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	<!-- ./ navigation -->

	<!-- content -->
	<div class="content">

		<!-- sidebar group -->
		<div class="sidebar-group">

			<!-- Chats sidebar -->
			<div id="chats" class="sidebar active">
				<header>
					<input type="hidden" id="username" name="username" value="${sessionScope.name}">
					登录用户：<span id="talks" >${sessionScope.name}</span>
					<ul class="list-inline">
						<li class="list-inline-item" data-toggle="tooltip" title="New group">
							<a class="btn btn-outline-light" href="#" data-toggle="modal" data-target="#newGroup">
								<i data-feather="users"></i>
							</a>
						</li>
						<li class="list-inline-item">
							<a class="btn btn-outline-light" data-toggle="tooltip" title="New chat" href="#"
							   data-navigation-target="friends">
								<i data-feather="plus-circle"></i>
							</a>
						</li>
						<li class="list-inline-item d-xl-none d-inline">
							<a href="#" class="btn btn-outline-light text-danger sidebar-close">
								<i data-feather="x"></i>
							</a>
						</li>
					</ul>
				</header>
				<form>
					<input type="text" class="form-control" placeholder="Search chats">
				</form>
				<div class="sidebar-body">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">


<%--								<img src=<%=distpath+"media/img/man_avatar1.jpg" %> class="rounded-circle" alt="image">--%>

							<div id="hz-group-body">

							</div>
						</li>
						<!-- -->
					</ul>
				</div>
			</div>
			<!-- ./ Chats sidebar -->



		</div>
		<!-- ./ sidebar group -->

		<!-- chat -->
		<div class="chat">
			<div class="chat-header">
				<div class="chat-header-user">
					<figure class="avatar">

						<img src=<%=distpath+"media/img/man_avatar3.jpg" %> class="rounded-circle" alt="image">
					</figure>
					<div>
						<h5> 正在与<span id="toUserName"></span>聊天</h5>
						<small class="text-success">
							<i>writing...</i>
						</small>
					</div>
				</div>
				<div class="chat-header-action">
					<ul class="list-inline">
						<li class="list-inline-item d-xl-none d-inline">
							<a href="#" class="btn btn-outline-light mobile-navigation-button">
								<i data-feather="menu"></i>
							</a>
						</li>
						<li class="list-inline-item" data-toggle="tooltip" title="Voice call">
							<a href="#" class="btn btn-outline-light text-success" data-toggle="modal"
							   data-target="#call">
								<i data-feather="phone"></i>
							</a>
						</li>
						<li class="list-inline-item" data-toggle="tooltip" title="Video call">
							<a href="#" class="btn btn-outline-light text-warning" data-toggle="modal"
							   data-target="#videoCall">
								<i data-feather="video"></i>
							</a>
						</li>
						<li class="list-inline-item">
							<a href="#" class="btn btn-outline-light" data-toggle="dropdown">
								<i data-feather="more-horizontal"></i>
							</a>
							<div class="dropdown-menu dropdown-menu-right">
								<a href="#" data-navigation-target="contact-information"
								   class="dropdown-item">Profile</a>
								<a href="#" class="dropdown-item">Add to archive</a>
								<a href="#" class="dropdown-item">Delete</a>
								<div class="dropdown-divider"></div>
								<a href="#" class="dropdown-item text-danger">Block</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="chat-body"> <!-- .no-message -->
				<!--
				<div class="no-message-container">
					<div class="row mb-5">
						<div class="col-md-4 offset-4">
							<img src="./dist/media/svg/undraw_empty_xct9.svg" class="img-fluid" alt="image">
						</div>
					</div>
					<p class="lead">Select a chat to read messages</p>
				</div>
				-->
				<div class="messages">


						<div id="hz-message-body">
						</div>

				</div>
				<div class="chat-footer">

						<div>
							<button class="btn btn-light mr-3" data-toggle="tooltip" title="Emoji" type="button">
								<i data-feather="smile"></i>
							</button>
						</div>
					<div contenteditable="true" id="hz-message-input">

					</div>
						<div class="form-buttons" style="box-sizing: border-box;
    text-align: right;">
							<button class="btn btn-light" data-toggle="tooltip" title="Add files" type="button">
								<i data-feather="paperclip"></i>
							</button>
							<button class="btn btn-light d-sm-none d-block" data-toggle="tooltip"
							        title="Send a voice record" type="button">
								<i data-feather="mic"></i>
							</button>
							<button  class="btn btn-primary" onclick="send()"   >
							 发送
							</button>
						</div>

				</div>
			</div>
			<!-- ./ chat -->

			<div class="sidebar-group">
				<div id="contact-information" class="sidebar">
					<header>
						<span>Profile</span>
						<ul class="list-inline">
							<li class="list-inline-item">
								<a href="#" class="btn btn-outline-light text-danger sidebar-close">
									<i data-feather="x"></i>
								</a>
							</li>
						</ul>
					</header>
					<div class="sidebar-body">
						<div class="pl-4 pr-4">
							<div class="text-center">
								<figure class="avatar avatar-xl mb-4">

									<img src=<%=distpath+"media/img/women_avatar5.jpg" %> class="rounded-circle" alt="image">
								</figure>
								<h5 class="mb-1">Mirabelle Tow</h5>
								<small class="text-muted font-italic">Last seen: Today</small>

								<ul class="nav nav-tabs justify-content-center mt-5" id="myTab" role="tablist">
									<li class="nav-item">
										<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
										   aria-controls="home" aria-selected="true">About</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
										   aria-controls="profile" aria-selected="false">Media</a>
									</li>
								</ul>
							</div>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
									<p class="text-muted">Lorem ipsum is a pseudo-Latin text used in web design, typography,
										layout, and printing in place of English to emphasise design elements over content.
										It's also called placeholder (or filler) text. It's a convenient tool for
										mock-ups.</p>
									<div class="mt-4 mb-4">
										<h6>Phone</h6>
										<p class="text-muted">(555) 555 55 55</p>
									</div>
									<div class="mt-4 mb-4">
										<h6>City</h6>
										<p class="text-muted">Germany / Berlin</p>
									</div>
									<div class="mt-4 mb-4">
										<h6>Website</h6>
										<p>
											<a href="#">www.franshanscombe.com</a>
										</p>
									</div>
									<div class="mt-4 mb-4">
										<h6 class="mb-3">Social media accounts</h6>
										<ul class="list-inline social-links">
											<li class="list-inline-item">
												<a href="#" class="btn btn-sm btn-floating btn-facebook"
												   data-toggle="tooltip" title="Facebook">
													<i class="fa fa-facebook"></i>
												</a>
											</li>
											<li class="list-inline-item">
												<a href="#" class="btn btn-sm btn-floating btn-twitter"
												   data-toggle="tooltip" title="Twitter">
													<i class="fa fa-twitter"></i>
												</a>
											</li>
											<li class="list-inline-item">
												<a href="#" class="btn btn-sm btn-floating btn-dribbble"
												   data-toggle="tooltip" title="Dribbble">
													<i class="fa fa-dribbble"></i>
												</a>
											</li>
											<li class="list-inline-item">
												<a href="#" class="btn btn-sm btn-floating btn-whatsapp"
												   data-toggle="tooltip" title="Whatsapp">
													<i class="fa fa-whatsapp"></i>
												</a>
											</li>
											<li class="list-inline-item">
												<a href="#" class="btn btn-sm btn-floating btn-linkedin"
												   data-toggle="tooltip" title="Linkedin">
													<i class="fa fa-linkedin"></i>
												</a>
											</li>
											<li class="list-inline-item">
												<a href="#" class="btn btn-sm btn-floating btn-google" data-toggle="tooltip"
												   title="Google">
													<i class="fa fa-google"></i>
												</a>
											</li>
											<li class="list-inline-item">
												<a href="#" class="btn btn-sm btn-floating btn-behance"
												   data-toggle="tooltip" title="Behance">
													<i class="fa fa-behance"></i>
												</a>
											</li>
											<li class="list-inline-item">
												<a href="#" class="btn btn-sm btn-floating btn-instagram"
												   data-toggle="tooltip" title="Instagram">
													<i class="fa fa-instagram"></i>
												</a>
											</li>
										</ul>
									</div>
									<div class="mt-4 mb-4">
										<h6 class="mb-3">Settings</h6>
										<div class="form-group">
											<div class="form-item custom-control custom-switch">
												<input type="checkbox" class="custom-control-input" id="customSwitch11">
												<label class="custom-control-label" for="customSwitch11">Block</label>
											</div>
										</div>
										<div class="form-group">
											<div class="form-item custom-control custom-switch">
												<input type="checkbox" class="custom-control-input" checked=""
												       id="customSwitch12">
												<label class="custom-control-label" for="customSwitch12">Mute</label>
											</div>
										</div>
										<div class="form-group">
											<div class="form-item custom-control custom-switch">
												<input type="checkbox" class="custom-control-input" id="customSwitch13">
												<label class="custom-control-label" for="customSwitch13">Get
													notification</label>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
									<h6 class="mb-3 d-flex align-items-center justify-content-between">
										<span>Recent Files</span>
										<a href="#" class="btn btn-link small">
											<i data-feather="upload" class="mr-2"></i> Upload
										</a>
									</h6>
									<div>
										<ul class="list-group list-group-flush">
											<li class="list-group-item pl-0 pr-0 d-flex align-items-center">
												<a href="#">
													<i class="fa fa-file-pdf-o text-danger mr-2"></i> report4221.pdf
												</a>
											</li>
											<li class="list-group-item pl-0 pr-0 d-flex align-items-center">
												<a href="#">
													<i class="fa fa-image text-muted mr-2"></i> avatar_image.png
												</a>
											</li>
											<li class="list-group-item pl-0 pr-0 d-flex align-items-center">
												<a href="#">
													<i class="fa fa-file-excel-o text-success mr-2"></i>
													excel_report_file2020.xlsx
												</a>
											</li>
											<li class="list-group-item pl-0 pr-0 d-flex align-items-center">
												<a href="#">
													<i class="fa fa-file-text-o text-warning mr-2"></i> articles342133.txt
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- ./ content -->

	</div>
</div>


<!-- App styles -->

<script src=<%=vendorpath+"bundle.js" %>></script>

<script src=<%=vendorpath+"enjoyhint/enjoyhint.min.js" %>></script>

<!-- App scripts -->
<script src=<%=distpath+"js/app.min.js" %>></script>

<!-- Examples -->
<script src=<%=distpath+"js/examples.js" %>></script>
<script type="text/javascript" src=<%=jsPath+"socketChart.js" %>></script>

</body>
</html>
