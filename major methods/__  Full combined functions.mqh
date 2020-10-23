//+------------------------------------------------------------------+
//|                                                    functions.mqh |
//|                                    mosipvp 2020, Trade Framework |
//|                                 https://www.youtube.com/pafecafe |
//+------------------------------------------------------------------+
#property copyright "mosipvp 2020, Trade Framework"
#property link      "https://www.youtube.com/channel/UCLZCGzMSw6u3Jvxuc-17BsQ/"
#property version   "2.01"
#property description "mosipvp@gmail.com"
#property strict
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+

/* ==============================================
make symbol standard name for all brokers
============================================== */
string symbolName(){
   string symbolX=Symbol();
   string symbolY=StringSubstr(symbolX,0,6);
   string symbolZ=StringSubstr(symbolY,6);
   return(symbolY+symbolZ);
}

/* ==============================================
-> first if by this function
============================================== */

bool startByVolume(int chartPeriod = 0){
   if(iVolume(Symbol(),chartPeriod,0)>=1) return(true);
   return(false);
}
// ENUM_TIMEFRAMES : current=0, 1M=1, ...


/* ==============================================
-> if candle 0 >= candle 21 = return true (in daily candles) 
============================================== */
bool imHigher(int count=21){
   if(iLow(Symbol(),PERIOD_D1,1)>=iHigh(Symbol(),PERIOD_D1,count)) return(true);
   return(false);
} 

/* ==============================================
-> if candle 0 <= candle 7 = return true (in daily candles) 
============================================== */
bool imLower(int count=7){
   if(iHigh(Symbol(),PERIOD_D1,1)<=iLow(Symbol(),PERIOD_D1,count)) return(true);
   return(false);
} 


/* ==============================================
-> find higher candle from x to y 
============================================== */
int theHigher(int from=0, int to=10, int period=1){
   double highestCandle,high[];
   ArraySetAsSeries(high,true);
   CopyHigh(_Symbol,period,from,to,high);
   highestCandle = ArrayMaximum(high,from,to);
   return((int)highestCandle);
}


/* ==============================================
-> find lower candle from x to y 
============================================== */
int theLower(int from=0, int to=10, int period=1){
   double lowestCandle,low[];
   ArraySetAsSeries(low,true);
   CopyLow(_Symbol,period,from,to,low);
   lowestCandle = ArrayMaximum(low,from,to);
   return((int)lowestCandle);
} 
/*
PERIOD_CURRENT = 0
PERIOD_M1      = 1
PERIOD_M5      = 5
PERIOD_M15     = 15
PERIOD_M30     = 30
PERIOD_H1      = 60
PERIOD_H4      = 240
PERIOD_D1      = 1440
PERIOD_W1      = 10080
PERIOD_MN1     = 43200
*/


/* ==============================================
-> find average candle(price) from x to y 
============================================== */
double theAverage(int from=0, int to=10, int period=1){
   MqlRates PriceInformation[];
   ArraySetAsSeries(PriceInformation,true);
   int Data= CopyRates(Symbol(),Period(),from,Bars(Symbol(),Period()),PriceInformation);
   double theHigh = PriceInformation[theHigher(from,to,period)].high;
   double theLow = PriceInformation[theLower(from,to,period)].low;
   double Average = NormalizeDouble(((theHigh+theLow)/2),6);
   return(Average);
} 

/* ==============================================
-> dynamic trailing stop  VER 1
============================================== */
void trailStop(int MagicNumber,double pips,double WhenToTrail=100,double TralingAmount=50){
   for(int i=OrdersTotal()-1;i>=0;i--){
   	if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
   	   if(OrderMagicNumber()==MagicNumber)
   	      if(OrderSymbol()==Symbol())
   	        // if(OrderType()==OP_SELL)
   	            if(OrderOpenPrice()-Ask>WhenToTrail*pips)
   	               if(OrderStopLoss()<Ask+pips*TralingAmount || OrderStopLoss()==0)
   		               bool modified = OrderModify(OrderTicket(),OrderOpenPrice(),Ask+(pips*TralingAmount),OrderTakeProfit(),0,clrGreen);
   }
   for(int i=OrdersTotal()-1;i>=0;i--){
   	if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
   	   if(OrderMagicNumber()==MagicNumber)
   	      if(OrderSymbol()==Symbol())
   	        // if(OrderType()==OP_BUY)
   	            if(Bid-OrderOpenPrice()>WhenToTrail*pips)
   	               if(OrderStopLoss()<Bid-pips*TralingAmount) 
   		               bool modified = OrderModify(OrderTicket(),OrderOpenPrice(),Bid-(pips*TralingAmount),OrderTakeProfit(),0,clrGreen);
   }
}
/*
// input OR extern
bool UseTrailingStop = true;
int WhenToTrail = 100;
int TralingAmount = 50;
*/

/* ==============================================
-> dynamic trailing stop  VER 2
============================================== */
void CheckTrailingStop(double ask,int MagicNumber, double pips, double CurrentStopLoss){
	double SL = NormalizeDouble(ask-150*_Point,_Digits);
	
	for(int i=OrdersTotal()-1;i>=0;i--){
		//string symbol = PositionGetSymbol(i); // mql5
		//if(_Symbol==symbol){
   	if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)){   	
   	   if(OrderMagicNumber()==MagicNumber){
      		if(_Symbol==Symbol()){
      			//ulong PositionTicket = PositionGetInteger(POSITION_TICKET); // mql5
      			//double CurrentStopLoss = PositionGetDoubl(POSITION_SL); // mql5
      			if(CurrentStopLoss<SL){
      				// trade.PositionModify(PositionTicket,(CurrentStopLoss+10*_Point),0); // mql5
      				 bool modified = OrderModify(OrderTicket(),OrderOpenPrice(),(CurrentStopLoss+10*_Point),OrderTakeProfit(),0,clrBlack);
      			}
      		}
   		}
      }
	}
}


/* ==============================================
--> define order total by symbol    
============================================== */
int OpenOrderThisPair(string pair){
	int total=0;
	for(int i=OrdersTotal()-1;i>=0;i--){
		int x = OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
		if(OrderSymbol()==pair) total++;
	}
	return(total);
}
/*
if(OrdersTotal() == 0){...}                  // from this
if(OpenOrderThisPair(Symbol()) == 0){...}    // to this
*/


/* ==============================================
  شمارش پوزیشنها    
============================================== */
int ordersPosition(int Magic)
  {
   int num=0;
   for(int i=OrdersTotal()-1;i>=0;i--)                                     
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))                
       {
         if(OrderMagicNumber()==Magic)
          num++;
       }
     }
   return(num);
  }  

/* ==============================================
  پاک کردن پوزیشن ها       
  1011 = BUY  (magic number)
  2011 = SELL (magic number)
  make this const or variable
============================================== */
void deleteOrders(int magicBuy=1011, int magicSell=2011, int theSlipPage=5)
 {
   for(int i=OrdersTotal()-1;i>=0;i--)
    {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
       {
         if(OrderMagicNumber()==magicBuy || OrderMagicNumber()==magicSell)
          {
            if(TimeDay(OrderOpenTime())!=Day())
             {
               if(OrderType()==OP_BUYLIMIT|| OrderType()==OP_SELLLIMIT)
               bool delorder=OrderDelete(OrderTicket(),clrWhite);
               if(OrderType()==OP_BUY || OrderType()==OP_SELL)
               bool closeorder=OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),theSlipPage,clrGreen);
            
             }
          }
      }
    }
 }

/* ==============================================
-> select by magic number [choose not opened position(repeated) for trade]
============================================== */
int ordersSelect(int magicBuy=1011, int magicSell=2011){
   int num=0;
   for(int i=OrdersTotal()-1;i>=0;i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
         if(OrderMagicNumber()==magicBuy || OrderMagicNumber()==magicSell) num++;
     }
   return(num);
}

/* =========================================
-> closePosition()  \\ close opened positions
========================================= */
void closePosition(int Magic, int theSlipPage=5)
{
   for(int i=OrdersTotal()-1;i>=0;i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber()==Magic)
            bool yccb=OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),theSlipPage,clrBlueViolet);
        }
     }
}

/* =========================================
-> modify orders manually (BUY)
========================================= */
/*bool modifyPositionBuy(int magicNum=0, double tradeStop=10){
   //--- modifies Stop Loss price for buy order №0
   if(tradeStop>0)
     {
      if(OrderSelect(magicNum,SELECT_BY_TICKET)){
         if(Bid-OrderOpenPrice()>Point*tradeStop)
           {
            if(OrderStopLoss()<Bid-Point*tradeStop)
              {
               bool res=OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(Bid-Point*tradeStop,Digits),OrderTakeProfit(),0,clrBlue);
               if(!res){
                  Print("Error in OrderModify[BUY]. Error code= ",GetLastError());
                  return(false);
                  }
               else{
                  Print("Order modified successfully.");
                  return(true);
                  }
              }
           }
      }
     }
   return(false);
} 
*/
/* =========================================
-> modify orders manually (SELL)
========================================= */
/*bool modifyPositionSell(int magicNum=0, double tradeStop=10){
   //--- modifies Stop Loss price for sell order №0
   if(tradeStop>0)
     {
      if(OrderSelect(magicNum,SELECT_BY_TICKET)){
         if(Ask-OrderOpenPrice()>Point*tradeStop)
           {
            if(OrderStopLoss()<Ask-Point*tradeStop)
              {
               bool res=OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(Ask-Point*tradeStop,Digits),OrderTakeProfit(),0,clrBlue);
               if(!res){
                  Print("Error in OrderModify[BUY]. Error code= ",GetLastError());
                  return(false);
                  }
               else{
                  Print("Order modified successfully.");
                  return(true);
                  }
              }
           }
      }
     }
   return(false);
}  
*/
/* =========================================
-> last closed BUY
========================================= */    
/*int lastClosedBuy(int magic=1011){
   if (OrderSelect(OrdersHistoryTotal()-1, SELECT_BY_POS, MODE_HISTORY)) 
   {
      if (OrderMagicNumber() == magic) { 
         if((OrderType()==OP_BUY || OrderType()==OP_BUYSTOP || OrderType()==OP_BUYLIMIT) && 
             OrderClosePrice()>=OrderTakeProfit()){ 
          return(1);
          }
          if((OrderType()==OP_BUY || OrderType()==OP_BUYSTOP || OrderType()==OP_BUYLIMIT) && 
             OrderClosePrice()<=OrderStopLoss()){ 
          return(0);
          } 
       }
   }
   return(-1);
}*/

/* =========================================
-> last closed SELL
========================================= */    
/*int lastClosedSell(int magic=2011){
   if (OrderSelect(OrdersHistoryTotal()-1, SELECT_BY_POS, MODE_HISTORY))
   {
      if (OrderMagicNumber() == magic) { 
          if((OrderType()==OP_SELL || OrderType()==OP_SELLSTOP || OrderType()==OP_SELLLIMIT) && 
             OrderClosePrice()>=OrderTakeProfit()){ 
          return(1);
          }
          if((OrderType()==OP_SELL || OrderType()==OP_SELLSTOP || OrderType()==OP_SELLLIMIT) && 
             OrderClosePrice()<=OrderStopLoss()){ 
          return(0);
          }
       }
   }
   return(-1);
} */

/* =========================================
-> last closed BUY
========================================= */    
int lastClosedBuy(int magic){  
   for(int i=OrdersHistoryTotal()-1;i>=0;i--)
    {
     int ord= OrderSelect(i, SELECT_BY_POS,MODE_HISTORY);
      if(OrderSymbol()==Symbol() && OrderMagicNumber()==magic)
       {
          //for buy order
          if((OrderType()==OP_BUY || OrderType()==OP_BUYSTOP || OrderType()==OP_BUYLIMIT) && 
             OrderProfit()>0) return(1); // takeprofit
          if((OrderType()==OP_BUY || OrderType()==OP_BUYSTOP || OrderType()==OP_BUYLIMIT) && 
             OrderProfit()<0) return(0); // stoploss
       }
    } 
   return(-1); 
}  

/* =========================================
-> last closed SELL
========================================= */ 
int lastClosedSell(int magic){  
   for(int i=OrdersHistoryTotal()-1;i>=0;i--)
    {
     int ord= OrderSelect(i, SELECT_BY_POS,MODE_HISTORY);
      if(OrderSymbol()==Symbol() && OrderMagicNumber()==magic)
       {
          //for buy order
          if((OrderType()==OP_SELL || OrderType()==OP_SELLSTOP || OrderType()==OP_SELLLIMIT) && 
             OrderProfit()>0) return(1); // takeprofit
          if((OrderType()==OP_SELL || OrderType()==OP_SELLSTOP || OrderType()==OP_SELLLIMIT) && 
             OrderProfit()<0) return(0); // stoploss
       }
    } 
   return(-1); 
}  
           
/* =========================================
-> hourFilter()  \\ filter which hour to work
========================================= */
bool hourFilter(int theTimeStart=1, int theTimeEnd=24){
   if(Hour()>=theTimeStart && Hour()<=theTimeEnd)
     {
      return(true);
     }
   else{ return(false);}
}


/* ==============================================
-> day filter
============================================== */
bool weekDayFilter(){
   int weekDayNumber = DayOfWeek();
   if(weekDayNumber==6 || weekDayNumber==0)
     {
      return(false);
     }
   else{ return(true);}
}


/* ==============================================
 total portfolio profit
============================================== */
double totalProfit(){
	int NumBuy=0;
	int NumSell=0;
	int NumPenBuyLimit=0;
	int NumPenBuyStop=0;
	int NumPenSellLimit=0;
	int NumPenSellStop=0;
	double totalProfit=0;
	double totalSellProfit=0;
	double totalBuyProfit=0;
	for(int i=OrdersTotal()-1;i>=0;i--){
		if(OrderType()==OP_BUY){
			NumBuy++;
			totalBuyProfit+=OrderProfit()+OrderSwap()+OrderCommission();
		}
		else if(OrderType()==OP_SELL){
			NumSell++;
			totalSellProfit+=OrderProfit()+OrderSwap()+OrderCommission();
		}
		else if(OrderType()==OP_BUYSTOP){
			NumPenBuyStop++;
		}
		else if(OrderType()==OP_BUYLIMIT){
			NumPenBuyLimit++;
		}
		else if(OrderType()==OP_SELLSTOP){
			NumPenSellStop++;
		}
		else if(OrderType()==OP_SELLLIMIT){
			NumPenSellLimit++;
		}
	}
	totalProfit=totalBuyProfit+totalSellProfit;
	return(totalProfit);
}


/* ==============================================
 total portfolio profit
============================================== */
double totalPortfolio(double buy,double sell){
   double total=0;
   double amount=AccountEquity();
   total = (sell-buy)*amount;
   return(total);
}


/* ==============================================
-> find pivot                       [need to fix]
============================================== */
bool pivotLow(int horizen=30){
   double   point1=Low[iLowest(NULL,PERIOD_CURRENT,MODE_CLOSE,Bars,0)];
   double   point2=Low[iLowest(NULL,PERIOD_CURRENT,MODE_CLOSE,horizen,0)];
   if(point1 < point2) return(true);
   return(false);
}


bool pivotHigh(int horizen=30){
   double   point1=High[iLowest(NULL,PERIOD_CURRENT,MODE_CLOSE,Bars,0)];
   double   point2=High[iLowest(NULL,PERIOD_CURRENT,MODE_CLOSE,horizen,0)];
   if(point1 > point2) return(true);
   return(false);
}


/* ==============================================
-> find pivot BY LINE
============================================== */
void pivotLine(int where=100,bool output=true){
   int highestCandle = iHighest(_Symbol,_Period,MODE_HIGH,where,0);
   int lowestCandle  = iLowest(_Symbol,_Period,MODE_LOW,where,0);
   RefreshRates();
   ObjectDelete("lineUP");
   ObjectDelete("lineDOWN");
   
   ObjectCreate("lineUP",OBJ_HLINE,0,Time[0],High[highestCandle]);
   ObjectCreate("lineDOWN",OBJ_HLINE,0,Time[0],Low[lowestCandle]);
   /*
   if(output)
     {
      Print("Highest Price: ",High[highestCandle]," _ number: ",highestCandle
          ,"\n Lowest Price: ",Low[lowestCandle]," _ number: ",lowestCandle);
     } */  
}


/* ==============================================
-> Label output
============================================== */
void theLabel(string name, string text,int size=20, int xPos=20, int yPos=20, color theColor=clrRed){
   // OnDeinit(ObjectDelete(name)); // cant delete
   ObjectCreate(name,OBJ_LABEL,0,0,0);
   ObjectSet(name,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
   ObjectSet(name,OBJPROP_XDISTANCE,xPos);
   ObjectSet(name,OBJPROP_YDISTANCE,yPos);
   ObjectSetText(name,text,size,"Arial",theColor); //"Arial" "Impact"
}


/* ==============================================
-> Margin Monitor
============================================== */
double myMargin(){
   double theMargin   = AccountInfoDouble(ACCOUNT_MARGIN);
   double freeMargin  = AccountInfoDouble(ACCOUNT_MARGIN_FREE);
   double totalMargin = theMargin-freeMargin;
   return(totalMargin);
}


/* ==============================================
-> Margin Monitor
============================================== */
bool stopByMargin(){
   if(myMargin()<=0)
     {
      //MessageBox("the account margin is zero, stop trading.","Margin Error");
      return(true);
     }else{return(false);}
}


/*************************************
*  Liberary name: variable of trade  *
*     for all projects of trade      *
*              mosi pvp              *
*************************************/

// OP_BUY  = Ask \\ OP_SELL = Bid 
double buyStopLoss(double loss){
   double state = Ask-(loss*Point); // buyStop
   return(state);
}
double buyProfit(double profit){
   double state  = Ask+(profit*Point); // buyTakeProfit
   return(state);
}   
double sellStopLoss(double loss){
   double state   = Bid+(loss*Point); // sellStop
   return(state);
}
double sellProfit(double profit){
   double state = Bid-(profit*Point); // sellTakeProfit
   return(state);
}
   
// OP_SELLLIMIT , OP_SELLSTOP , OP_BUYLIMIT , OP_BUYSTOP
double buyLimit(double range){
   double state = Ask-(range*Point); // buyLimit
   return(state);
}
double sellLimit(double range){
   double state= Bid+(range*Point); // sellLimit
   return(state);
}
double buyStop(double range){
   double state  = Ask+(range*Point); // buyStop
   return(state);
}
double sellStop(double range){
   double state = Bid-(range*Point); // sellStop
   return(state);
}
/*   
// thePrice =  buyLimitRange || sellLimitRange || buyStopRange || sellStopRange |OR| Ask || Bid
   double thePrice    = 0;   
   double lossBuyX    =  thePrice-(50*Point); // buyStop & buyLimit 
   double profitBuyX  =  thePrice+(50*Point); // buyStop & buyLimit
   double lossSellX   =  thePrice+(50*Point); // sellStop & sellLimit 
*/ 

// Ask/Bid price
double askPrice(){
   double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   return(state);
}
double bidPrice(){
   double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   return(state);
}
// Ask/Bid price override [high OR low]
double askPrice(string which){
   if(which=="high")
     {
      double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASKHIGH),_Digits);
      return(state);
     }
   else if(which=="low")
     {
      double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASKLOW),_Digits);
      return(state);
     }
   else
     {
      double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
      return(state);
     }
}
double bidPrice(string which){
   if(which=="high")
     {
      double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BIDHIGH),_Digits);
      return(state);
     }
   else if(which=="low")
     {
      double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BIDLOW),_Digits);
      return(state);
     }
   else
     {
      double state = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
      return(state);
     }
}

/* **********************************************
                     spread
********************************************** */
// spread
double theSpread(){
   double lowSpread  =100000;
   double highSpread =0;
   int currentSpread = (int)SymbolInfoInteger(_Symbol,SYMBOL_SPREAD);
   if(currentSpread<lowSpread)
     {
      lowSpread=currentSpread;
      return(lowSpread);
     }
   if(currentSpread>highSpread)
     {
      highSpread=currentSpread;
      return(highSpread);
     }
   return(currentSpread);
}
 


// --------------------------------------------------------//
// --------------------------------------------------------//
// --------------------------------------------------------//

/* **********************************************
MACD + CCi  & MovingAverage
********************************************** */

/* =========================================
-> MACD+CCi signal  \\ macd + cci = signal
========================================= */
int MACD_CCi(){
   if(iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,1)>iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_SIGNAL,1) && 
      iCCI(Symbol(),0,14,PRICE_TYPICAL,1)>100)
     {
         return(1); // "BUY"
     }
   else if(iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,1)<iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_SIGNAL,1) && 
      iCCI(Symbol(),0,14,PRICE_TYPICAL,1)<-100)
     {
         return(0); // "SELL"
     }
   else return(-1); // "Wait for signal ..."
}   
/* =========================================
-> closeSignal()  \\ close opened signals
========================================= */
int closeMACD_CCi(){
   if(iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,2)>iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_SIGNAL,2) && 
      iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,1)<iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_SIGNAL,1))
         return(1); // "Close Buy"

   else if(iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,2)<iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_SIGNAL,2) && 
      iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,1)>iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_SIGNAL,1))
         return(0); // "Close Sell"

   else return(-1); // "Not Closing Signal"
}


/* =========================================
-> moveStatus()  \\ moving average positions
========================================= */
int moveStatus(){
   if(iMA(NULL,PERIOD_CURRENT,3,0,MODE_EMA,PRICE_CLOSE,2)<=iMA(NULL,PERIOD_CURRENT,9,0,MODE_EMA,PRICE_CLOSE,2) && 
      iMA(NULL,PERIOD_CURRENT,3,0,MODE_EMA,PRICE_CLOSE,1)>iMA(NULL,PERIOD_CURRENT,9,0,MODE_EMA,PRICE_CLOSE,1))
         return(1); // "Buy MA"
   else if(iMA(NULL,PERIOD_CURRENT,3,0,MODE_EMA,PRICE_CLOSE,2)>=iMA(NULL,PERIOD_CURRENT,9,0,MODE_EMA,PRICE_CLOSE,2) && 
      iMA(NULL,PERIOD_CURRENT,3,0,MODE_EMA,PRICE_CLOSE,1)<iMA(NULL,PERIOD_CURRENT,9,0,MODE_EMA,PRICE_CLOSE,1))
         return(0); // "Sell MA"
   else return(-1); // "Not MA Signal."
}

int moveStatus(int periodUp=3,int periodDown=9){
   if(iMA(NULL,PERIOD_CURRENT,periodUp,0,MODE_EMA,PRICE_CLOSE,2)<=iMA(NULL,PERIOD_CURRENT,periodDown,0,MODE_EMA,PRICE_CLOSE,2) && 
      iMA(NULL,PERIOD_CURRENT,periodUp,0,MODE_EMA,PRICE_CLOSE,1)>iMA(NULL,PERIOD_CURRENT,periodDown,0,MODE_EMA,PRICE_CLOSE,1))
         return(1); // "Buy MA"
   else if(iMA(NULL,PERIOD_CURRENT,periodUp,0,MODE_EMA,PRICE_CLOSE,2)>=iMA(NULL,PERIOD_CURRENT,periodDown,0,MODE_EMA,PRICE_CLOSE,2) && 
      iMA(NULL,PERIOD_CURRENT,periodUp,0,MODE_EMA,PRICE_CLOSE,1)<iMA(NULL,PERIOD_CURRENT,periodDown,0,MODE_EMA,PRICE_CLOSE,1))
         return(0); // "Sell MA"
   else return(-1); // "Not MA Signal."
}


/* =========================================
-> RSI()  \\ RSI signal
========================================= */
int RSI(){
   if(iRSI(NULL,0,14,PRICE_CLOSE,0)>iRSI(NULL,0,14,PRICE_CLOSE,1)) 
      return(1);    // "BUY"
   if(iRSI(NULL,0,14,PRICE_CLOSE,0)<iRSI(NULL,0,14,PRICE_CLOSE,1)) 
      return(0);    // "SELL"
   else return(-1); // "Not RSI Signal."
}

int RSI(int period=14,int destination=0,int target=1){
   if(iRSI(NULL,0,period,PRICE_CLOSE,destination)>iRSI(NULL,0,period,PRICE_CLOSE,target)) 
      return(1);    // "BUY"
   if(iRSI(NULL,0,period,PRICE_CLOSE,destination)<iRSI(NULL,0,period,PRICE_CLOSE,target)) 
      return(0);    // "SELL"
   else return(-1); // "Not RSI Signal."
}


// --------------------------------------------------------//
// --------------------------------------------------------//
// --------------------------------------------------------//
/* ||||||||||||||||||||||||||||||||||||||
           BUY / SELL BUTTON
|||||||||||||||||||||||||||||||||||||| */

void theButtom(string name){                             //[need to test and fix]
   if(name=="buy")
     {
      ObjectCreate("BuyBotton",OBJ_BUTTON,0,0,0);
      ObjectSetInteger((int)_Symbol,"BuyButton",OBJPROP_XDISTANCE,200);
      ObjectSetInteger((int)Symbol(),"BuyButton",OBJPROP_YDISTANCE,200);
      ObjectSetInteger((int)Symbol(),"BuyButton",OBJPROP_XSIZE,150);
      ObjectSetInteger((int)Symbol(),"BuyButton",OBJPROP_YSIZE,50);
      ObjectSetInteger((int)Symbol(),"BuyButton",OBJPROP_CORNER,3);
      //ObjectSetInteger((int)_Symbol,"BuyButton",OBJPROP_TEXT,"BUY");  
     }
   if(name=="sell")
     {
      ObjectCreate("SellBotton",OBJ_BUTTON,0,0,0);
      ObjectSetInteger((int)_Symbol,"SellBotton",OBJPROP_XDISTANCE,200);
      ObjectSetInteger((int)Symbol(),"SellBotton",OBJPROP_YDISTANCE,400);
      ObjectSetInteger((int)Symbol(),"SellBotton",OBJPROP_XSIZE,150);
      ObjectSetInteger((int)Symbol(),"SellBotton",OBJPROP_YSIZE,50);
      ObjectSetInteger((int)Symbol(),"SellBotton",OBJPROP_CORNER,3);
      //ObjectSetInteger((int)_Symbol,"SellBotton",OBJPROP_TEXT,"Sell");  
     }

      
      /*void OnChartEvent(
                          const int id,
                          const long& lparam,
                          const double& dparam,
                          const string& sparam
                       )
             {
              if(id==CHARTEVENT_OBJECT_CLICK)
                {
                 if(sparam=="BuyButton")
                   {
                    //OrderSend(_Symbol,OP_BUY,0,10,Ask,3,0,Ask+300*_Point,NULL,0,0,clrGreen);
                    Print(sparam+"You Have a Buy Position...");
                   }
                }
             }*/
}


/*----------------------------------------------------------------------

Session	                        Duration (GMT)

Sydney (Australian)	            GMT: from 10:00 PM GMT to 7:00 AM GMT

Tokyo (Asian)	                  GMT: from 12:00 AM GMT to 9:00 AM GMT

London (European)	               GMT: from 8:00 AM GMT to 5:00 PM GMT

New York (American)	            GMT: from 1:00 PM GMT to 10:00 PM GMT

tehan: 3:30 / 4:30 +gmt (5 am london = 8:30/9:30 teran am)
---------------------------------------------------------------------*/