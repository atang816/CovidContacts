<%@ page import = "java.sql.*"%>

  <%
    String deleteGroupID = request.getParameter("deleteGroupID");
    int groupID = Integer.parseInt(deleteGroupID);
    String groupName = request.getParameter("deleteGroupName");

    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
      PreparedStatement ps = conn.prepareStatement("DELETE FROM group_chat WHERE group_name = ? AND group_id = ?;");
      ps.setString(1,groupName);
      ps.setInt(2,groupID); 

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
