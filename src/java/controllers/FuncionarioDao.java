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
        String sql = "insert into funcionarios " +
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
            List<Funcionario> funcionarios = new ArrayList<>();
            PreparedStatement stmt = this.connection.
                    prepareStatement("select * from funcionarios");
            ResultSet rs = stmt.executeQuery();
            Funcionario func;
            while (rs.next()) {
                func = new Funcionario();
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
    public void updateFuncionario(Funcionario func) {
        String sql = "update funcionarios set nome=?, email=?, cargo=?, salario=?" +
                "dataNascimento=? where id=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, func.getNome());
            stmt.setString(2, func.getEmail());
            stmt.setString(3, func.getCargo());
            stmt.setDouble(4, func.getSalario());
            stmt.setDate(5, new Date(func.getDataNascimento().getTime()));
            stmt.setLong(6, func.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public void removeFuncionario(long idFunc) {
     try {
         PreparedStatement stmt = connection.prepareStatement("delete from funcionarios where id=?");
         stmt.setLong(1, idFunc);
         stmt.execute();
         stmt.close();
     } catch (SQLException e) {
         throw new RuntimeException(e);
     }
 }
}
