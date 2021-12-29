<%@ page import = "java.sql.*"%>

  <%
    String firstName = request.getParameter("fname");
    String lastName = request.getParameter("lname");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
      PreparedStatement ps = conn.prepareStatement("insert into user(first_name, last_name, user_pass, email, phone) values(?,?,?,?,?);");
      ps.setString(1,firstName);
      ps.setString(2,lastName);
      ps.setString(3,password);
      ps.setString(4,email);
      ps.setString(5,phone);

      int x = ps.executeUpdate();
      if(x>0)
      {
        out.println("Success");
      }
      else
      {
        out.println("Fail");
      }
    }
    catch(Exception e){
      out.println(e);
    }
  %>
