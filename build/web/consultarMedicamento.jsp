<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="dao.MedicamentoDAO" %>
<%@ page import="model.Medicamento" %>
<%
    request.setCharacterEncoding("UTF-8");

    String numeroLote = request.getParameter("batch-number");
    Medicamento medicamento = null;

    if (numeroLote != null && !numeroLote.isEmpty()) {
        try {
            MedicamentoDAO dao = new MedicamentoDAO();
            medicamento = dao.consultarPorLote(numeroLote);
        } catch (Exception e) {
            out.println("<p>Erro ao consultar o medicamento: " + e.getMessage() + "</p>");
        }
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Consultar Medicamento</title>
</head>
<body>
    <h1>Consultar Medicamento</h1>
    <form method="get" action="consultarMedicamento.jsp">
        <label for="batch-number">Número do Lote:
            <input id="batch-number" name="batch-number" type="text" required placeholder="Digite o número do lote" />
        </label>
        <input type="submit" value="Consultar" />
    </form>

    <% if (medicamento != null) { %>
        <h2>Detalhes do Medicamento</h2>
        <form method="post" action="editarOuApagarMedicamento.jsp">
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
            <input type="submit" name="action" value="Editar" />
            <input type="submit" name="action" value="Apagar" />
        </form>
    <% } %>
</body>
</html>
