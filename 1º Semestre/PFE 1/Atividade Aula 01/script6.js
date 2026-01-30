function calcular() {
        let valor = Number(document.getElementById("valor").value);
        let cashback = valor > 300 ? valor * 0.05 : 0;
        let liquido = valor - cashback;
        document.getElementById("resultado").innerHTML =
            `Cashback: R$ ${cashback.toFixed(2)}<br>Valor Líquido: R$ ${liquido.toFixed(2)}`;
    }