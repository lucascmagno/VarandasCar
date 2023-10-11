package model;

public class Veiculo {
	private int id_veiculo;
	private int id_cliente;
	private String montadora;
	private String modelo;
	private int ano_fabrica;
	
		
	public Veiculo(int id_veiculo, int id_cliente, String montadora, String modelo, int ano_fabrica) {
		super();
		this.id_veiculo = id_veiculo;
		this.id_cliente = id_cliente;
		this.montadora = montadora;
		this.modelo = modelo;
		this.ano_fabrica = ano_fabrica;
	}

	public Veiculo() {
		super();
	}
	
	
	public int getId_veiculo() {
		return id_veiculo;
	}
	public void setId_veiculo(int id_veiculo) {
		this.id_veiculo = id_veiculo;
	}

	
	public int getId_cliente() {
		return id_cliente;
	}
	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}


	public String getMontadora() {
		return montadora;
	}
	public void setMontadora(String montadora) {
		this.montadora = montadora;
	}
	
	
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	
	
	public int getAno_fabrica() {
		return ano_fabrica;
	}
	public void setAno_fabrica(int ano_fabrica) {
		this.ano_fabrica = ano_fabrica;
	}
	
	
	
}
