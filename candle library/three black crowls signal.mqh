  
#property strict

// MAIN VARIABLES
double O, O1, O2, H, H1, H2, L, L1, L2, C, C1, C2;
double AvgBody,AvgBody2,AvgBody3,MidPoint,MidPoint1,MidPoint2,AverageBodySize,Body,HighLow,body_size,candle_range,Price,PriceBack3;

/*=========================================
||       Crows Signal Refrences          ||
=========================================*/
// Three Black Crows
//---good signal but needs end to repeating
bool cThreeBlackCrows(int candleNum=0){
   AvgBody=    (Open[candleNum]-Close[candleNum]);
   AvgBody2=   (Open[candleNum+1]-Close[candleNum+1]);
   AvgBody3=   (Open[candleNum+2]-Close[candleNum+2]);
   MidPoint=   (High[candleNum]+Low[candleNum])/2;
   MidPoint1=  (High[candleNum+1]+Low[candleNum+1])/2;
   MidPoint2=  (High[candleNum+2]+Low[candleNum+2])/2;
   if((Close[candleNum+2]-Open[candleNum+2]<AvgBody3) && 
      (Close[candleNum+1]-Open[candleNum+1]<AvgBody2) && 
      (Close[candleNum]-Open[candleNum]<AvgBody) && 
      (MidPoint1<MidPoint2) && 
      (MidPoint<MidPoint2)) return(true);
   return(false);
}
