   
#property strict

// MAIN VARIABLES
double O, O1, O2, H, H1, H2, L, L1, L2, C, C1, C2;
double AvgBody,AvgBody2,AvgBody3,MidPoint,MidPoint1,MidPoint2,AverageBodySize,Body,HighLow,body_size,candle_range,Price,PriceBack3;

/*=========================================
||          Bearish Refrences            ||
=========================================*/
// *** Bearish Refrences ***
// Bearish Three Side Down
bool cBearishThreeSideDown(int candleNum=0){
   if((High[candleNum+4]>High[candleNum+5]) && 
      (High[candleNum+3]>High[candleNum+4]) && 
      (High[candleNum+2]<High[candleNum+3]) && 
      (Low[candleNum+2]>Low[candleNum+3]) && 
      (Low[candleNum]<Low[candleNum+2])) return(true);
   return(false);
}

// Tweezer Tops
bool cTweezerTops(int candleNum=0){
   if((Open[candleNum+1]==Close[candleNum]) && (Close[candleNum]<Open[candleNum])) 
      return(true);
   return(false);
}

// Evening Star
bool cEveningStar(int candleNum=0){
   if((Close[candleNum+2]>Open[candleNum+2]) && 
      (Close[candleNum+1]>Open[candleNum+1] || Close[candleNum+1]<Open[candleNum+1]) && 
      (Close[candleNum+1]>Close[candleNum+2]) && 
      (Open[candleNum+1]>Close[candleNum+2]) && 
      (Close[candleNum]<Open[candleNum]) && 
      (Open[candleNum]<Close[candleNum+1]) && 
      (Open[candleNum]<Open[candleNum+1])) return(true);
   return(false);
}

// Bearish Railway Track
bool cBearishRailwayTrack(int candleNum=0){
   if((Close[candleNum+1]>Open[candleNum+1]) && 
      (Open[candleNum]<Close[candleNum]) && 
      (Open[candleNum+1]==Open[candleNum]) && 
      (Close[candleNum+1]==Close[candleNum])) return(true);
   return(false);
}

// Dark Cloud Cover
bool cDarkCloudCover(int candleNum=0){
   MidPoint1=(High[candleNum+1]+Low[candleNum+1])/2;
   if((Close[candleNum+1]>Open[candleNum+1]) && 
      (Close[candleNum]<Open[candleNum]) && 
      (Open[candleNum]>Close[candleNum+1]) && 
      (Close[candleNum]<MidPoint1)) return(true);
   return(false); //--Piercing Line Bearish
}

// Bearish Hawk
bool cBearishHawk(int candleNum=0){
   if((Close[candleNum+1]>Open[candleNum+1]) && 
      (Close[candleNum]>Open[candleNum]) && 
      (High[candleNum]>High[candleNum+1]) && 
      (Low[candleNum]<Low[candleNum+1]) && 
      (Open[candleNum]>Open[candleNum+1]) && 
      (Close[candleNum]<Close[candleNum+1])) return(true);
   return(false);//---BullishHomingPidgeon
}

     