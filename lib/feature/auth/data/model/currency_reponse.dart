class CurrencyResponse {
  List<Languages>? languages;
  List<Currencies>? currencies;
  String? defaultLanguage;
  String? defaultCurrency;
  int? status;

  CurrencyResponse(
      {this.languages,
        this.currencies,
        this.defaultLanguage,
        this.defaultCurrency,
        this.status});

  CurrencyResponse.fromJson(Map<String, dynamic> json) {
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(new Languages.fromJson(v));
      });
    }
    if (json['currencies'] != null) {
      currencies = <Currencies>[];
      json['currencies'].forEach((v) {
        currencies!.add(new Currencies.fromJson(v));
      });
    }
    defaultLanguage = json['default_language']?.toString();
    defaultCurrency = json['default_currency']?.toString();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.languages != null) {
      data['languages'] = this.languages!.map((v) => v.toJson()).toList();
    }
    if (this.currencies != null) {
      data['currencies'] = this.currencies!.map((v) => v.toJson()).toList();
    }
    data['default_language'] = this.defaultLanguage;
    data['default_currency'] = this.defaultCurrency;
    data['status'] = this.status;
    return data;
  }
}

class Languages {
  String? locale;
  String? name;

  Languages({this.locale, this.name});

  Languages.fromJson(Map<String, dynamic> json) {
    locale = json['locale'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locale'] = this.locale;
    data['name'] = this.name;
    return data;
  }
}

class Currencies {
  String? currencyMain;
  String? currencyFormat;
  String? currencyThousand;
  String? currencyDecimal;
  String? currencyNoDecimal;
  String? rate;
  String? symbol;
  String? name;
  int? isMain;

  Currencies(
      {this.currencyMain,
        this.currencyFormat,
        this.currencyThousand,
        this.currencyDecimal,
        this.currencyNoDecimal,
        this.rate,
        this.symbol,
        this.name,
        this.isMain});

  Currencies.fromJson(Map<String, dynamic> json) {
    currencyMain = json['currency_main']?.toString();
    currencyFormat = json['currency_format']?.toString();
    currencyThousand = json['currency_thousand']?.toString();
    currencyDecimal = json['currency_decimal']?.toString();
    currencyNoDecimal = json['currency_no_decimal']?.toString();
    rate = json['rate']?.toString();
    symbol = json['symbol']?.toString();
    name = json['name']?.toString();
    isMain = json['is_main'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_main'] = this.currencyMain;
    data['currency_format'] = this.currencyFormat;
    data['currency_thousand'] = this.currencyThousand;
    data['currency_decimal'] = this.currencyDecimal;
    data['currency_no_decimal'] = this.currencyNoDecimal;
    data['rate'] = this.rate;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['is_main'] = this.isMain;
    return data;
  }
}
