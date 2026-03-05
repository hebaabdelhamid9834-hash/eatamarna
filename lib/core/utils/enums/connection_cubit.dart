import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectionStatus { connected, disconnected }

class ConnectionCubit extends Cubit<ConnectionStatus> {
  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription _subscription;

  ConnectionCubit() : super(ConnectionStatus.connected) {
    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      if (results.contains(ConnectivityResult.mobile) || results.contains(ConnectivityResult.wifi)) {
        emit(ConnectionStatus.connected);
      } else {
        emit(ConnectionStatus.disconnected);
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
