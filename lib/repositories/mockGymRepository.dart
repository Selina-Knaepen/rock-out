import 'package:rock_out/models/gym.dart';

class MockGymRepository {
  List<Gym> _gyms = new List<Gym>();

  MockGymRepository() {
    addGym("Crux");
    addGym("Boulder");
    addGym("Boulder Mania");
    addGym("City Lizard");
    addGym("Klimax");
    addGym("Maniak");
  }

  addGym(String name) {
    _gyms.add(new Gym(name));
  }

  List<Gym> get gyms {
    return _gyms;
  }
}