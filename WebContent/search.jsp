<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ page import="model.Type" %>
  <%@ page import="model.Wood" %>
  <%@ page import="model.Builder" %>
  <%@ page import="model.Guitar" %>
   <%@ page import="model.GuitarSpec" %>
   <%@ page import="util_connection.DataConnection" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE >
<html >

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>吉他销售系统</title>
   <!-- Bootstrap Styles-->
    <link href="css/bootstrap.css" rel="stylesheet" />
     <!-- FontAwesome Styles-->
    <link href="css/font-awesome.css" rel="stylesheet" />
     <!-- Morris Chart Styles-->
   
        <!-- Custom Styles-->
    <link href="css/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
   <link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
</head>

<body>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">guitar销售系统</a>
            </div>

                                <!-- /.顶部 -->
            
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                </li>
                
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    </li>
                
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                </li>
                
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> 个人用户</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> 登录</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a>
                        </li>
                    </ul>
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        
        
        <!--目录  -->
       
       
       
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu" href="index.html"><i class="fa fa-dashboard"></i> 首页</a>
                    </li>
                    <li>
                        <a href="ui-elements.html"><i class="fa fa-desktop"></i> 用户查询</a>
                    </li>
				


                  
                   
                </ul>

            </div>

        </nav>
       
       
       
       
       
        <!-- 右侧  -->
       <div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            南湖吉他<small>用户查询</small>
                        </h1>
                    </div>
                </div> 
                 <!-- /. ROW  -->
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
吉他列表                        </div>
                        
                       
                       
                        <form action="searchGuitar" method="post">
<label>制造商：</label><select name="builder" id="builder" >
                                              <option></option>
                                              <% for(int  i = 0; i<Builder.values().length;i++){%>
                                              <option value="<%=Builder.values()[i]%>"><%=Builder.values()[i]%></option>
                                              <%} %>
                                           </select>
<label>型号：</label><select name="model" id="model" >
                                            <option></option>
                                            <option >BHSKAD</option>
                                            <option>DQADQD</option>
	                                        <option>FERFWF</option>
                                      </select>
<br><br>
<label>类型：</label><select name="type" id="type">
                                          <option></option>
                                           <% for(int  i = 0; i<Type.values().length;i++){%>
                                              <option value="<%=Type.values()[i]%>"><%=Type.values()[i]%></option>
                                              <%} %>
                                          </select>
<label>背板木：</label><select name="backWood" id="backWood" >
                                              <option></option>
                                                 <% for(int  i = 0; i<Wood.values().length;i++){%>
                                              <option value="<%=Wood.values()[i]%>"><%=Wood.values()[i]%></option>
                                              <%} %>
                                           </select>

       
        <input type="submit" name="find" id="find"  value="查询">

    </form>
    
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                   <thead>
	        <tr>
	            <th>编号</th>
	            <th>价格</th>
	            <th>制造商</th>
	            <th>型号</th>
	            <th>类型</th>
	            <th>背板木</th>
	            <th>顶端木</th>
	        </tr>
	    </thead>
	    
	    
                                      <tbody>
        
<% 
try{
    Connection conn=DataConnection.getConnection();
   //从数据库里面取出所有吉他
    String sql="select * from guitar";
	PreparedStatement stmt=conn.prepareStatement(sql);
	ResultSet rs= stmt.executeQuery();
	List<Guitar> guitars = new ArrayList<Guitar>();
	while (rs.next()) {
		%>
		<tr>
     	<td><%=rs.getString(1)%></td>
		<td><%=rs.getDouble(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs.getString(7)%></td>
		</tr>    
	   
		 
	<%}
	
   }
catch (Exception e) {
	e.printStackTrace();
}
%>
 </tbody>
                                </table>
                            </div>
                            
                        </div>
                        
                        
                   <!-- /东大  -->
                        
  
  
                        
                        
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
                <!-- /. ROW  -->
            
                
           
         
                <!-- /. ROW  -->
        </div>
               <footer><p>Copyright &copy; 2016.</p></footer>
    </div>
        
    </div>
   
   
    <!-- jQuery Js -->
    <script src="js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="js/jquery.metisMenu.js"></script>
     <!-- DATA TABLE SCRIPTS -->
    <script src="js/dataTables/jquery.dataTables.js"></script>
    <script src="js/dataTables/dataTables.bootstrap.js"></script>
        
        
         <!-- Custom Js -->
    <script src="js/custom-scripts.js"></script>
    



</body>

</html>