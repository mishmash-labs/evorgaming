import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:provider/provider.dart';

import '../../cubits/checkout/checkout_cubit.dart';
import '../../providers/userdata_provider.dart';

class CheckOutPage extends StatelessWidget {
  final _checkoutKey = GlobalKey<FormBuilderState>();
  final CheckoutCubit checkoutCubit = CheckoutCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AutoSizeText(
          "Checkout",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocConsumer(
        bloc: checkoutCubit,
        listener: (context, state) {
          if (state is CheckoutSuccess) {
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          }
          if (state is CheckoutFailed) {
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
          }
        },
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return Center(
              child: SpinKitCubeGrid(
                color: Colors.red.shade900,
                size: 50.0,
              ),
            );
          } else if (state is CheckoutInitial ||
              state is CheckoutSuccess ||
              state is CheckoutFailed) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _checkoutKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "Name",
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        labelText: "Name",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "Email",
                      decoration: InputDecoration(
                        labelText: "Email",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.email(context),
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderPhoneField(
                      name: "Phone_no",
                      defaultSelectedCountryIsoCode: "PK",
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.minLength(context, 13,
                            errorText: "Incorrect length"),
                        FormBuilderValidators.maxLength(context, 13,
                            errorText: "Incorrect length")
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "address",
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        labelText: "Address",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "city",
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        labelText: "City",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "country",
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        labelText: "Country",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "postal_code",
                      cursorColor: Colors.red,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Postal Code",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "order_note",
                      initialValue: "",
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        labelText: "Order Note",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    OutlineButton(
                      borderSide: BorderSide(color: Colors.red.shade800),
                      highlightedBorderColor: Colors.red.shade800,
                      onPressed: () {
                        if (state is CheckoutLoading) {
                        } else {
                          _checkoutKey.currentState.save();
                          if (_checkoutKey.currentState.validate()) {
                            var finalData = <String, dynamic>{};
                            finalData.addAll(_checkoutKey.currentState.value);
                            finalData["email"] =
                                Provider.of<UserData>(context, listen: false)
                                    .userId;
                            if (finalData["order_note"].isEmpty) {
                              print("here");
                              finalData["order_note"] = " ";
                            }
                            checkoutCubit.checkout(finalData);
                          } else {
                            print("validation failed");
                          }
                        }
                      },
                      child: AutoSizeText(
                        "CHECKOUT",
                        style: TextStyle(letterSpacing: 1.5),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
