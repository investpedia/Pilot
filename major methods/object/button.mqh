
//+------------------------------------------------------------------+
//| دکمه(Button)                                                     |
//+------------------------------------------------------------------+

bool Button(const long                    chart_ID=0,// ای دی چارت
            const string            name="Button",            // اسم
            const int               sub_window=0,             // شماره پنجره
            const int               x=0,                      // X فاصله محور
            const int               y=0,                      // Y فاصله محور
            const int               width=50,                 // عرض دکمه
            const int               height=18,                // ارتفاع دکمه
            const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // انتخاب گوشه چارت
            const string            text="Button",            // نوشته درون دکمه
            const string            font="Arial",             // فونت
            const int               font_size=10,             // سایز فونت
            const color             clr=clrBlack,             // رنگ نوشته
            const color             back_clr=C'236,233,216',  // رنگ دکمه
            const color             border_clr=clrNONE,       // رنگ کادر دکمه
            const bool              state=false,              // حالت دکمه ،کلیک شده / کلیک نشده
            const bool              back=false,               // قرار گرفتن در پشت
            const bool              selection=false,          // قابلیت حرکت
            const bool              hidden=true,              // مخفی شدن از لیست
            const long              z_order=0)                // اولویت برای کلیک ماوس
  {
   ResetLastError();
   if(ObjectFind(name)==sub_window) // در صورت وجود داشتن ابجیکت
     {
      ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
      ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
      ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
      ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
      ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
      ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
      ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
      ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
      ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
      ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
      ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
      ChartRedraw();
      return(true);
        }else{
      if(ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0))
        {
         ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
         ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
         ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
         ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
         ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
         ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
         ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
         ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
         ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
         ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
         ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);
         ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
         ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
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
برای انتخاب گوشه یکی از این چهار نوع میتواند انتهاب شود 
CORNER_LEFT_UPPER             سمت چپ بالا
CORNER_LEFT_LOWER             سمت چپ پایین
CORNER_RIGHT_LOWER            سمت راست پایین
CORNER_RIGHT_UPPER            سمت راست بالا
*/
