var url = window.location.href;
var objURL = new URL(url); 
var acesso = objURL.searchParams.get("acesso");
var bootstrap = "<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3' crossorigin='anonymous'>";
var jsBotstrap = "<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js' integrity='sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2' crossorigin='anonymous'></script>";
var cssExt = "<link rel='stylesheet' type='text/css' href='style/estilos.css'>";
var wave = "<link rel='stylesheet type='text/css href='style/wave-css.css'>";
var cssInc = "<style>\n\
                body {\n\
                    background-color: #d1d1d1;\n\
                    text-align: center;\n\
                    padding: 0 0;\n\
                }\n\
            </style>";
//bootstrap = "";
//jsBotstrap = "";
cssExt = "";
//cssInc = "";
//wave = "";
var head = "<meta http-equiv = 'Content-Type' content='text/html; charset=UTF-8'>\n\
            <title>My Lib</title>\n\
            <meta http-equiv='cache-control' content='no-cache'>\n\
            <meta http-equiv='pragma' content='no-cache'>\n\
            <meta http-equiv='content-language' content='pt-br, en-US, fr'>\n\
            <meta http-equiv='expires' content = '0'>\n\
            <meta name='author' content='Bruno Gressler da Silveira'>\n\
            <meta name='viewport' content='width=device-width, initial-scale=1'>\n\
            <meta name='description' content='Ao escrever uma meta tag, use entre 140 e 160 caracteres para que o Google possa exibir toda a sua mensagem. Não se esqueça de incluir sua palavra-chave!'>\n\
            <meta name='copyright' content='© 2021 Bruno Silveira'>\n\
            <meta name='robots' content='index, follow'>\n\
            " + bootstrap + "\n\
            " + jsBotstrap + "\
            " + wave + "\n\
            " + cssExt + "\n\
            " + cssInc + "\n\
            <script src='js/jquery.js'></script>\n\
            <script src='js/jqueryToast.js'></script>";
function carregarPagina () {
    if (acesso !== null) {
        if (acesso === "bruno") {
            alert(acesso);
        }
    }
}
function validar () {
    let nome = document.getElementsByName("txtNome")[0];
    let idade = document.getElementsByName("numIdade")[0];
//    let email = document.getElementsByName("email")[0].value;
    let tipo = document.getElementsByName("slTipo")[0];
    if (nome.value === "" && idade.value === "" && tipo.value === "") {
        alert("PREENCHA OS CAMPOS");
        nome.focus();
    } else if (nome.value === "") {
        alert("PREENCHA O CAMPO NOME");
        nome.focus();
    } else if (idade.value === "") {
        alert("PREENCHA O CAMPO IDADE");
        idade.focus();
    } else if (tipo.value === "") {
        alert("ESCOLHA UM TIPO DE CONTA");
        tipo.focus();
    }
}
function requisitar(valor) {
    if (valor === "prj") {
        window.location.href = valor;
    }
    if (valor === "msc") {
        window.location.href = valor;
    }
    if (valor === "web") {
        window.location.href = valor;
    }
    if (valor === "minhasMusicas") {
        window.location.href = valor;
    }
    if (valor === "money") {
        window.location.href = valor;
    }
    if (valor === "alterar") {
        alert(valor);
    }
    if (valor === "insertCliente") {
        let btnInserCliente = document.querySelector("button#btnInserCliente");
        let btnVoltarCliente = document.querySelector("button#btnVoltarCliente");
        let tbCliente = document.querySelector(".table");
        let formCliente = document.querySelector("form#formCliente");

        btnInserCliente.setAttribute("style", "display: none;");
        btnVoltarCliente.removeAttribute("style", "display");
        tbCliente.setAttribute("style", "display: none;");
        formCliente.setAttribute("style", "display: block;");
    }
    if (valor === "voltarCliente") {
         window.location.href = "cliente.jsp";
    }
    if (valor === "sair") {
        let link = window.location;
        link.href = "index.jsp";
    }
}
document.write(head);