package controllers;

import admin.ConnectionFactory;
import admin.ConnectionFactory;
import models.Funcionario;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Breno Antunes
 */
public class FuncionarioDao {
    private Connection connection;

    public FuncionarioDao() throws ClassNotFoundException {
      this.connection = new ConnectionFactory().getConnection();
    }
  
    public void addFuncionario(Funcionario funcionario) {
        String sql = "insert into funcionario " +
                "(nome,email,cargo,salario,dataNascimento)" +
                " values (?,?,?,?,?)";

        try {
               PreparedStatement stmt = connection.prepareStatement(sql);

            // seta os valores

            stmt.setString(1,funcionario.getNome());
            stmt.setString(2,funcionario.getEmail());
            stmt.setString(3,funcionario.getCargo());
            stmt.setDouble(4,funcionario.getSalario());
            stmt.setDate(5, new Date(funcionario.getDataNascimento().getTime()));

            // executa
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public List<Funcionario> getFuncionarios() {
        try {
            List<Funcionario> funcionarios = new ArrayList<Funcionario>();
            PreparedStatement stmt = this.connection.
                    prepareStatement("select * from funcionario");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                Funcionario func = new Funcionario();
                func.setId(rs.getLong("id"));
                func.setNome(rs.getString("nome"));
                func.setEmail(rs.getString("email"));
                func.setCargo(rs.getString("cargo"));
                func.setSalario(rs.getDouble("salario"));
                func.setDataNascimento(rs.getDate("dataNascimento"));

                
                funcionarios.add(func);
            }
            rs.close();
            stmt.close();
            return funcionarios;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
