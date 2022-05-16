function carregarPagina (valor) {
    if (valor === "bootstrap") {
        alert(valor);
    } else {
        alert(valor);
    }
}

var bootstrap = "<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3' crossorigin='anonymous'>";
var jsBotstrap = "<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js' integrity='sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2' crossorigin='anonymous'></script>";
var cssExt = "<link rel='stylesheet' type='text/css' href='style/estilos.css'>";
var cssInc = "<style>\n\
                body {\n\
                    background-color: #ffffff;\n\
                }\n\
            </style>";
bootstrap = "";
jsBotstrap = "";
//cssExt = "";
//cssInc = "";



var head = "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>\n\
            <title>My Lib</title>\n\
            <meta name='author' content='Bruno Gressler da Silveira'>\n\
            <meta name='viewport' content='width=device-width, initial-scale=1'>\n\
            " + bootstrap + "\n\
            " + jsBotstrap + "\n\
            " + cssExt + "\n\
            " + cssInc + "\n\
            <script src=js/jquery.js></script>\n\
            <script src=js/jqueryToast.js></script>";

document.write(head);