<script>
  import Home from "./components/Home.vue";
import UnAuthenticated from "./components/UnAuthenticated.vue";
  
  export default{
    props: {
        userId: String,
        refreshToken: String
    },
    data(){
      return{
        userId: 0,
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
      SetUserTokens(acces, refresh){
        this.accesToken = acces;
        this.refreshToken = refresh;
      },
      LogOut(){
        this.accesToken = null;
        this.refreshToken = null;
      }
    },
    components: { Home, UnAuthenticated }
}
</script>

<template>
  <UnAuthenticated v-if="!hasUser" @login-succes="SetUserTokens"></UnAuthenticated>
  <Home v-if="hasUser" :refreshToken="this.refreshToken" @logout="LogOut"></Home>
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
