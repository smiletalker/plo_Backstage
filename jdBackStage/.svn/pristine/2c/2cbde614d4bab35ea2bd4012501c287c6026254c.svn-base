import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex);

//存储全局数据
const state={
  wfhnumber:8,//未发货
  wfknumber:10,//未付款
  wshnumber:7,//未收货
  yshnumber:4,//已收货
  tknumber:7,//退款
  thnumber:7,//退货
};

const mutations={
  wfhnumber(state,wfhnumber){
    state.wfhnumber=wfhnumber;
  },
  wfknumber(state,wfknumber){
    state.wfknumber=wfknumber;
  },
  wshnumber(state,wshnumber){
    state.wshnumber=wshnumber;
  },
  yshnumber(state,yshnumber){
    state.yshnumber=yshnumber;
  },
  tknumber(state,tknumber){
    state.tknumber=tknumber;
  },
  thnumber(state,thnumber){
    state.thnumber=thnumber;
  },

};

const actions={
  setment(ctx,wfhnumber){
    ctx.commit('wfhnumber',wfhnumber);
  }
};
export default new Vuex.Store({
  state,
  mutations,
  actions
});
