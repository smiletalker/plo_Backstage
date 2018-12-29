// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
/*引入axios*/
import axios from 'axios';
import Vuex from 'vuex'
import store from './store/store'
/*router.push('/');*/
Vue.config.productionTip = false;
Vue.use(Vuex);
Vue.prototype.$axios=axios;
import $ from 'jquery';
/* eslint-disable no-new */
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);

import defines from '../config/data'
Vue.prototype.defines = defines;

router.beforeEach((to,from,next)=>{
  if(to.meta.needLogin){
    console.log("需要登陆");
  }else{
    next()
  }if(window.sessionStorage.data){
    next();
  }else{
    /*alert("session为空，请先登录");*/
    next('/denglu');
  }
});
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>',
  render: h => h(App)
});
