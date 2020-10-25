
//+------------------------------------------------------------------+
//| کادر نوشته(Edit)                                                 |
//+------------------------------------------------------------------+
bool Edit(const long                  chart_ID=0,// ای دی چارت
          const string           name="Edit",              // اسم
          const int              sub_window=0,             // شماره پنجره
          const int              x=0,                      // X مختصات 
          const int              y=0,                      // Y مختصات
          const int              width=50,                 // عرض
          const int              height=18,                // ارتفاع
          const string           text="Text",              // متن
          const string           font="Arial",             // فونت
          const int              font_size=10,             // اندازه فونت
          const ENUM_ALIGN_MODE  align=ALIGN_CENTER,       // نوع تراز
          const bool             read_only=false,          // فقط قابل خواندن
          const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // انتخاب گوشه چارت
          const color            clr=clrBlack,             // رنگ نوشته
          const color            back_clr=clrWhite,        // رنگ پشن نوشته
          const color            border_clr=clrNONE,       // رنگ کادر
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
      ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
      ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
      ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
      ObjectSetInteger(chart_ID,name,OBJPROP_ALIGN,align);
      ObjectSetInteger(chart_ID,name,OBJPROP_READONLY,read_only);
      ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
      ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
      ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
      ChartRedraw();
      return(true);
        }else{
      if(ObjectCreate(chart_ID,name,OBJ_EDIT,sub_window,0,0))
        {
         ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
         ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
         ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
         ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
         ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
         ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
         ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
         ObjectSetInteger(chart_ID,name,OBJPROP_ALIGN,align);
         ObjectSetInteger(chart_ID,name,OBJPROP_READONLY,read_only);
         ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
         ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
         ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
         ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
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