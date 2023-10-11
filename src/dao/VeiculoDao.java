package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Veiculo;
import util.Conexao;

public class VeiculoDao {
	
	public boolean inserirVeiculo(Veiculo v) {
	    Conexao con = null;
	    try {
	        con = new Conexao();
	        String sql = "INSERT INTO `veiculo` "
	            + "(`fk_cliente`, `montadora`, `modelo`, `ano_fabrica`) VALUES ("
	            + v.getId_cliente() + ", '" + v.getMontadora() + "', '"
	            + v.getModelo() + "', " + v.getAno_fabrica() + ")";
	        
	        con.executeUpdate(sql);
	        return true;
	    } catch (SQLException e) {
	        return false;
	    } finally {
	        if (con != null) {
	        	con.close();
	        }
	    }
	}
	
	public Veiculo VeiculoPorId(int id_veiculo) {
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet resV = con.executeQuery("SELECT * FROM `veiculo` WHERE `id_veiculo`="+id_veiculo);
			
			resV.next();
			
			Veiculo veiculo = new Veiculo();
			
			
			veiculo.setId_cliente(resV.getInt(1));
			veiculo.setId_cliente(resV.getInt(2));
			veiculo.setMontadora(resV.getString(3));
			veiculo.setModelo(resV.getString(4));
			veiculo.setAno_fabrica(resV.getInt(5));

			return veiculo;
		}catch (SQLException e) {
			return null;
		}
	}
	
	public boolean editarVeiculo(Veiculo v) {
	    Conexao con = null;
	    try {
	        con = new Conexao();
	        String sql = "UPDATE `veiculo` SET "
	            + "`fk_cliente` = " + v.getId_cliente() + ","
	            + " `montadora` = '" + v.getMontadora() + "',"
	            + " `modelo` = '" + v.getModelo() + "',"
	            + " `ano_fabrica` = " + v.getAno_fabrica() + " "
	            + " WHERE `id_veiculo` = " + v.getId_veiculo();
	        
	        con.executeUpdate(sql);
	        return true;
	    } catch (SQLException e) {
	        return false;
	    } finally {
	        if (con != null) {
	            con.close();
	        }
	    }
	}
	
	public ArrayList<Veiculo> veiculosUser(int id_user){
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet res = con.executeQuery("SELECT * FROM `veiculo` WHERE fk_cliente = "+id_user+";");
			ArrayList<Veiculo> veiculos = new ArrayList<Veiculo>();
			
			while (res.next()) {
				Veiculo nova = new Veiculo();
				nova.setId_veiculo(res.getInt("id_veiculo"));
				nova.setId_cliente(res.getInt("fk_cliente"));
				nova.setMontadora(res.getString("montadora"));
				nova.setModelo(res.getString("modelo"));
				nova.setAno_fabrica(res.getInt("ano_fabrica"));
				veiculos.add(nova);
			}
			return veiculos;
		} catch (SQLException e){
			return null;
		} catch (NullPointerException a) {
			return null;
		}
	}
	
	public boolean apagarVeiculo(int id_veiculo) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("DELETE FROM `veiculo` WHERE id_veiculo ="+id_veiculo+";");
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
	
	public int idVeiculoAutoPeca() {
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet res = con.executeQuery("SELECT AUTO_INCREMENT FROM "
					+ "information_schema.tables WHERE"
					+ " table_name = 'veiculo' AND "
					+ "table_schema = 'auto_pecas';");
			res.next();
			int id = res.getInt(1);
			return id;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return -1;
		}
	}
	
}
