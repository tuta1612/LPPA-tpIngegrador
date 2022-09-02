<script>
import axios from 'axios'
import Usuario from './Usuario.vue';

  export default{
    props: {
        refreshToken: String
    },
    data() {
        return {
            accesToken: null,
            usuarios: [],
            descripcionError: null,
            currentUser: null,
            loading: true
        };
    },
    mounted() {
        this.getAccesToken();
    },
    methods: {
        getAccesToken() {
            console.log(this.refreshToken);
            axios.post("https://lppa-tpintegrador.herokuapp.com/Authorization/RefreshToken?refreshToken=" + this.refreshToken)
                .then(response => {
                this.accesToken = response.data.jwToken;
                this.getAllUsers();
            })
                .catch(error => alert(error.response.data));
        },
        getAllUsers() {
            this.descripcionError = null;
            axios.get("https://lppa-tpintegrador.herokuapp.com/User", {
                headers: {
                    "Authorization": "Bearer " + this.accesToken
                }
            })
            .then(response => {
                this.descripcionError = null;
                this.usuarios = response.data;
                this.loading = false;
            })
            .catch(error => {
                this.loading = false;
                this.descripcionError = error.response.data;
            });
        },
        addUser() {
            this.$emit("detail", { id: 0, username: "", email: "", permissions: [] });
        },
        editUser(item) {
          this.currentUser = item;
        },
        deleteUser(item) {
            if (confirm("¿Está seguro?")) {
                this.loading = true;
                axios.delete("https://lppa-tpintegrador.herokuapp.com/User?userId=" + item.id, {
                    headers: {
                        "Authorization": "Bearer " + this.accesToken,
                        "Content-type": "application/json"
                    }
                }).then(response => {
                    this.getAllUsers();
                }).catch(error => {
                    this.loading = false;
                    alert(error.response.data);
                    
                });
            }
        }
    },
    components: { Usuario }
}
</script>

<template>
  <div class="spinner-border text-dark" role="status" v-if="loading">
    <span class="visually-hidden">Loading...</span>
  </div>
    <p v-else-if="descripcionError!=null">{{descripcionError}}</p>
  <Usuario 
    v-else-if="currentUser!=null"
    :refreshToken="this.refreshToken"
    :currentUser="this.currentUser"
    @goto-userlist="this.currentUser=null">
  </Usuario>
  <div v-else>
    <ul  class="list-group">
      <li v-for="item in usuarios" class="list-group-item">
        <div class="row">
          <div class="col">
            <h5 class="mb-1">{{item.username}}</h5>
            <small>{{item.email}}</small>
          </div>
          <div class="col" >
            <button type="button" class="btn btn-warning" @click="editUser(item)">Modificar</button>
            <button type="button" class="btn btn-danger" @click="deleteUser(item)">Borrar</button>
          </div>
        </div>
      </li>
    </ul>
    <!--<p>Para agregar un nuevo usuario toca 
      <button type="button" class="btn btn-primary" @click="addUser()">Aqui</button>
    </p>-->
  </div>
</template>

<style scoped>
</style>
