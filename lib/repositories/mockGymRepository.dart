import 'package:rock_out/models/gym.dart';

class MockGymRepository {
  List<Gym> _gyms = new List<Gym>();

  MockGymRepository() {
    addGymByValues("Crux");
    addGymByValues("Boulder");
    addGymByValues("Boulder Mania");
    addGymByValues("City Lizard");
    addGymByValues("Klimax");
    addGymByValues("Maniak");
  }

  addGymByValues(String name, [String address = "Unknown", String website = "Unknown"]) {
    _gyms.add(new Gym(name, address, website));
  }

  addGym(Gym gym) {
    _gyms.add(gym);
  }

  List<Gym> get gyms {
    return _gyms;
  }
}