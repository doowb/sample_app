require 'windows/api'

module Windows
   module DeviceIO
      API.auto_namespace = 'Windows::DeviceIO'
      API.auto_constant  = true
      API.auto_method    = true
      API.auto_unicode   = false

      private

      # Device Types
      FILE_DEVICE_BEEP                = 0x00000001
      FILE_DEVICE_CD_ROM              = 0x00000002
      FILE_DEVICE_CD_ROM_FILE_SYSTEM  = 0x00000003
      FILE_DEVICE_CONTROLLER          = 0x00000004
      FILE_DEVICE_DATALINK            = 0x00000005
      FILE_DEVICE_DFS                 = 0x00000006
      FILE_DEVICE_DISK                = 0x00000007
      FILE_DEVICE_DISK_FILE_SYSTEM    = 0x00000008
      FILE_DEVICE_FILE_SYSTEM         = 0x00000009
      FILE_DEVICE_INPORT_PORT         = 0x0000000a
      FILE_DEVICE_KEYBOARD            = 0x0000000b
      FILE_DEVICE_MAILSLOT            = 0x0000000c
      FILE_DEVICE_MIDI_IN             = 0x0000000d
      FILE_DEVICE_MIDI_OUT            = 0x0000000e
      FILE_DEVICE_MOUSE               = 0x0000000f
      FILE_DEVICE_MULTI_UNC_PROVIDER  = 0x00000010
      FILE_DEVICE_NAMED_PIPE          = 0x00000011
      FILE_DEVICE_NETWORK             = 0x00000012
      FILE_DEVICE_NETWORK_BROWSER     = 0x00000013
      FILE_DEVICE_NETWORK_FILE_SYSTEM = 0x00000014
      FILE_DEVICE_NULL                = 0x00000015
      FILE_DEVICE_PARALLEL_PORT       = 0x00000016
      FILE_DEVICE_PHYSICAL_NETCARD    = 0x00000017
      FILE_DEVICE_PRINTER             = 0x00000018
      FILE_DEVICE_SCANNER             = 0x00000019
      FILE_DEVICE_SERIAL_MOUSE_PORT   = 0x0000001a
      FILE_DEVICE_SERIAL_PORT         = 0x0000001b
      FILE_DEVICE_SCREEN              = 0x0000001c
      FILE_DEVICE_SOUND               = 0x0000001d
      FILE_DEVICE_STREAMS             = 0x0000001e
      FILE_DEVICE_TAPE                = 0x0000001f
      FILE_DEVICE_TAPE_FILE_SYSTEM    = 0x00000020
      FILE_DEVICE_TRANSPORT           = 0x00000021
      FILE_DEVICE_UNKNOWN             = 0x00000022
      FILE_DEVICE_VIDEO               = 0x00000023
      FILE_DEVICE_VIRTUAL_DISK        = 0x00000024
      FILE_DEVICE_WAVE_IN             = 0x00000025
      FILE_DEVICE_WAVE_OUT            = 0x00000026
      FILE_DEVICE_8042_PORT           = 0x00000027
      FILE_DEVICE_NETWORK_REDIRECTOR  = 0x00000028
      FILE_DEVICE_BATTERY             = 0x00000029
      FILE_DEVICE_BUS_EXTENDER        = 0x0000002a
      FILE_DEVICE_MODEM               = 0x0000002b
      FILE_DEVICE_VDM                 = 0x0000002c
      FILE_DEVICE_MASS_STORAGE        = 0x0000002d
      FILE_DEVICE_SMB                 = 0x0000002e
      FILE_DEVICE_KS                  = 0x0000002f
      FILE_DEVICE_CHANGER             = 0x00000030
      FILE_DEVICE_SMARTCARD           = 0x00000031
      FILE_DEVICE_ACPI                = 0x00000032
      FILE_DEVICE_DVD                 = 0x00000033
      FILE_DEVICE_FULLSCREEN_VIDEO    = 0x00000034
      FILE_DEVICE_DFS_FILE_SYSTEM     = 0x00000035
      FILE_DEVICE_DFS_VOLUME          = 0x00000036
      FILE_DEVICE_SERENUM             = 0x00000037
      FILE_DEVICE_TERMSRV             = 0x00000038
      FILE_DEVICE_KSEC                = 0x00000039
      FILE_DEVICE_FIPS                = 0x0000003A
      FILE_DEVICE_INFINIBAND          = 0x0000003B

      IOCTL_DISK_BASE = FILE_DEVICE_DISK
      
      FILE_ANY_ACCESS     = 0
      FILE_READ_ACCESS    = 0x0001
      FILE_WRITE_ACCESS   = 0x0002
      FILE_SPECIAL_ACCESS = FILE_ANY_ACCESS
      
      METHOD_BUFFERED   = 0
      METHOD_IN_DIRECT  = 1
      METHOD_OUT_DIRECT = 2
      METHOD_NEITHER    = 3
      
      API.new('DeviceIoControl', 'LLPLPLPP', 'B')
      
      # Macros from WinIoCtl.h

      def CTL_CODE(device, function, method, access)
         ((device) << 16) | ((access) << 14) | ((function) << 2) | (method)
      end
      
      def FSCTL_SET_COMPRESSION 
         CTL_CODE(FILE_DEVICE_FILE_SYSTEM, 16, METHOD_BUFFERED, 3)
      end

      def FSCTL_ENUM_USN_DATA
         CTL_CODE(FILE_DEVICE_FILE_SYSTEM, 44,  METHOD_NEITHER, 0)
      end

      def FSCTL_READ_USN_JOURNAL
         CTL_CODE(FILE_DEVICE_FILE_SYSTEM, 46,  METHOD_NEITHER, 0)
      end
   
      def FSCTL_SET_SPARSE
         CTL_CODE(FILE_DEVICE_FILE_SYSTEM, 49, METHOD_BUFFERED, 0)
      end

      def FSCTL_CREATE_USN_JOURNAL
         CTL_CODE(FILE_DEVICE_FILE_SYSTEM, 57,  METHOD_NEITHER, 0)
      end

      def FSCTL_READ_FILE_USN_DATA
         CTL_CODE(FILE_DEVICE_FILE_SYSTEM, 58,  METHOD_NEITHER, 0)
      end

      def FSCTL_WRITE_USN_CLOSE_RECORD
         CTL_CODE(FILE_DEVICE_FILE_SYSTEM, 59,  METHOD_NEITHER, 0)
      end

      def FSCTL_EXTEND_VOLUME
         CTL_CODE(FILE_DEVICE_FILE_SYSTEM, 60, METHOD_BUFFERED, 0)
      end

      def FSCTL_QUERY_USN_JOURNAL
         CTL_CODE(FILE_DEVICE_FILE_SYSTEM, 61, METHOD_BUFFERED, 0)
      end

      def FSCTL_DELETE_USN_JOURNAL
         CTL_CODE(FILE_DEVICE_FILE_SYSTEM, 62, METHOD_BUFFERED, 0)
      end

      def IOCTL_DISK_GET_DRIVE_GEOMETRY
         CTL_CODE(IOCTL_DISK_BASE, 0x0000, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end

      def IOCTL_DISK_GET_PARTITION_INFO
         CTL_CODE(IOCTL_DISK_BASE, 0x0001, METHOD_BUFFERED, FILE_READ_ACCESS)
      end

      def IOCTL_DISK_SET_PARTITION_INFO
         CTL_CODE(IOCTL_DISK_BASE, 0x0002, METHOD_BUFFERED,
            FILE_READ_ACCESS | FILE_WRITE_ACCESS
         )
      end

      def IOCTL_DISK_GET_DRIVE_LAYOUT
         CTL_CODE(IOCTL_DISK_BASE, 0x0003, METHOD_BUFFERED, FILE_READ_ACCESS)
      end

      def IOCTL_DISK_SET_DRIVE_LAYOUT
         CTL_CODE(IOCTL_DISK_BASE, 0x0004, METHOD_BUFFERED,
            FILE_READ_ACCESS | FILE_WRITE_ACCESS)
      end

      def IOCTL_DISK_VERIFY
         CTL_CODE(IOCTL_DISK_BASE, 0x0005, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end

      def IOCTL_DISK_FORMAT_TRACKS
         CTL_CODE(IOCTL_DISK_BASE, 0x0006, METHOD_BUFFERED,
            FILE_READ_ACCESS | FILE_WRITE_ACCESS
         )
      end

      def IOCTL_DISK_REASSIGN_BLOCKS
         CTL_CODE(IOCTL_DISK_BASE, 0x0007, METHOD_BUFFERED,
            FILE_READ_ACCESS | FILE_WRITE_ACCESS
         )
      end

      def IOCTL_DISK_PERFORMANCE
         CTL_CODE(IOCTL_DISK_BASE, 0x0008, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end

      def IOCTL_DISK_IS_WRITABLE
         CTL_CODE(IOCTL_DISK_BASE, 0x0009, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end

      def IOCTL_DISK_LOGGING
         CTL_CODE(IOCTL_DISK_BASE, 0x000a, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end

      def IOCTL_DISK_FORMAT_TRACKS_EX  
         CTL_CODE(IOCTL_DISK_BASE, 0x000b, METHOD_BUFFERED,
            FILE_READ_ACCESS | FILE_WRITE_ACCESS
         )
      end

      def IOCTL_DISK_HISTOGRAM_STRUCTURE  
         CTL_CODE(IOCTL_DISK_BASE, 0x000c, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end

      def IOCTL_DISK_HISTOGRAM_DATA
         CTL_CODE(IOCTL_DISK_BASE, 0x000d, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end

      def IOCTL_DISK_HISTOGRAM_RESET
         CTL_CODE(IOCTL_DISK_BASE, 0x000e, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end

      def IOCTL_DISK_REQUEST_STRUCTURE
         CTL_CODE(IOCTL_DISK_BASE, 0x000f, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end

      def IOCTL_DISK_REQUEST_DATA
         CTL_CODE(IOCTL_DISK_BASE, 0x0010, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end

      def IOCTL_DISK_PERFORMANCE_OFF
         CTL_CODE(IOCTL_DISK_BASE, 0x0018, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end

      def IOCTL_DISK_GET_PARTITION_INFO_EX
         CTL_CODE(IOCTL_DISK_BASE, 0x0012, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end

      def IOCTL_DISK_SET_PARTITION_INFO_EX
         CTL_CODE(IOCTL_DISK_BASE, 0x0013, METHOD_BUFFERED,
            FILE_READ_ACCESS | FILE_WRITE_ACCESS
         )
      end

      def IOCTL_DISK_GET_DRIVE_LAYOUT_EX
         CTL_CODE(IOCTL_DISK_BASE, 0x0014, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end

      def IOCTL_DISK_SET_DRIVE_LAYOUT_EX
         CTL_CODE(IOCTL_DISK_BASE, 0x0015, METHOD_BUFFERED,
            FILE_READ_ACCESS | FILE_WRITE_ACCESS
         )
      end

      def IOCTL_DISK_CREATE_DISK
         CTL_CODE(IOCTL_DISK_BASE, 0x0016, METHOD_BUFFERED,
            FILE_READ_ACCESS | FILE_WRITE_ACCESS
         )
      end

      def IOCTL_DISK_GET_LENGTH_INFO
         CTL_CODE(IOCTL_DISK_BASE, 0x0017, METHOD_BUFFERED, FILE_READ_ACCESS)
      end

      def IOCTL_DISK_GET_DRIVE_GEOMETRY_EX
         CTL_CODE(IOCTL_DISK_BASE, 0x0028, METHOD_BUFFERED, FILE_ANY_ACCESS)
      end
   end
end
