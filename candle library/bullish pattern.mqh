    
#property strict

// MAIN VARIABLES
double O, O1, O2, H, H1, H2, L, L1, L2, C, C1, C2;
double AvgBody,AvgBody2,AvgBody3,MidPoint,MidPoint1,MidPoint2,AverageBodySize,Body,HighLow,body_size,candle_range,Price,PriceBack3;

/*=========================================
||          Bullish Refrences            ||
=========================================*/
// *** Bullish Refrences ***
// Bullish Engulfing
bool cBullishEngulfing(int candleNum=0){
   O=(Open[candleNum]);
   O1=(Open[candleNum+1]);
   C=(Close[candleNum]);
   C1=(Close[candleNum+1]);
   if( ((O1>C1) && (C>O) && (C>=O1) && (C1>=O) && ((C-O)>(O1-C1))) ) return(true);
   return(false);
}

// Bullish Harami
bool cBullishHarami(int candleNum=0){
   O=(Open[candleNum]);
   O1=(Open[candleNum+1]);
   C=(Close[candleNum]);
   C1=(Close[candleNum+1]);
   if( (O1>C1) && (C>O) && (C<=O1) && (C1<=O) && ((C-O)<(O1-C1)) ) return(true);
   return(false);
}

// Bullish Three Inside Up
bool cBullishThreeInsideUp(int candleNum=0){
if((Low[candleNum+4] <Low[candleNum+5]) &&
   (Low[candleNum+3] <Low[candleNum+4]) &&
   (High[candleNum+2]<High[candleNum+3]) &&
   (Low[candleNum+2] >Low[candleNum+3]) &&
   (High[candleNum]  >High[candleNum+2])) return(true);
   return(false);
}

// Tweezer Bottoms
bool cTweezerBottoms(int candleNum=0){
   if((Open[candleNum+1]==Close[candleNum]) &&
     (Close[candleNum]>Open[candleNum])) return(true);
   return(false);
}

// Morning Star
bool cMorningStar(int candleNum=0){
   if((Close[candleNum+2]<Open[candleNum+2]) &&
     (Close[candleNum+1]<Open[candleNum+1] || Close[candleNum+1]>Open[candleNum+1]) &&
     (Close[candleNum+1]<Close[candleNum+2]) &&
     (Open[candleNum+1]<Close[candleNum+2]) &&
     (Close[candleNum]>Open[candleNum]) &&
     (Open[candleNum]>Close[candleNum+1]) &&
     (Open[candleNum]>Open[candleNum+1])) return(true);
   return(false);
}

// Bullish Railway Track
bool cBullishRailwayTrack(int candleNum=0){
   if((Close[candleNum+1]<Open[candleNum+1]) &&
     (Open[candleNum]>Close[candleNum]) && 
     (Open[candleNum+1]==Open[candleNum]) && 
     (Close[candleNum+1]==Close[candleNum])) return(true);
   return(false);
}

// Piercing Line
bool cPiercingLine(int candleNum=0){
   MidPoint1=(High[candleNum+1]+Low[candleNum+1])/2;
   if((Close[candleNum+1]<Open[candleNum+1]) &&
     (Close[candleNum]>Open[candleNum]) && 
     (Open[candleNum]<Close[candleNum+1]) && 
     (Close[candleNum]>MidPoint1)) return(true);
   return(false);
}

// Bullish Homing Pidgeon
bool cBullishHomingPidgeon(int candleNum=0){
   if((Close[candleNum+1]<Open[candleNum+1]) && 
      (Close[candleNum]<Open[candleNum]) && 
      (High[candleNum]<High[candleNum+1]) && 
      (Low[candleNum]>Low[candleNum+1]) && 
      (Open[candleNum]<Open[candleNum+1]) && 
      (Close[candleNum]>Close[candleNum+1])) return(true);
   return(false);
   
}

