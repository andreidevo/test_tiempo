import 'package:equatable/equatable.dart';


abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends FormEvent {
  const NameChanged({
    required this.name
  });

  final String name;
  @override
  List<Object> get props => [name];
}

class BirthdayChanged extends FormEvent {
  const BirthdayChanged({
    required this.date
  });

  final String date;
  @override
  List<Object> get props => [date];
}

class CityChanged extends FormEvent {
  const CityChanged({
    required this.city
  });

  final String city;
  @override
  List<Object> get props => [city];
}

class EmailChanged extends FormEvent {
  const EmailChanged({
    required this.email
  });

  final String email;
  @override
  List<Object> get props => [email];
}

class PhoneChanged extends FormEvent {
  const PhoneChanged({
    required this.phone
  });

  final String phone;
  @override
  List<Object> get props => [phone];
}

class ValidateForm extends FormEvent {

  @override
  List<Object> get props => [];
}

class ClearEvent extends FormEvent {

  @override
  List<Object> get props => [];
}