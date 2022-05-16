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
    boolean casa = false, autorizado = false;
    String ipDaMaquina = InetAddress.getLocalHost().getHostAddress();
    String nomeDaMaquina = InetAddress.getLocalHost().getHostName();
    if (ipDaMaquina.contains("192.168.")) {
        casa = true;
    }
    System.out.println("acesso - " + acesso);
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <script type="text/javascript" src="js/head.js"></script>
    </head>
    <body>
        <header>
            <% if (autorizado) {%>
            <button type="button" class="btn btn-link">Senhas</button>
            <% } %>

            <button type="button" onClick="carregarPagina('bootstrap')" class="btn btn-link">Bootstrap</button>
        </header>

        <script type="text/javascript" src="js/menu.js"></script>
        <hr>
        <section>
            <h2 style="display: none;">Index</h2>

            <nav class="navbar navbar-expand-lg bg-light">
                <div class="container-fluid">
                    <div class='collapse navbar-collapse' id='navbarSupportedContent'>
                        <ul class='navbar-nav me-auto mb-2 mb-lg-0'>
                            <li class='nav-item'>
                                <a class="nav-link active" aria-current="page" href="index.jsp?acesso=bruno">BRUNO</a>
                            </li>
                            <li class='nav-item'>
                                <a class='nav-link active' aria-current='page' href="index.jsp?acesso=william">WILLIAN</a>
                            </li>
                            <li class='nav-item'>
                                <a class='nav-link active' aria-current='page' href="index.jsp?acesso=fernanda">FERNANDA</a>
                            </li>
                            <li class='nav-item'>
                                <a class='nav-link active' aria-current='page' href="index.jsp?acesso=paulo">PAULO</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <% if (acesso != null) { %>
            <div><button type="button" class="btn btn-outline-primary" onClick="requisitar('sair')">SAIR</button></div>
            <% } %>
            <hr>

            <% if (casa) {%>
            <!--<div class="centro">-->
            <div>
                <button type="button" class="btn btn-outline-primary" onClick="requisitar('prj')">PRJ</button>
                <button type="button" class="btn btn-outline-secondary" onClick="requisitar('msc')">MSC</button>
                <button type="button" class="btn btn-outline-primary" onClick="requisitar('minhasMusicas')">Minhas</button>
            </div>
            <!--</div>-->
            <% }%>
            <hr>

            <% if (casa) {%>
            <div class="centro">
                <a href="https://www.starplus.com/pt-br/home" target="_blank">
                    <img src="images/starPlus.png" style="clear: both;" class="rounded mx-auto d-block"alt="STAR PLUS" title="STAR PLUS" width="10%" height="100px;">
                </a>
                <a href="https://play.hbomax.com/" target="_blank">
                    <img src="images/hboMax.jpg" class="rounded mx-auto d-block" alt="HBO MAX" title="HBO MAX" width="10%" height="100px;">
                </a>
                <a href="https://www.youtube.com/" target="_blank">
                    <img src="images/youtube.png" alt="YOUTUBE" title="YOUTUBE" class="rounded mx-auto d-block" width="10%" height="100px;">
                </a>
                <a href="https://www.disneyplus.com" target="_blank">
                    <img src="images/disneyPlus.png" alt="DISNEY" title="DISNEY" class="rounded mx-auto d-block" width="10%" height="100px;">
                </a>
                <a href="https://www.primevideo.com/?ref_=dvm_pds_amz_br_dc_s_g_mkw_s2Hv03IvM-dc_pcrid_524308839345&mrntrk=slid__pgrid_62046161446_pgeo_1001686_x__ptid_kwd-296527732991" target="_blank">
                    <img src="images/primeVideo.png" alt="PRIME VIDEO" title="PRIME VIDEO" class="rounded mx-auto d-block" width="10%" height="100px;">
                </a>
                <a href="https://www.cinemark.com.br/filme/doutor-estranho-no-multiverso-da-loucura?utm_source=search&utm_medium=ga&utm_campaign=doutor_estranho2&utm_id=vzz_28149https://www.cinemark.com.br/filme/doutor-estranho-no-multiverso-da-loucura?utm_source=search&utm_medium=ga&utm_campaign=doutor_estranho2&utm_id=vzz_281491854759516&utm_term=trf1854759516&utm_term=trf&gclid=Cj0KCQjwsdiTBhD5ARIsAIpW8CJaFe586WI06ws5IP7OW9pz9xWptOr3-JgqfJqYQN2DAsnxRkYtunAaAuNGEALw_wcB" target="_blank">
                    <img src="images/cinemark.png" alt="CINEMARK" title="CINEMARK" class="rounded mx-auto d-block" width="10%" height="100px;">
                </a>
                <ul>
                    <li>
                        <a href="https://web.whatsapp.com/" target="_blank">
                            WHATS
                        </a>
                    </li>
                    <li>
                        <a href="hhttps://ead.qi.edu.br/login/index.php" target="_blank">
                            MOODLE
                        </a>
                    </li>
                </ul>
            </div>
            <%}%>

            <div class="centro">
                <label>Acessos</label>
                <button data-tooltip="Acessos"> ? </button>
                <button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-html="true" title="<em>Tooltip</em> <u>with</u> <b>HTML</b>">
                    Tooltip with HTML
                </button>


            </div>

        </section>
        <footer>
        </footer>
        <script type="text/javascript" src="js/requests.js"></script>
    </body>
</html>
