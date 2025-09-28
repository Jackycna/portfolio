import 'package:portfolio_in/core/AppImages/app_images.dart';

class ProjectsDataSource {
  static const List<String> project = [
    AppImages.seashop,
    AppImages.calender,
    AppImages.employee,
  ];
  static const String seashop =
      'SeaShop is a fresh fish delivery app designed to provide customers with a smooth and efficient way to order seafood online. The app is divided into three main modules for users, delivery personnel, and administrators. It features real-time delivery tracking using Google Maps, allowing customers to see the live location of their orders. Seamless in-app messaging between users and delivery staff is implemented using Firebase Realtime Database, while Firebase Authentication handles secure login and user management. With a focus on convenience, communication, and reliability, SeaShop offers a complete solution for modern seafood delivery services.';

  static const String employye =
      'The Employee Portal App is a mobile application developed to streamline various internal operations for employees within an organization. It includes essential features such as a QR code scanner for attendance and access tracking, a leave application form with approval flow, and a dynamic reporting dashboard that visualizes employee data on a weekly and monthly basis using interactive charts. The app integrates with RESTful APIs to fetch and send real-time data, ensuring seamless backend communication. Built using Flutter and Dart, the project follows Clean Architecture to promote scalability and maintainability, while BLoC state management is used to handle business logic and state transitions efficiently. My role involved designing and developing core features, implementing API integrations, and ensuring a smooth, user-friendly experience across all modules. Through this project, I gained practical experience in applying clean coding principles, managing complex state, and building data-driven UI components in a realworld Flutter application.';
  static const String calender =
      'The Calendar App is a productivity-focused mobile application designed to help users manage their schedules efficiently with a clean and intuitive interface. The app offers multiple calendar views—including day, week, and month—allowing users to seamlessly navigate and organize their events. It utilizes local notifications to remind users of upcoming tasks or events, ensuring they stay on track throughout the day. All event data is securely stored locally using Sqflite, enabling offline access and fast performance. The app is built with Flutter using a Clean Architecture approach, promoting modularity, testability, and scalability. State management is handled using the BLoC pattern, providing a responsive and reactive user experience. My contribution involved implementing the calendar UI, integrating Sqflite for persistent local storage, setting up local notifications, and structuring the app following best practices in clean architecture. Through this project, I gained handson experience with local storage, notification scheduling, and managing complex state in a realworld app.';
  static final List<String> fishdelivery = [
    AppImages.firesbase,
    AppImages.flutter,
    AppImages.bloc,
    AppImages.map,
  ];
  static final List<String> employeeintegration = [
    AppImages.flutter,
    AppImages.firesbase,
    AppImages.bloc,
    AppImages.scanner,
  ];
  static final List<String> calenderdata = [
    AppImages.flutter,
    AppImages.firesbase,
    AppImages.sqflite,
    AppImages.bloc,
  ];
}
