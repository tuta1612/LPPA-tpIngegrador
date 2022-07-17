<script>
  import axios from 'axios';
  export default{
    data() {
      return {
        login: true,
        userName: null,
        userEmail: null,
        userPassword: null,
        confirmPassword: null,
        loading: false
      }
    },
    methods:{
      LogIn(){
        if(this.userName == null || this.userName.length==0 ||
        this.userPassword == null || this.userPassword.length==0 )
          return;

        this.loading = true;
        axios.post("https://lppa-tpintegrador.herokuapp.com/Authorization/LogIn",{
          "userName": this.userName,
          "password": this.userPassword
        })
        .then( response => {
          let userResponse = response.data;
          this.loading = false;
          this.$emit("login-succes", userResponse.userId, userResponse.userName, userResponse.jwToken, userResponse.refreshToken);
        } )
        .catch( error => {
          alert(error)
          this.loading = false;
          });
      },
      SignUp(){
        if(this.userName == null || this.userName.length==0 ||
        this.userEmail == null || this.userEmail.length==0 ||
        this.userPassword == null || this.userPassword.length==0 ||
        this.confirmPassword == null || this.confirmPassword.length==0 )
          return;

        this.loading = true;
        axios.post("https://lppa-tpintegrador.herokuapp.com/Authorization/SignUp",{
          userName: this.userName,
          email: this.userEmail,
          password: this.userPassword,
          confirmPassword: this.confirmPassword
        })
        .then( response => {
          let userResponse = response.data;
          this.loading = false;
          this.login = true
        } )
        .catch( error => {
          alert(error)
          this.loading = false;
          });
      }
    }
  }
</script>


<template>
  <div class="wrapper">
      <div v-if="login" class="title-text">
         <div class="title login">
            Ingresar
         </div>
      </div>
      <div v-if="login" class="form-container">
         <div class="form-inner">
            <form action="#" class="login">
               <div class="field">
                  <input type="text" id="user" placeholder="Usuario" required v-model="userName">
               </div>
               <div class="field">
                  <input type="password" id="password" placeholder="Contraseña" required v-model="userPassword">
               </div>
               <div class="field btn" v-if="!loading">
                  <div class="btn-layer"></div>
                  <input type="submit" value="Iniciar sesión" id="btnlogin" @click="LogIn">
               </div>
               <div class="spinner-border text-dark" role="status" v-if="loading">
                <span class="visually-hidden">Loading...</span>
               </div>
               <p>¿No tenes cuenta?
                <a href="#" @click="login=false">Registrate</a>
               </p>
            </form>
          </div>
      </div>

      <div v-if="!login" class="title-text">
        <div class="title signup">
            Crear nueva cuenta
        </div>
      </div>
      <div v-if="!login" class="form-container">
         <div class="form-inner">
            <form action="#" class="signup">
               <div class="field">
                  <input type="text" id="user" placeholder="Usuario" required v-model="userName">
               </div>
               <div class="field">
                  <input type="email" id="email" placeholder="Email" required v-model="userEmail">
               </div>
               <div class="field">
                  <input type="password" id="password" placeholder="Contraseña" required v-model="userPassword">
               </div>
               <div class="field">
                  <input type="password" id="confirmpassword" placeholder="Repetir contraseña" required v-model="confirmPassword">
               </div>
               <div class="field btn" v-if="!loading">
                  <div class="btn-layer"></div>
                  <input type="submit" value="Registrarse" id="btnsignup" @click="SignUp">
               </div>
               <div class="spinner-border text-dark" role="status" v-if="loading">
                <span class="visually-hidden">Loading...</span>
               </div>
               <p>¿Ya tenes una cuenta?
                <a href="#" @click="login=true">Ingresa</a> 
               </p>
            </form>
          </div>
      </div>
        
   </div>
</template>




<!-- 
  <p style="background-color: yellowgreen;">
    <input id="user" placeholder="Usuario" v-model="userName"><br>
    <input id="password" placeholder="Contraseña" v-model="userPassword"><br>
    <button @click="LogIn()">Ingresar</button>
  </p>
  <p style="background-color: aquamarine;">
    <button @click="SignUp()">Registrarse</button>
  </p>
</template> -->

<!--
<style scoped>
-->

<style>
@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
html,body{
  display: grid;
  height: 100%;
  width: 100%;
  place-items: center;
  background: -webkit-linear-gradient(left, #4745b2, #42fac3);
}
::selection{
  background: #fa4299;
  color: #fff;
}
.wrapper{
  overflow: hidden;
  max-width: 390px;
  background: #fff;
  padding: 30px;
  border-radius: 5px;
  box-shadow: 0px 15px 20px rgba(0,0,0,0.1);
}
.wrapper .title-text{
  display: flex;
  width: 200%;
}
.wrapper .title{
  width: 50%;
  font-size: 35px;
  font-weight: 600;
  text-align: center;
  transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);
}
.wrapper .slide-controls{
  position: relative;
  display: flex;
  height: 50px;
  width: 100%;
  overflow: hidden;
  margin: 30px 0 10px 0;
  justify-content: space-between;
  border: 1px solid lightgrey;
  border-radius: 10px;
}
.slide-controls .slide{
  height: 100%;
  width: 100%;
  color: #fff;
  font-size: 18px;
  font-weight: 500;
  text-align: center;
  line-height: 48px;
  cursor: pointer;
  z-index: 1;
  transition: all 0.6s ease;
}
.slide-controls label.signup{
  color: #000;
}
.slide-controls .slider-tab{
  position: absolute;
  height: 100%;
  width: 50%;
  left: 0;
  z-index: 0;
  border-radius: 10px;
  background: -webkit-linear-gradient(left, #4745b2, #42fac3);
  transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);
}
input[type="radio"]{
  display: none;
}
#signup:checked ~ .slider-tab{
  left: 50%;
}
#signup:checked ~ label.signup{
  color: #fff;
  cursor: default;
  user-select: none;
}
#signup:checked ~ label.login{
  color: #000;
}
#login:checked ~ label.signup{
  color: #000;
}
#login:checked ~ label.login{
  cursor: default;
  user-select: none;
}
.wrapper .form-container{
  width: 100%;
  overflow: hidden;
}
.form-container .form-inner{
  display: flex;
  width: 200%;
}
.form-container .form-inner form{
  width: 50%;
  transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);
}
.form-inner form .field{
  height: 50px;
  width: 100%;
  margin-top: 20px;
}
.form-inner form .field input{
  height: 100%;
  width: 100%;
  outline: none;
  padding-left: 15px;
  border-radius: 10px;
  border: 1px solid lightgrey;
  border-bottom-width: 2px;
  font-size: 17px;
  transition: all 0.3s ease;
}
.form-inner form .field input:focus{
  border-color: #45c50a;
  /* box-shadow: inset 0 0 3px #fb6aae; */
}
.form-inner form .field input::placeholder{
  color: #999;
  transition: all 0.3s ease;
}
form .field input:focus::placeholder{
  color: #b3b3b3;
}
.form-inner form .pass-link{
  margin-top: 5px;
}
.form-inner form .signup-link{
  text-align: center;
  margin-top: 30px;
}
.form-inner form .pass-link a,
.form-inner form .signup-link a{
  color: #fa4299;
  text-decoration: none;
}
.form-inner form .pass-link a:hover,
.form-inner form .signup-link a:hover{
  text-decoration: underline;
}
form .btn{
  height: 50px;
  width: 100%;
  border-radius: 5px;
  position: relative;
  overflow: hidden;
}
form .btn .btn-layer{
  height: 100%;
  width: 300%;
  position: absolute;
  left: -100%;
  background: -webkit-linear-gradient(left, #4745b2, #42fac3, #4745b2);
  border-radius: 5px;
  transition: all 0.4s ease;;
}
form .btn:hover .btn-layer{
  left: 0;
}
form .btn input[type="submit"]{
  height: 100%;
  width: 100%;
  z-index: 1;
  position: relative;
  background: none;
  border: none;
  color: #fff;
  padding-left: 0;
  border-radius: 5px;
  font-size: 20px;
  font-weight: 500;
  cursor: pointer;
}

button{
    background-color: red;
}
</style>
