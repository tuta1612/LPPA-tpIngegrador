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
                .catch(error => alert(error));
        },
        getAllUsers() {
            axios.get("https://lppa-tpintegrador.herokuapp.com/User", {
                headers: {
                    "Authorization": "Bearer " + this.accesToken
                }
            })
                .then(response => {
                this.usuarios = response.data;
                this.loading = false;
            })
                .catch(error => alert(error));
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
                    alert(error);
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
  <Usuario 
    v-else-if="currentUser!=null"
    :refreshToken="this.refreshToken"
    :currentUser="this.currentUser"
    @goto-userlist="this.currentUser=null">
  </Usuario>
  <div v-else>
    <ul  class="list-group">
      <li v-for="item in usuarios" class="list-group-item">
        {{item.username}} / {{item.email}}
        <button type="button" class="btn btn-warning" @click="editUser(item)">Modificar</button>
        <button type="button" class="btn btn-danger" @click="deleteUser(item)">Borrar</button>
      </li>
    </ul>
    <!--<p>Para agregar un nuevo usuario toca 
      <button type="button" class="btn btn-primary" @click="addUser()">Aqui</button>
    </p>-->
  </div>
</template>

<style scoped>
</style>
