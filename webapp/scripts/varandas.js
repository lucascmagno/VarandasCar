let pagina = document.querySelector('#innerpagina');
let pedidos = document.querySelector('.l1');
let personalizar = document.querySelector('.l2');
let veiculos = document.querySelector('.l3');
let conta = document.querySelector('.l4');
let titulo = document.querySelector('#titulo');
var pedido;


var btxEdita = document.querySelectorAll('.edit');


//Pegar Mes atual
var data = new Date();
mes = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];


//DASHBOARD
 var numpedidos = 1;

if (numpedidos == 0) {
    document.querySelector('#lista-pedidos').insertAdjacentHTML("beforeend", '<div class="nopedidos">Você ainda não possui pedidos cadastrados</div>')

} else {
    document.querySelector('#lista-pedidos').insertAdjacentHTML("beforeend", '<div class="pedidosheader"><span>Peça</span><span>Marca/Modelo</span><span>Solicitação</span><span>Status</span></div>');

    for (var i = 0; i < numpedidos; i++){
        
        pedido = '<a href="#" id="pedido'+ i +'" class="pedido"><span id="peca'+ i +'">Peça</span><span id="carro'+ i +'">Toyota Etios</span><span id="solicitacao'+ i +'">06/06/2021</span><div class="content-status"><span id="status'+ i +'">Entregue</span><div id="corstatus'+ i +'" class="divstatus"></div></div></a>';
    
        document.querySelector('#lista-pedidos').insertAdjacentHTML("beforeend", pedido)
    };
}


function EditaInput(y){
    document.querySelector(`.input${y}`).toggleAttribute("disabled");
    document.querySelector(`.sub${y}`).classList.add("visible");
}

function ConfirmaInput(y){
    console.log(y);
    document.querySelector(`.input${y}`).toggleAttribute("disabled");
    document.querySelector(`.sub${y}`).classList.remove("visible");


    //Nome
    if (y === 0 && document.querySelector('.input0').value.length > 3){
        nome = document.querySelector('.input0').value;
        document.querySelector('#persona').innerHTML = nome;
        document.querySelectorAll('.contentinput')[y].submit();
    };

    if (y === 0 && document.querySelector('.input0').value.length <= 3){
        document.querySelector('.input0').value = nome;
    };
}

conta.addEventListener('click', () =>{
    
    //Cartão
     const selectPag = document.querySelector('#displayPag');
     const formCredito = document.querySelector('.credito');
 
     selectPag.addEventListener('change', function() {
         if (selectPag.selectedIndex === 1) {
             formCredito.style.display = 'block';
           } else {
             formCredito.style.display = 'none';
           }
       });
})
