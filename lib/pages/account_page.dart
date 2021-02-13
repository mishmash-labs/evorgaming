import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:evorgaming/pages/account/withdrawls_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../cubits/accountpage/account_cubit.dart';
import '../cubits/changepassword/changepassword_cubit.dart';
import '../providers/userdata_provider.dart';
import 'account/announcements_page.dart';
import 'account/characterid_page.dart';
import 'account/orders_page.dart';
import 'account/profile_page.dart';
import 'account/transactions_page.dart';
import 'home/wallet_page.dart';
import 'login_page.dart';

class AccountPage extends StatelessWidget {
  final AccountCubit accountCubit = AccountCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: accountCubit
        ..loadAccount(Provider.of<UserData>(context, listen: false).userId),
      // cubit: accountCubit..loadAccount("hasnain01022000@gmail.com"),
      builder: (context, state) {
        if (state is AccountLoaded) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: AutoSizeText(
                "My Account",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black38,
                    child: state.data.profileDetails.photo != null
                        ? InkWell(
                            onTap: () => showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return ProfilePage(
                                  profileDetails: state.data.profileDetails,
                                  accountCubit: accountCubit,
                                );
                              },
                            ),
                            child: CachedNetworkImage(
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              imageUrl:
                                  "https://evorgaming.com/storage/${state.data.profileDetails.photo}",
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return ProfilePage(
                                    profileDetails: state.data.profileDetails,
                                    accountCubit: accountCubit,
                                  );
                                },
                              );
                            },
                            icon: (Icon(Icons.person)),
                          ),
                  ),
                ),
              ],
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WalletPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                AutoSizeText(state.data.profileDetails.balance),
                                SizedBox(height: 8),
                                AutoSizeText(
                                  "Balance",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                AutoSizeText(
                                    state.data.profileDetails.earning ?? "0"),
                                SizedBox(height: 8),
                                AutoSizeText(
                                  "Earnings",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.white10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnnouncementsPage(),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.announcement)),
                  title: AutoSizeText(
                    "Announcements",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.white10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WalletPage(),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.account_balance_wallet)),
                  title: AutoSizeText(
                    "Wallet",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.white10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterIDPage(
                          characterId: state.data.characterId,
                        ),
                      ),
                    ).then((val) => accountCubit
                      ..refresh(Provider.of<UserData>(context, listen: false)
                          .userId));
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.person_add)),
                  title: AutoSizeText(
                    "Characters IDs",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.white10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrdersPage(
                          orderData: state.data.orders,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.shopping_cart)),
                  title: AutoSizeText(
                    "Orders",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.white10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionsPage(
                          transactionData: state.data.transaction,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.swap_horiz)),
                  title: AutoSizeText(
                    "Transactions",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.white10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WithdrawalPage(
                          withdrawalData: state.data.withdrawals,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.attach_money)),
                  title: AutoSizeText(
                    "Withdrawals",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.white10,
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return ChangePasswordDialog();
                      },
                    );
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.lock_open)),
                  title: AutoSizeText(
                    "Change Password",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.white10,
                ),
                ListTile(
                  onTap: () async {
                    const url = 'https://evorgaming.com/page/Privacy-Policy';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.policy)),
                  title: AutoSizeText(
                    "Privacy Policy",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.white10,
                ),
                ListTile(
                  onTap: () async {
                    const url = 'https://evorgaming.com/page/Terms&Conditions';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.notes)),
                  title: AutoSizeText(
                    "Terms & Conditions",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.white10,
                ),
                ListTile(
                  onTap: () async {
                    const url = 'https://evorgaming.com/contact';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.help)),
                  title: AutoSizeText(
                    "FAQ / Support",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.white10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: OutlineButton(
                      onPressed: () async {
                        await Provider.of<UserData>(context, listen: false)
                            .prefs
                            .clear();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      borderSide: BorderSide(color: Colors.red.shade800),
                      highlightedBorderColor: Colors.red.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      child: AutoSizeText(
                        "Logout".toUpperCase(),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8)
              ],
            ),
          );
        } else if (state is AccountLoading) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: AutoSizeText(
                "My Account",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            body: Center(
              child: SpinKitCubeGrid(
                color: Colors.red.shade900,
                size: 50.0,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class ChangePasswordDialog extends StatelessWidget {
  final _changePasswordKey = GlobalKey<FormBuilderState>();
  final ChangepasswordCubit changepasswordCubit = ChangepasswordCubit();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: BlocConsumer(
        cubit: changepasswordCubit,
        listener: (context, state) {
          if (state is ChangepasswordSubmitted) {
            BotToast.closeAllLoading();
            BotToast.showText(
                text: state.data.message, duration: Duration(seconds: 4));
            Navigator.pop(context);
          } else if (state is ChangepasswordFailed) {
            BotToast.closeAllLoading();
            BotToast.showText(
                text: state.message, duration: Duration(seconds: 4));
          } else if (state is ChangepasswordSubmitting) {
            BotToast.showLoading();
          }
        },
        builder: (context, state) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: FormBuilder(
                key: _changePasswordKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          "Change Password",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                    FormBuilderTextField(
                      name: "old_password",
                      cursorColor: Colors.red,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Enter Previous Password",
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
                    FormBuilderTextField(
                      name: "new_password",
                      cursorColor: Colors.red,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Enter New Password",
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
                    FormBuilderTextField(
                      name: "new_password_confirm",
                      cursorColor: Colors.red,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Confirm New Password",
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
                        (val) {
                          if (_changePasswordKey
                                  .currentState.fields['new_password']?.value !=
                              val) return 'Password does not match';
                          return null;
                        }
                      ]),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          _changePasswordKey.currentState.save();
                          if (_changePasswordKey.currentState.validate()) {
                            var finalData = <String, dynamic>{};
                            finalData
                                .addAll(_changePasswordKey.currentState.value);
                            finalData["email"] =
                                Provider.of<UserData>(context, listen: false)
                                    .userId;
                            changepasswordCubit.changepassword(finalData);
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
          );
        },
      ),
    );
  }
}
