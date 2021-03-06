/// TODO: Need to document all this parameters.
const GENERAL_FAT_BPB = packed struct {
    BS_jmpBoot: u3,
    BS_OEMName: [8]u8,
    BPB_BytesPerSector: u2,
    BPB_SectorsPerCluster: u1,
    BPB_ReservedSectorsCount: u2,
    BPB_NumberOfFATs: u1,
    BPB_RootEntriesCount: u2,
    BPB_TotalSectors16: u2,
    BPB_Media: u1,
    BPB_SizeOfFAT16: u2,
    BPB_SectorPerTrack: u2,
    BPB_NumberOfHeads: u2,
    BPB_HiddenSectorsCount: u4,
    BPB_TotalSectors32: u4,
};

const FAT_BPB = packed struct {
    GENERAL_FAT_BPB: general,
    BS_DriveNumber: u1,
    BS_Reserved1: u1,
    BS_BootSignature: u1,
    BS_VolumeSerialNumber: u4,
    BS_VolumeLabel: [11]u8,
    BS_FileSystemType: [8]u8,
    BS_BootSignature: u1,
    Padding1: [448]u8,
    SignatureWord: u2,
};

const FAT32_BPB = packed struct {
    GENERAL_FAT_BPB: general,
    BPB_SizeOfFAT32: u4,
    BPB_ExtraFlags: u2,
    BPB_FileSystemVersion: u2,
    BPB_RootCluster: u4,
    BPB_FileSystemInformationSector: u2,
    BPB_BackupBootSector: u2,
    BPB_Reserved: [12]u8,
    BS_DriveNumber: u1,
    BS_Reserved1: u1,
    BS_BootSignature: u1,
    BS_VolumeSerialNumber: u4,
    BS_VolumeLabel: [11]u8,
    BS_FileSystemType: [8]u8,
    Padding: [420]u8,
    SignatureWord: u2,
};
