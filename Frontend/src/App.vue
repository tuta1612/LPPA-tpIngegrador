<script>
  import Home from "./components/Home.vue";
  import UnAuthenticated from "./components/UnAuthenticated.vue";
  
  export default{
    data(){
      return{
        userId: 0,
        userName: null,
        accesToken: null,
        refreshToken: null
      }
    },
    computed:{
      hasUser: function(){
        return this.refreshToken != undefined && this.refreshToken != null;
      }
    },
    methods:{
      SetUserTokens(id, name, acces, refresh){
        this.userId = id;
        this.userName = name;
        this.accesToken = acces;
        this.refreshToken = refresh;
      },
      LogOut(){
        this.userId = 0;
        this.userName = null;
        this.accesToken = null;
        this.refreshToken = null;
      }
    },
    components: { Home, UnAuthenticated }
}
</script>

<template>
  <UnAuthenticated v-if="!hasUser" @login-succes="SetUserTokens"></UnAuthenticated>
  <Home v-if="hasUser" :userId="this.userId" :refreshToken="this.refreshToken" @logout="LogOut"></Home>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
