package model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Bruno Gressler da Silveira
 * @version 1
 * @since 24/04/2022
 */
public class Cliente {
    
    private long idCliente;
    private String nome;
    private int idade;
    private boolean email;
    private byte tipo;
    private String enviarEmail;
    private Date dataRegistro;
    private Time horaRegistro;

    public Cliente() {
    }

    public Cliente(long idCliente, String nome, int idade, boolean email, byte tipo, String enviarEmail, Date dataRegistro, Time horaRegistro) {
        this.idCliente = idCliente;
        this.nome = nome;
        this.idade = idade;
        this.email = email;
        this.tipo = tipo;
        this.enviarEmail = enviarEmail;
        this.dataRegistro = dataRegistro;
        this.horaRegistro = horaRegistro;
    }

    public byte getTipo() {
        return tipo;
    }

    public void setTipo(byte tipo) {
        this.tipo = tipo;
    }

    

    public long getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(long idCliente) {
        this.idCliente = idCliente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public boolean isEmail() {
        return email;
    }

    public void setEmail(boolean email) {
        this.email = email;
    }

    public String getEnviarEmail() {
        return enviarEmail;
    }

    public void setEnviarEmail(String enviarEmail) {
        this.enviarEmail = enviarEmail;
    }

    public Date getDataRegistro() {
        return dataRegistro;
    }

    public void setDataRegistro(Date dataRegistro) {
        this.dataRegistro = dataRegistro;
    }

    public Time getHoraRegistro() {
        return horaRegistro;
    }

    public void setHoraRegistro(Time horaRegistro) {
        this.horaRegistro = horaRegistro;
    }

    @Override
    public String toString() {
        return "Cliente{" + "idCliente=" + idCliente + ", nome=" + nome + ", idade=" + idade + ", email=" + email + ", tipo=" + tipo + ", enviarEmail=" + enviarEmail + ", dataRegistro=" + dataRegistro + ", horaRegistro=" + horaRegistro + '}';
    }
    
    
    
}
