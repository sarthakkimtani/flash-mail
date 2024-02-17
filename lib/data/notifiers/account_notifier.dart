import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:hive_flutter/adapters.dart";

import "package:flash_mail/data/models/account/account.dart";
import "package:flash_mail/data/providers/providers.dart";

class AccountState {
  final bool isLoading;
  final TMAccount? user;

  const AccountState({
    this.isLoading = false,
    this.user,
  });

  bool isAuthenticated() {
    return user != null;
  }
}

class AccountNotifier extends StateNotifier<AccountState> {
  static const _boxName = "accounts";
  static const _key = "user";

  final Ref ref;

  AccountNotifier(this.ref) : super(const AccountState());

  Future<void> fetchAccount() async {
    var box = await Hive.openBox<TMAccount>(_boxName);
    final user = box.get(_key, defaultValue: null);

    if (user != null) {
      ref.read(emailProvider.notifier).state = user.email;
      ref.read(passwordProvider.notifier).state = user.password;
      state = AccountState(isLoading: false, user: user);
    }
  }

  Future<void> createAccount() async {
    state = const AccountState(isLoading: true);

    try {
      TMAccount account = await ref.read(clientProvider).createAccount();
      var box = Hive.box<TMAccount>(_boxName);
      await box.put(_key, account);

      ref.read(emailProvider.notifier).state = account.email;
      ref.read(passwordProvider.notifier).state = account.password;
      state = AccountState(isLoading: false, user: account);
    } catch (err) {
      state = const AccountState(isLoading: false);
      rethrow;
    }
  }

  Future<void> login(String? address, String? password) async {
    state = const AccountState(isLoading: true);

    try {
      if (address != null && password != null) {
        TMAccount account =
            await ref.read(clientProvider).login(address, password);
        var box = Hive.box<TMAccount>(_boxName);
        await box.put(_key, account);

        state = AccountState(isLoading: false, user: account);
      }
    } catch (err) {
      state = const AccountState(isLoading: false);
      rethrow;
    }
  }

  Future<void> logout() async {
    AccountState previous = state;
    try {
      var box = Hive.box<TMAccount>(_boxName);
      await box.delete(_key);
      state = const AccountState();
    } catch (err) {
      state = previous;
      rethrow;
    }
  }
}
