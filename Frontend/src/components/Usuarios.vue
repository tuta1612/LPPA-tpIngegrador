<script>
import axios from 'axios'

  export default{
    props:{
      refreshToken: String
    },
    data(){
      return {
        accesToken: null,
        usuarios :[],
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
        axios.get("https://lppa-tpintegrador.herokuapp.com/User", {
          headers: {
            'Authorization':'Bearer '+this.accesToken
          }
        })
        .then( response => {
          this.permisos = response.data;
          this.loading = false;
        } )
        .catch( error => alert(error) );
      },
      test(){
        alert("test");
      }
    }
  }
</script>

<template>
  <div class="spinner-border text-dark" role="status" v-if="loading">
    <span class="visually-hidden">Loading...</span>
  </div>
  <ul v-else class="list-group">
    <li v-for="item in usuarios" class="list-group-item">
      {{item.id}} {{item.username}} {{item.email}}       
      <button type="button" class="btn btn-warning" @click="test">Borrar</button>
      <button type="button" class="btn btn-danger" @click="test">Modificar</button>
    </li>
  </ul>
</template>

<style scoped>
</style>
