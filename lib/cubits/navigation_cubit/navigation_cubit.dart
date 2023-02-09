import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/constants.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationHome());

  void setScreen(Navigation index) {
    switch (index) {
      case Navigation.home:
        {
          emit(NavigationHome());
        }
        break;
      case Navigation.gallery:
        {
          emit(NavigationGallery());
        }
        break;
      case Navigation.booking:
        {
          emit(NavigationBooking());
        }
        break;
      case Navigation.login:
        {
          emit(NavigationLogin());
        }
        break;
      case Navigation.add:
        {
          emit(NavigationAdd());
        }
        break;
      default:
        {
          emit(NavigationHome());
        }
    }
  }
}
