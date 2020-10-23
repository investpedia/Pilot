/* ==============================================
-> day filter
============================================== */
bool weekDayFilter(){
   int weekDayNumber = DayOfWeek();
   if(weekDayNumber==6 || weekDayNumber==0)
     {
      return(false);
     }
   else{ return(true);}
}
