
/* ==============================================
-> trade methodneed for TP & SL on trading
============================================== */
double high=iHigh(Symbol(),PERIOD_CURRENT,1);
double low=iLow(Symbol(),PERIOD_CURRENT,1);
double close=iClose(Symbol(),PERIOD_CURRENT,1);

double p =NormalizeDouble((high+low+close)/3,Digits);

double takeprofitType1(){
	double result=NormalizeDouble((2*p)-low,Digits);
	return(result);
}

double takeprofitType2(){
	double result=NormalizeDouble(p+high-low,Digits);
	return(result);
}

double takeprofitType3(){
	double result=NormalizeDouble((2*p)+(high-(2*low)),Digits);
	return(result);
}

double stoplossType1(){
	double result=NormalizeDouble((2*p)-high,Digits);
	return(result);
}

double stoplossType2(){
	double result=NormalizeDouble(p-high+low,Digits);
	return(result);
}

double stoplossType3(){
	double result=NormalizeDouble((2*p)-((2* high)-low),Digits);
	return(result);
}

// important: on a trade buy/sell should to use 1 of this method.
// OrderSend(_Symbol....BUY,0,takrprofitType1(),..takrprofitType1()+....)