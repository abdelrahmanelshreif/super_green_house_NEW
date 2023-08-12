part of 'createaccount_cubit.dart';

@immutable
abstract class CreateaccountState {}

class CreateaccountInitial extends CreateaccountState {}
class CreateAccountLoading extends CreateaccountState {}
class CreateAccountError extends CreateaccountState {}
class CreateAccountSuccess extends CreateaccountState {}