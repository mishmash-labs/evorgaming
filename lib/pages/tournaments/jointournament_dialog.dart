import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:evorgaming/cubits/jointournaments/jointournament_cubit.dart';
import 'package:evorgaming/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../models/tournamentdetails_model.dart';
import '../../providers/userdata_provider.dart';

class JoinTournamentDialog extends StatefulWidget {
  final TournamentDetailsModel data;

  JoinTournamentDialog({Key key, @required this.data}) : super(key: key);

  @override
  _JoinTournamentDialogState createState() => _JoinTournamentDialogState();
}

class _JoinTournamentDialogState extends State<JoinTournamentDialog> {
  final _joinTournamentKey = GlobalKey<FormBuilderState>();

  final JointournamentCubit jointournamentCubit = JointournamentCubit();

  @override
  void initState() {
    if (widget.data.type == "SOLO") {
      jointournamentCubit
        ..jointournament({
          "email": Provider.of<UserData>(context, listen: false).userId,
          "tournment_id": widget.data.id,
          "game_id": widget.data.gameId
        }, widget.data.type);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: BlocConsumer(
        cubit: jointournamentCubit,
        listener: (context, state) {
          if (state is JointournamentJoined) {
            BotToast.closeAllLoading();
            popBool = true;
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
            Navigator.of(context).popUntil((route) => route.isFirst);
          } else if (state is JointournamentFailed) {
            BotToast.closeAllLoading();
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
            Navigator.pop(context);
          } else if (state is JointournamentJoining) {
            BotToast.showLoading();
          }
        },
        builder: (context, state) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _joinTournamentKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoSizeText(
                      "Enter Character IDs",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "TeamMember01",
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        labelText: "Team Member 1",
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
                    SizedBox(height: 8),
                    if (widget.data.type == "SQUAD")
                      FormBuilderTextField(
                        name: "TeamMember02",
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          labelText: "Team Member 2",
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
                    if (widget.data.type == "SQUAD") SizedBox(height: 8),
                    if (widget.data.type == "SQUAD")
                      FormBuilderTextField(
                        name: "TeamMember03",
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          labelText: "Team Member 3",
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
                    SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          _joinTournamentKey.currentState.save();
                          if (_joinTournamentKey.currentState.validate()) {
                            var finalData = <String, dynamic>{};
                            finalData
                                .addAll(_joinTournamentKey.currentState.value);
                            finalData["email"] =
                                Provider.of<UserData>(context, listen: false)
                                    .userId;
                            finalData["tournment_id"] = widget.data.id;
                            finalData["game_id"] = widget.data.gameId;
                            jointournamentCubit.jointournament(
                                finalData, widget.data.type);
                          } else {
                            print("validation failed");
                          }
                        },
                        child: AutoSizeText(
                          "JOIN",
                        ),
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
