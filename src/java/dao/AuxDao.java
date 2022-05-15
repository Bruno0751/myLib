package dao;

import java.sql.Connection;
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
    
    public static List<AuxModel> findAux () throws SQLException, Exception {
        ResultSet rs = null;
        Statement st = null;
        List<AuxModel> lista = null;
        Connection conexaoMysqlBruno = null;
        try {
            conexaoMysqlBruno = ConexaoMysqlBruno.getConexao();
            lista = new ArrayList<>();
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
        } catch (Exception e) {
            String erro = "ERRO AO BUSCAR CLIENTE";
            System.out.println(erro);
            JOptionPane.showMessageDialog(null, erro, "ERRO", JOptionPane.ERROR_MESSAGE);
            e.printStackTrace();
            throw new Exception(erro);
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
}
