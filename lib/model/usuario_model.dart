class Usuario{

  var _id;
  var _nombreUsuario;
  var _email; //para la autenticacion y bd
  var _password; //para la autenticacion

  Usuario(this._id, this._nombreUsuario, this._email, this._password);

  Usuario.fromjson(Map<String, dynamic> data)
  : _id=data['id'],
    _nombreUsuario=data['nombreUsuario'],
    _email=data['email'],
    _password=data['password'];

  Map<String, dynamic> convertir() =>{
    'id' : _id,
    'nombreUsuario' : _nombreUsuario,
    'email' : _email,
    'password' : _password
  };

  get email => _email;

  set email(value) {
    _email = value;
  }

  get nombreUsuario => _nombreUsuario;

  set nombreUsuario(value) {
    _nombreUsuario = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }
}