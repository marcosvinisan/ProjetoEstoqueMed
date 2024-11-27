<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="dao.MedicamentoDAO" %>
<%
    request.setCharacterEncoding("UTF-8");

    // Captura os parâmetros enviados pelo formulário
    String action = request.getParameter("action");
    String numeroLote = request.getParameter("batch-number");

    // Mensagem de feedback
    String mensagem = "";
    String redirecionamento = "listarMedicamentos.jsp";

    try {
        MedicamentoDAO dao = new MedicamentoDAO();

        if ("Editar".equals(action)) {
            // Captura os dados enviados para edição
            String nomeComercial = request.getParameter("med-name");
            String formulaQuimica = request.getParameter("formula");
            String dataValidade = request.getParameter("expiry-date");
            String laboratorioFornecedor = request.getParameter("laboratory");

            // Validações: Certifique-se de que os campos estão preenchidos
            if (nomeComercial == null || nomeComercial.trim().isEmpty() ||
                formulaQuimica == null || formulaQuimica.trim().isEmpty() ||
                dataValidade == null || dataValidade.trim().isEmpty() ||
                laboratorioFornecedor == null || laboratorioFornecedor.trim().isEmpty() ||
                numeroLote == null || numeroLote.trim().isEmpty()) {
                throw new Exception("Todos os campos são obrigatórios para editar.");
            }

            // Atualiza os dados do medicamento
            dao.editar(nomeComercial, formulaQuimica, dataValidade, laboratorioFornecedor, numeroLote);
            mensagem = "Medicamento editado com sucesso!";
        } else if ("Apagar".equals(action)) {
            // Verifica se o número do lote foi enviado
            if (numeroLote == null || numeroLote.trim().isEmpty()) {
                throw new Exception("Número do lote não pode estar vazio para exclusão.");
            }

            dao.apagar(numeroLote);
            mensagem = "Medicamento apagado com sucesso!";
        } else {
            throw new Exception("Ação inválida.");
        }
    } catch (Exception e) {
        mensagem = "Erro ao processar a ação: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Resultado da Ação</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Resultado da Ação</h1>
        <p><%= mensagem %></p>
        <a href="<%= redirecionamento %>" class="btn">Voltar para a lista de medicamentos</a>
    </div>
</body>
</html>
