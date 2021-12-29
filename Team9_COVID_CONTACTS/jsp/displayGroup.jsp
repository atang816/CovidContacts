<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
      <link href="https://fonts.googleapis.com/css2?family=Lora&family=Noto+Serif:wght@700&family=Open+Sans+Condensed:wght@300;700&family=Poppins:wght@500&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="../css/doctorstyle.css">
    <title>Covid Contacts Friends</title>
  </head>

    <body class="doctorpage">
      <h1 class="flist">Group Chat</h1>

<%
    String groupID = request.getParameter("displayGroupID");
    int group = Integer.parseInt(groupID);


  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Covid Contacts","root","B0ldin81");
    PreparedStatement ps = conn.prepareStatement("SELECT group_chat.group_name, user.first_name, user.last_name, user.email, user.phone FROM user, group_members, group_chat WHERE group_chat.group_id = group_members.group_id AND group_members.user_id = user.user_id AND group_chat.group_id = ?;");
    ps.setInt(1, group);

    ResultSet rs = ps.executeQuery();

    boolean display = true;

    while(rs.next())
    {
      if(display == true)
      {
        out.println("Group: " + rs.getString(1) + "<br/><br/>");
        display = false;
      }
      out.println("Name: " + rs.getString(2) + " " + rs.getString(3) + "<br/><br/>");
      out.println("email: " +rs.getString(4) + "<br/><br/>");
      out.println("Phone Number: " +rs.getString(5) + "<br/><br/>");

    }
  }
  catch(Exception e){
    out.println(e);
  }
%>

  </body>
</html>
