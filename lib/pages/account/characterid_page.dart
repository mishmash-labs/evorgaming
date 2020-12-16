import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../models/account_model.dart';

class CharacterIDPage extends StatelessWidget {
  final List<CharacterId> characterId;

  const CharacterIDPage({Key key, @required this.characterId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)), //this right here
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AutoSizeText(
                "Enter Your Game Character ID's",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              AutoSizeText(
                "Note : You must Enter your correct character ID. You won't be able to change it later by yourself. But if you want to do so you have to contact support.",
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 8),
              for (var item in characterId)
                TextFormField(
                  initialValue: item.characterId,
                  enabled: item.characterId == null,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                      hintText: 'ENTER ${item.gameName} CHARACTER ID',
                      labelText: item.gameName),
                ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: AutoSizeText(
                    "SAVE",
                  ),
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
