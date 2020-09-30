class AuthException implements Exception{
  static const Map<String, String > erros = {
    "EMAIL_EXISTS": 'o endereço de email já está sendo usado por outra conta',
    "OPERATION_NOT_ALLOWED":'Operação não permitida',
    "TOO_MANY_ATTEMPTS_TRY_LATER":'Tente mais tarde',
    "EMAIL_NOT_FOUND": 'Email não encontrado',
    "INVALID_PASSWORD": 'Senha invalida',
    "USER_DISABLED": 'Usuário desativado',
  }; 
  final String key;

  AuthException(this.key);

  @override
  String toString() {
    String erro = "Erro inesperado!";
    if(erros.containsKey(key)){
      erro = erros[key];
    }

  return erro;
  
  }

}