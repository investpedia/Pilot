
/* =========================================
-> last closed BUY
========================================= */    
int lastClosedBuy(int magic){  
   for(int i=OrdersHistoryTotal()-1;i>=0;i--)
    {
     int ord= OrderSelect(i, SELECT_BY_POS,MODE_HISTORY);
      if(OrderSymbol()==Symbol() && OrderMagicNumber()==magic)
       {
          //for buy order
          if((OrderType()==OP_BUY || OrderType()==OP_BUYSTOP || OrderType()==OP_BUYLIMIT) && 
             OrderProfit()>0) return(1); // takeprofit
          if((OrderType()==OP_BUY || OrderType()==OP_BUYSTOP || OrderType()==OP_BUYLIMIT) && 
             OrderProfit()<0) return(0); // stoploss
       }
    } 
   return(-1); 
}  
