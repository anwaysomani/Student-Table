<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
	String id = request.getParameter("api_list");
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String database = "student";
	String userid = "Anway";
	String password = "anway123";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Employee</title>
        
        
        <!-- BootStrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    
    <body>
        <h1>Employee</h1>
        <div class="container">
            <form class="form-horizontal" action="indexStudent.jsp">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="ID">ID</label>
                    <div class="col-sm-10">
                        <input type='number' class="form-control" name='ID' placeholder="ID">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">Name</label>
                    <div class="col-sm-10">
                        <input type='text' class="form-control" name='name' placeholder="Name">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="college">Company-held-college</label>
                    <div class="col-sm-10">
                        <input type='text' class="form-control" name="college" placeholder="Enter company-held-college name...">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="avgmarls">Average Marks</label>
                    <div class="col-sm-10">
                        <input type='double' class="form-control" name='avgmarks' placeholder="Enter average marks....">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="total">Total</label>
                    <div class="col-sm-10">
                        <input type='double' class="form-control" name='total' placeholder="Enter average marks...">
                    </div>
                </div>

                <div class="form-group"> 
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                </div>

            </form>
        </div>
        
        <table class="table table-hover">
            <thead class="thead-light">
              <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Company-held-college</th>
                <th scope="col">Average Marks</th>
                <th scope="col">Total</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
            <%
                try{
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_test", "Anway", "anway123");
                    statement = con.createStatement();
                    String sql = "SELECT * FROM student";
                    resultSet = statement.executeQuery(sql);
                    int i=0;
                    while(resultSet.next()){
            %>      
            <tr>                     
                <th scope="row">Tree<%=resultSet.getString("ID") %></th>
                <td><%=resultSet.getString("Name") %></td>
                <td><%=resultSet.getString("College") %></td>
                <td><%=resultSet.getString("AvgMarks") %></td>
                <td><%=resultSet.getString("Total") %></td>
            </tr>                            
            <%
                i++;
			}
			connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
                </tbody>
            </table>    
        
    </body>
</html>
