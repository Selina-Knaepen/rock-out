class Gym {
  String _name;
  String _address;
  String _website;

  Gym(this._name, this._address, this._website);

  String get name {
    return _name;
  }

  set name(String newName) {
    _name = newName;
  }

  String get address {
    return _address;
  }

  set address(String newAddress) {
    _address = address;
  }

  String get website {
    return _website;
  }

  set website(String newWebsite) {
    _website = newWebsite;
  }
}