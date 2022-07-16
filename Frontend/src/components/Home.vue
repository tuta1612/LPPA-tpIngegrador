<script>
import Permisos from './Permisos.vue';
import Usuarios from './Usuarios.vue';
  export default{
    props: {
        userId: String,
        refreshToken: String
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
  <h1>HOME</h1>
  <button @click="LogOut">Cerrar sesión</button>
  <p>{{userId}}</p>
  <p>{{refreshToken}}</p>

  <Permisos refreshToken="0BF54F9517933D42477FD64DF38C792C2442677B5E3E0DE7FF"></Permisos>
  <Usuarios refreshToken="0BF54F9517933D42477FD64DF38C792C2442677B5E3E0DE7FF"></Usuarios>
</template>

<style scoped>
</style>
