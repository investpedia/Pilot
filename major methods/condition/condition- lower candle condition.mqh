/* ==============================================
-> if candle 0 <= candle 7 = return true (in daily candles) 
============================================== */
bool imLower(int count=7){
   if(iHigh(Symbol(),PERIOD_D1,1)<=iLow(Symbol(),PERIOD_D1,count)) return(true);
   return(false);
} 
