package dao;

import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import model.AuxModel;
import persistence.ConexaoMysqlBruno;

/**
 *
 * @author Bruno Gressler da Silveira
 * @version 1
 * @since 24/04/2022
 */
public class AuxDao {

    private static final String FINDAUX = "SELECT * FROM servlet.tipo_servlet";

    public static List<AuxModel> findAux(String ipDaMaquina) throws SQLException, UnknownHostException {
        ResultSet rs = null;
        Statement st = null;
        List<AuxModel> lista = null;
        Connection conexaoMysqlBruno = null;
        lista = new ArrayList<>();
        try {
            if (ipDaMaquina.contains("192.168.")) {
                conexaoMysqlBruno = ConexaoMysqlBruno.getConexao();
            } else if (ipDaMaquina.equals("10.1.0.255")) {
            }
            st = conexaoMysqlBruno.createStatement();
            rs = st.executeQuery(FINDAUX);
            while (rs.next()) {
                AuxModel obj = new AuxModel();
                obj.setIdTipo(rs.getLong("id_tipo"));
                obj.setDescricao(rs.getString("descricao"));
                obj.setBlativo(rs.getBoolean("bl_ativo"));
                if (obj.isBlativo()) {
                    obj.setAtivo("SIM");
                } else {
                    obj.setAtivo("NÃO");
                }
                obj.setDataRegistro(rs.getDate("data_registro"));
                obj.setHoraRegistro(rs.getTime("hora_registro"));
                lista.add(obj);
            }
        } catch (SQLException e) {
            if (ipDaMaquina.contains("192.168.")) {
                JOptionPane.showMessageDialog(null, "ERRO AO BUSCAR CLIENTE", "ERRO", JOptionPane.ERROR_MESSAGE);
            }
            System.out.println("ERRO AO BUSCAR CLIENTE");
        } finally {
            if (conexaoMysqlBruno != null) {
                conexaoMysqlBruno.close();
                System.out.println("fechouConexaoMysqlBruno");
            }
            st.close();
            rs.close();
        }
        return lista;
    }
    
    public static void ativarOUInativarAux(String ipDaMaquina) throws SQLException, UnknownHostException {
        PreparedStatement pst = null;
        Connection conexaoMysqlBruno = null;
        try {
            if (ipDaMaquina.contains("192.168.")) {
                conexaoMysqlBruno = ConexaoMysqlBruno.getConexao();
            } else if (ipDaMaquina.equals("10.1.0.255")) {
            }
            pst = conexaoMysqlBruno.prepareStatement("UPDATE servlet.tipo_servlet SET = ? WHERE id_tipo = ?;");
        } catch (SQLException e) {
            if (ipDaMaquina.contains("192.168.")) {
                JOptionPane.showMessageDialog(null, "ERRO AO BUSCAR CLIENTE", "ERRO", JOptionPane.ERROR_MESSAGE);
            }
            System.out.println("ERRO AO BUSCAR CLIENTE");
        } finally {
            if (conexaoMysqlBruno != null) {
                conexaoMysqlBruno.close();
                System.out.println("fechouConexaoMysqlBruno");
            }
            pst.close();
        }
    }
}
