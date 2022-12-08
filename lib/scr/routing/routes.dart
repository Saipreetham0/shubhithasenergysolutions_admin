const rootRout = '/';

const loginPageRouteDisplay = 'Login';
const loginPageRoute = '/login';

const dashboardPageRouteDisplay = 'Dashboard';
const dashboardPageRoute = '/dashboard';

class MenuItem {
  final String title;
  final String route;

  MenuItem({required this.title, required this.route});
}

List<MenuItem> menuItems = [
  MenuItem(title: dashboardPageRouteDisplay, route: dashboardPageRoute),
  MenuItem(title: loginPageRouteDisplay, route: loginPageRoute),
  MenuItem(title: dashboardPageRouteDisplay, route: dashboardPageRoute),
];



