<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Real State</title>


</head>
<body>
<h1>Add property </h1>

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost/RealEstate_JEE?serverTimezone=UTC"  
     user="root"  password=""/>  
  
<sql:query dataSource="${db}" var="rs">  
SELECT * from Property;  
</sql:query>  


<table border="2" width="100%">  
<tr>  
<th>name</th>  
<th>id</th>  
<th>country</th>  
<th>city</th>  
</tr>  
<c:forEach var="table" items="${rs.rows}">  
<tr>  
<td><c:out value="${table.property_name}"/></td>  
<td><c:out value="${table.property_id}"/></td>  
<td><c:out value="${table.country}"/></td>  
<td><c:out value="${table.adress}"/></td>  
<td><c:out value="${table.price}"/></td>  

</tr>  
</c:forEach>  
</table>  


<form method="GET" action="controller">
			Property Name <input type="text" name="name"  /><br>
			Property System Identifier <input type="text" name="property_id"  /><br>
			Country <input type="text" name="country"  /><br>
			City<input type="text" name="city"  /><br>
			Type  <input type="radio" name="type" value="residential" checked> Residantial<br>
			      <input type="radio" name="type" value="commercial">Commercial <br>
			      <input type="radio" name="type" value="industrial"> Industrial <br>
			      <input type="radio" name="type" value="land"> Vacant Land <br>
			      
			Owner Name<input type="text" name="owner_name"  /><br>
			Owner ID<input type="text" name="owner_id"  /><br>
			Under Mortgage  <input type="radio" name="mortgage" value="yes" checked> Yes<br>
			                <input type="radio" name="mortgage" value="no">No <br>
			      
			Purchase type  <input type="radio" name="purchase_type" value="yes" checked> Loan<br>
			                <input type="radio" name="purchase_type" value="no">Complete <br>
			
			      
			
			Purchase Price   <input type="text" name="price"  /> <br>
			<input type="submit" value="Valider" />

</form>

</body>
</html>