import 'package:sandbox/entities/career/career_node.dart';

sealed class CareerNodesState {}

final class CareerNodesInitial extends CareerNodesState {}

final class CareerNodesLoadInProgess extends CareerNodesState {}

final class CareerNodesLoadFinish extends CareerNodesState {
  CareerNodesLoadFinish({required this.values});

  final List<CareerNode> values;
}

final class CareerNodesFailure extends CareerNodesState {}
