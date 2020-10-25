
//+------------------------------------------------------------------+
//| رویداد(Event)                                                    |
//+------------------------------------------------------------------+
bool Event(const long                  chart_ID=0,//  ای دی چارت
           const string          name="Event",    // اسم
           const int             sub_window=0,    // شماره پنجره
           const string          text="Text",     // متن
           datetime              time=0,          // نقطه زمان
           const color           clr=clrRed,      // رنگ
           const int             width=1,         // اندازه(زمان انتخاب)
           const bool            back=false,      // قرار گرفتن در پشت
           const bool            selection=false, // قابلیت حرکت
           const bool            hidden=true,     // مخفی شدن از لیست
           const long            z_order=0)       // اولویت برای کلیک ماوس
  {
   ResetLastError();
   if(ObjectFind(name)==sub_window) // در صورت وجود داشتن ابجیکت
     {
      ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
      ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
      ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
      ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
      ChartRedraw();
      return(true);
        }else{
      if(ObjectCreate(chart_ID,name,OBJ_EVENT,sub_window,time,0))
        {
         ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
         ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
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