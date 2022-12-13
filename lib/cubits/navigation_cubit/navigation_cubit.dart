import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  void setScreen(int index) {
    if (index == 0) {
      emit(NavigationHome());
    }
    if (index == 1) {
      emit(NavigationGallery());
    }
    if (index == 2) {
      emit(NavigationBooking());
    }
  }
}
