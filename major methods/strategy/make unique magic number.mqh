
/* ==============================================
-> make unique magic number
============================================== */
int UniqueMagicNumber(){
	char chararray[];
	string name = Symbol();
	StringToUpper(name);
	StringToCharArray(name,chararray,0,6);
	//ArrayPrint(chararray); // <-- for mql5: show value on cli
	string MagicString;
	for(int i=0;i<6;i++){
		StringAdd(MagicString,(string)chararray[i]);
	}
	// Print(MagicString); // xx yy xx yy xx yy
	int unique = StringToInteger(MagicString);
	// Print(MagicString); // xxyyxxyyxxyy
	return(unique);
}
