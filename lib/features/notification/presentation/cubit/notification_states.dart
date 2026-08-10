abstract class NotificationStates {}

class NotificationInitial extends NotificationStates {}

class NotificationLoading extends NotificationStates {}

class NotificationSuccess extends NotificationStates {}

class NotificationFailure extends NotificationStates {
  final String error;

  NotificationFailure(this.error);
}
// abstract class NotificationStates {}

// class NotificationInitial extends NotificationStates {}

// class NotificationLoading extends NotificationStates {}

// class NotificationSuccess extends NotificationStates {}

// class NotificationFailure extends NotificationStates {
//   final String error;

//   NotificationFailure(this.error);
// }