<%-- 
    Document   : cadAux
    Created on : 24/04/2022, 14:55:38
    Author     : Bruno
--%>

<%@page import="dao.AuxDao"%>
<%@page import="model.AuxModel"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<AuxModel> lista = AuxDao.findAux();
%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="js/head.js"></script>
    </head>
    <body>
        <header>
        </header>

        <script type="text/javascript" src="js/menu.js"></script>

        <section>
            <h2 style="display: none;">Auxiliar</h2>

            <!--            <button type="button" onClick="requisitar('insertCliente')" id="btnInserCliente">Cadastrar Cliente</button>
                        <button type="button" onClick="requisitar('voltarCliente')" id="btnVoltarCliente" style="display: none;">Voltar</button>-->

            <% if (!lista.isEmpty()) {%>
            <table class="centro tbAux">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Descrição</th>
                        <th>Ativo</th>
                        <th>Data</th>
                        <th>Hora</th>
                    </tr>
                </thead>
                <%
                    for (int i = 0; i < lista.size(); i++) {
                %>

                <tbody>
                    <tr>
                        <td><%= (lista.get(i).getIdTipo())%></td>
                        <td><%= (lista.get(i).getDescricao())%></td>
                        <td><%= (lista.get(i).getAtivo())%></td>
                        <td><%= (lista.get(i).getDataRegistro())%></td>
                        <td><%= (lista.get(i).getHoraRegistro())%></td>
                    </tr>
                </tbody>
                <%
                    }
                %>
                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Descrição</th>
                        <th>Ativo</th>
                        <th>Data</th>
                        <th>Hora</th>
                    </tr>
                </tfoot>
            </table>
            <% } else { %>
            <h3 class="tbCliente" style="color: #1c3a29; font-size: 55px; text-align: center;">Não Há Cliente Cadastrado</h3>
            <% }%>
            <!--            <form id="formCliente" style="display: none;" class="centro">
                            <label>Nome:</label>
                            <input type="text" name="txtNome" placeholder="Nome" id="nomeCliente">
                            <div>
                                <label>Idade:</label>
                                <input type="number" name="numIdade" placeholder="Idade" id="idadeCliente">
                            </div>
                        </form>-->
        </section>
        <footer>
        </footer>
        <!--<script type="text/javascript" src="js/requests.js"></script>-->
    </body>
</html>
