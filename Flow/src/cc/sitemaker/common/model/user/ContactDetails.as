package cc.sitemaker.common.model.user
{
	public class ContactDetails
	{
		// Mandatory details
		private var _firstname:String;
		private var _lastname:String;
		private var _email:String;
		private var _country:String;
		private var _zipcode:String;
		private var _phone:String;
		private var _address:String;
		private var _city:String;
		private var _hidedetails:Boolean;
		
		public function ContactDetails() {
			firstname = "";
			lastname ="";
			zipcode = "";
			country = "";
			email = "";
			// Gandi API requires UK to be specified as GB :( so for now special case mapping what I get back from user.cgi UK => GB
			if (country == "UK") country = "GB"; 
			phone = "";
			address = "";
			city = "";
			// default details hidden from WHOIS database
			hidedetails = true;
		}
		
		

		public function get firstname():String
		{
			return _firstname;
		}

		public function set firstname(value:String):void
		{
			_firstname = value;
		}

		public function get lastname():String
		{
			return _lastname;
		}

		public function set lastname(value:String):void
		{
			_lastname = value;
		}

		public function get email():String
		{
			return _email;
		}

		public function set email(value:String):void
		{
			_email = value;
		}

		public function get country():String
		{
			return _country;
		}

		public function set country(value:String):void
		{
			_country = value;
		}

		public function get zipcode():String
		{
			return _zipcode;
		}

		public function set zipcode(value:String):void
		{
			_zipcode = value;
		}

		public function get phone():String
		{
			return _phone;
		}

		public function set phone(value:String):void
		{
			_phone = value;
		}

		public function get address():String
		{
			return _address;
		}

		public function set address(value:String):void
		{
			_address = value;
		}

		public function get city():String
		{
			return _city;
		}

		public function set city(value:String):void
		{
			_city = value;
		}

		public function get hidedetails():Boolean
		{
			return _hidedetails;
		}

		public function set hidedetails(value:Boolean):void
		{
			_hidedetails = value;
		}

	}
}