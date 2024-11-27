<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="dao.MedicamentoDAO" %>
<%@ page import="java.sql.SQLException" %>
<%
    // Define a codificação de caracteres para o request
    request.setCharacterEncoding("UTF-8");

    // Captura os dados enviados pelo formulário
    String nomeComercial = request.getParameter("med-name");
    String formulaQuimica = request.getParameter("formula");
    String numeroLote = request.getParameter("batch-number");
    String dataValidade = request.getParameter("expiry-date");
    String laboratorio = request.getParameter("laboratory");

    try {
        // Valida os dados recebidos (opcional, mas recomendado)
        if (nomeComercial == null || formulaQuimica == null || numeroLote == null || dataValidade == null || laboratorio == null ||
            nomeComercial.isEmpty() || formulaQuimica.isEmpty() || numeroLote.isEmpty() || dataValidade.isEmpty() || laboratorio.isEmpty()) {
            throw new Exception("Todos os campos são obrigatórios!");
        }

        // Instancia a classe DAO e salva os dados no banco
        MedicamentoDAO dao = new MedicamentoDAO();
        dao.salvar(nomeComercial, formulaQuimica, numeroLote, dataValidade, laboratorio);

        // Redireciona para a página de sucesso
        response.sendRedirect("registerSucessful.html");
    } catch (SQLException e) {
        // Trata erros relacionados ao banco de dados
        out.println("<p>Erro ao acessar o banco de dados: " + e.getMessage() + "</p>");
    } catch (Exception e) {
        // Trata outros tipos de erros
        out.println("<p>Ocorreu um erro ao salvar os dados: " + e.getMessage() + "</p>");
    }
%>
