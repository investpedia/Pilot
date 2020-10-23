/* ==============================================
-> Margin Monitor
============================================== */
bool stopByMargin(){
   if(myMargin()<=0)
     {
      //MessageBox("the account margin is zero, stop trading.","Margin Error");
      return(true);
     }else{return(false);}
}