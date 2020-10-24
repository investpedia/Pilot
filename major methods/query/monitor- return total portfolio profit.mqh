/* ==============================================
 total portfolio profit
============================================== */
double totalPortfolio(double buy,double sell){
   double total=0;
   double amount=AccountEquity();
   total = (sell-buy)*amount;
   return(total);
}