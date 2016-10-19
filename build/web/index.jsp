<%-- 
    Document   : index
    Created on : 18/10/2016, 22:07:27
    Author     : Breno Antunes
--%>

<%@page import="java.util.List"%>
<%@page import="modelos.Funcionario"%>
<%@page import="admin.dao.FuncionarioDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="admin.ConnectionFactory"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
        <title>Funcionarios</title>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">CRUD</a>
                </div>

                <div class="collapse navbar-collapse" id="navbar">
                </div>
            </div>
        </nav>
        <div class="col col-sm-offset-0 col-sm-12 col-md-offset-2 col-md-8">
            <h1>Funcionários</h1>
            <a class="btn btn-success pull-right" href="novoFuncionario.jsp">Adicionar <span class="glyphicon glyphicon-plus"></span></a>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nome</th>
                        <th>E-Mail</th>
                        <th>Data de Aniversario</th>
                        <th>Cargo</th>
                        <th>Salario</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        FuncionarioDao dao = new FuncionarioDao();
                        List<Funcionario> funcionarios = dao.getFuncionarios();
                        Funcionario f;
                    %>
                    <c:forEach var="i" begin="0" end="${funcionarios.size()}">
                        <c:set var="func" value="${funcionarios.get(i)}" scope="page" />

                        Item <c:out value="${func}"/><p>
                    </c:forEach>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td><button class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-pencil"></span> </button><button class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span></button></td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
