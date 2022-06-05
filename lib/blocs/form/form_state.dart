import 'package:equatable/equatable.dart';

enum FormStateStatus { none, filled, validated, errors }
enum FormStateFields { name, email, phone, city, date}

class FormBlocStatusClass{

  FormStateStatus? formStateStatus = FormStateStatus.none;
  bool nameError = false;
  bool emailError = false;
  bool phoneError = false;
  bool cityError = false;
  bool dateError = false;

  FormBlocStatusClass({
    this.formStateStatus
  });
}

class FormBlocState extends Equatable {

  FormBlocState({
    this.name,
    this.email,
    this.phone,
    this.city,
    this.date,
    this.formBlocStatusClass
  });

  String? name;
  String? email;
  String? phone;
  String? city;
  String? date;
  FormBlocStatusClass? formBlocStatusClass;

  static final empty = FormBlocState(
    name: '',
    email: '',
    phone: '',
    city: '',
    date: '',
    formBlocStatusClass: FormBlocStatusClass()
  );

  @override
  List<Object?> get props => [
    name,
    email,
    phone,
    city,
    date,
    formBlocStatusClass
  ];

  FormBlocState copyWith({
    String? name,
    String? email,
    String? phone,
    String? city,
    String? date,
    FormBlocStatusClass? formBlocStatusClass,
  }) {
    return FormBlocState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      date: date ?? this.date,
      formBlocStatusClass: formBlocStatusClass ?? this.formBlocStatusClass,
    );
  }
}