<script>
  import axios from 'axios';
  export default{
    data() {
      return {
        userName: null,
        userPassword: null
      }
    },
    methods:{
      LogIn(){
        axios.post("https://lppa-tpintegrador.herokuapp.com/Authorization/LogIn",{
          "userName": this.userName,
          "password": this.userPassword
        })
        .then( response => {
          let userResponse = response.data;
          this.loading = false;        
          this.$emit("login-succes", userResponse.jwToken, userResponse.refreshToken);
        } )
        .catch( error => alert(error) );
      },
      SignUp(){}
    }
  }
</script>

<template>
  <h1>INGRESAR</h1>
  <p style="background-color: yellowgreen;">
    <input id="user" placeholder="Usuario" v-model="userName"><br>
    <input id="password" placeholder="Contraseña" v-model="userPassword"><br>
    <button @click="LogIn()">Ingresar</button>
  </p>
  <p style="background-color: aquamarine;">
    <button @click="SignUp()">Registrarse</button>
  </p>
</template>

<style scoped>
</style>
