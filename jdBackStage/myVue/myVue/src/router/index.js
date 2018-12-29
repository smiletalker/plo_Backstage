import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router);
import HelloWorld from '@/components/HelloWorld'
// import product from '@/components/product'
import denglu from '@/components/denglu'
import staff from '@/components/staff'
import customer from '@/components/customer'
import jurist from '@/components/jurist'
import jur_name from '@/components/jur_name'
import sjtj from '@/components/sjtj'
import index from '@/components/index'
import order from './order'
import activity from './activity'
import product from './product'

export default new Router({
  routes: [
    ...order,
    ...activity,
    ...product,
    {
      path: '/',
      name: 'index',
      component: index
    },
    {
      path:'/HelloWorld',
      name:'HelloWorld',
      component:HelloWorld
    },
    // {
    //  path:'/product',
    //  name:'product',
    //  component:product
    // },
    {
      path:'/denglu',
      name:'denglu',
      component:denglu
    },
    {
      path:'/staff',
      name:'staff',
      component:staff
    },
    {
      path:'/customer',
      name:'customer',
      component:customer
    },
    {
      path:'/jurist',
      name:'jurist',
      component:jurist
    },
    {
      path:'/jur_name',
      name:'jur_name',
      component:jur_name
    },
    {
      path:'/sjtj',
      name:'sjtj',
      component:sjtj
    },
    {
      path: '/index',
      name: 'index',
      component: index
    },
  ]
});
