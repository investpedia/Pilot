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

/* overload */
void closePosition(int Magic)
{
   for(int i=OrdersTotal()-1;i>=0;i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber()==Magic)
            bool yccb=OrderClose(OrderTicket(),OrderLots(),OrderClosePrice());
        }
     }
}

