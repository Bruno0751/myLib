package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import model.Cliente;
import persistence.ConexaoMysqlBruno;

/**
 *
 * @author Bruno Gressler da Silveira
 * @version 1
 * @since 24/04/2022
 */
public class ClienteDao {

    private static final String FINDCLIENTE = "SELECT * FROM servlet.cliente_servlet";

    public static List<Cliente> findClente() throws SQLException, Exception {
        ResultSet rs = null;
        Statement st = null;
        List<Cliente> lista = null;
        Connection conexaoMysqlBruno = null;
        try {
            conexaoMysqlBruno = ConexaoMysqlBruno.getConexao();
            lista = new ArrayList<>();
            st = conexaoMysqlBruno.createStatement();
            rs = st.executeQuery(FINDCLIENTE);
            while (rs.next()) {
                Cliente obj = new Cliente();
                obj.setIdCliente(rs.getLong("id_cliente"));
                obj.setNome(rs.getString("nome"));
                obj.setIdade(rs.getInt("idade"));
                obj.setEmail(rs.getBoolean("enviar_email"));
                if (obj.isEmail()) {
                    obj.setEnviarEmail("SIM");
                } else {
                    obj.setEnviarEmail("NÃO");
                }
                obj.setTipo(rs.getByte("tipo"));
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
            }
            st.close();
            rs.close();
        }
        return lista;
    }

    public static void insertCliente(Cliente obj) throws SQLException, Exception {
        PreparedStatement pst = null;
        Connection conexaoMysqlBruno = null;
        try {
            conexaoMysqlBruno = ConexaoMysqlBruno.getConexao();
            
            pst = conexaoMysqlBruno.prepareStatement("INSERT INTO servlet.cliente_servlet VALUES(NULL, ?, ?, ?, ?, NOW(), NOW());");
            pst.setString(1, obj.getNome());
            pst.setInt(2, obj.getIdade());
            pst.setBoolean(3, obj.isEmail());
            pst.setByte(4, obj.getTipo());
            pst.executeUpdate();
            
        } catch (Exception e) {
            String erro = "ERRO AO INSERIR CLIENTE";
            System.out.println(erro);
            JOptionPane.showMessageDialog(null, erro, "ERRO", JOptionPane.ERROR_MESSAGE);
            e.printStackTrace();
            throw new Exception(erro);
        } finally {
            if (conexaoMysqlBruno != null) {
                conexaoMysqlBruno.close();
            }
            pst.close();
        }
    }
}
