package cc.sitemaker.common.model.core
{
	public class Currency
	{
		public static var USD:Currency = new Currency("USD","$");
		public static var AUD:Currency = new Currency("AUD","$");
		public static var GBP:Currency = new Currency("GBP","\u00a3");
		public static var EUR:Currency = new Currency("EUR","\u20ac");
		public static var CAD:Currency = new Currency("CAD","$");
		public static var JPY:Currency = new Currency("JPY","\u00a5");
		public static var CZK:Currency = new Currency("CZK","Kč"); // Czech Koruna
		public static var DKK:Currency = new Currency("DKK","kr"); // Danish Kroner
		public static var HKD:Currency = new Currency("HKD","HK$"); // Hong Kong Dollars
		public static var HUF:Currency = new Currency("HUF","Ft"); // Hungarian Forint
		public static var NZD:Currency = new Currency("NZD","$"); // New Zealand Dollars
		public static var NOK:Currency = new Currency("NOK","kr"); // Norwegian Krone
		public static var PLN:Currency = new Currency("PLN","zł"); // Polish Zlotych
		public static var SGD:Currency = new Currency("SGD","S$"); // Singapore Dollars
		public static var SEK:Currency = new Currency("SEK","kr"); // Swedish Kronor
		public static var CHF:Currency = new Currency("CHF","Fr."); // Swiss Francs
		
		private var _symbol : String;
		private var _code : String;
		
		public function Currency(code:String,symbol:String) {
			_code = code;
			_symbol = symbol; 
		}
		
		public function getCode():String{
			return _code;
		}
		
		public function getSymbol():String{
			return _symbol;	
		}
		
		public static function GetCurrencyFromCode(code:String):Currency{
			var MAP:Object = {
				USD:USD,
				AUD:AUD,
				GBP:GBP,
				EUR:EUR,
				CAD:CAD,
				JPY:JPY,
				CZK:CZK,
				DKK:DKK,
				HUF:HUF,
				NZD:NZD,
				NOK:NOK,
				PLN:PLN,
				SGD:SGD,
				SEK:SEK,
				CHF:CHF
			};
			return MAP[code.toUpperCase()];		
		}
	}
}