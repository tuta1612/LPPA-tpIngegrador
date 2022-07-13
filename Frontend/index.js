function iniciarlogin() {

  var datousuario = document.getElementById("inputusuario").value;
  var datopassword = document.getElementById("inputpassword").value;
  
  fetch(`https://localhost:44329/Authorization/LogIn`, {
    method:'POST',
    headers: { 'Content-Type': 'application/json'},
    body: JSON.stringify( {
       "userName": datousuario,
       "password": datopassword,
    } )
  }).then(res=> res.json()).then(data=> {
    alert("OK");
    //guardar el jwt y el refresh token
    //ir a la otra pantalla
    // htttp:bla/home?token=hola
  }).catch(err=>{
    alert("error");
    //mostrar un cartel con el error
  });
}



const queryString = window.location.search;
// ?product=shirt&color=blue&newuser&size=m
const urlParams = new URLSearchParams(queryString);
const token = urlParams.get('token');
alert(token);