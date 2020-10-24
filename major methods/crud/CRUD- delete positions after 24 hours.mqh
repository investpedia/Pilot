/* ==============================================
  delete position by magic for last day (24 hour)
============================================== */
void deleteOrders(int magicBuy=1011, int magicSell=2011, int theSlipPage=5)
 {
   for(int i=OrdersTotal()-1;i>=0;i--)
    {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
       {
         if(OrderMagicNumber()==magicBuy || OrderMagicNumber()==magicSell)
          {
            if(TimeDay(OrderOpenTime())!=Day())
             {
               if(OrderType()==OP_BUYLIMIT|| OrderType()==OP_SELLLIMIT)
               bool delorder=OrderDelete(OrderTicket(),clrWhite);
               if(OrderType()==OP_BUY || OrderType()==OP_SELL)
               bool closeorder=OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),theSlipPage,clrGreen);
            
             }
          }
      }
    }
 }
