import 'package:CovidMonitor/models/RpGlobal.dart';
import 'package:CovidMonitor/models/RpLatest.dart';
import 'package:CovidMonitor/models/RpUserCountry.dart';
import 'package:CovidMonitor/network/ApiProvider.dart';

class Repository {
  var apiProvider = ApiProvider();

  Future<RpLatest> getGloballyLatestData() => apiProvider.getGloballyLatestData();
  Future<List<Country>> getAllCountriesData() => apiProvider.getAllCountriesData();
  Future<Country> getUserCountryData(String countryCode) => apiProvider.getUserCountryData(countryCode);
}
