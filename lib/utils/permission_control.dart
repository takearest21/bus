import 'package:permission/permission.dart';

class PermissionControl {
  bool a0 = false,
      a1 = false,
      a2 = false,
      a3 = false,
      a4 = false,
      a5 = false,
      a6 = false,
      a7 = false,
      a8 = false,
      a9 = false;
  bool i0 = false,
      i1 = false,
      i2 = false,
      i3 = false,
      i4 = false,
      i5 = false,
      i6 = false;
  int radioValue = 0;
  PermissionName permissionName = PermissionName.Internet;
  String message = '';

  Future getPermissionsStatus() async {
    List<PermissionName> permissionNames = [];
    if (a0) permissionNames.add(PermissionName.Calendar);
    if (a1) permissionNames.add(PermissionName.Camera);
    if (a2) permissionNames.add(PermissionName.Contacts);
    if (a3) permissionNames.add(PermissionName.Microphone);
    if (a4) permissionNames.add(PermissionName.Location);
    if (a5) permissionNames.add(PermissionName.Phone);
    if (a6) permissionNames.add(PermissionName.Sensors);
    if (a7) permissionNames.add(PermissionName.SMS);
    if (a8) permissionNames.add(PermissionName.Storage);

    if (i0) permissionNames.add(PermissionName.Internet);
    if (i1) permissionNames.add(PermissionName.Calendar);
    if (i2) permissionNames.add(PermissionName.Camera);
    if (i3) permissionNames.add(PermissionName.Contacts);
    if (i4) permissionNames.add(PermissionName.Microphone);
    if (i5) permissionNames.add(PermissionName.Location);
    if (i6) permissionNames.add(PermissionName.Storage);
    message = '';
    List<Permissions> permissions =
        await Permission.getPermissionsStatus(permissionNames);
    permissions.forEach((permission) {
      message +=
          '${permission.permissionName}: ${permission.permissionStatus}\n';
    });
  
  }

  Future getSinglePermissionStatus() async {
    var permissionStatus =
        await Permission.getSinglePermissionStatus(permissionName);
    
       message = permissionStatus.toString();
    
  }

   Future requestPermissions() async {
    List<PermissionName> permissionNames = [];
    if (a0) permissionNames.add(PermissionName.Calendar);
    if (a1) permissionNames.add(PermissionName.Camera);
    if (a2) permissionNames.add(PermissionName.Contacts);
    if (a3) permissionNames.add(PermissionName.Microphone);
    if (a4) permissionNames.add(PermissionName.Location);
    if (a5) permissionNames.add(PermissionName.Phone);
    if (a6) permissionNames.add(PermissionName.Sensors);
    if (a7) permissionNames.add(PermissionName.SMS);
    if (a8) permissionNames.add(PermissionName.Storage);
    if (a9) permissionNames.add(PermissionName.State);

    if (i0) permissionNames.add(PermissionName.Internet);
    if (i1) permissionNames.add(PermissionName.Calendar);
    if (i2) permissionNames.add(PermissionName.Camera);
    if (i3) permissionNames.add(PermissionName.Contacts);
    if (i4) permissionNames.add(PermissionName.Microphone);
    if (i5) permissionNames.add(PermissionName.Location);
    if (i6) permissionNames.add(PermissionName.Storage);
    message = '';
    var permissions = await Permission.requestPermissions(permissionNames);
    permissions.forEach((permission) {
      message +=
          '${permission.permissionName}: ${permission.permissionStatus}\n';
    });
    
  }
}
