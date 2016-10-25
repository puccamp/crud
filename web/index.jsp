<%-- 
    Document   : index
    Created on : 18/10/2016, 22:07:27
    Author     : Breno Antunes
--%>

<%@page import="java.util.List" %>
<%@page import="models.Funcionario"%>
<%@page import="dao.FuncionarioDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="admin.ConnectionFactory"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        
        <script src="http://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
        <div class="modal fade" id="confirmationModal" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Confirmar exclusão</h4>
                    </div>
                    <form  method="post" action="servletFuncionario?method=delete">
                        <div class="modal-body">
                            <p>Você tem certeza que deseja excluir o funcionario <span id="nomeExcluir"></span> ?</p>
                            <input hidden type="text" id="idExcluir" name="idExcluir"/>
                        </div>
                        <div class="modal-footer">
                          <button type="submit" class="btn btn-danger">Confirmar</button>
                          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col col-sm-offset-0 col-sm-12 col-md-offset-2 col-md-8">
            <h1>Funcionários</h1>
            <a class="btn btn-success pull-right" href="formFuncionario.jsp">Adicionar <span class="glyphicon glyphicon-plus"></span></a>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
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
                        request.setAttribute("funcionarios", funcionarios);
                    %>
                    <c:forEach items="${funcionarios}" var="funcionario"> 
                        <tr>
                            <td><c:out value="${funcionario.getNome()}"/></td>
                            <td><c:out value="${funcionario.getEmail()}"/></td>
                            <td><c:out value="${funcionario.getDataNascimentoString()}"/></td>
                            <td><c:out value="${funcionario.getCargo()}"/></td>
                            <td><c:out value="${funcionario.getSalario()}"/></td>
                            <td>
                                <form method="post" action="servletFuncionario?method=put&funcId=${funcionario.getId()}">
                                    <button class="btn btn-sm btn-warning" type="submit"><span class="glyphicon glyphicon-pencil"></span></button>
                                </form>
                                <button class="btn btn-sm btn-danger" onclick="removeFunc('${funcionario.getNome()}','${funcionario.getId()}')"><span class="glyphicon glyphicon-trash"></span></button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script>
            function removeFunc(nome,id){
                $("#nomeExcluir").text(nome);
                $("#idExcluir").val(id);
                $('#confirmationModal').modal('show');
            }
        </script>
    </body>
</html>
