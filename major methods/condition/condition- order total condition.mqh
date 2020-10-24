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
