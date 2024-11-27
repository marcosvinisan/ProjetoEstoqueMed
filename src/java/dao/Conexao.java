package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    // Ajuste da URL para garantir que o MySQL use UTF-8
    private static final String URL = "jdbc:mysql://localhost:3306/LabEstoque?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
    
    private static final String USER = "root"; 
    private static final String PASSWORD = ""; 

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Erro ao conectar ao banco de dados: " + e.getMessage(), e);
        }
    }
}
