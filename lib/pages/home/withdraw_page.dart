import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:evorgaming/cubits/walletpage/withdraw_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../providers/userdata_provider.dart';

class WithdrawPage extends StatelessWidget {
  final WithdrawCubit withdrawCubit = WithdrawCubit();

  final _withdrawKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: AutoSizeText(
          "Withdraw",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocConsumer(
        cubit: withdrawCubit
          ..getPaymentMethods(
              Provider.of<UserData>(context, listen: false).userId),
        listener: (context, state) {
          if (state is WithdrawSuccess) {
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
            Navigator.pop(context);
          }
          if (state is WithdrawFailed) {
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
          }
        },
        builder: (context, state) {
          if (state is WithdrawLoading)
            return Center(
              child: SpinKitCubeGrid(
                color: Colors.red.shade900,
                size: 50.0,
              ),
            );
          else if (state is WithdrawLoaded ||
              state is WithdrawSuccess ||
              state is WithdrawFailed)
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _withdrawKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    FormBuilderDropdown(
                      name: "payment_method_id",
                      decoration: InputDecoration(
                        labelText: "Payment Method",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                      items: state.paymentData.message
                          .map<DropdownMenuItem>((method) => DropdownMenuItem(
                                value: method.id,
                                child: Text('${method.name}'),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "amount",
                      cursorColor: Colors.red,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        labelText: "Amount",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "name",
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
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "withdrawal_email",
                      decoration: InputDecoration(
                        labelText: "Withdrawal Email",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "phone_no",
                      cursorColor: Colors.red,
                      keyboardType: TextInputType.phone,
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
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "cnic_no",
                      cursorColor: Colors.red,
                      keyboardType: TextInputType.number,
                      maxLength: 13,
                      decoration: InputDecoration(
                        labelText: "CNIC Number",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.maxLength(context, 13),
                        FormBuilderValidators.minLength(context, 13),
                      ]),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "note",
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        labelText: "Note",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    OutlineButton(
                      borderSide: BorderSide(color: Colors.red.shade800),
                      highlightedBorderColor: Colors.red.shade800,
                      onPressed: () {
                        if (state is WithdrawLoading) {
                        } else {
                          _withdrawKey.currentState.save();
                          if (_withdrawKey.currentState.validate()) {
                            Map<String, dynamic> finalData = Map();
                            finalData.addAll(_withdrawKey.currentState.value);
                            finalData["email"] =
                                Provider.of<UserData>(context, listen: false)
                                    .userId;
                            withdrawCubit.submitRequest(finalData);
                          } else {
                            print("validation failed");
                          }
                        }
                      },
                      child: AutoSizeText("Withdraw"),
                    )
                  ],
                ),
              ),
            );
          else
            return Container();
        },
      ),
    );
  }
}
