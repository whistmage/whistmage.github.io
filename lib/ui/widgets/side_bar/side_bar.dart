import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/configuration/di.dart';
import 'package:sandbox/services/model_states/contacts/contacts_cubit.dart';
import 'package:sandbox/services/model_states/hobbies/hobbies_cubit.dart';
import 'package:sandbox/services/model_states/personal_info/personal_info_cubit.dart';
import 'package:sandbox/ui/appereance/additional_colors.dart';
import 'package:sandbox/ui/widgets/contacts/contacts.dart';
import 'package:sandbox/ui/widgets/hobbies/hobbies.dart';
import 'package:sandbox/ui/widgets/personal_info/personal_info.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<ContactsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<PersonalInfoCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<HobbiesCubit>(),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                Theme.of(context).extension<AdditionalColors>()?.overlayColor,
          ),
          child: CustomScrollView(
            slivers: [
              PersonalInfo(),
              Contacts(),
              Hobbies(),
            ],
          ),
        ),
      ),
    );
  }
}
