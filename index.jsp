<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>IET Search Library</title>
<link rel="stylesheet" type="text/css" media="screen" href="css/screen.css"/>
		<link rel="stylesheet" type="text/css" media="screen" href="css/view_mode.css"/>
		<link rel="stylesheet" href="jquery.ui.all.css">
	<script src="jss/jquery-1.9.1.js"></script>
	<script src="jss/jquery.ui.core.js"></script>
	<script src="jss/jquery.ui.widget.js"></script>
	<script src="jss/jquery.ui.tabs.js"></script>
	<link rel="stylesheet" href="tab.css">
	<link rel="icon" 
      type="image/png" 
      href="myicon.png">
	<script>
	$(function() {
		$( "#tabs" ).tabs({
			event: "mouseover"
		});
	});
        function activate(){
           if( document.getElementById("tdData").style.visibility=="hidden"){
               document.getElementById("tdData").style.visibility="visible"
           }
        }
	</script>
	

<body>
	<h1 id="header" >IET Library Search</h1>
	
	<div >

<div id="tabs">
	<ul id="leftnav">
		<li><a href="#tabs-1">Search</a></li>
		<li><a href="#tabs-2">About IET</a></li>
		<li><a href="#tabs-3">About Library</a></li>
	</ul>
	<div id="tabs-1">
            <form action="index.jsp" method="post">
		<h2>Search</h2>
		<br>
		<br>
                <h1>Search Option
                
<select id="search" name="search">
  <option value="aname">Author Name</option>
  <option value="publ">Publisher</option>
  <option value="isbn">ISBN No.</option>
  <option value="bno">Book Name</option>
</select>

                    <input type="submit"  value="Search" onclick="activate()"></h1>
            </form>
            <%!static Connection c;
               static Statement stmt;
               static ResultSet rs;
%>
<br>
<br>
<h1>Queried to order by :  <b> <%=request.getParameter("search") %> </b></h1>
<table border="3" style="visibility: visible;color: #ffff00" id="tdData">
    <tr>
        <td>Author Name</td>
        <td>Publisher name</td>
        <td>ISBN no.</td>
        <td>Book No.</td>
    </tr>
            <% 
           
            if(request.getParameter("search")!=null){
                try{
                    c=Connect.Conn.getCon();
                stmt=c.createStatement();
                rs=stmt.executeQuery("select * from lib order by "+request.getParameter("search"));
                while(rs.next()){
                    %>
                    <tr>
                        <td><%= rs.getString("aname") %></td>
                        <td><%= rs.getString("publ") %></td>
                        <td><%= rs.getString("isbn") %> </td>
                        <td><%= rs.getString("bno") %></td>
                    </tr>
                    <%                 
                }
                }catch(Exception e){
                    e.printStackTrace();
                }
                               }
            %>
</table>
	</div>
	<div id="tabs-2">
		<h2>About IET</h2>
		<br>
		<br>
		<p>Devi Ahilya University, Indore has been a leading University of central India. <br>
		The University within the framework of its UTD opened a self-financing engineering Institute named Institute of Engineering & Technology (IET).<br>
		It started its academic journey with glorious dreams on 04 September 1996. It has been popularly known as IET-DAVV.</p>
	</div>
	<div id="tabs-3">
		<h2>About Library</h2>
		<br>
		<br>
		<p>Our library enrich of 20,000 books on engineering,economics and literature.
			We provide 3 books to each student of our institute to restrain them from economic 
			burden.</p>
	</div>
</div>



	
</div>



</body>
</html>
