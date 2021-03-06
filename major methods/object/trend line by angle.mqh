
//+------------------------------------------------------------------+
//| خط ترند با زاویه(Trend Line By Angle)                            |
//+------------------------------------------------------------------+

bool Trend_Line_By_Angle(const long           chart_ID=0,// ای دی چارت
                         const string          name="TrendLine",  // اسم خط
                         const int             sub_window=0,      // شماره پنجره
                         datetime              time=0,            // اولین نقطه زمان
                         double                price=0,           // اولین نفطه قیمت
                         const double          angle=45.0,        // مقدار زاویه
                         const color           clr=clrRed,        // رنگ خط
                         const ENUM_LINE_STYLE style=STYLE_SOLID, // استایل خط
                         const int             width=1,           // اندازه خط
                         const bool            back=false,        // قرار گرفتن در پشت
                         const bool            selection=true,    // قابلیت حرکت
                         const bool            ray_right=true,    // ادامه دار بودن خط
                         const bool            hidden=true,       // مخفی شدن از لیست
                         const long            z_order=0)         // اولویت برای کلیک ماوس
  {
   datetime time2=0;
   double   price2=0;
   ResetLastError();
   if(ObjectFind(name)==sub_window) // در صورت وجود داشتن ابجیکت
     {
      ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
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
      if(ObjectCreate(chart_ID,name,OBJ_TRENDBYANGLE,sub_window,time,price,time2,price2))
        {
         ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
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