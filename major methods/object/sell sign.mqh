
//+------------------------------------------------------------------+
//| نشانه فروش(Sell Sign)                                            |
//+------------------------------------------------------------------+ 

bool Sell_Sign(const long                 chart_ID=0,//ای دی چارت
               const string          name="ArrowSell",  // اسم
               const int             sub_window=0,      // شماره پنجره
               datetime              time=0,            // نقطه زمان
               double                price=0,           // نقطه قمیت
               const color           clr=C'3,95,172',   // رنگ
               const ENUM_LINE_STYLE style=STYLE_SOLID, // استایل  (وقتی برجسته شود)
               const int             width=1,           // سایز  (وقتی برجسته شود)
               const bool            back=false,        // قرار گرفتن در پشت
               const bool            selection=false,   // قابلیت حرکت
               const bool            hidden=true,       // مخفی شدن از لیست
               const long            z_order=0)         // اولویت برای کلیک ماوس
  {
   ResetLastError();
   if(ObjectFind(name)==sub_window) // در صورت وجود داشتن ابجیکت
     {
      ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
      ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
      ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
      ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
      ChartRedraw();
      return(true);
        }else{
      if(ObjectCreate(chart_ID,name,OBJ_ARROW_SELL,sub_window,time,price))
        {
         ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
         ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
         ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
         ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
         ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
         ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
         ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
         ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
         ChartRedraw();
         return(true);
        }
      else
        {
         Print(__FUNCTION__,
               ": failed to create => ",name," object! Error code = ",GetLastError());
         return(false);
        }
     }
  }