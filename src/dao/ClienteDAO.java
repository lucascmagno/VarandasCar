package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.Cliente;
import util.Conexao;

public class ClienteDAO {
	public boolean inserirUsuario(Cliente p) {
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("INSERT INTO `cliente` "
					+ "(`nome`, `email`,"
					+ " `telefone`, `senha`)"
					+ " VALUES ('"+p.getNome()+"', '"+p.getEmail()+"',"
							+ " '"+p.getTelefone()+"', '"+p.getSenha()+"');");
			return true;
		}catch(SQLException e){
			return false;
		}
		
	}
	
	public ResultSet retornaUsuarios() {
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet resultados = con.executeQuery("SELECT * FROM `cliente`");
			return resultados;
		}catch(SQLException e){
			ResultSet vazio = null;
			return vazio;
		}
	}
	
	public Cliente retornaUsuario(int index) {
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet resQuery = con.executeQuery("SELECT * FROM `cliente` WHERE id_cliente = '"+Integer.toString(index)+"';");
			resQuery.next();
			
			Cliente p = new Cliente();
			p.setId_cliente(resQuery.getInt(1));
			p.setNome(resQuery.getString(2));
			p.setEmail(resQuery.getString(3));
			p.setTelefone(resQuery.getString(4));
			p.setSenha(resQuery.getString(5));
			
			return p;
			
		}catch(SQLException e){
			Cliente vazio = null;
			return vazio;
		}
	}
	
	public boolean login(String email, String senha) {
		Conexao con = null;
		int qnt = 0;
		try {
			con = new Conexao();
			ResultSet login = con.executeQuery("SELECT * FROM `cliente` WHERE email LIKE '"+ email +"' AND senha LIKE '"+senha+"';");
			
			while(login.next()) {
				qnt++;
				System.out.println(qnt);
			}
			
			if (qnt == 1) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
	
	public int UserByLogin(String email, String senha) {
		Conexao con = null;
		int qnt = 0;
		try {
			con = new Conexao();
			int id_cliente = 0;
			ResultSet login = con.executeQuery("SELECT * FROM `cliente` WHERE email LIKE '"+ email +"' AND senha LIKE '"+senha+"';");


			
			while(login.next()) {
				qnt++;
				id_cliente = login.getInt(1);
			}
			
			 
			
			if (qnt == 0 || qnt > 1) {
				return -2;
			} else {
				return id_cliente;
			}
		} catch (Exception e) {
			return -1;
		}
	}
	
	public boolean apagaUsuario(int id) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("DELETE FROM `cliente` WHERE id_cliente = "+id);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
	public boolean verificaCampo(String field, String value){
		Conexao con = null;
		int lines = 0;
		try {
			con = new Conexao();
			ResultSet res = con.executeQuery("SELECT * FROM `cliente` WHERE `"+field+"` LIKE \""+value+"\";");
			while(res.next()) {
				lines++;
			}
			System.out.println(lines);
		} catch (SQLException e) {
			System.out.println("Erro SQL "+e);
		}
		
		if(lines == 0) {
			return false;
		}else {
			return true;
		}
	}
}