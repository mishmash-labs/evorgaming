import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../cubits/characterid/characterid_cubit.dart';
import '../../models/account_model.dart';
import '../../providers/userdata_provider.dart';

class CharacterIDPage extends StatefulWidget {
  final List<CharacterId> characterId;

  const CharacterIDPage({Key key, @required this.characterId})
      : super(key: key);

  @override
  _CharacterIDPageState createState() => _CharacterIDPageState();
}

class _CharacterIDPageState extends State<CharacterIDPage> {
  CharacteridCubit characteridCubit;

  @override
  void initState() {
    characteridCubit = CharacteridCubit(widget.characterId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: AutoSizeText(
            "Character IDs",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: characteridCubit.characterId
                .where((cid) {
                  return cid.characterId == null;
                })
                .toList()
                .isNotEmpty
            ? FloatingActionButton.extended(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  "Add ID",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.red.shade700,
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return IDDialog(
                        characterId: characteridCubit.characterId,
                        characteridCubit: characteridCubit,
                      );
                    },
                  );
                },
              )
            : null,
        body: BlocBuilder(
          cubit: characteridCubit,
          builder: (context, state) {
            if (state is CharacteridInitial ||
                state is CharacteridAdded ||
                state is CharacteridFailed) {
              return characteridCubit.characterId
                          .where((cid) {
                            return cid.characterId != null;
                          })
                          .toList()
                          .length ==
                      0
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person_add,
                            color: Colors.white54,
                            size: 75,
                          ),
                          const SizedBox(height: 8),
                          AutoSizeText(
                            "No IDs Added",
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: characteridCubit.characterId
                          .where((cid) {
                            return cid.characterId != null;
                          })
                          .toList()
                          .length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              title: Text("Game: " +
                                  characteridCubit.characterId
                                      .where((cid) {
                                        return cid.characterId != null;
                                      })
                                      .toList()[index]
                                      .gameName),
                              subtitle: Text("Character ID: " +
                                  characteridCubit.characterId
                                      .where((cid) {
                                        return cid.characterId != null;
                                      })
                                      .toList()[index]
                                      .characterId),
                            ),
                          ),
                        );
                      },
                    );
            } else if (state is CharacteridAdding) {
              return Center(
                child: SpinKitCubeGrid(
                  color: Colors.red.shade900,
                  size: 50.0,
                ),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}

class IDDialog extends StatelessWidget {
  final List<CharacterId> characterId;
  final CharacteridCubit characteridCubit;
  final _characterIDKey = GlobalKey<FormBuilderState>();

  IDDialog({Key key, this.characterId, this.characteridCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: characteridCubit,
      listener: (context, state) {
        if (state is CharacteridAdded) {
          BotToast.closeAllLoading();
          BotToast.showText(
              text: state.data.message, duration: Duration(seconds: 4));

          Navigator.pop(context);
        } else if (state is CharacteridFailed) {
          BotToast.closeAllLoading();
          BotToast.showText(
              text: state.data.message, duration: Duration(seconds: 4));
        } else if (state is CharacteridAdding) {
          BotToast.showLoading();
        }
      },
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: FormBuilder(
              key: _characterIDKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "Enter Your Game Character IDs",
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
                  AutoSizeText(
                    "Note : You must Enter your correct character ID. You won't be able to change it later by yourself. But if you want to do so you have to contact support.",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 16),
                  FormBuilderDropdown(
                    name: "game_id",
                    decoration: InputDecoration(
                      labelText: "Select Game",
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
                    items: characterId
                        .where((cid) {
                          return cid.characterId == null;
                        })
                        .toList()
                        .map<DropdownMenuItem>((id) {
                          return DropdownMenuItem(
                            value: id.gameId,
                            child: Text('${id.gameName}'),
                          );
                        })
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  FormBuilderTextField(
                    name: "Character_id",
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
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        _characterIDKey.currentState.save();
                        if (_characterIDKey.currentState.validate()) {
                          var finalData = <String, dynamic>{};
                          finalData.addAll(_characterIDKey.currentState.value);
                          finalData["email"] =
                              Provider.of<UserData>(context, listen: false)
                                  .userId;
                          characteridCubit.updateid(
                              Provider.of<UserData>(context, listen: false)
                                  .userId,
                              finalData);
                        } else {
                          print("validation failed");
                        }
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
        ),
      ),
    );
  }
}
