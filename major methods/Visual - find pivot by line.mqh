/* ==============================================
-> find pivot BY LINE
============================================== */
void pivotLine(int where=100,bool output=true){
   int highestCandle = iHighest(_Symbol,_Period,MODE_HIGH,where,0);
   int lowestCandle  = iLowest(_Symbol,_Period,MODE_LOW,where,0);
   RefreshRates();
   ObjectDelete("lineUP");
   ObjectDelete("lineDOWN");
   
   ObjectCreate("lineUP",OBJ_HLINE,0,Time[0],High[highestCandle]);
   ObjectCreate("lineDOWN",OBJ_HLINE,0,Time[0],Low[lowestCandle]);
   /*
   if(output)
     {
      Print("Highest Price: ",High[highestCandle]," _ number: ",highestCandle
          ,"\n Lowest Price: ",Low[lowestCandle]," _ number: ",lowestCandle);
     } */  
}
