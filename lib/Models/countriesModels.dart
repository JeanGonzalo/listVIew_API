// Generated by https://quicktype.io

class Response {
  Global global;
  List<Country> countries;
  String date;

  Response({
    this.global,
    this.countries,
    this.date,
  });
}

class Countries {
  List<Country> items = new List();

  Countries();

  Countries.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final country = new Country.fromJsonMap(item);
      items.add(country);
    }
  }
}

class Country {
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;

  Country({
    this.country,
    this.countryCode,
    this.slug,
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
    this.date,
  });

  Country.fromJsonMap(Map<String, dynamic> json)
      : country = json['Country'],
        countryCode = json['CountryCode'],
        slug = json['Slug'],
        newConfirmed = json['NewConfirmed'],
        totalConfirmed = json['TotalConfirmed'],
        newDeaths = json['NewDeaths'],
        totalDeaths = json['TotalDeaths'],
        newRecovered = json['NewRecovered'],
        totalRecovered = json['TotalRecovered'],
        date = json['Date'];

  /* Map<String, dynamic> toMap() => {
        "Country": country,
        "CountryCode": countryCode,
        "Slug": slug,
        "NewConfirmed": newConfirmed,
        "TotalConfirmed": totalConfirmed,
        "NewDeaths": newDeaths,
        "TotalDeaths": totalDeaths,
        "NewRecovered": newRecovered,
        "TotalRecovered": totalRecovered,
        "Date": date,
      }; */
}

class Global {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  Global({
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
  });
}

/* 
class Country {
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;

  Country({
    this.country,
    this.countryCode,
    this.slug,
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
    this.date,
  });
}
 */