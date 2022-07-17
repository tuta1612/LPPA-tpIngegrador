<script>
import axios from 'axios'

  export default{
    props:{
      currentUser: Object,
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
    computed:{
      isNewUser: function(){
        return this.currentUser == null || this.currentUser.id==0;
      }
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
      cancel(){
        this.$emit("goto-userlist");
      },
      editUser(oneUser){
        if(true){
          this.loading = true;
          axios.put("https://lppa-tpintegrador.herokuapp.com/User",
          oneUser,{
            headers: {
              'Authorization': 'Bearer '+this.accesToken,
              'Content-type':'application/json'
            }
          })
          .then( response => {
            this.$emit("goto-userlist");
          } )
          .catch( error => {
            this.loading = false;
            alert(error)
            });
          }
      },
      containsPermission(onePermission){
        debugger
        let cond1 =  this.currentUser!=null;
        let cond2 = this.currentUser.permissions.some(item=> item.id == onePermission.id);
        return cond1 && cond2;
      }
    }
  }
</script>

<template>
  <div class="card" style="width: 20rem;">
    <div class="card-header">
      Modificar usuario
    </div>
    <div class="card-body">
      <input id="id" placeholder="Id" v-model="currentUser.id" disabled><br>
      <input id="user" placeholder="Usuario" v-model="currentUser.username" disabled><br>
      <input id="mail" placeholder="Email" v-model="currentUser.email"><br>

      <div class="spinner-border text-dark" role="status" v-if="loading">
        <span class="visually-hidden">Loading...</span>
      </div>
      <div v-else>
        <p>Permisos: <br>
          <label v-for="item in permisos">
            <input type="checkbox" :value="item" v-model="currentUser.permissions"> 
            {{item.name}}
          </label>
        </p>
        <p>
          <button type="button" class="btn btn-danger mx-2" @click="cancel()">Cancelar</button>
          <button type="button" class="btn btn-success mx-2" @click="editUser(currentUser)">Grabar</button>
        </p>
      </div>
    </div>
  </div>
</template>

<style scoped>
</style>
