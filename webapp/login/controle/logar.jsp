<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ClienteDAO" %>
<% 
    ClienteDAO login = new ClienteDAO();
    boolean ok = false;   
    
    String email = request.getParameter("emailin");
    String senha = request.getParameter("senhain");
    
    ok = login.login(email, senha);
    HttpSession sessao = request.getSession();
    
    if(ok){
        int id = login.UserByLogin(email, senha);
        if (id == 0){
            session.setAttribute("id_cliente", -1); // Define a variável de sessão como -1
            response.sendRedirect("../singin.jsp");
        } else {
            session.setAttribute("id_cliente", id); // Define a variável de sessão com o ID correto
            response.sendRedirect("../../paginas/dashboard.jsp");
        }
    } else {
        session.setAttribute("id_cliente", -1); // Define a variável de sessão como -1
        response.sendRedirect("../singin.jsp");
    }
%>
