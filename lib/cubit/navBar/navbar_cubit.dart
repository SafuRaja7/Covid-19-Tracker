import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navbar_state.dart';
part 'navBar_items.dart';

class NavBarCubit extends Cubit<NavbarState> {
  NavBarCubit()
      : super(const NavbarState(index: 0, navbarItem: NavBarItem.global));

  void getNavBarItem(NavBarItem navbarItem) {
    switch (navbarItem) {
      case NavBarItem.global:
        emit(const NavbarState(index: 0, navbarItem: NavBarItem.global));
        break;
      case NavBarItem.countries:
        emit(const NavbarState(index: 1, navbarItem: NavBarItem.countries));
        break;
      case NavBarItem.pakistan:
        emit(const NavbarState(index: 2, navbarItem: NavBarItem.global));
        break;
    }
  }
}
