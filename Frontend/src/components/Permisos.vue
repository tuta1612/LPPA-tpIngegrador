<script>
import axios from 'axios'

  export default{
    props:{
      refreshToken: String
    },
    data(){
      return {
        accesToken: null,
        permisos :[],
        loading: true
      }
    },
    mounted(){
      this.getAccesToken();
    },
    methods: {
      getAccesToken(){
        console.log(this.refreshToken);
        axios.post("https://lppa-tpintegrador.herokuapp.com/Authorization/RefreshToken?refreshToken="+this.refreshToken)
        .then( response => {
          this.accesToken = response.data.jwToken;
          this.getAllPermissions();
        } )
        .catch( error => alert(error) );
      },
      getAllPermissions(){
        axios.get("https://lppa-tpintegrador.herokuapp.com/Permission", {
          headers: {
            'Authorization':'Bearer '+this.accesToken
          }
        })
        .then( response => {
          this.permisos = response.data;
          this.loading = false;
        } )
        .catch( error => alert(error) );
      }
    }
  }
</script>

<template>
  <h1>Permisos</h1>
  <p v-if="loading">Cargando...</p>
  <ul v-else>
    <li v-for="item in permisos">
      {{item.id}} {{item.name}}
    </li>
  </ul>
</template>

<style scoped>
</style>
