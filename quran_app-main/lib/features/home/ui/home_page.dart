import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/home/logic/cubits/main_cubit.dart';
import 'package:quran_app/features/home/logic/cubits/main_cubit_states.dart';

import 'package:quran_app/features/home/ui/widgets/home_page_body.dart';
import 'package:quran_app/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainCubitStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                scrolledUnderElevation: 0,
                elevation: 0,
                title: Text(
                  S.of(context).homeTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<MainCubit>(context).changeAppMode();
                      },
                      icon: BlocProvider.of<MainCubit>(context).isDark
                          ? const Icon(
                              Icons.sunny,
                              color: Colors.amber,
                            )
                          : const Icon(
                              Icons.brightness_2,
                              color: Colors.blueAccent,
                            ))
                ],
              ),
              body: const HomePageBody(),
            );
          }),
    );
  }
}
