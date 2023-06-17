class Desktop {
  String idDesktop;
  String desktopTag;
  String userName;
  String desktopComputerName;
  String desktopSerialNumber;
  String desktopManufacturer;
  String desktopModel;
  String desktopTotalPhysicalMemory;
  String desktopOperatingSystem;
  String desktopProvider;
  String desktopProcessor;
  String desktopMacAddress;
  String desktopDiskDrive;
  String department;
  String site;
  String monitor1;
  String monitor2;

  Desktop({
    required this.idDesktop,
    required this.desktopTag,
    required this.userName,
    required this.desktopComputerName,
    required this.desktopSerialNumber,
    required this.desktopManufacturer,
    required this.desktopModel,
    required this.desktopTotalPhysicalMemory,
    required this.desktopOperatingSystem,
    required this.desktopProvider,
    required this.desktopProcessor,
    required this.desktopMacAddress,
    required this.desktopDiskDrive,
    required this.department,
    required this.site,
    required this.monitor1,
    required this.monitor2,
  });

  factory Desktop.fromJson(Map<String, dynamic> json) {
    return Desktop(
      idDesktop: json['id_desktop'],
      desktopTag: json['desktop_tag'],
      userName: json['user_name'],
      desktopComputerName: json['desktop_computer_name'],
      desktopSerialNumber: json['desktop_serial_number'],
      desktopManufacturer: json['desktop_manufacturer'],
      desktopModel: json['desktop_model'],
      desktopTotalPhysicalMemory: json['desktop_total_physical_memory'],
      desktopOperatingSystem: json['desktop_operating_system'],
      desktopProvider: json['desktop_provider'],
      desktopProcessor: json['desktop_processor'],
      desktopMacAddress: json['desktop_mac_address'],
      desktopDiskDrive: json['desktop_disk_drive'],
      department: json['department'],
      site: json['site'],
      monitor1: json['monitor1'],
      monitor2: json['monitor2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_desktop': idDesktop,
      'desktop_tag': desktopTag,
      'user_name': userName,
      'desktop_computer_name': desktopComputerName,
      'desktop_serial_number': desktopSerialNumber,
      'desktop_manufacturer': desktopManufacturer,
      'desktop_model': desktopModel,
      'desktop_total_physical_memory': desktopTotalPhysicalMemory,
      'desktop_operating_system': desktopOperatingSystem,
      'desktop_provider': desktopProvider,
      'desktop_processor': desktopProcessor,
      'desktop_mac_address': desktopMacAddress,
      'desktop_disk_drive': desktopDiskDrive,
      'department': department,
      'site': site,
      'monitor1': monitor1,
      'monitor2': monitor2,
    };
  }

  @override
  String toString() {
    return 'Desktop{idDesktop: $idDesktop, desktopTag: $desktopTag, userName: $userName, '
        'desktopComputerName: $desktopComputerName, desktopSerialNumber: $desktopSerialNumber, '
        'desktopManufacturer: $desktopManufacturer, desktopModel: $desktopModel, '
        'desktopTotalPhysicalMemory: $desktopTotalPhysicalMemory, desktopOperatingSystem: $desktopOperatingSystem, '
        'desktopProvider: $desktopProvider, desktopProcessor: $desktopProcessor, '
        'desktopMacAddress: $desktopMacAddress, desktopDiskDrive: $desktopDiskDrive, '
        'department: $department, site: $site, monitor1: $monitor1, monitor2: $monitor2}';
  }
}
