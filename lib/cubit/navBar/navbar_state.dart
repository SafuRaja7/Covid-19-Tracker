part of 'navbar_cubit.dart';

class NavbarState extends Equatable {
  final NavBarItem? navbarItem;
  final int? index;
  const NavbarState({this.index, this.navbarItem});

  @override
  List<Object> get props => [index!, navbarItem!];
}
