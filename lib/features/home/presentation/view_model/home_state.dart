import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_management_platform/app/di/di.dart';
import 'package:real_estate_management_platform/features/batch/presentation/view/batch_view.dart';
import 'package:real_estate_management_platform/features/batch/presentation/view_model/batch_bloc.dart';
import 'package:real_estate_management_platform/features/course/presentation/view/course_view.dart';
import 'package:real_estate_management_platform/features/course/presentation/view_model/course_bloc.dart';
import 'package:real_estate_management_platform/features/home/presentation/view/dashboard_view.dart';
import 'package:real_estate_management_platform/features/home/presentation/view/profile_view.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        BlocProvider(
          create: (context) => getIt<CourseBloc>(),
          child: const HomeScreen(),
        ),
        BlocProvider(
          create: (context) => getIt<CourseBloc>(),
          child: const CourseView(),
        ),
        BlocProvider(
          create: (context) => getIt<BatchBloc>(),
          child: const ProductListScreen(),
        ),
        BlocProvider(
          create: (context) => getIt<CourseBloc>(),
          child: const ProfileView(),
        ),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
