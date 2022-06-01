<%-- 
    Document   : cliente
    Created on : 21/04/2022, 13:01:54
    Author     : Bruno
--%>

<%@page import="java.net.InetAddress"%>
<%@page import="dao.AuxDao"%>
<%@page import="model.AuxModel"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClienteDao"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ipDaMaquina = InetAddress.getLocalHost().getHostAddress();
    boolean casa = false;
    List<Cliente> lista = null;
    List<AuxModel> listaTpo = null;
    if (ipDaMaquina.contains("192.168.")) {
        lista = ClienteDao.findClente();
        listaTpo = AuxDao.findAux();
        casa = true;
    }

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
            <button type="button" onClick="requisitar('insertCliente')" id="btnInserCliente" class="btn btn-primary">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
                </svg>
                Cadastrar Cliente
            </button>
            <button type="button" onClick="requisitar('voltarCliente')" id="btnVoltarCliente" style="display: none;" class="btn btn-primary">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-all-fill" viewBox="0 0 16 16">
                <path d="M8.021 11.9 3.453 8.62a.719.719 0 0 1 0-1.238L8.021 4.1a.716.716 0 0 1 1.079.619V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"/>
                <path d="M5.232 4.293a.5.5 0 0 1-.106.7L1.114 7.945a.5.5 0 0 1-.042.028.147.147 0 0 0 0 .252.503.503 0 0 1 .042.028l4.012 2.954a.5.5 0 1 1-.593.805L.539 9.073a1.147 1.147 0 0 1 0-1.946l3.994-2.94a.5.5 0 0 1 .699.106z"/>
                </svg>
                Voltar
            </button>
        </div>
        <section>
            <h2 style="display: none;">Cliente</h2>

            <% if (casa) { %>
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
            <% }%>
        </section>
        <script type="text/javascript" src="js/footer.js"></script>
        <script type="text/javascript" src="js/requests.js"></script>
    </body>
</html>
