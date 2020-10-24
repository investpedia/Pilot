/* ==============================================
-> select by magic number [choose not opened position(repeated) for trade]
============================================== */
int ordersSelect(int magicBuy=1011, int magicSell=2011){
   int num=0;
   for(int i=OrdersTotal()-1;i>=0;i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
         if(OrderMagicNumber()==magicBuy || OrderMagicNumber()==magicSell) num++;
     }
   return(num);
}
