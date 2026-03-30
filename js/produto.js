const modal = document.getElementById('modalProduto')
modal.addEventListener('show.bs.modal', () => {
    console.log('ola')
})

const modalDetalhes = document.getElementById('modalDetalhesProduto')
modalDetalhes.addEventListener('show.bs.modal', () => {
    console.log('ola')
})

const modalEditar = document.getElementById('modalEditarProduto')
modalEditar.addEventListener('show.bs.modal', () => {
    console.log('oii')
})

function fnListarProdutos() {
    fetch(`http://localhost:3000/produtos`, { method: "GET" })
        .then(resposta => resposta.json())
        .then((produtos) => {
            produtos.forEach(produto => {
                fnMontarLinhaProduto(produto)
            })
        })
}
fnListarProdutos()

function fnMontarLinhaProduto(produto) {
    let produtoDisponivel = ""
    if (produto.disponivel == "S") {
        produtoDisponivel = "Disponivel"
    } else {
        produtoDisponivel = "Indisponivel"
    }
    
    console.log(produto.dtaCompra)

    let linhaProduto = `
    <tr>
    <td>${produto.equipamento}</td>
    <td>${produto.imei}</td>
    <td>${produto.nrodocumento}</td>
    <td>${produto.modelo}</td>
    <td>${produto.ean}</td>
    <td>${produto.serie}</td>
    <td>${produto.dtacompra.split("T")[0]}</td>
    <td><span class="badge bg-success">${produtoDisponivel}</span></td>
    <td>
                                        <div class="d-flex gap-2 justify-content-center">
                                            <button class="btn btn-primary btn-sm" data-bs-toggle="modal"
                                                data-bs-target="#modalDetalhesProduto">
                                                <i class="bi bi-eye"></i>
                                            </button>
                                            <button data-bs-toggle="modal" data-bs-target="#modalEditarProduto"
                                                class="btn btn-warning btn-sm">
                                                <i class="bi bi-pencil-square"></i>
                                            </button>
                                            <button class="btn btn-danger btn-sm">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                            <button class="btn btn-secondary btn-sm">
                                                <i class="bi bi-box-seam"></i>
                                            </button>
                                        </div>
                                    </td>
                                    </tr>
    `

    document.querySelector(".corpo_tabelaProdutos").innerHTML += linhaProduto
}

function fnCadastrarProduto() {
    let formProduto = {
        equipamento: document.getElementById("cadProduto").value,
        modelo: document.getElementById("cadModeloProduto").value,
        marca: document.getElementById("cadMarcaProduto").value,
        configuracao: document.getElementById("cadConfiguracaoProduto").value,
        serie: document.getElementById("cadNumeroSerieProduto").value,
        imei: document.getElementById("cadImeiProduto").value,
        dtaCompra: document.getElementById("cadDataCompraProduto").value,
        valor: document.getElementById("cadValorCompraProduto").value,
        nroDocumento: document.getElementById("cadDocumentNfProduto").value,
        nroddd: document.getElementById("cadDddProduto").value,
        nrolinha: document.getElementById("cadLinhaProduto").value,
        codchip: document.getElementById("cadCodChipProduto").value,
        operadora: document.getElementById("cadOperadoraProduto").value,
        pinoperadora: document.getElementById("cadPinOperadoraProduto").value,
        localestoque: document.getElementById("cadLocalidadeEstoqueProduto").value,
        responsavelestoque: document.getElementById("cadResponsavelProduto").value,
        ean: document.getElementById("cadEanProduto").value,
        alugado: document.getElementById("cadAlugadoProduto").value,
        disponivel: document.getElementById("cadDisponibilidadeProduto").value
    }

    console.dir(formProduto)

    fetch(`http://localhost:3000/produtos/`, {
        method: "POST",
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formProduto)
    })
        .then((resposta) => resposta.status)
        .then((dados) => {
            if (dados == 200) {
                console.log("Produto Cadastrado Com Sucesso!!!")
            } else if (dados == 401) {
                console.log("Deu Errado")
            } else {
                console.log("Ocorreu Algum Problema Não Identificado")
            }
        })
}

const btnSalvar = document.getElementById("btnSalvarProduto")
btnSalvar.addEventListener('click', () => {
    fnCadastrarProduto()
})

function fnPreencherModalEditProdutos(produto) {
    const equipamento = document.getElementById("editProduto").value
    const modelo = document.getElementById("editModeloProduto").value
    const marca = document.getElementById("editMarcaProduto").value
    const configuracao = document.getElementById("editConfiguracaoProduto").value
    const serie = document.getElementById("editNumSerieProduto").value
    const imei = document.getElementById("editImeiProduto").value
    const dtaCompra = document.getElementById("editDataCompraProduto").value
    const dtacadastro = ""
    const valor = document.getElementById("editValorProduto").value
    const nrodocumento = document.getElementById("editDocumentoNfProduto").value
    const nroddd = document.getElementById("editDddProduto").value
    const nrolinha = document.getElementById("editLinhaProduto").value
    const codchip = document.getElementById("editCodChipProduto").value
    const operadora = document.getElementById("editOperadoraProduto").value
    const pinoperadora = document.getElementById("editPinOperadoraProduto").value
    const localestoque = document.getElementById("editLocalidadeEstoqueProduto").value
    const responsavelestoque = document.getElementById("editResponsavelProduto").value
    const ean = document.getElementById("editEanProduto").value
    const alugado = document.getElementById("editAlugadoProduto").value
    const disponivel = document.getElementById("editDisponibilidadeProduto").value
}

function fnEditarProduto() {
    let formEditProduto = {
        equipamento: document.getElementById("editProduto").value,
        modelo: document.getElementById("editModeloProduto").value,
        marca: document.getElementById("editMarcaProduto").value,
        configuracao: document.getElementById("editConfiguracaoProduto").value,
        serie: document.getElementById("editNumSerieProduto").value,
        imei: document.getElementById("editImeiProduto").value,
        dtacompra: document.getElementById("editDataCompraProduto").value,
        dtacadastro: "hoje",
        valor: document.getElementById("editValorProduto").value,
        nrodocumento: document.getElementById("editDocumentoNfProduto").value,
        nroddd: document.getElementById("editDddProduto").value,
        nrolinha: document.getElementById("editLinhaProduto").value,
        codchip: document.getElementById("editCodChipProduto").value,
        operadora: document.getElementById("editOperadoraProduto").value,
        pinoperadora: document.getElementById("editPinOperadoraProduto").value,
        localestoque: document.getElementById("editLocalidadeEstoqueProduto").value,
        responsavelestoque: document.getElementById("editResponsavelProduto").value,
        ean: document.getElementById("editEanProduto").value,
        alugado: document.getElementById("editAlugadoProduto").value,
        disponivel: document.getElementById("editDisponibilidadeProduto").value
    }

    console.dir(formEditProduto)
    fetch(`http://localhost:3000/produtos/`, {
        method: "PUT",
        headers: { 'Content-Type': "application/json" },
        body: JSON.stringify(formEditProduto)
    })
        .then((resposta) => resposta.json)
        .then((dados) => {

        })
}

const btnSalvarEditProduto = document.getElementById("btnSalvarEditProduto")
btnSalvarEditProduto.addEventListener('click', () => {
    fnEditarProduto()
})

function fnDetalhesProduto() {

}