<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@include file="cookies.jsp" %>
<% 
String Area = "";

int ForwardedToNumber = 0 ;
int SubmittedByNumber = 0 ;
String SubmittedByName = "";

String Description = "";
String ForwardedToName = "";
int ComplainID = 0;
System.out.println("Direct Parameter: "+request.getParameter("c"));
ComplainID = Integer.parseInt(request.getParameter("c"));

String SubmittedTime  = "";
String status = "";
String ResolvedByHTML = "";


   // Get an array of Cookies associated with this domain
            Statement statement = connection.createStatement();
            
            System.out.println("Complain ID: "+ComplainID);
//            ComplainID = 2;
            try{
                
                ResultSet temp = statement
                        .executeQuery("SELECT checked from complainbook WHERE ID = "+ComplainID);
                temp.next();
                if(temp.getInt("checked") == 0){
                    statement.executeUpdate("UPDATE complainbook SET checked = 1 WHERE ID = "+ComplainID);
                    statement.executeUpdate("UPDATE complainbook SET checkedat = CURRENT_TIMESTAMP WHERE ID = "+ComplainID);
                }
                
                ResultSet complainDetail = statement
                        .executeQuery("SELECT * from complainbook WHERE ID = "+ComplainID);
                complainDetail.next();

                Area = complainDetail.getString("Area");
                SubmittedTime  = ""+complainDetail.getTimestamp("DateTime");
                SubmittedByNumber = complainDetail.getInt("SubmittedBy");
                ForwardedToNumber = complainDetail.getInt("ForwardedTo");
                int Status = complainDetail.getInt("solved");
                status = "InActive";
                if(Status == 0){
                    status = "Active";
                }
                Description = complainDetail.getString("Description");

                ResultSet submittedByset = statement.executeQuery("SELECT FirstName from campstaff WHERE ID = "+SubmittedByNumber);
                submittedByset.next();
                SubmittedByName = submittedByset.getString("FirstName");

                ResultSet ForwardedToset = statement.executeQuery("SELECT FirstName from campstaff WHERE ID = "+ForwardedToNumber);
                ForwardedToset.next();
                ForwardedToName = ForwardedToset.getString("FirstName");

                ResultSet ResolvedByset = connection.createStatement().executeQuery("SELECT * from campstaff WHERE Role REGEXP 4");
                while(ResolvedByset.next()){
                    ResolvedByHTML = ResolvedByHTML+ "<option value=\""
                            +ResolvedByset.getString("ID")+"\">"
                            +ResolvedByset.getString("FirstName")+"</option>";

                }
                
                
            }catch(Exception ex){
                System.out.println(ex);
            }

 %>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>Camp System | Complain Review</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> </head>
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
        <!-- BEGIN HEADER -->
        <div class="page-header navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo">
                    <a href="dashboard.jsp">
                        <img src="" alt="logo" class="logo-default" /> </a>
                    <div class="menu-toggler sidebar-toggler"> </div>
                </div>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN TOP NAVIGATION MENU -->
                <div class="top-menu">
                    <ul class="nav navbar-nav pull-right">
                        <!-- BEGIN NOTIFICATION DROPDOWN -->
                        
                         <!--END NOTIFICATION DROPDOWN--> 
                         <!--BEGIN INBOX DROPDOWN--> 
                        
                         <!--END INBOX DROPDOWN--> 
                         <!--BEGIN TODO DROPDOWN--> 
                        
                        <!-- END TODO DROPDOWN -->
                        <!-- BEGIN USER LOGIN DROPDOWN -->
                        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                        <li class="dropdown dropdown-user">
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <img alt="" class="img-circle" src="<% out.println(ProfilePicture); %>" />
                                <span class="username username-hide-on-mobile">
                                    <% 
                                        ResultSet staffdetails = statement.executeQuery("SELECT * from campstaff WHERE ID =" + campstaffid);
                                        staffdetails.next();
                                        String Name = staffdetails.getString("FirstName");
                                        out.println(Name);
                                    %>
                                </span>
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-default">
                                <!-- <li>
                                    <a href="page_user_profile_1.html">
                                        <i class="icon-user"></i> My Profile </a>
                                </li>
                                <li>
                                    <a href="app_calendar.html">
                                        <i class="icon-calendar"></i> My Calendar </a>
                                </li>
                                <li>
                                    <a href="app_inbox.html">
                                        <i class="icon-envelope-open"></i> My Inbox
                                        <span class="badge badge-danger"> 3 </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="app_todo.html">
                                        <i class="icon-rocket"></i> My Tasks
                                        <span class="badge badge-success"> 7 </span>
                                    </a>
                                </li>
                                <li class="divider"> </li>-->
                                <li>
                                    <a href="lockscreen.jsp">
                                        <i class="icon-lock"></i> Lock Screen </a>
                                </li>
                                <li>
                                    <a href="login.jsp">
                                        <i class="icon-key"></i> Log Out </a>
                                </li>
                            </ul>
                        </li>
                        <!-- END USER LOGIN DROPDOWN -->
                        <!-- BEGIN QUICK SIDEBAR TOGGLER -->
                        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                        <li class="dropdown dropdown-quick-sidebar-toggler">
                            <a href="javascript:;" class="dropdown-toggle">
                                <i class="icon-logout"></i>
                            </a>
                        </li>
                        <!-- END QUICK SIDEBAR TOGGLER -->
                    </ul>
                </div>
                <!-- END TOP NAVIGATION MENU -->
            </div>
            <!-- END HEADER INNER -->
        </div>
        <!-- END HEADER -->
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->
            <div class="page-sidebar-wrapper">
                <!-- BEGIN SIDEBAR -->
                <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                <div class="page-sidebar navbar-collapse collapse">
                    <!-- BEGIN SIDEBAR MENU -->
                    <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
                    <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
                    <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
                    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                    <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
                    <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                    <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
                        <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
                        <li class="sidebar-toggler-wrapper hide">
                            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                            <div class="sidebar-toggler"> </div>
                            <!-- END SIDEBAR TOGGLER BUTTON -->
                        </li>
                        <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
                        <li class="sidebar-search-wrapper">
                            <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                            <!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
                            <!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
                            <form class="sidebar-search  sidebar-search-bordered" action="page_general_search_3.html" method="POST">
                                <a href="javascript:;" class="remove">
                                    <i class="icon-close"></i>
                                </a>
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <a href="javascript:;" class="btn submit">
                                            <i class="icon-magnifier"></i>
                                        </a>
                                    </span>
                                </div>
                            </form>
                            <!-- END RESPONSIVE QUICK SEARCH FORM -->
                        </li>
                        <li class="nav-item start active open">
                            <a href="complainreview.jsp" class="nav-link nav-toggle">
                                <i class="icon-home"></i>
                                <span class="title">Review Complains</span>
                                <span class="selected"></span>
                                <!--<span class="arrow open"></span>-->
                            </a>
                        </li>
                    </ul>
                    <!-- END SIDEBAR MENU -->
                    <!-- END SIDEBAR MENU -->
                </div>
                <!-- END SIDEBAR -->
            </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                    <!-- BEGIN PAGE HEADER-->
                    <!-- BEGIN THEME PANEL -->
                    <div class="theme-panel hidden-xs hidden-sm">
                        <div class="toggler"> </div>
                        <div class="toggler-close"> </div>
                        <div class="theme-options">
                            <div class="theme-option theme-colors clearfix">
                                <span> THEME COLOR </span>
                                <ul>
                                    <li class="color-default current tooltips" data-style="default" data-container="body" data-original-title="Default"> </li>
                                    <li class="color-darkblue tooltips" data-style="darkblue" data-container="body" data-original-title="Dark Blue"> </li>
                                    <li class="color-blue tooltips" data-style="blue" data-container="body" data-original-title="Blue"> </li>
                                    <li class="color-grey tooltips" data-style="grey" data-container="body" data-original-title="Grey"> </li>
                                    <li class="color-light tooltips" data-style="light" data-container="body" data-original-title="Light"> </li>
                                    <li class="color-light2 tooltips" data-style="light2" data-container="body" data-html="true" data-original-title="Light 2"> </li>
                                </ul>
                            </div>
                            <div class="theme-option">
                                <span> Theme Style </span>
                                <select class="layout-style-option form-control input-sm">
                                    <option value="square" selected="selected">Square corners</option>
                                    <option value="rounded">Rounded corners</option>
                                </select>
                            </div>
                            <div class="theme-option">
                                <span> Layout </span>
                                <select class="layout-option form-control input-sm">
                                    <option value="fluid" selected="selected">Fluid</option>
                                    <option value="boxed">Boxed</option>
                                </select>
                            </div>
                            <div class="theme-option">
                                <span> Header </span>
                                <select class="page-header-option form-control input-sm">
                                    <option value="fixed" selected="selected">Fixed</option>
                                    <option value="default">Default</option>
                                </select>
                            </div>
                            <div class="theme-option">
                                <span> Top Menu Dropdown</span>
                                <select class="page-header-top-dropdown-style-option form-control input-sm">
                                    <option value="light" selected="selected">Light</option>
                                    <option value="dark">Dark</option>
                                </select>
                            </div>
                            <div class="theme-option">
                                <span> Sidebar Mode</span>
                                <select class="sidebar-option form-control input-sm">
                                    <option value="fixed">Fixed</option>
                                    <option value="default" selected="selected">Default</option>
                                </select>
                            </div>
                            <div class="theme-option">
                                <span> Sidebar Menu </span>
                                <select class="sidebar-menu-option form-control input-sm">
                                    <option value="accordion" selected="selected">Accordion</option>
                                    <option value="hover">Hover</option>
                                </select>
                            </div>
                            <div class="theme-option">
                                <span> Sidebar Style </span>
                                <select class="sidebar-style-option form-control input-sm">
                                    <option value="default" selected="selected">Default</option>
                                    <option value="light">Light</option>
                                </select>
                            </div>
                            <div class="theme-option">
                                <span> Sidebar Position </span>
                                <select class="sidebar-pos-option form-control input-sm">
                                    <option value="left" selected="selected">Left</option>
                                    <option value="right">Right</option>
                                </select>
                            </div>
                            <div class="theme-option">
                                <span> Footer </span>
                                <select class="page-footer-option form-control input-sm">
                                    <option value="fixed">Fixed</option>
                                    <option value="default" selected="selected">Default</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- END THEME PANEL -->
                    <!-- BEGIN PAGE BAR -->
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <a href="dashboard.jsp">Home</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <a href="#">Review Complains</a>
                                <i class="fa fa-circle"></i>
                            </li>
                        </ul>
                        <div class="page-toolbar">
                            
                        </div>
                    </div>
                    <!-- END PAGE BAR -->
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> Complains System
                        <small>Review Complains</small>
                    </h3>
                    <!-- END PAGE TITLE-->
                    <!-- END PAGE HEADER-->
                    
                    <!-- BEGIN SAMPLE TABLE PORTLET-->
                    <div class="row">
                        <div class="col-md-12 ">
                            <!-- BEGIN SAMPLE FORM PORTLET-->
                            <div class="portlet light bordered">
                                <div class="portlet-title">
                                    <div class="caption font-red-sunglo">
                                        <i class="icon-settings font-red-sunglo"></i>
                                        <span class="caption-subject bold uppercase">Complain Details</span>
                                    </div>
                                    <div class="actions">
                                        <div class="btn-group">
                                            <a class="btn btn-sm green dropdown-toggle" href="javascript:;" data-toggle="dropdown"> Actions
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a data-toggle="modal" href="#resolvetab">
                                                        <i class="fa fa-pencil"></i>Resolve</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-trash-o"></i> Delete </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-ban"></i> Ban </a>
                                                </li>
                                                <li class="divider"> </li>
                                                <li>
                                                    <a href="javascript:;"> Make admin </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="resolvetab" tabindex="-1" role="basic" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h4 class="modal-title">Resolved Complain?</h4>
                                                </div>
                                                <form action="complainreview.jsp" name="resolveform" id="resolveform" method="post">
                                                    <div class="modal-body">
                                                        <div id="blockui_sample_3_1_element">
                                                            <div class="form-group form-md-line-input has-info">
                                                                <select class="form-control" name="resolvedby">
                                                                    <% 
                                                                           System.out.println(ResolvedByHTML);
                                                                            out.println(ResolvedByHTML);

                                                                        %>
                                                                        
                                                                </select>
                                                                <% out.println("<input type=\"hidden\" name=\"complainid\" value=\""+ComplainID+"\">"); %>
                                                                <label for="form_control_1"><strong>Resolved By</strong></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <div class="modal-footer">
                                                    <button type="submit" form="resolveform" class="btn btn-outline sbold blue">Save changes</button>
                                                    <button type="button" class="btn btn-outline sbold red" data-dismiss="modal">Close</button>
                                                </div>
                                                </form>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                <div class="portlet-body form">
                                    
                                        <div class="form-body">
                                            
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group form-md-line-input has-error">
                                                        <% out.println(""
                                                                + "<input type=\"text\" class=\"form-control\" disabled id=\"form_control_1\" value=\""+Area+"\">");
                                                                %>
                                                        <label for="form_control_1">Room No#</label>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group form-md-line-input has-error">
                                                        <%
                                                        out.println("<input type=\"text\" class=\"form-control\" disabled id=\"form_control_1\" value=\""+SubmittedByName+"\">");
                                                        %>
                                                        
                                                        <label for="form_control_1">Submitted By</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group form-md-line-input has-error">
                                                        <% 
                                                            out.println("<input type=\"text\" class=\"form-control\" disabled id=\"form_control_1\" value=\""+SubmittedTime+"\">");
                                                            
                                                        %>
                                                        
                                                        <label for="form_control_1">Submission Time</label>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group form-md-line-input has-error">
                                                        <%
                                                        out.println("<input type=\"text\" class=\"form-control\" disabled id=\"form_control_1\" value=\""+ForwardedToName+"\">");
                                                        %>
                                                        
                                                        <label for="form_control_1">Forwarded To</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group form-md-line-input has-error">
                                                        <% 
                                                            out.println("<input type=\"text\" class=\"form-control\" disabled id=\"form_control_1\" value=\""+status+"\">");
                                                            
                                                        %>
                                                        
                                                        <label for="form_control_1">Status</label>
                                                    </div>
                                                </div>
                                            </div>
                                                       
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group form-md-line-input">
                                                        <% out.println(""+
                                                        "<textarea class=\"form-control\" rows=\"3\" disabled>"+Description+"</textarea>");
                                                        %>
                                                        <label for="form_control_1">Description</label>
                                                    </div>
                                                </div>
                                            </div>            
                                                
                                            
                                            <div class="form-actions noborder">
                                                <form action="complainreview.jsp" method="post" id="cancelbutton">
                                                    <button type="submit" form="cancelbutton" class="btn default">Cancel</button>
                                                </form>
                                            </div>
                                        
                                            
                                            
                                            
                                        
                                    
                                </div>
                            </div>
                            <!-- END SAMPLE FORM PORTLET-->
                            <!-- BEGIN SAMPLE FORM PORTLET-->
                            
                            <!-- END SAMPLE FORM PORTLET-->
                            <!-- BEGIN SAMPLE FORM PORTLET-->
                            
                            <!-- END SAMPLE FORM PORTLET-->
                        </div>
                    </div>
                    
                            <!-- END SAMPLE TABLE PORTLET-->
                            
                    
                    
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
            <!-- BEGIN QUICK SIDEBAR -->
            <a href="javascript:;" class="page-quick-sidebar-toggler">
                
            </a>
            <!-- END QUICK SIDEBAR -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER --><div class="page-footer">
            <div class="page-footer-inner"> 2016 &copy; Camp System by Ahsan Mahmood.                
            </div>
            <div class="scroll-to-top">
                <i class="icon-arrow-up"></i>
            </div>
        </div>
        <!-- END FOOTER -->
        <!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
        <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
        <script src="assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
        <script src="assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
        <!-- END THEME LAYOUT SCRIPTS -->
    </body>

</html>