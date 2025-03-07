import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/configuration/di.dart';
import 'package:sandbox/widgets/career_nodes/career_nodes_cubit.dart';
import 'package:sandbox/widgets/personal_details/personal_details_cubit.dart';
import 'package:sandbox/widgets/layout_resolver/layout_resolver.dart';
import 'package:sandbox/widgets/career_nodes/career_nodes.dart';
import 'package:sandbox/widgets/personal_details/personal_details.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    const pageTitle = 'Резюме';
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<CareerNodesCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<PersonalDetailsCubit>(),
        ),
      ],
      child: LayoutResolver(
        pageTitle: pageTitle,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
            ),
            child: CustomScrollView(
              slivers: [
                PersonalDetails(),
                CareerNodes(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
