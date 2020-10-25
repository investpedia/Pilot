
//+------------------------------------------------------------------+
//| تصویر از نوع تیکت(Bitmap Label)                                  |
//+------------------------------------------------------------------+
bool Bitmap_Label(const long              chart_ID=0,// ای دی چارت
                  const string            name="BmpLabel",          // اسم
                  const int               sub_window=0,             // شماره پنجره
                  const int               x=0,                      // X مختصات 
                  const int               y=0,                      // Y مختصات
                  const string            file_on="",               // عکس زمان روشن
                  const string            file_off="",              // عکس زمان خواموش
                  const int               width=0,                  // عرض
                  const int               height=0,                 // ارتفاع
                  const int               x_offset=10,              // X فاصله از محوره 
                  const int               y_offset=10,              // Y فاصله از محوره
                  const bool              state=false,              // کلیک شده / کلیک نشده
                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // انتخاب گوشه چارت
                  const ENUM_ANCHOR_POINT anchor=ANCHOR_LEFT_UPPER, // نقطه اتکا  
                  const color             clr=clrRed,               // رنگ کادر (زمان کلیک)
                  const ENUM_LINE_STYLE   style=STYLE_SOLID,        // استایل کادر(زمان کلیک)
                  const int               point_width=1,            // اندازه نقطه حرکت
                  const bool              back=false,               // قرار گرفتن در پشت
                  const bool              selection=false,          // قابلیت حرکت
                  const bool              hidden=true,              // مخفی شدن از لیست
                  const long              z_order=0)                //  اولویت برای کلیک ماوس
  {
   ResetLastError();
   if(ObjectFind(name)==sub_window) // در صورت وجود داشتن ابجیکت
     {
      ObjectSetString(chart_ID,name,OBJPROP_BMPFILE,0,file_on);
      ObjectSetString(chart_ID,name,OBJPROP_BMPFILE,1,file_off);
      ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
      ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
      ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
      ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
      ObjectSetInteger(chart_ID,name,OBJPROP_XOFFSET,x_offset);
      ObjectSetInteger(chart_ID,name,OBJPROP_YOFFSET,y_offset);
      ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
      ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
      ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
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
      if(ObjectCreate(chart_ID,name,OBJ_BITMAP_LABEL,sub_window,0,0))
        {
         ObjectSetString(chart_ID,name,OBJPROP_BMPFILE,0,file_on);
         ObjectSetString(chart_ID,name,OBJPROP_BMPFILE,1,file_off);
         ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
         ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
         ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
         ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
         ObjectSetInteger(chart_ID,name,OBJPROP_XOFFSET,x_offset);
         ObjectSetInteger(chart_ID,name,OBJPROP_YOFFSET,y_offset);
         ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
         ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
         ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,anchor);
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



برای انتخاب گوشه یکی از این چهار نوع میتواند انتخاب شود 
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