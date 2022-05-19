import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wassword/cubit/password_cubit.dart';
import 'package:wassword/styles/dimens.dart' as mdimens;
import 'package:wassword/ui/action_button.dart';
import 'package:wassword/ui/custom_slider_thumb_circle.dart';
import 'package:wassword/ui/option_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PasswordCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  void _copyToClipboard(String newPassword) {
    Clipboard.setData(ClipboardData(text: newPassword));

    if (Platform.isAndroid || Platform.isIOS) {
      Fluttertoast.showToast(
          msg: "Password copied to clipboard",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          "Wassword",
          style: GoogleFonts.roboto(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              iconSize: 24,
              color: Theme.of(context).colorScheme.onPrimary,
              icon: const Icon(Icons.info_outline_rounded),
              onPressed: () => context.push('/about'),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: mdimens.defaultSpace),
            height: 250,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(mdimens.roundedCornerPassword),
                bottomRight: Radius.circular(mdimens.roundedCornerPassword),
              ),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: mdimens.paddingHorizontalPassword),
            alignment: const Alignment(0, 0),
            child: Text(
              context.select((PasswordCubit cubit) => cubit.state.password),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          //https://medium.com/flutter-community/flutter-sliders-demystified-4b3ea65879c
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTrackColor:
                    Theme.of(context).colorScheme.primaryContainer,
                trackHeight: mdimens.heightSlider * 1.3,
                inactiveTrackColor:
                    Theme.of(context).colorScheme.surfaceVariant,
                thumbColor: Theme.of(context).colorScheme.primaryContainer,
                thumbShape: CustomSliderThumbCircle(
                    thumbRadius: mdimens.heightSlider,
                    buildContext: context,
                    value: context
                        .select((PasswordCubit cubit) => cubit.state.length))),
            child: Slider(
                min: 8.0,
                max: 32.0,
                divisions: 20,
                value: context.select(
                    (PasswordCubit cubit) => cubit.state.length.toDouble()),
                onChanged: (double value) =>
                    context.read<PasswordCubit>().changeLength(value.toInt())),
          ),
          SizedBox(
            height: mdimens.defaultSpace,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: mdimens.paddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                OptionButton(
                  title: "Uppercase",
                  description: "ABC",
                  icon: Icons.title,
                  active: context.select(
                      (PasswordCubit cubit) => cubit.state.withUppercase),
                  callback: () =>
                      context.read<PasswordCubit>().changeUppercase(),
                ),
                SizedBox(
                  width: mdimens.defaultSpace,
                ),
                OptionButton(
                    title: "Lowercase",
                    description: "abc",
                    icon: Icons.format_size,
                    active: context.select(
                        (PasswordCubit cubit) => cubit.state.withLowercase),
                    callback: () =>
                        context.read<PasswordCubit>().changeLowercase()),
              ],
            ),
          ),
          SizedBox(
            height: mdimens.defaultSpace,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: mdimens.paddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                OptionButton(
                    title: "Numbers",
                    description: "123",
                    icon: Icons.looks_one,
                    active: context.select(
                        (PasswordCubit cubit) => cubit.state.withNumbers),
                    callback: () =>
                        context.read<PasswordCubit>().changeNumbers()),
                SizedBox(
                  width: mdimens.defaultSpace,
                ),
                OptionButton(
                    title: "Special",
                    description: "@£*",
                    icon: Icons.star,
                    active: context.select(
                        (PasswordCubit cubit) => cubit.state.withSpecial),
                    callback: () =>
                        context.read<PasswordCubit>().changeSpecial()),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          BlocConsumer<PasswordCubit, PasswordState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mdimens.paddingHorizontal),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ActionButton(
                        text: "Copy",
                        icon: Icons.copy,
                        isMain: false,
                        callback: () => _copyToClipboard(state.password),
                      ),
                    ),
                    SizedBox(
                      width: mdimens.defaultSpace,
                    ),
                    Expanded(
                      flex: 4,
                      child: ActionButton(
                        text: "Generate",
                        icon: Icons.sync,
                        isMain: true,
                        callback: () =>
                            context.read<PasswordCubit>().updatePassword(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: mdimens.hugeSpace,
          ),
        ],
      ),
    );
  }
}
