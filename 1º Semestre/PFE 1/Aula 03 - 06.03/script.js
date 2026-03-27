document.addEventListener("DOMContentLoaded", function(){

const modalFilme = document.getElementById("modal");

let filmes = JSON.parse(localStorage.getItem("filmes")) || [];
let indiceEditando = null;

renderizarTabela();

function salvarDadosLocalmente(){
    localStorage.setItem("filmes", JSON.stringify(filmes));
}

function abrirModal(){
    modalFilme.style.display = "block";
}

function fecharModal(){
    modalFilme.style.display = "none";
}

function salvarFilme(){

    const obj = {
        capa: document.getElementById("capa").value,
        nome: document.getElementById("nome").value,
        genero: document.getElementById("genero").value,
        ano: document.getElementById("ano").value,
        classificacao: document.getElementById("classificacao").value,
        produtora: document.getElementById("produtora").value
    }

    if(indiceEditando !== null){
        filmes[indiceEditando] = obj;
        indiceEditando = null;
    }else{
        filmes.push(obj);
    }

    salvarDadosLocalmente();
    renderizarTabela();
    fecharModal();

    document.getElementById("capa").value = "";
    document.getElementById("nome").value = "";
    document.getElementById("genero").value = "";
    document.getElementById("ano").value = "";
    document.getElementById("classificacao").value = "";
    document.getElementById("produtora").value = "";
}

function renderizarTabela(lista = filmes){
    const dados = document.getElementById("listaFilmes");
    dados.innerHTML = "";

    lista.forEach((f, i) => {
        dados.innerHTML += `
        <tr>
            <td><img src="${f.capa}" width="60"></td>
            <td>${f.nome}</td>
            <td>${f.genero}</td>
            <td>${f.ano}</td>
            <td>${f.classificacao}</td>
            <td>${f.produtora}</td>
            <td>
                <button onclick="editar(${i})">Editar</button>
                <button onclick="excluir(${i})">Excluir</button>
            </td>
        </tr>
        `;
    });
}

function excluir(indice){
    filmes.splice(indice, 1);
    salvarDadosLocalmente();
    renderizarTabela();
}

function editar(indice){

    const filme = filmes[indice];

    document.getElementById("capa").value = filme.capa;
    document.getElementById("nome").value = filme.nome;
    document.getElementById("genero").value = filme.genero;
    document.getElementById("ano").value = filme.ano;
    document.getElementById("classificacao").value = filme.classificacao;
    document.getElementById("produtora").value = filme.produtora;

    indiceEditando = indice;

    abrirModal();
}

function filtrarGenero(){

    const generoSelecionado = document.getElementById("filtroGenero").value;

    if(generoSelecionado === "todos"){
        renderizarTabela();
        return;
    }

    const filtrados = filmes.filter(f => f.genero === generoSelecionado);
    renderizarTabela(filtrados);
}

window.abrirModal = abrirModal;
window.fecharModal = fecharModal;
window.salvarFilme = salvarFilme;
window.excluir = excluir;
window.editar = editar;
window.filtrarGenero = filtrarGenero;

});