/*************************************
*  Liberary name: variable of trade  *
*     for all projects of trade      *
*              mosi pvp              *
*************************************/

// OP_BUY  = Ask \\ OP_SELL = Bid 
double buyStopLoss(double loss){
   double state = Ask-(loss*Point); // buyStop
   return(state);
}
double buyProfit(double profit){
   double state  = Ask+(profit*Point); // buyTakeProfit
   return(state);
}   
double sellStopLoss(double loss){
   double state   = Bid+(loss*Point); // sellStop
   return(state);
}
double sellProfit(double profit){
   double state = Bid-(profit*Point); // sellTakeProfit
   return(state);
}
   
// OP_SELLLIMIT , OP_SELLSTOP , OP_BUYLIMIT , OP_BUYSTOP
double buyLimit(double range){
   double state = Ask-(range*Point); // buyLimit
   return(state);
}
double sellLimit(double range){
   double state= Bid+(range*Point); // sellLimit
   return(state);
}
double buyStop(double range){
   double state  = Ask+(range*Point); // buyStop
   return(state);
}
double sellStop(double range){
   double state = Bid-(range*Point); // sellStop
   return(state);
}
/*   
// thePrice =  buyLimitRange || sellLimitRange || buyStopRange || sellStopRange |OR| Ask || Bid
   double thePrice    = 0;   
   double lossBuyX    =  thePrice-(50*Point); // buyStop & buyLimit 
   double profitBuyX  =  thePrice+(50*Point); // buyStop & buyLimit
   double lossSellX   =  thePrice+(50*Point); // sellStop & sellLimit 
*/ 

// Ask/Bid price
double askPrice(){
   double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   return(state);
}
double bidPrice(){
   double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   return(state);
}
// Ask/Bid price override [high OR low]
double askPrice(string which){
   if(which=="high")
     {
      double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASKHIGH),_Digits);
      return(state);
     }
   else if(which=="low")
     {
      double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASKLOW),_Digits);
      return(state);
     }
   else
     {
      double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
      return(state);
     }
}
double bidPrice(string which){
   if(which=="high")
     {
      double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BIDHIGH),_Digits);
      return(state);
     }
   else if(which=="low")
     {
      double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BIDLOW),_Digits);
      return(state);
     }
   else
     {
      double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
      return(state);
     }
}
