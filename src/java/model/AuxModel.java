package model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Bruno Gressler da Silveira
 * @version 1
 * @since 24/04/2022
 */
public class AuxModel {
    
    private long idTipo;
    private String descricao;
    private boolean blativo;
    private String ativo;
    private Date dataRegistro;
    private Time horaRegistro;

    public AuxModel() {
    }

    public AuxModel(long idTipo, String descricao, boolean blativo, String ativo, Date dataRegistro, Time horaRegistro) {
        this.idTipo = idTipo;
        this.descricao = descricao;
        this.blativo = blativo;
        this.ativo = ativo;
        this.dataRegistro = dataRegistro;
        this.horaRegistro = horaRegistro;
    }

    public long getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(long idTipo) {
        this.idTipo = idTipo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public boolean isBlativo() {
        return blativo;
    }

    public void setBlativo(boolean blativo) {
        this.blativo = blativo;
    }

    public String getAtivo() {
        return ativo;
    }

    public void setAtivo(String ativo) {
        this.ativo = ativo;
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

    
    
    
    
}
