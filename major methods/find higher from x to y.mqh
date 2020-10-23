/* ==============================================
-> find higher candle from x to y 
============================================== */
int theHigher(int from=0, int to=10, int period=1){
   double highestCandle,high[];
   ArraySetAsSeries(high,true);
   CopyHigh(_Symbol,period,from,to,high);
   highestCandle = ArrayMaximum(high,from,to);
   return((int)highestCandle);
}
/*
PERIOD_CURRENT = 0
PERIOD_M1      = 1
PERIOD_M5      = 5
PERIOD_M15     = 15
PERIOD_M30     = 30
PERIOD_H1      = 60
PERIOD_H4      = 240
PERIOD_D1      = 1440
PERIOD_W1      = 10080
PERIOD_MN1     = 43200
*/
