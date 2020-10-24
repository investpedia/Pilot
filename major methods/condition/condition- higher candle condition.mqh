/* ==============================================
-> if candle 0 >= candle 21 = return true (in daily candles) 
============================================== */
bool imHigher(int count=21){
   if(iLow(Symbol(),PERIOD_D1,1)>=iHigh(Symbol(),PERIOD_D1,count)) return(true);
   return(false);
} 
