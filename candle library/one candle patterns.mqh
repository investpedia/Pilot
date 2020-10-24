
#property strict

// MAIN VARIABLES
double O, O1, O2, H, H1, H2, L, L1, L2, C, C1, C2;
double AvgBody,AvgBody2,AvgBody3,MidPoint,MidPoint1,MidPoint2,AverageBodySize,Body,HighLow,body_size,candle_range,Price,PriceBack3;

/*=========================================
||       Patterns {one candle}           ||
=========================================*/
//Bullish -> one candle
bool cBullish(int candleNum=0){
   body_size = Close[candleNum] - Open[candleNum];
   if(body_size <= 0)                    
      return(false); // reject (a bearish or doji candle)
   return(true);
}

//Bearish -> one candle
bool cBearish(int candleNum=0){
   body_size = Open[candleNum] - Close[candleNum];
   if(body_size <= 0)                    
      return(false); // reject (a bullish or doji candle)
   return(true);
}

// Doji >>normal -> one candle
bool cDojiNormal(int candleNum=0){
   if(Open[candleNum]==Close[candleNum]) 
      return(true);
   return(false);
}

//Hammer -> one candle
bool cBullishHammer(int i) 
  {
   body_size = Close[i] - Open[i];
   if(body_size <= 0)                    
      return(false); // reject (a bearish or doji candle)
   candle_range = High[i] - Low[i];
   if(body_size < candle_range/3)        
      return(false); // reject (body is less than 1/3)
   if(Open[i] < Low[i] + candle_range/2) 
      return(false); // reject (body is in lower 1/2)
   return(true);
}

//ShotingStar -> one candle
bool cBearishHammer(int i) 
  {
   body_size = Open[i] - Close[i];
   if(body_size <= 0)                    
      return(false); // reject (a bullish or doji candle)
   candle_range = High[i] - Low[i];
   if(body_size < candle_range/3)        
      return(false); // reject (body is less than 1/3)
   if(Open[i] > Low[i] + candle_range/2) 
      return(false); // reject (body is in upper 1/2)
   return(true);
}

   