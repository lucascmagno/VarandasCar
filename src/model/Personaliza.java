package model;

public class Personaliza {
	private int id_personaliza;
	private int fk_veiculo;
	private String peca;
	private String dimensoes;
	private String cor;
	private String data_peca;
	private String observacao;
		
	
	public Personaliza(int id_personaliza, int fk_veiculo, String peca, String dimensoes, String cor, String data_peca, String observacao) {
		super();
		this.id_personaliza = id_personaliza;
		this.fk_veiculo = fk_veiculo;
		this.peca = peca;
		this.dimensoes = dimensoes;
		this.cor = cor;
		this.data_peca = data_peca;
		this.observacao = observacao;
	}

	public Personaliza() {
		super();

	}
	
	
	public int getId_personaliza() {
		return id_personaliza;
	}
	public void setId_personaliza(int id_personaliza) {
		this.id_personaliza = id_personaliza;
	}
	
	
	public int getFk_veiculo() {
		return fk_veiculo;
	}
	public void setFk_veiculo(int fk_veiculo) {
		this.fk_veiculo = fk_veiculo;
	}
	

	public String getPeca() {
		return peca;
	}
	public void setPeca(String peca) {
		this.peca = peca;
	}

	
	public String getDimensoes() {
		return dimensoes;
	}
	public void setDimensoes(String dimensoes) {
		this.dimensoes = dimensoes;
	}
	
	
	public String getCor() {
		return cor;
	}
	public void setCor(String cor) {
		this.cor = cor;
	}
	
	
	public String getData_peca() {
		return data_peca;
	}
	public void setData_peca(String data_peca) {
		this.data_peca = data_peca;
	}
	

	public String getObservacao() {
		return observacao;
	}
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	
	
}
