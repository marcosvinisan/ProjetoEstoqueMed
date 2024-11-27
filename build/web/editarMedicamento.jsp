<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="dao.MedicamentoDAO" %>
<%@ page import="model.Medicamento" %>
<%
    request.setCharacterEncoding("UTF-8");

    // Obtém o número do lote enviado pelo formulário
    String numeroLote = request.getParameter("batch-number");
    Medicamento medicamento = null;

    try {
        MedicamentoDAO dao = new MedicamentoDAO();
        medicamento = dao.consultarPorLote(numeroLote);

        if (medicamento == null) {
            throw new Exception("Medicamento não encontrado para o número do lote fornecido.");
        }
    } catch (Exception e) {
        out.println("<p class='error'>Erro ao carregar medicamento: " + e.getMessage() + "</p>");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Medicamento</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Editar Medicamento</h1>
        <form method="post" action="editarOuApagarMedicamento.jsp">
            <!-- Número do lote enviado como campo oculto -->
            <input type="hidden" name="batch-number" value="<%= medicamento.getNumeroLote() %>" />

            <label for="med-name">Nome Comercial:
                <input id="med-name" name="med-name" type="text" value="<%= medicamento.getNomeComercial() %>" required />
            </label>

            <label for="formula">Fórmula Química:
                <input id="formula" name="formula" type="text" value="<%= medicamento.getFormulaQuimica() %>" required />
            </label>

            <label for="expiry-date">Data de Validade:
                <input id="expiry-date" name="expiry-date" type="date" value="<%= medicamento.getDataValidade() %>" required />
            </label>

            <label for="laboratory">Laboratório Fornecedor:
                <input id="laboratory" name="laboratory" type="text" value="<%= medicamento.getLaboratorioFornecedor() %>" required />
            </label>

            <button type="submit" name="action" value="Editar">Salvar Alterações</button>
        </form>
        <a href="listarMedicamentos.jsp" class="btn">Voltar para a lista</a>
    </div>
</body>
</html>
