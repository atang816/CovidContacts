<%@ page import = "java.sql.*"%>

  <%
    String userID = request.getParameter("userID");
    String friendID = request.getParameter("friendID");

    int user = Integer.parseInt(userID);
    int friend = Integer.parseInt(friendID);

    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
      PreparedStatement ps = conn.prepareStatement("INSERT INTO friends (user_id1, user_id2)" +
                "VALUES (?,?)");


      ps.setInt(1, user);
      ps.setInt(2, friend);


      int x = ps.executeUpdate();
      if(x>0)
      {
        out.println("Success");
        %> <jsp:include page="success.jsp"/> <%
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
