import 'package:titles/src/data/utils/exceptions/exceptions.dart';

class LocalStorageException extends AppExceptions {
  LocalStorageException(super.mensage, [super.stackTrace]);
}

class ClientExeception extends AppExceptions {
  ClientExeception(super.mensage);
}
