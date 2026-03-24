function fnInveriar() {
    let formInventariar = {
        codigoPessoa: document.getElementById("txtCodigoPessoa").value,
        nomePessoa: document.getElementById("txtNomePessoa").value,
        filialPessoa: document.getElementById("txtFilial").value,
        departamentoPessoa: document.getElementById("txtDepartamento").value,
        cargoPessoa: document.getElementById("txtCargo").value,
        equipamento: document.getElementById("txtEquipamento").value,
        marca: document.getElementById("txtMarca").value,
        modelo: document.getElementById("txtModelo").value,
        imei: document.getElementById("txtImei").value,
        serie: document.getElementById("txtSerie").value,
        descricao: document.getElementById("txtDescricao").value,
        numeroLinha: document.getElementById("txtNumeroLinha").value,
        codigoChip: document.getElementById("txtCodigoChip").value,
        operadora: document.getElementById("txtOperadora").value,
        pinOpeardora: document.getElementById("txtPinOperadora").value,
        historico: document.getElementById("txtHistorico").value
    }
    console.dir(formInventariar)
}

const btnInventariar = document.getElementById("botaoInventariar")
btnInventariar.addEventListener("click", () => {
    fnInveriar()
})