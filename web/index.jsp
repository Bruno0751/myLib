<%-- 
    Document   : index
    Created on : 20/04/2022, 21:37:31
    Author     : Bruno Gressler da Silveira
--%>

<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String acesso = "";
    acesso = request.getParameter("acesso");
    boolean casa = false, autorizado = false, empresa = false;
    String ipDaMaquina = InetAddress.getLocalHost().getHostAddress();
//    ipDaMaquina = "10.1.0.255";
//    String nomeDaMaquina = InetAddress.getLocalHost().getHostName();
    if (ipDaMaquina.contains("192.168.")) {
        casa = true;
    } else if (ipDaMaquina.equals("10.1.0.255")) {
        empresa = true;
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <script type="text/javascript" src="js/head.js"></script>
    </head>
    <body onload="carregarPagina()">
        <header>
            <% if (autorizado) {%>
            <button type="button" class="btn btn-link">Senhas</button>
            <% } %>


        </header>

        <script type="text/javascript" src="js/menu.js"></script>
        <button type="button" onClick="carregarPagina('vazio')" class="btn btn-link">Bootstrap</button>

        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <div class='collapse navbar-collapse' id='navbarSupportedContent'>
                    <ul class='navbar-nav me-auto mb-2 mb-lg-0'>
                        <li class='nav-item'>
                            <a class="nav-link active" aria-current="page" href="index.jsp?acesso=bruno">Bruno</a>
                        </li>
                        <li class='nav-item'>
                            <a class='nav-link active' aria-current='page' href="index.jsp?acesso=william">Willian</a>
                        </li>
                        <li class='nav-item'>
                            <a class='nav-link active' aria-current='page' href="index.jsp?acesso=fernanda">Fernanda</a>
                        </li>
                        <li class='nav-item'>
                            <a class='nav-link active' aria-current='page' href="index.jsp?acesso=paulo">Paulo</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <section>
            <h2 style="display: none;">Index</h2>


            <% if (acesso != null) { %>
            <div><button type="button" class="btn btn-outline-primary" onClick="requisitar('sair')">SAIR</button></div>
            <% } %>

            <button type="button" class="btn btn-outline-primary" onClick="requisitar('prj')">Projeto</button>
            <% if (casa) {%>
            <button type="button" class="btn btn-outline-secondary" onClick="requisitar('msc')">Musicas</button>
            <button type="button" class="btn btn-outline-primary" onClick="requisitar('minhasMusicas')">Minhas</button>
            <button type="button" class="btn btn-outline-secondary" onClick="requisitar('money')">Money</button>
            <button type="button" class="btn btn-outline-primary" onClick="requisitar('web')">Web</button>
            <% }%>

            <% if (casa) {%>
            <div class="grid">
                <a href="https://www.starplus.com/pt-br/home" target="_blank">
                    <img src="images/starPlus.png" style="clear: both;" class="g-col-2"alt="STAR PLUS" title="STAR PLUS" width="10%" height="100px;">
                </a>
                <a href="https://play.hbomax.com/" target="_blank">
                    <img src="images/hboMax.jpg" class="g-col-2" alt="HBO MAX" title="HBO MAX" width="10%" height="100px;">
                </a>
                <a href="https://www.youtube.com/" target="_blank">
                    <img src="images/youtube.png" alt="YOUTUBE" title="YOUTUBE" class="g-col-2" width="10%" height="100px;">
                </a>
                <a href="https://www.disneyplus.com" target="_blank">
                    <img src="images/disneyPlus.png" alt="DISNEY" title="DISNEY" class="g-col-2k" width="10%" height="100px;">
                </a>
                <a href="https://www.primevideo.com/?ref_=dvm_pds_amz_br_dc_s_g_mkw_s2Hv03IvM-dc_pcrid_524308839345&mrntrk=slid__pgrid_62046161446_pgeo_1001686_x__ptid_kwd-296527732991" target="_blank">
                    <img src="images/primeVideo.png" alt="PRIME VIDEO" title="PRIME VIDEO" class="g-col-2" width="10%" height="100px;">
                </a>
                <a href="https://www.cinemark.com.br/filme/doutor-estranho-no-multiverso-da-loucura?utm_source=search&utm_medium=ga&utm_campaign=doutor_estranho2&utm_id=vzz_28149https://www.cinemark.com.br/filme/doutor-estranho-no-multiverso-da-loucura?utm_source=search&utm_medium=ga&utm_campaign=doutor_estranho2&utm_id=vzz_281491854759516&utm_term=trf1854759516&utm_term=trf&gclid=Cj0KCQjwsdiTBhD5ARIsAIpW8CJaFe586WI06ws5IP7OW9pz9xWptOr3-JgqfJqYQN2DAsnxRkYtunAaAuNGEALw_wcB" target="_blank">
                    <img src="images/cinemark.png" alt="CINEMARK" title="CINEMARK" class="g-col-2" width="10%" height="100px;">
                </a>
                <a href="https://github.com/" target="_blank">
                    <img src="images/gitHub.png" alt="GIT HUB" title="GIT HUB" class="g-col-2" width="10%" height="100px;">
                </a>
            </div>           
            <%}%>

            <% if (empresa) {%>
            <div class="grid">
                <a href="https://github.com/" target="_blank">
                    <img src="images/gitHub.png" alt="GIT HUB" title="GIT HUB" class="g-col-2" width="10%" height="100px;">
                </a>
            </div>
            <%}%>
            
            <div class="grid">
                <a href="https://portalinvestidor.tesourodireto.com.br/" target="_blank">
                    <img src="images/tesoroDireto.png" style="clear: both;" class="g-col-2"alt="TESORO DIRETO" title="TESORO DIRETO" width="10%" height="100px;">
                </a>
                <a href="https://www.nuinvest.com.br/" target="_blank">
                    <img src="images/nuInvest.png" style="clear: both;" class="g-col-2"alt="NU INVET" title="NU INVET" width="10%" height="100px;">
                </a>
                <a href="https://www.rico.com.vc/login/" target="_blank">
                    <img src="images/rico.png" style="clear: both;" class="g-col-2"alt="RICO" title="RICO" width="10%" height="100px;">
                </a>
            </div>

        </section>
        <script type="text/javascript" src="js/footer.js"></script>
    </body>
</html>
