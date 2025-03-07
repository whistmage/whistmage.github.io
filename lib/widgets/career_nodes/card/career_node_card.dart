import 'package:flutter/material.dart';
import 'package:sandbox/entities/career/career_node.dart';
import 'package:sandbox/widgets/career_nodes/card/career_node_duration.dart';
import 'package:sandbox/widgets/career_nodes/card/company_title.dart';

class CareerNodeCard extends StatelessWidget {
  const CareerNodeCard({super.key, required this.careerNode});

  final CareerNode careerNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompanyTitle(company: careerNode.company),
        const SizedBox(height: 4),
        Text(
          careerNode.jobtTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 2),
        CareerNodeDuration(careerNode: careerNode),
        Text(
          careerNode.details,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
