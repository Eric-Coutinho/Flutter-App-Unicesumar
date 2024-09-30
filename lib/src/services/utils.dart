import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Utils {
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(
      locale: 'pt_BR',
    );
    return numberFormat.format(price);
  }

  String formataDataHora(DateTime dataHora) {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dataHora);
  }
}
