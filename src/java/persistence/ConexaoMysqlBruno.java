package persistence;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Bruno Gressler da Silveira
 * @since 23/04/2022
 * @version 1
 */
public class ConexaoMysqlBruno {

    //private static final String DRIVE = "com.mysql.jdbc.Driver";
    private static final String DRIVEME = "com.mysql.cj.jdbc.Driver"; //8.0.22
    //private static final String URL = "jdbc:mysql://10.1.0.201:3306/test?useTimezone=true&serverTimezone=UTC";
    private static final String URLME = "jdbc:mysql://127.0.0.1:3306/servlet?useTimezone=true&serverTimezone=UTC";
    private static final String USERME = "root";
    private static final String PASSWORDME = "9320";

    public static Connection getConexao() throws SQLException, UnknownHostException {
        String ipDaMaquina = InetAddress.getLocalHost().getHostAddress();
        Connection connection = null;
        try {
            if (ipDaMaquina.contains("192.168.")) {
                Class.forName(DRIVEME);
                connection = DriverManager.getConnection(URLME, USERME, PASSWORDME);
                System.out.println("ConexaoMysqlBruno");
            }
        } catch (SQLException e) {
            if (ipDaMaquina.contains("192.168.")) {
                JOptionPane.showMessageDialog(null, "erro de conexão\n" + e.getMessage(), "ERRO", JOptionPane.ERROR_MESSAGE);
            }
            System.out.println("erro de conexão\n" + e.getMessage());
            System.exit(0);
        } finally {
            return connection;
        }
    }
}
