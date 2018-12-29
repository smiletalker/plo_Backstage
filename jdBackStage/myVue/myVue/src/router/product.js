import clothTable from '@/components/common/producttable'
import trousersTable from '@/components/common/producttrousers'
import product from '@/components/product'

export default[
  {
    path:'/product',
    name:'product',
    component:product,
    children:[
      {
        path: '/',
        name: 'clothTable',
        component: clothTable
      },
      {
        path:'/producttable',
        name:'clothTable',
        component:clothTable
      },
      {
        path:'/producttrousers',
        name:'trousersTable',
        component:trousersTable
      }
    ]
  }
]
