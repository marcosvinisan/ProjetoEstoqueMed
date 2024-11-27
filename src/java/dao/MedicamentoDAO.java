package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Medicamento;

public class MedicamentoDAO {
    private Connection connection;

    // Construtor que inicializa a conexão com o banco de dados
    public MedicamentoDAO() {
        this.connection = Conexao.getConnection();
    }

    // Método para salvar um novo medicamento
    public void salvar(String nomeComercial, String formulaQuimica, String numeroLote, String dataValidade, String laboratorioFornecedor) {
        String sql = "INSERT INTO medicamentos (nome_comercial, formula_quimica, numero_lote, data_validade, laboratorio_fornecedor) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, nomeComercial);
            stmt.setString(2, formulaQuimica);
            stmt.setString(3, numeroLote);
            stmt.setString(4, dataValidade);
            stmt.setString(5, laboratorioFornecedor);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao salvar medicamento: " + e.getMessage(), e);
        }
    }

    // Método para listar todos os medicamentos
    public List<Medicamento> listarTodos() {
        String sql = "SELECT * FROM medicamentos";
        List<Medicamento> lista = new ArrayList<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Medicamento medicamento = new Medicamento(
                    rs.getString("nome_comercial"),
                    rs.getString("formula_quimica"),
                    rs.getString("numero_lote"),
                    rs.getString("data_validade"),
                    rs.getString("laboratorio_fornecedor")
                );
                lista.add(medicamento);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar medicamentos: " + e.getMessage(), e);
        }

        return lista;
    }

    // Método para consultar um medicamento pelo número do lote
    public Medicamento consultarPorLote(String numeroLote) {
        String sql = "SELECT * FROM medicamentos WHERE numero_lote = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, numeroLote);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Medicamento(
                    rs.getString("nome_comercial"),
                    rs.getString("formula_quimica"),
                    rs.getString("numero_lote"),
                    rs.getString("data_validade"),
                    rs.getString("laboratorio_fornecedor")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao consultar medicamento: " + e.getMessage(), e);
        }

        return null; // Retorna null caso o medicamento não seja encontrado
    }

    // Método para editar os dados de um medicamento
    public void editar(String nomeComercial, String formulaQuimica, String dataValidade, String laboratorioFornecedor, String numeroLote) {
        String sql = "UPDATE medicamentos SET nome_comercial = ?, formula_quimica = ?, data_validade = ?, laboratorio_fornecedor = ? WHERE numero_lote = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, nomeComercial);
            stmt.setString(2, formulaQuimica);
            stmt.setString(3, dataValidade);
            stmt.setString(4, laboratorioFornecedor);
            stmt.setString(5, numeroLote);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao editar medicamento: " + e.getMessage(), e);
        }
    }

    // Método para apagar um medicamento pelo número do lote
    public void apagar(String numeroLote) {
        String sql = "DELETE FROM medicamentos WHERE numero_lote = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, numeroLote);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected == 0) {
                throw new SQLException("Nenhum medicamento encontrado com o número do lote: " + numeroLote);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao apagar medicamento: " + e.getMessage(), e);
        }
    }
}
