
import 'package:awraq/features/governates/data/model/governates_model.dart';
abstract class GovernoratesRepo {
  Future<GovernoratesModel> getGovernorates();
}