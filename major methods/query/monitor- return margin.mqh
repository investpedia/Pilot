/* ==============================================
-> Margin Monitor
============================================== */
double myMargin(){
   double theMargin   = AccountInfoDouble(ACCOUNT_MARGIN);
   double freeMargin  = AccountInfoDouble(ACCOUNT_MARGIN_FREE);
   double totalMargin = theMargin-freeMargin;
   return(totalMargin);
}
