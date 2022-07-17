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
      },
      addPermission(){
        let newName = prompt("Seleccione un nombre para este nuevo permiso");
        if(newName!=null && newName.length>0){
          this.loading = true;
          axios.post("https://lppa-tpintegrador.herokuapp.com/Permission",{
            id: 0,
            name: newName
          },{
            headers: {
              'Authorization': 'Bearer '+this.accesToken,
              'Content-type':'application/json'
            }
          })
          .then( response => {
            this.getAllPermissions();
          } )
          .catch( error => {
            this.loading = false;
            alert(error)
            });
          }
      },
      editPermission(item){
        if(item.id==1) return;
        let newName = prompt("Seleccione el nuevo nombre para este permiso", item.name);
        if(newName!=null && newName.length>0){
          this.loading = true;
          axios.put("https://lppa-tpintegrador.herokuapp.com/Permission",{
            id: item.id,
            name: newName
          },{
            headers: {
              'Authorization': 'Bearer '+this.accesToken,
              'Content-type':'application/json'
            }
          })
          .then( response => {
            this.getAllPermissions();
          } )
          .catch( error => {
            this.loading = false;
            alert(error)
            });
          }
      },
      deletePermission(item){
        if(item.id==1) return;
        if(confirm("¿Está seguro?")){
          this.loading = true;
          axios.delete("https://lppa-tpintegrador.herokuapp.com/Permission?permissionId="+item.id,{
            headers: {
              'Authorization': 'Bearer '+this.accesToken,
              'Content-type':'application/json'
            }
          })
          .then( response => {
            this.getAllPermissions();
          } )
          .catch( error => {
            this.loading = false;
            alert('No se pudo eliminar el permiso '+item.name);
            });
          }
      }
    }
  }
</script>

<template>
  <div class="spinner-border text-dark" role="status" v-if="loading">
    <span class="visually-hidden">Loading...</span>
  </div>
  <div v-else>
    <ul  class="list-group">
      <li v-for="item in permisos" class="list-group-item">
        {{item.id}} {{item.name}}
        <button type="button" class="btn btn-warning" @click="editPermission(item)">Modificar</button>
        <button type="button" class="btn btn-danger" @click="deletePermission(item)">Borrar</button>
      </li>
    </ul>
    <p>Para agregar un nuevo permiso toca 
      <button type="button" class="btn btn-primary" @click="addPermission()">Aqui</button>
    </p>
  </div>
</template>

<style scoped>
</style>
