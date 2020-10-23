/* ==============================================
make symbol standard name for all brokers
============================================== */
string symbolName(){
   string symbolX=Symbol();
   string symbolY=StringSubstr(symbolX,0,6);
   string symbolZ=StringSubstr(symbolY,6);
   return(symbolY+symbolZ);
}
