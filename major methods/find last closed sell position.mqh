
/* =========================================
-> last closed SELL
========================================= */ 
int lastClosedSell(int magic){  
   for(int i=OrdersHistoryTotal()-1;i>=0;i--)
    {
     int ord= OrderSelect(i, SELECT_BY_POS,MODE_HISTORY);
      if(OrderSymbol()==Symbol() && OrderMagicNumber()==magic)
       {
          //for buy order
          if((OrderType()==OP_SELL || OrderType()==OP_SELLSTOP || OrderType()==OP_SELLLIMIT) && 
             OrderProfit()>0) return(1); // takeprofit
          if((OrderType()==OP_SELL || OrderType()==OP_SELLSTOP || OrderType()==OP_SELLLIMIT) && 
             OrderProfit()<0) return(0); // stoploss
       }
    } 
   return(-1); 
}  
  