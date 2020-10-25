
//+------------------------------------------------------------------+
//| کانال رگرسیون(Linear Regression Channel)                         |
//+------------------------------------------------------------------+

bool Linear_Regression_Channel(const long   chart_ID=0,// ای دی چارت
                               const string          name="Regression", // اسم کانال
                               const int             sub_window=0,      // شماره پنجره
                               datetime              time1=0,           // اول نقطه کانال زمان
                               datetime              time2=0,           // دومین نقطه کانال زمان
                               const color           clr=clrRed,        // رنگ کانال
                               const ENUM_LINE_STYLE style=STYLE_SOLID, // استایل خطوط کانال
                               const int             width=1,           // اندازه خط کانال
                               const bool            fill=false,        // پر کردن کانال با رنگ
                               const bool            back=false,        // قرار گرفتن در پشت
                               const bool            selection=true,    // قابلیت حرکت
                               const bool            ray_right=false,   // ادامه دار بودن کانال
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
      ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);
      ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
      ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
      ChartRedraw();
      return(true);
        }else{
      if(ObjectCreate(chart_ID,name,OBJ_REGRESSION,sub_window,time1,0,time2,0))
        {
         ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
         ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
         ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width);
         ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
         ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
         ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
         ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right);
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