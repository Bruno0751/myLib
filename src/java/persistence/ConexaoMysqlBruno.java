package persistence;

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
    private static final String DRIVE = "com.mysql.cj.jdbc.Driver"; //8.0.22
    
    //private static final String URL = "jdbc:mysql://10.1.0.201:3306/test?useTimezone=true&serverTimezone=UTC";
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/servlet?useTimezone=true&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "9320";
    
    public static Connection getConexao() throws SQLException {
        Connection connection = null;
        try {
            Class.forName(DRIVE);
            //String URL = "jdbc:mysql://localhost:3306/quitanda?useTimezone=true&serverTimezone=UTC&user=root&password=9320";
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("ConexaoMysqlBruno");
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "erro de conexão\n" + e.getMessage(), "ERRO", JOptionPane.ERROR_MESSAGE);
            e.printStackTrace();
            System.exit(0);
        } finally {
            return connection;
        }
    }
}
