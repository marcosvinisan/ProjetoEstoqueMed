import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Medicamento;

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
