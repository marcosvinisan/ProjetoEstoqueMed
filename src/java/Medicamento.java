package model;

public class Medicamento {
    private String nomeComercial;
    private String formulaQuimica;
    private String numeroLote;
    private String dataValidade;
    private String laboratorioFornecedor;

    public Medicamento(String nomeComercial, String formulaQuimica, String numeroLote, String dataValidade, String laboratorioFornecedor) {
        this.nomeComercial = nomeComercial;
        this.formulaQuimica = formulaQuimica;
        this.numeroLote = numeroLote;
        this.dataValidade = dataValidade;
        this.laboratorioFornecedor = laboratorioFornecedor;
    }

    // Getters e Setters
    public String getNomeComercial() {
        return nomeComercial;
    }

    public void setNomeComercial(String nomeComercial) {
        this.nomeComercial = nomeComercial;
    }

    public String getFormulaQuimica() {
        return formulaQuimica;
    }

    public void setFormulaQuimica(String formulaQuimica) {
        this.formulaQuimica = formulaQuimica;
    }

    public String getNumeroLote() {
        return numeroLote;
    }

    public void setNumeroLote(String numeroLote) {
        this.numeroLote = numeroLote;
    }

    public String getDataValidade() {
        return dataValidade;
    }

    public void setDataValidade(String dataValidade) {
        this.dataValidade = dataValidade;
    }

    public String getLaboratorioFornecedor() {
        return laboratorioFornecedor;
    }

    public void setLaboratorioFornecedor(String laboratorioFornecedor) {
        this.laboratorioFornecedor = laboratorioFornecedor;
    }
}
