<%@ page import = "java.sql.*"%>

  <%
    String groupID = request.getParameter("groupID");
    int group = Integer.parseInt(groupID);
    String memberID = request.getParameter("newMemberID");
    int member = Integer.parseInt(memberID);
    


    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
      PreparedStatement ps = conn.prepareStatement("INSERT INTO group_members VALUES(?,?);");
      ps.setInt(1, member);
      ps.setInt(2, group);

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
