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
import model.Cliente;
import persistence.ConexaoMysqlBruno;
// TESTE UTIL
//import persistence.ConexaoMysql;

/**
 *
 * @author Bruno Gressler da Silveira
 * @version 1
 * @since 24/04/2022
 */
public class ClienteDao {

    private static final String FINDCLIENTE = "SELECT * FROM servlet.cliente_servlet";

    public static List<Cliente> findClente(String ipDaMaquina) throws SQLException, UnknownHostException {
        ResultSet rs = null;
        Statement st = null;
        List<Cliente> lista = null;
        Connection conexaoMysql = null;
        lista = new ArrayList<>();
        try {
            if (ipDaMaquina.contains("192.168.")) {
                conexaoMysql = ConexaoMysqlBruno.getConexao();
//                conexaoMysql = ConexaoMysql.conectar();
            } else if (ipDaMaquina.equals("10.1.0.255")) {
            }
            st = conexaoMysql.createStatement();
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
        } catch (SQLException e) {
            if (ipDaMaquina.contains("192.168.")) {
                JOptionPane.showMessageDialog(null, "ERRO AO BUSCAR CLIENTE", "ERRO", JOptionPane.ERROR_MESSAGE);
            }
            System.out.println("ERRO AO BUSCAR CLIENTE");
        } finally {
            if (conexaoMysql != null) {
                conexaoMysql.close();
            }
            st.close();
            rs.close();
        }
        return lista;
    }

    public static void insertCliente(Cliente obj, String ipDaMaquina) throws SQLException, UnknownHostException {
        PreparedStatement pst = null;
        Connection conexaoMysql = null;
        try {
            if (ipDaMaquina.contains("192.168.")) {
                conexaoMysql = ConexaoMysqlBruno.getConexao();
                pst = conexaoMysql.prepareStatement("INSERT INTO servlet.cliente_servlet VALUES(NULL, ?, ?, ?, ?, NOW(), NOW());");
            } else if (ipDaMaquina.equals("10.1.0.255")) {
            }
            pst.setString(1, obj.getNome());
            pst.setInt(2, obj.getIdade());
            pst.setBoolean(3, obj.isEmail());
            pst.setByte(4, obj.getTipo());
            pst.executeUpdate();

        } catch (SQLException e) {
            if (ipDaMaquina.contains("192.168.")) {
                JOptionPane.showMessageDialog(null, "ERRO AO INSERIR CLIENTE", "ERRO", JOptionPane.ERROR_MESSAGE);
            }
            System.out.println("ERRO AO INSERIR CLIENTE");
        } finally {
            if (conexaoMysql != null) {
                conexaoMysql.close();
            }
            pst.close();
        }
    }
}
