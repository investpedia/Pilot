
//+------------------------------------------------------------------+
//| اتیکت(Label)                                                     |
//+------------------------------------------------------------------+

bool Label(const long                    chart_ID=0,// ای دی چارت
           const string            name="Label",             // اسم
           const int               sub_window=0,             // شماره پنجره
           const int               x=0,                      // X فاصله محور
           const int               y=0,                      // Y فاصله محور
           const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // انتخاب گوشه چارت
           const string            text="Label",             // متن
           const string            font="Arial",             // فونت
           const int               font_size=10,             // اندازه فونت
           const color             clr=clrRed,               // رنگ
           const double            angle=0.0,                // زاویه نوشته
           const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // نقطه اتکا نوشته
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
      ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
      ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
      ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
      ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
      ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
      ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
      ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
      ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
      ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
      ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
      ChartRedraw();
      return(true);
        }else{
      if(ObjectCreate(chart_ID,name,OBJ_LABEL,sub_window,0,0))
        {
         ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
         ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
         ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
         ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
         ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
         ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
         ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,angle);
         ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
         ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
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
برای انتخاب گوشه یکی از این چهار نوع میتواند انتهاب شود 
CORNER_LEFT_UPPER             سمت چپ بالا
CORNER_LEFT_LOWER             سمت چپ پایین
CORNER_RIGHT_LOWER            سمت راست پایین
CORNER_RIGHT_UPPER            سمت راست بالا



برای نقاط اتکا میتوانید یکی از موارد زیر انتخاب شود

ANCHOR_LEFT_UPPER          چپ بالا
ANCHOR_LEFT                چپ
ANCHOR_LEFT_LOWER          چپ پایین
ANCHOR_LOWER               پایین
ANCHOR_RIGHT_LOWER         راست پایین
ANCHOR_RIGHT               راست
ANCHOR_RIGHT_UPPER         راست بالا
ANCHOR_UPPER               بالا
ANCHOR_CENTER              مرکز
*/
