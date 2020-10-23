/* ==============================================
-> first if by this function
============================================== */

bool startByVolume(int chartPeriod = 0){
   if(iVolume(Symbol(),chartPeriod,0)>=1) return(true);
   return(false);
}
// ENUM_TIMEFRAMES : current=0, 1M=1, ...
