<%-- 
    Document   : novoFuncionario
    Created on : 18/10/2016, 23:39:47
    Author     : developer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
        <title>Adicionar funcionario</title>
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
                    <a class="navbar-brand" href="index.jsp">CRUD</a>
                </div>

                <div class="collapse navbar-collapse" id="navbar">
                </div>
            </div>
        </nav>
        <form class="form-horizontal" method="POST" action="addFuncionario">
            <fieldset>
            <legend>Novo funcionario</legend>
            <div class="form-group">
                <label class="col-md-4 control-label" for="txtNome">Nome:</label>  
                <div class="col-md-4">
                <input id="txtNome" name="nome" type="text" placeholder="Ex: João da Silva" class="form-control input-md" required="true">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="txtEmail">Email:</label>  
                <div class="col-md-4">
                    <input id="txtEmail" name="email" type="text" placeholder="Ex: joaodasilva@email.com" class="form-control input-md" required="true">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="txtDatanasc">Data de Nascimento</label>  
                <div class="col-md-4">
                    <input id="txtDatanasc" name="datanasc" type="text" placeholder="Ex: 02/04/1994" class="form-control input-md" required="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="cbCargo">Cargo:</label>  
                <div class="col-md-4">
                    <input id="txtCargo" name="cargo" type="text" placeholder="Ex: Analista de Sistemas" class="form-control input-md" required="true">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="txtSalario">Salário:</label>  
                <div class="col-md-4">
                    <input id="txtSalario" name="salario" type="text" placeholder="Ex: 2000.00" class="form-control input-md" required="true">
                </div>
            </div>
            <div class="form-group">
              <div class="col-md-offset-4 col-md-8">
                <button id="btnAdicionar" name="btnAdicionar" class="btn btn-success">Adicionar</button>
                <button id="btnLimpar" name="btnLimpar" class="btn btn-danger">Limpar</button>
              </div>
            </div>

            </fieldset>
            </form>

    </body>
</html>
