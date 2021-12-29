<%@ page import = "java.sql.*"%>

  <%
    String userID = request.getParameter("userID");
    int id = Integer.parseInt(userID);
    String email = request.getParameter("email");
    String newPassword = request.getParameter("new-password");
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
      PreparedStatement ps = conn.prepareStatement("UPDATE user SET user_pass = ? WHERE user_id = ? AND email = ?;");
      ps.setString(1, newPassword);
      ps.setInt(2,id);
      ps.setString(3,email);

      int x = ps.executeUpdate();;

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
