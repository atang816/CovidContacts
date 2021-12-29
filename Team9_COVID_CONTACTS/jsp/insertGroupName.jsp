<%@ page import = "java.sql.*"%>

  <%
    String userID = request.getParameter("ownerID");
    int user = Integer.parseInt(userID);
    String groupName = request.getParameter("newGroup");

    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
      PreparedStatement ps = conn.prepareStatement("INSERT INTO group_chat (group_name, owner_id)" + "VALUES (?, ?);");
      ps.setString(1,groupName);
      ps.setInt(2,user); 

      int x = ps.executeUpdate();
      if(x>0)
      {
        %> <jsp:include page="success.jsp"/> <%
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
