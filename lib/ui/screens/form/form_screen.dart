import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tiempo/blocs/form/form_bloc.dart';
import 'package:test_tiempo/blocs/form/form_event.dart';
import 'package:test_tiempo/blocs/form/form_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_tiempo/ui/widgets/button_widget.dart';

class FormScreen extends StatelessWidget {

  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<FormBloc, FormBlocState>(
            builder: (context, state){

              ButtonWidgetEnum buttonState = ButtonWidgetEnum.inactive;
              FormBlocStatusClass status = state.formBlocStatusClass!;
              if (status.formStateStatus == FormStateStatus.none){

              }else if (status.formStateStatus == FormStateStatus.filled) {
                buttonState = ButtonWidgetEnum.active;
              }else if (status.formStateStatus == FormStateStatus.validated) {
                buttonState = ButtonWidgetEnum.completed;
              }

              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: (status.nameError) ?
                              Colors.redAccent :
                              const Color(0xFFBDBDBD),
                            width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: (status.nameError) ?
                              Colors.redAccent :
                              const Color(0xFF562BF7),
                            width: 2),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: AppLocalizations.of(context)!.name,
                        fillColor: Colors.white70
                      ),
                      onChanged: (value){
                        context.read<FormBloc>().add(
                          NameChanged(name: value)
                        );
                      },
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: (status.dateError) ?
                              Colors.redAccent :
                              const Color(0xFFBDBDBD),
                            width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: (status.dateError) ?
                              Colors.redAccent :
                              const Color(0xFF562BF7),
                            width: 2),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: AppLocalizations.of(context)!.birthday,
                        fillColor: Colors.white70
                      ),
                      onChanged: (value){
                        context.read<FormBloc>().add(
                          BirthdayChanged(date: value)
                        );
                      },
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: (status.cityError) ?
                              Colors.redAccent :
                              const Color(0xFFBDBDBD),
                            width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: (status.cityError) ?
                              Colors.redAccent :
                              const Color(0xFF562BF7),
                            width: 2),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: AppLocalizations.of(context)!.city,
                        fillColor: Colors.white70
                      ),
                      onChanged: (value){
                        context.read<FormBloc>().add(
                          CityChanged(city: value)
                        );
                      },
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: (status.emailError) ?
                              Colors.redAccent :
                              const Color(0xFFBDBDBD),
                            width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: (status.emailError) ?
                              Colors.redAccent :
                              const Color(0xFF562BF7),
                            width: 2),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: AppLocalizations.of(context)!.email,
                        fillColor: Colors.white70
                      ),
                      onChanged: (value){
                        context.read<FormBloc>().add(
                          EmailChanged(email: value)
                        );
                      },
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: (status.phoneError) ?
                              Colors.redAccent :
                              const Color(0xFFBDBDBD),
                            width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: (status.phoneError) ?
                              Colors.redAccent :
                              const Color(0xFF562BF7),
                            width: 2),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: AppLocalizations.of(context)!.phone,
                        fillColor: Colors.white70
                      ),
                      onChanged: (value){
                        context.read<FormBloc>().add(
                          PhoneChanged(phone: value)
                        );
                      },
                    ),
                    const SizedBox(height: 20,),
                    ButtonWidget(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 60,
                      content: AppLocalizations.of(context)!.send,
                      buttonState: buttonState,
                      onTap: (){
                        if (buttonState == ButtonWidgetEnum.active){
                          context.read<FormBloc>().add(
                            ValidateForm()
                          );
                        }

                        if (buttonState == ButtonWidgetEnum.completed){
                          context.read<FormBloc>().add(
                            ClearEvent()
                          );
                          Navigator.pop(context);
                        }
                      }
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
