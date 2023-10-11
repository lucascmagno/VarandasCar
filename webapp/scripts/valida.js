function ValidaNovoUsuer(){
	 let nome = formAddUsuer.nomeup.value
	  
	 if(nome.length <= 5 && nome != ""){
		 document.querySelector('#erro0').innerHTML = "Égua do nome curto! Tente um maior!";
		 document.querySelector('#erro0').style.display = "block";
	 } else if (nome == "") {
		 document.querySelector('#erro0').innerHTML = "Põe teu nome, cabeçudo!";
		 document.querySelector('#erro0').style.display = "block";
	 }
 };
 
 function ValidaNome(){
	 let nome = document.querySelector('#nomeup').value
	 
	 if(nome.length <= 10 && nome.length > 0){
		 document.querySelector('#erro0').innerHTML = "Égua do nome curto! Tente um maior!";
		 document.querySelector('#erro0').style.display = "block";
	} else {
		  document.querySelector('#erro0').style.display = "none";
	}
 };
 
 
 
 function ValidaEmail(){
	 let email = document.querySelector('#emailup').value
	 
	 if(email != ""){
		 document.querySelector('#erro1').innerHTML = "Tem que por teu Email, seu infeliz!";
		 document.querySelector('#erro1').style.display = "block";
		 document.querySelector('#submitbtx').setAttribute("disabled","disabled");
  	} else {
		  document.querySelector('#erro1').style.display = "none";
		  document.querySelector('#submitbtx').setAttribute("disabled","");
	}
 };
 
 
function ValidaFone() {
  let fone = document.querySelector('#foneup');
  let foneNumerico = fone.value.replace(/\D/g, '');
  let foneFormatado = '';

  if (foneNumerico.length > 0) {
    foneFormatado = '(' + foneNumerico.substring(0, 2) + ') ';

    if (foneNumerico.length > 2) {
      foneFormatado += foneNumerico.substring(2, 7);

      if (foneNumerico.length > 7) {
        foneFormatado += '-' + foneNumerico.substring(7, 11);
      }
    }
  }

  fone.value = foneFormatado;
  
  if(fone.length < 15) {
	  document.querySelector('#erro2').innerHTML = "Número inválido!";
		 document.querySelector('#erro2').style.display = "block";
  } else {
	  document.querySelector('#erro2').style.display = "none";
  }
}


function ValidaSenha(){
	let senha = document.querySelector('#senhaup').value;

	if (senha.length <= 5 && senha.length > 0) {
		document.querySelector('#erro3').innerHTML = "Sua senha está muito curta!";
		 document.querySelector('#erro3').style.display = "block";
	} else {
		document.querySelector('#erro3').style.display = "none";
	}
}

function VerSenha(){
	let senha = document.querySelector('#senhaup')
	let icone = document.querySelector('.IconSenha')
	
	if (senha.type === 'password') {
    senha.type = 'text';
    icone.src = '../imagens/EscSenha.svg';
  } else {
    senha.type = 'password';
    icone.src = '../imagens/VerSenha.svg';
  }
}