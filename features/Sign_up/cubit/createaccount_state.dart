part of 'createaccount_cubit.dart';

@immutable
abstract class CreateaccountState {}

class CreateaccountInitial extends CreateaccountState {}
class Createaccountloading extends CreateaccountState {}
class Createaccounterror extends CreateaccountState {}
class Createaccountsuccess extends CreateaccountState {}