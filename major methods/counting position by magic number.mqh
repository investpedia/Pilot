/* ==============================================
 Counting positions
============================================== */
int ordersPosition(int Magic)
  {
   int num=0;
   for(int i=OrdersTotal()-1;i>=0;i--)                                     
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))                
       {
         if(OrderMagicNumber()==Magic)
          num++;
       }
     }
   return(num);
  }  
