import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tiempo/blocs/form/form_event.dart';
import 'package:test_tiempo/blocs/form/form_state.dart';
import 'package:email_validator/email_validator.dart';


class FormBloc extends Bloc<FormEvent, FormBlocState>{

  FormBloc() : super(FormBlocState.empty){
    on<NameChanged>((event, emit) async {
      emit(state.copyWith(
        name: event.name,
        formBlocStatusClass: checkFields(state.copyWith(
          name: event.name
        ))
      ));
    });
    on<BirthdayChanged>((event, emit) async {
      emit(state.copyWith(
        date: event.date,
        formBlocStatusClass: checkFields(state.copyWith(
          date: event.date
        ))
      ));
    });
    on<CityChanged>((event, emit) async {
      emit(state.copyWith(
        city: event.city,
        formBlocStatusClass: checkFields(state.copyWith(
          city: event.city
        ))
      ));
    });
    on<EmailChanged>((event, emit) async {
      emit(state.copyWith(
        email: event.email,
        formBlocStatusClass: checkFields(state.copyWith(
          email: event.email
        ))
      ));
    });
    on<PhoneChanged>((event, emit) async {
      emit(state.copyWith(
        phone: event.phone,
        formBlocStatusClass: checkFields(state.copyWith(
          phone: event.phone
        ))
      ));
    });
    on<ValidateForm>((event, emit) async {
      emit(state.copyWith(
        formBlocStatusClass: validateForm(state)
      ));
    });
    on<ClearEvent>((event, emit) async {
      emit(FormBlocState.empty);
    });
  }

  FormBlocStatusClass validateForm(FormBlocState state){
    FormBlocStatusClass result = FormBlocStatusClass();
    result.formStateStatus = FormStateStatus.validated;

    // Necesito verificar todos los campos aquí,
    // pero solo he comprobado email por ejemplo

    if (!EmailValidator.validate(state.email!)){
      result.formStateStatus = FormStateStatus.errors;
      result.emailError = true;
    }else{
      result.emailError = false;
    }

    return result;
  }

  FormBlocStatusClass checkFields(FormBlocState state){
    if (state.formBlocStatusClass!.formStateStatus == FormStateStatus.validated){
      return state.formBlocStatusClass!;
    }

    FormBlocStatusClass result = FormBlocStatusClass();
    result.formStateStatus = FormStateStatus.filled;

    if (state.date == null || state.date == ''){
      result.formStateStatus = FormStateStatus.errors;
      result.dateError = true;
    }else{
      result.dateError = false;
    }

    if (state.name == null || state.name == ''){
      result.formStateStatus = FormStateStatus.errors;
      result.nameError = true;
    }else{
      result.nameError = false;
    }

    if (state.phone == null || state.phone == ''){
      result.formStateStatus = FormStateStatus.errors;
      result.phoneError = true;
    }else{
      result.phoneError = false;
    }

    if (state.email == null || state.email == ''){
      result.formStateStatus = FormStateStatus.errors;
      result.emailError = true;
    }else{
      result.emailError = false;
    }
    if (state.city == null || state.city == ''){
      result.formStateStatus = FormStateStatus.errors;
      result.cityError = true;
    }else{
      result.cityError = false;
    }

    return result;
  }
}