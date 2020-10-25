
//+------------------------------------------------------------------+
//| مستطیل گرافیکی(Rectangle label)                                  |
//+------------------------------------------------------------------+

bool Rectangle_label(const long             chart_ID=0,               // ای دی چارت
                     const string           name="RectLabel",         // اسم
                     const int              sub_window=0,             // شماره پنجره
                     const int              x=0,                      // X مختصات 
                     const int              y=0,                      // Y مختصات
                     const int              width=50,                 // عرض
                     const int              height=18,                // ارتفاع
                     const color            back_clr=C'236,233,216',  // رنگ پس زمینه
                     const ENUM_BORDER_TYPE border=BORDER_SUNKEN,     // نوع خط کادر
                     const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // انتخاب گوشه چارت
                     const color            clr=clrRed,               // رنگ کادر
                     const ENUM_LINE_STYLE  style=STYLE_SOLID,        // استایل کادر
                     const int              line_width=1,             // اندازه کادر
                     const bool             back=false,               // قرار گرفتن در پشت
                     const bool             selection=false,          // قابلیت حرکت
                     const bool             hidden=true,              // مخفی شدن از لیست
                     const long             z_order=0)                // اولویت برای کلیک ماوس
  {
   ResetLastError();
   if(ObjectFind(name)==sub_window) // در صورت وجود داشتن ابجیکت
     {
      ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
      ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
      ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
      ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
      ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_TYPE,border);
      ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
      ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
      ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,line_width);
      ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
      ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
      ChartRedraw();
      return(true);
        }else{
      if(ObjectCreate(chart_ID,name,OBJ_RECTANGLE_LABEL,sub_window,0,0))
        {
         ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
         ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
         ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
         ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
         ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
         ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_TYPE,border);
         ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
         ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
         ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
         ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,line_width);
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
//+------------------------------------------------------------------+
