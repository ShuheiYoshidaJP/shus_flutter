class Pose3d {
  double x, y, z;
  Pose3d({required this.x, required this.y, required this.z});
  factory Pose3d.fromData(Map<String, dynamic> data) {
    return Pose3d(x: data["x"], y: data["y"], z: data["z"]);
  }
}
