<%-- 
    Document   : index
    Created on : 24 Jul, 2015, 7:15:45 PM
    Author     : Prasad
--%>

<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <select name="dir">
    <%
        File f=new File("D:\\chef-starter\\chef-repo\\cookbooks");
        File s[]=f.listFiles();
        String opt="";
        for(int i=0;i<s.length;i++)
            opt=opt+"<option name="+s[i].getName()+">"+s[i].getName()+"</option>";
             %>
             <%=opt%>
              </select>
              
              <%
              Runtime rr=Runtime.getRuntime();
              rr.exec("Notepad.exe");
              File f1=new File("D:\\chef-starter\\chef-repo\\");
              String s11;
              rr.exec("powershell knife node list > D:\\phani.txt",null,f1);
             /* String command[]={"powershell","knife","node","list",">","D:\\phani.txt"};
              ProcessBuilder processBuilder=new ProcessBuilder(command);
              processBuilder.directory(f1);
              processBuilder.start();*/
              BufferedReader bufferedReader=new BufferedReader(new InputStreamReader(new FileInputStream("D:\\phani.txt")));
              String line=" ",temp1="";
              while((temp1=bufferedReader.readLine())!=null)
              {
                  System.out.println(temp1);
                  line=line+"<option name="+temp1+">"+temp1+"</option>";
              }
              FileInputStream f2=new FileInputStream("D:\\phani.txt");
              int c;
              System.out.println("this is printed\n");
              while((c=f2.read())!=-1)
              {
                  System.out.print((char)c);
              }
              %>
              
              <select>
                  <%=line%>
              </select>
      </body>
</html>
