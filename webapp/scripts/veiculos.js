let pagina = document.querySelector('#innerpagina');
let pedidos = document.querySelector('.l1');
let personalizar = document.querySelector('.l2');
let veiculos = document.querySelector('.l3');
let conta = document.querySelector('.l4');
let titulo = document.querySelector('#titulo');
var pedido;


var nome = "José da Silva Souza Pacheco";
document.querySelector('#persona').innerHTML = nome;

var btxEdita = document.querySelectorAll('.edit');


//Pegar Mes atual
var data = new Date();
mes = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];

//Adicionar lista de Veiculos
var contveiculos = 3;

if (contveiculos == 0) {
    document.querySelector('.contentveiculos').insertAdjacentHTML("beforeend", '<div class="noveiculo">Nenhum veiculo cadastrado</div>');
    console.log(0);
} else {
    var contentVeiculos = document.querySelector('.contentveiculos');
    console.log(contveiculos);
    // Função para remover a classe 'selecionado' de todos os elementos
    function removerSelecionadoDeTodos() {
        document.querySelectorAll('.veiculo').forEach((element) => {
            element.classList.remove('selecionado');
        });
    }

    // Usando um loop forEach para criar os elementos e adicionar os ouvintes de evento
    Array.from({ length: contveiculos }, (_, contador) => {
        var innerveiculo = '<div class="veiculo" id="v' + contador + '"><h4>Toyota <b>Etios 2017</b></h4></div>';
        contentVeiculos.insertAdjacentHTML("beforeend", innerveiculo);

        var veiculoElement = document.querySelector('#v' + contador);

        veiculoElement.addEventListener('click', () => {
            removerSelecionadoDeTodos(); // Remove 'selecionado' de todos os elementos
            veiculoElement.classList.add('selecionado'); // Adiciona 'selecionado' ao elemento clicado


        // Obtenha o ID do veículo a partir do ID do elemento clicado
            var veiculoID = veiculoElement.id.substr(1); // Remove o "v" do ID
            console.log(veiculoID);
        });


    });

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
    pedidos.classList.remove('active');
    personalizar.classList.remove('active');
    loja.classList.remove('active');
    conta.classList.add('active');
    pagina.innerHTML = innerConta;
    titulo.innerHTML = "Minha Conta";    


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
