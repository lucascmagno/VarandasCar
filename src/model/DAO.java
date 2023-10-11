package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
	/** MODULO DE CONEXÃO **/
	
	// PARÂMETROS
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/varandas_auto?useTimezone=true&serverTimezone=UTC";
	private String user = "root";
	private String password = "";
	
	//MÉTODO
	private Connection conectar() {
		Connection con = null;
		
		//Verificar se a conexão com o Banco de Dados foi bem sucedida
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			System.out.println(e);
		return null;
		} 
	}
	
	//Teste de Conexão
	
	public void testeConexao() {
		try {
			Connection con = conectar();
			System.out.println(con);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		} 
	}
}
