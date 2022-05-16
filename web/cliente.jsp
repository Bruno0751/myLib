<%-- 
    Document   : cliente
    Created on : 21/04/2022, 13:01:54
    Author     : Bruno
--%>

<%@page import="dao.AuxDao"%>
<%@page import="model.AuxModel"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClienteDao"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Cliente> lista = ClienteDao.findClente();
    List<AuxModel> listaTpo = AuxDao.findAux();

%>
<!DOCTYPE html>
<html>
    
    <head>
        <script type="text/javascript" src="js/head.js"></script>
    </head>
    <body >
        <header>
        </header>

        <script type="text/javascript" src="js/menu.js"></script>
        <div class="centro" style="margin-bottom: 15px;">
            <button type="button" onClick="requisitar('insertCliente')" id="btnInserCliente" class="btn btn-primary">Cadastrar Cliente</button>
            <button type="button" onClick="requisitar('voltarCliente')" id="btnVoltarCliente" style="display: none;" class="btn btn-primary">Voltar</button>
        </div>
        <section>
            <h2 style="display: none;">Cliente</h2>

            <% if (!lista.isEmpty()) {%>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Idade</th>
                        <th scope="col">Email</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Data</th>
                        <th scope="col"s>Hora</th>
                    </tr>
                </thead>
                <%
                    for (int i = 0; i < lista.size(); i++) {
                %>

                <tbody>
                    <tr>
                        <td scope="row"><%= (lista.get(i).getIdCliente())%></td>
                        <td scope="row"><%= (lista.get(i).getNome())%></td>
                        <td scope="row"><%= (lista.get(i).getIdade())%></td>
                        <td scope="row"><%= (lista.get(i).getEnviarEmail())%></td>
                        <td scope="row"><%= (lista.get(i).getTipo())%></td>
                        <td scope="row"><%= (lista.get(i).getDataRegistro())%></td>
                        <td scope="row"><%= (lista.get(i).getHoraRegistro())%></td>
                    </tr>
                </tbody>
                <%
                    }
                %>
                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Idade</th>
                        <th>Email</th>
                        <th>Tipo</th>
                        <th>Data</th>
                        <th>Hora</th>
                    </tr>
                </tfoot>
            </table>
            <% } else { %>
            <h3 class="tbCliente" style="color: #1c3a29; font-size: 55px; text-align: center;">Não Há Cliente Cadastrado</h3>
            <% }%>
            <form id="formCliente" style="display: none;" class="centro" method="GET" action="adicionarCliente">

                <div class="input-group mb-3">
                    <span class="input-group-text" id="inputGroup-sizing-default">Nome:</span>
                    <input type="text" name="txtNome" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                </div>


                <div class="input-group mb-3">
                    <span class="input-group-text" id="inputGroup-sizing-default">Idade:</span>
                    <input type="number" name="numIdade" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                </div>

                <div style="margin-top: 11px;"><label>Deseja Receber Email?</label></div>
                <div>
                    Sim:<input type="radio" value="sim" name="email">
                    Não:<input type="radio" value="nao" name="email" checked>
                </div>

                <% if (!listaTpo.isEmpty()) { %>
                <div>
                    <select name="slTipo" class="form-select" aria-label="Default select example">
                        <option value="">Selecione...</option>
                        <%
                            for (int i = 0; i < listaTpo.size(); i++) {
                                if (listaTpo.get(i).isBlativo()) {
                        %>
                        <option value="<%= (listaTpo.get(i).getIdTipo())%>">
                            <%= (listaTpo.get(i).getDescricao().toUpperCase())%>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <% }%>

                <div>
                    <input type="submit" class="border border-primary rounded-pill" value="Enviar">
                    <input type="reset" class="border border-secondary rounded-pill" value="Limpar">
                </div>
            </form>
        </section>
        <footer>
        </footer>
        <script type="text/javascript" src="js/requests.js"></script>
    </body>
</html>
