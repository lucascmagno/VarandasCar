package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.Personaliza;
import model.Veiculo;
import util.Conexao;

public class PersonalizaDAO {
	public boolean inserirPeca(Personaliza peca) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("INSERT INTO `personaliza` "
					+ "(`id_personaliza`, `fk_veiculo`, `peca`,"
					+ " `dimensoes`, `cor`, `observacao`,"
					+ " `data_peca`) VALUES (NULL, '"+peca.getFk_veiculo()+"'"
							+ ", '"+peca.getPeca()+"', '"+peca.getDimensoes()+"'"
									+ ", '"+peca.getCor()+"', '"+peca.getObservacao()+"', '"+peca.getData_peca()+"');");
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
	
	public boolean editarPeca(Personaliza peca) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("UPDATE `personaliza` SET "
					+ " `peca` = '"+peca.getPeca()+"',"
					+ " `dimensoes`="+peca.getDimensoes()+", "
					+ "`cor`='"+peca.getCor()+"',"
					+ "`observacao`='"+peca.getObservacao()+"',"
					+ "`data_peca`='"+peca.getData_peca()+"' WHERE `id_personaliza` = "+peca.getId_personaliza()+";");
			return true;
		} catch (SQLException e) {
			return false;
		}
	} 
	
	public Personaliza pecaVeiculo(int fk_veiculo){
	    Conexao con = null;
	    try {
	        con = new Conexao();
	        ResultSet res = con.executeQuery("SELECT * FROM `personaliza` WHERE fk_veiculo = "+fk_veiculo+";");
	        Personaliza nova = new Personaliza();
	        res.next();
	        nova.setId_personaliza(res.getInt(1));
	        nova.setFk_veiculo(res.getInt(2));
	        nova.setPeca(res.getString(3));
	        nova.setDimensoes(res.getString(4));
	        nova.setCor(res.getString(5));
	        nova.setObservacao(res.getString(6));
	        nova.setData_peca(res.getString(7));
	        return nova;
	    } catch (SQLException e){
	        return null;
	    } catch (NullPointerException a) {
	        return null;
	    }
	}

	
	public Personaliza pecaPorVeiculo(int id_veiculo) {
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet resA = con.executeQuery("SELECT * FROM `personaliza` WHERE `id_veiculo`="+id_veiculo);
			
			resA.next();
			
			Personaliza p = new Personaliza();
			
			p.setId_personaliza(resA.getInt(1));
			p.setFk_veiculo(resA.getInt(2));
			p.setPeca(resA.getString(3));
			p.setDimensoes(resA.getString(4));
			p.setCor(resA.getString(5));
			p.setObservacao(resA.getString(6));
			p.setData_peca(resA.getString(7));
			
			return p;
			}catch (SQLException e) {
				return null;
			}
	}
	
	public boolean apagarPeca(int id_personaliza) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("DELETE FROM `personaliza` WHERE id_personaliza = "+id_personaliza+";");
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
}
