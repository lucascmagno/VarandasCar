const validate = async(disp) =>{
	if (disp.name_disponibility == false){
		 document.getElementById("erro1").innerHTML="Email já está em uso!!";
		 document.getElementById("enviar").setAttribute("disabled","disabled");
	} else {
		document.getElementById("erro1").innerHTML="";
		document.getElementById("enviar").removeAttribute("disabled");
	}
}

const disponibilityName = async() =>{
	const url = `http://localhost:8080/varandas/src/webapp/login/controle/FakeApi.jsp?email=${document.getElementById("emailup").value}`;
	const dados = await fetch(url);
	const disp = await dados.json();
	validate(disp);
}

document.getElementById("emailup").addEventListener("focusout",disponibilityName);