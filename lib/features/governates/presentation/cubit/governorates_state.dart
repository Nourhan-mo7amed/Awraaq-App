import 'package:awraq/features/governates/data/model/governates_model.dart';

abstract class GovernoratesState {}

class GovernoratesInitial extends GovernoratesState {}

class GovernoratesLoading extends GovernoratesState {}

class GovernoratesSuccess extends GovernoratesState {
  final List<Governorate> governorates;

  GovernoratesSuccess(this.governorates);
}

class GovernoratesFailure extends GovernoratesState {
  final String message;

  GovernoratesFailure(this.message);
}