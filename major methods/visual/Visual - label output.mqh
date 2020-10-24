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