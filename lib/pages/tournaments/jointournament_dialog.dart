import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../../cubits/jointournaments/jointournament_cubit.dart';
import '../../cubits/missingid/missingid_cubit.dart';
import '../../models/tournamentdetails_model.dart';
import '../../providers/userdata_provider.dart';
import '../../utils/globals.dart';

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
    BotToast.showLoading();
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
        bloc: jointournamentCubit,
        listener: (context, state) {
          if (state is JointournamentJoining) {
            BotToast.showLoading();
          } else if (state is JointournamentJoined) {
            BotToast.closeAllLoading();
            popBool = true;
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
            Navigator.of(context).popUntil((route) => route.isFirst);
          } else if (state is JointournamentFailed) {
            BotToast.closeAllLoading();
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
            if (state.data.code == "300")
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return MissingIDDialog(
                    gameName: widget.data.game,
                    gameID: widget.data.gameId,
                  );
                },
              ).then((val) {
                if (widget.data.type == "SOLO") {
                  Navigator.pop(context);
                }
              });
            if (widget.data.type == "SOLO" && state.data.code != "300") {
              Navigator.pop(context);
            }
          }
        },
        builder: (context, state) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _joinTournamentKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    AutoSizeText(
                      "Join Tournament",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    if (widget.data.type == "DUO" ||
                        widget.data.type == "SQUAD")
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
                    if (widget.data.type == "DUO" ||
                        widget.data.type == "SQUAD")
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () {
                            _joinTournamentKey.currentState.save();
                            if (_joinTournamentKey.currentState.validate()) {
                              var finalData = <String, dynamic>{};
                              finalData.addAll(
                                  _joinTournamentKey.currentState.value);
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

class MissingIDDialog extends StatelessWidget {
  final gameID;
  final gameName;

  MissingIDDialog({Key key, @required this.gameID, @required this.gameName})
      : super(key: key);

  final MissingidCubit missingidCubit = MissingidCubit();
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: missingidCubit,
      listener: (BuildContext context, state) {
        if (state is MissingidSubmitting) {
          BotToast.showLoading();
        } else if (state is MissingidSubmitted) {
          BotToast.closeAllLoading();
          BotToast.showText(
              text: state.data.message, duration: Duration(seconds: 4));
          Navigator.pop(context);
        } else if (state is MissingidFailed) {
          BotToast.closeAllLoading();
          BotToast.showText(
              text: state.data.message, duration: Duration(seconds: 4));
        }
      },
      builder: (context, state) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "Enter Your $gameName Character ID",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: CircleAvatar(
                            backgroundColor: Colors.black38,
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: idController,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      labelText: "Enter Character ID",
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
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        missingidCubit.updateid({
                          "email": Provider.of<UserData>(context, listen: false)
                              .userId,
                          "game_id": gameID,
                          "Character_id": idController.text
                        });
                      },
                      child: AutoSizeText(
                        "SUBMIT",
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
    );
  }
}
