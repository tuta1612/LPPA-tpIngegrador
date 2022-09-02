<script>
import Permisos from './Permisos.vue';
import Usuarios from './Usuarios.vue';
  export default{
    props: {
        userId: String,
        refreshToken: String
    },
    data(){
      return {
        currentSection:null
      }
    },
    methods:{
      LogOut(){
        this.$emit("logout");
      }
    },
    components: { Permisos, Usuarios }
}
</script>

<template>
  <nav class="navbar fixed-top bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#" @click="currentSection=null">Inicio</a>
      <a class="nav-link" href="#" @click="currentSection='usuarios'">Usuarios</a>
      <a class="nav-link" href="#" @click="currentSection='permisos'">Permisos</a>
      <a class="nav-link" href="#" @click="LogOut">Cerrar sesión</a>
    </div>
  </nav>
  <img v-if="currentSection==null" src="../assets/logo.png">
  <Usuarios v-if="currentSection=='usuarios'" :refreshToken="this.refreshToken"></Usuarios>
  <Permisos v-if="currentSection=='permisos'" :refreshToken="this.refreshToken"></Permisos>
</template>

<style scoped>
</style>
