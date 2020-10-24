
# HOW TO USE:
 put this file on include folder then use by #include
   [   #include <custom/CandlePatterns.mqh>   ]
   
##
/*=========================================
||            Content Table              ||
=========================================*/

###PATTERNS: (one candle)                    [TYPE]
_ Bullish                     cBullish(i)  
_ Bearish                     cBearish(i)
##
###NORMAL MODES:                         [STANDARD]
_ Doji                        cDojiNormal(i)
_ Hammer                      cBullishHammer(i)
_ ShotingStar                 cBearishHammer(i)
##
###_ BULLISH:                        [BULISH TYPES]
__ Bullish Engulfing          cBullishEngulfing(i)
__ Bullish Harami             cBullishHarami(i)
__ Bullish Three Inside Up    cBullishThreeInsideUp(i)
__ Tweezer Bottoms            cTweezerBottoms(i)
__ Morning Star               cMorningStar(i)
__ Bullish Railway Track      cBullishRailwayTrack(i)
__ Piercing Line              cPiercingLine(i)
__ Bullish Homing Pidgeon     cBullishHomingPidgeon(i)
##
###_ BEARISH:                        [BEARISH TYPE]
__ Bearish ThreeSide Down     cBearishThreeSideDown(i)
__ Tweezer Tops               cTweezerTops(i)
__ Evening Star               cEveningStar(i)
__ Bearish Railway Track      cBearishRailwayTrack(i)
__ Dark Cloud Cover           cDarkCloudCover(i)
__ Bearish Hawk               cBearishHawk(i)
##
###_ SIGNAL:                         [CROWS SIGNAL]
__ Three Black Crows          cThreeBlackCrows(i)

