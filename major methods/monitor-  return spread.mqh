/* **********************************************
                     spread
********************************************** */
// spread
double theSpread(){
   double lowSpread  =100000;
   double highSpread =0;
   int currentSpread = (int)SymbolInfoInteger(_Symbol,SYMBOL_SPREAD);
   if(currentSpread<lowSpread)
     {
      lowSpread=currentSpread;
      return(lowSpread);
     }
   if(currentSpread>highSpread)
     {
      highSpread=currentSpread;
      return(highSpread);
     }
   return(currentSpread);
}