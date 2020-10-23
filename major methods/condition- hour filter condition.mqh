           
/* =========================================
-> hourFilter()  \\ filter which hour to work
========================================= */
bool hourFilter(int theTimeStart=1, int theTimeEnd=24){
   if(Hour()>=theTimeStart && Hour()<=theTimeEnd)
     {
      return(true);
     }
   else{ return(false);}
}
