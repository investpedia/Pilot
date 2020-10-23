/* ==============================================
-> find average candle(price) from x to y 
============================================== */
double theAverage(int from=0, int to=10, int period=1){
   MqlRates PriceInformation[];
   ArraySetAsSeries(PriceInformation,true);
   int Data= CopyRates(Symbol(),Period(),from,Bars(Symbol(),Period()),PriceInformation);
   double theHigh = PriceInformation[theHigher(from,to,period)].high;
   double theLow = PriceInformation[theLower(from,to,period)].low;
   double Average = NormalizeDouble(((theHigh+theLow)/2),6);
   return(Average);
} 
