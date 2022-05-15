var bootstrap = "<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3' crossorigin='anonymous'>";
var css = "<link rel='stylesheet' type='text/css' href='style/estilos.css'>";
var title = "<title>My Lib</title>";
//bootstrap = "";
css = "";



var head = "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>\n\
            " + title + "\n\
            <meta name='author' content='Bruno Gressler da Silveira'>\n\
            " + bootstrap + "\n\
            " + css + "\n\
            <script src=js/jquery.js></script>\n\
            <script src=js/jqueryToast.js></script>";

document.write(head);