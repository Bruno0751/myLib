function requisitar(valor) {
    if (valor === "prj") {
        window.location.href = valor;
    }
    if (valor === "msc") {
        window.location.href = valor;
    }
    if (valor === "minhasMusicas") {
        window.location.href = valor;
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