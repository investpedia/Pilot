
//+------------------------------------------------------------------+
//| تصویر(Bitmap)                                                     |
//+------------------------------------------------------------------+
bool Bitmap(const long                 chart_ID=0,// ای دی چارت
            const string          name="Bitmap",     // اسم
            const int             sub_window=0,      // شماره پنجره
            datetime              time=0,            // نقطه زمان
            double                price=0,           // نقطه قیمت
            const string          file="",           //  ادرس عکس
            const int             width=10,          //  عرض  
            const int             height=10,         // ارتفاع 
            const int             x_offset=0,        // X فاصله از محوره 
            const int             y_offset=0,        // Y فاصله از محوره
            const color           clr=clrRed,        // رنگ کادر (زمان کلیک)
            const ENUM_LINE_STYLE style=STYLE_SOLID, // استایل کادر(زمان کلیک)
            const int             point_width=1,     // اندازه نقطه حرکت
            const bool            back=false,        // قرار گرفتن در پشت
            const bool            selection=false,   // قابلیت حرکت
            const bool            hidden=false,// مخفی شدن از لیست
            const long            z_order=0) // اولویت برای کلیک ماوس
  {
   ResetLastError();
   if(ObjectFind(name)==sub_window) // در صورت وجود داشتن ابجیکت
     {
      ObjectSetString(chart_ID,name,OBJPROP_BMPFILE,file);
      ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
      ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
      ObjectSetInteger(chart_ID,name,OBJPROP_XOFFSET,x_offset);
      ObjectSetInteger(chart_ID,name,OBJPROP_YOFFSET,y_offset);
      ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
      ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,point_width);
      ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
      ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
      ChartRedraw();
      return(true);
        }else{
      if(ObjectCreate(chart_ID,name,OBJ_BITMAP,sub_window,time,price))
        {
         ObjectSetString(chart_ID,name,OBJPROP_BMPFILE,file);
         ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
         ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
         ObjectSetInteger(chart_ID,name,OBJPROP_XOFFSET,x_offset);
         ObjectSetInteger(chart_ID,name,OBJPROP_YOFFSET,y_offset);
         ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
         ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style);
         ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,point_width);
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
//|                                                                  |
//+------------------------------------------------------------------+
/*
ادرس عکس به صورت زیر نوشته میشود
عکس حتما باید با بسوند بی ام پی باشد
\\Images\\images.bmp
*/
