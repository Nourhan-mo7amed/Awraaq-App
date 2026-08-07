import 'package:awraq/features/ai_chat/view/ai_chat_view.dart';
import 'package:awraq/features/home/presentation/view/home_view.dart';
import 'package:awraq/features/layout/cubit/layout_cubit/layout_states.dart';
import 'package:awraq/features/saved/presentation/views/saved_services_view.dart';
import 'package:awraq/features/search/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(InitialLayoutStates());

  int currentIndex = 0;
  List<Widget> views = [
    HomeView(),
    SearchView(),
    SavedServicesView(),
    AiChatView()
  ];

  void changeLayoutNavBarState(int index) {
    currentIndex = index;

    emit(LayoutChangeState());
  }
}
