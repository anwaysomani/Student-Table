<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String ID = request.getParameter("ID");
    String name = request.getParameter("name");
    String college = request.getParameter("college");
    String avgmarks = request.getParameter("avgmarks");
    String total = request.getParameter("total");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_test", "Anway", "anway123");
        Statement st = con.createStatement();

        st.executeUpdate("INSERT INTO student(ID, name, college, avgmarks, total) VALUES('"+ID+"', '"+name+"', '"+college+"', '"+avgmarks+"', '"+total+"')");


        String redirectURL = "http://localhost:8080/Student_Table/index.jsp";
        response.sendRedirect(redirectURL);
        out.println("Inserted data successfully");
    }
    catch(Exception e) {   
        out.println(e);
    }
%>