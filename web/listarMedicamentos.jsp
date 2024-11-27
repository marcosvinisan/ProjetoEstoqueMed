<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.MedicamentoDAO" %>
<%@ page import="model.Medicamento" %>
<%
    // Instancia o DAO e busca todos os medicamentos
    MedicamentoDAO dao = null;
    List<Medicamento> medicamentos = null;

    try {
        dao = new MedicamentoDAO();
        medicamentos = dao.listarTodos();
    } catch (Exception e) {
        out.println("<p class='error'>Erro ao listar medicamentos: " + e.getMessage() + "</p>");
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Lista de Medicamentos</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Lista de Medicamentos</h1>
        <% if (medicamentos != null && !medicamentos.isEmpty()) { %>
            <table>
                <thead>
                    <tr>
                        <th>Número do Lote</th>
                        <th>Nome Comercial</th>
                        <th>Fórmula Química</th>
                        <th>Data de Validade</th>
                        <th>Laboratório</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Medicamento medicamento : medicamentos) { %>
                        <tr>
                            <td><%= medicamento.getNumeroLote() %></td>
                            <td><%= medicamento.getNomeComercial() %></td>
                            <td><%= medicamento.getFormulaQuimica() %></td>
                            <td><%= medicamento.getDataValidade() %></td>
                            <td><%= medicamento.getLaboratorioFornecedor() %></td>
                            <td>
                                <!-- Formulário para Editar -->
                                <form method="get" action="editarMedicamento.jsp" style="display:inline;">
                                    <input type="hidden" name="batch-number" value="<%= medicamento.getNumeroLote() %>" />
                                    <button type="submit" name="action" value="Editar">Editar</button>
                                </form>
                                
                                <form method="post" action="editarOuApagarMedicamento.jsp" style="display:inline;">
                                    <input type="hidden" name="batch-number" value="<%= medicamento.getNumeroLote() %>" />
                                    <button type="submit" name="action" value="Apagar" class="danger">Excluir</button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <p>Nenhum medicamento encontrado.</p>
        <% } %>
        <!-- Botão para voltar à página principal -->
        <a href="index.html" class="btn">Adicionar Novo Medicamento></a>
    </div>
</body>
</html>
