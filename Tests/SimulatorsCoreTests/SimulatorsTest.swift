//
//  SimulatorsTest.swift
//  SimulatorsCoreTests
//
//  Created by Kazuya Ueoka on 2018/05/28.
//

import SimulatorsCore
import XCTest

final class SimulatorsTest: XCTestCase {
    let json = """
{
  "devicetypes" : [
    {
      "name" : "iPhone 4s",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPhone-4s"
    },
    {
      "name" : "iPhone 5",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPhone-5"
    },
    {
      "name" : "iPhone 5s",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPhone-5s"
    },
    {
      "name" : "iPhone 6",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPhone-6"
    },
    {
      "name" : "iPhone 6 Plus",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPhone-6-Plus"
    },
    {
      "name" : "iPhone 6s",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPhone-6s"
    },
    {
      "name" : "iPhone 6s Plus",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPhone-6s-Plus"
    },
    {
      "name" : "iPhone 7",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPhone-7"
    },
    {
      "name" : "iPhone 7 Plus",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPhone-7-Plus"
    },
    {
      "name" : "iPhone 8",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPhone-8"
    },
    {
      "name" : "iPhone 8 Plus",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPhone-8-Plus"
    },
    {
      "name" : "iPhone SE",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPhone-SE"
    },
    {
      "name" : "iPhone X",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPhone-X"
    },
    {
      "name" : "iPad 2",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPad-2"
    },
    {
      "name" : "iPad Retina",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPad-Retina"
    },
    {
      "name" : "iPad Air",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPad-Air"
    },
    {
      "name" : "iPad Air 2",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPad-Air-2"
    },
    {
      "name" : "iPad (5th generation)",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPad--5th-generation-"
    },
    {
      "name" : "iPad Pro (9.7-inch)",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPad-Pro--9-7-inch-"
    },
    {
      "name" : "iPad Pro (12.9-inch)",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPad-Pro"
    },
    {
      "name" : "iPad Pro (12.9-inch) (2nd generation)",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPad-Pro--12-9-inch---2nd-generation-"
    },
    {
      "name" : "iPad Pro (10.5-inch)",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.iPad-Pro--10-5-inch-"
    },
    {
      "name" : "Apple TV",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.Apple-TV-1080p"
    },
    {
      "name" : "Apple TV 4K",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.Apple-TV-4K-4K"
    },
    {
      "name" : "Apple TV 4K (at 1080p)",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.Apple-TV-4K-1080p"
    },
    {
      "name" : "Apple Watch - 38mm",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.Apple-Watch-38mm"
    },
    {
      "name" : "Apple Watch - 42mm",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.Apple-Watch-42mm"
    },
    {
      "name" : "Apple Watch Series 2 - 38mm",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-38mm"
    },
    {
      "name" : "Apple Watch Series 2 - 42mm",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-42mm"
    },
    {
      "name" : "Apple Watch Series 3 - 38mm",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-3-38mm"
    },
    {
      "name" : "Apple Watch Series 3 - 42mm",
      "identifier" : "com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-3-42mm"
    }
  ],
  "runtimes" : [
    {
      "buildversion" : "13E233",
      "availability" : "(available)",
      "name" : "iOS 9.3",
      "identifier" : "com.apple.CoreSimulator.SimRuntime.iOS-9-3",
      "version" : "9.3"
    },
    {
      "buildversion" : "14E8301",
      "availability" : "(available)",
      "name" : "iOS 10.3",
      "identifier" : "com.apple.CoreSimulator.SimRuntime.iOS-10-3",
      "version" : "10.3.1"
    },
    {
      "buildversion" : "15E217",
      "availability" : "(available)",
      "name" : "iOS 11.3",
      "identifier" : "com.apple.CoreSimulator.SimRuntime.iOS-11-3",
      "version" : "11.3"
    },
    {
      "buildversion" : "15L211",
      "availability" : "(available)",
      "name" : "tvOS 11.3",
      "identifier" : "com.apple.CoreSimulator.SimRuntime.tvOS-11-3",
      "version" : "11.3"
    },
    {
      "buildversion" : "15T212",
      "availability" : "(available)",
      "name" : "watchOS 4.3",
      "identifier" : "com.apple.CoreSimulator.SimRuntime.watchOS-4-3",
      "version" : "4.3"
    }
  ],
  "devices" : {
    "com.apple.CoreSimulator.SimRuntime.iOS-11-0" : [
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 5s",
        "udid" : "F06C00DF-FC2C-4D9D-9DA5-B1FB0EC7580B"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 6",
        "udid" : "8008D399-7312-456A-80EE-2FE934F63475"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 6 Plus",
        "udid" : "5924A9C4-6CB7-4D2B-9B47-D2F7708C4CE9"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 6s",
        "udid" : "00A66829-00D7-481D-8A87-724A8F6F690B"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 6s Plus",
        "udid" : "67AE7224-76E6-446A-BD9C-C4B05C84E092"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 7",
        "udid" : "A8681872-CF83-47A0-800B-B348691CFE59"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 7 Plus",
        "udid" : "B62C34C5-A9C0-4400-A190-89A01A792BEC"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 8",
        "udid" : "1F4DBABF-D608-4E10-AD3A-86475E1A046B"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 8 Plus",
        "udid" : "772FB43E-1494-4D6B-B401-3AD4C75B7F72"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone SE",
        "udid" : "296EAEED-41C5-4CF4-BC8C-3E4AE0AEBAC2"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone X",
        "udid" : "C6DAEE8A-CC2E-4983-9A5A-1C79FF1278E0"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Air",
        "udid" : "F4797C5A-72B1-4FC0-B34C-C22FDDD1A2B4"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Air 2",
        "udid" : "2CB56246-F11A-465E-A1B0-5110925396E5"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad (5th generation)",
        "udid" : "E0DFED1D-613E-4E75-8E40-24A6D6E6F663"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Pro (9.7-inch)",
        "udid" : "7016B88E-3542-4A96-871A-C682ABD2829E"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Pro (12.9-inch)",
        "udid" : "4F3EB3E9-ED66-4270-9FA7-55164DDFB831"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Pro (12.9-inch) (2nd generation)",
        "udid" : "4CE1DA69-E5BE-4382-9EF7-6BBE2B03DCD1"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Pro (10.5-inch)",
        "udid" : "7A784995-C357-4F75-954A-D73CD8D5A332"
      }
    ],
    "com.apple.CoreSimulator.SimRuntime.watchOS-4-2" : [
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch - 38mm",
        "udid" : "51B2585F-5424-4CF5-AA8B-4CD58406AE7E"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch - 42mm",
        "udid" : "644BC879-3490-4A7A-A953-40DA624FF52C"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch Series 2 - 38mm",
        "udid" : "51D6BBAE-2E1A-45F5-BAF1-0860BC307CE3"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch Series 2 - 42mm",
        "udid" : "CF109962-BBB3-420F-8E6F-A639B7143954"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch Series 3 - 38mm",
        "udid" : "AE2EE4E0-12CA-450C-8586-DAE706C11B69"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch Series 3 - 42mm",
        "udid" : "6AF35574-2B66-497F-A9E7-8D1C868DF67C"
      }
    ],
    "com.apple.CoreSimulator.SimRuntime.iOS-11-1" : [
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 5s",
        "udid" : "43DED9BF-6F9E-4F86-B6DE-366C14972BC0"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 6",
        "udid" : "38EEB85B-8042-4125-A044-48390E4EFDFD"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 6 Plus",
        "udid" : "89DD5F9A-B28A-47AB-AA28-4B38F5E694D7"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 6s",
        "udid" : "4F74825E-211B-431C-8AF4-327BFECE8D99"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 6s Plus",
        "udid" : "8884DAB6-FEFF-4325-86DE-0179E01B9254"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 7",
        "udid" : "61604C22-78AA-431E-83D3-0C6F128FDF78"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 7 Plus",
        "udid" : "5F2803A6-2C9C-4F1B-86A9-2DD5D4040461"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 8",
        "udid" : "47C6DA35-1F36-4133-98D1-CE4F61AFBF02"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 8 Plus",
        "udid" : "BFC73CA5-4711-404B-8D86-DFFB402B7D57"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone SE",
        "udid" : "413739E6-E7BE-43A4-8ED3-31408B72B0F2"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone X",
        "udid" : "7BCE9F43-DC38-4F0D-8CCC-1B827BE71387"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Air",
        "udid" : "E551A97F-C0F9-4DA4-B11C-61E3528D98DB"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Air 2",
        "udid" : "89134EEF-44BA-4CA9-B13B-AF8A3D388832"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad (5th generation)",
        "udid" : "39C2CB1E-14AE-45A5-A5D7-FFA8593A36CC"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Pro (9.7-inch)",
        "udid" : "CD8FDB0B-4DB5-465E-B606-D4FA65104D2F"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Pro (12.9-inch)",
        "udid" : "DF03EB6C-E95D-4F29-9BA9-8CD81F4872A5"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Pro (12.9-inch) (2nd generation)",
        "udid" : "72AE4DF6-610A-41E8-BA5E-FE56D20AF0AB"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Pro (10.5-inch)",
        "udid" : "342CDBB7-31B9-4394-9486-3638EB58F598"
      }
    ],
    "com.apple.CoreSimulator.SimRuntime.iOS-11-2" : [
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 5s",
        "udid" : "F5B42AFA-54C9-4284-A3E5-BC839C8C2DE2"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 6",
        "udid" : "F5DF65ED-1A4F-4AC6-AE93-D9FEF684D02F"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 6 Plus",
        "udid" : "A6345EEA-66F5-4DBF-85B1-DD29785B73E8"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 6s",
        "udid" : "531BE87D-9693-4A82-BE1D-9BB426224FC6"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 6s Plus",
        "udid" : "2301B524-6AFD-410B-8767-F905FB56C8E4"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 7",
        "udid" : "88688DB3-8913-496A-89DA-7BEC882F0E4D"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 7 Plus",
        "udid" : "66837742-12AC-477A-BC6D-73FCD257DB6C"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 8",
        "udid" : "7410154D-27B7-4A46-816B-A46C965AFD57"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone 8 Plus",
        "udid" : "35BC0E99-D08D-42CD-B5C2-32B11D55FEDC"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone SE",
        "udid" : "67FCAE4A-1A43-4DCE-9251-4A22A6472EEA"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPhone X",
        "udid" : "B0810574-8131-48C4-909E-C34DB5636320"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Air",
        "udid" : "0ABC53D3-445B-49FE-8251-8A0D6BB92485"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Air 2",
        "udid" : "ACD0A946-C027-4C0E-9FA5-03D001CD5703"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad (5th generation)",
        "udid" : "806B0171-313F-4F7A-BDA2-0B86AE37263C"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Pro (9.7-inch)",
        "udid" : "F40F3376-EFA6-47FC-9A48-E98528823507"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Pro (12.9-inch)",
        "udid" : "7B90D155-A4E5-45C8-BA7A-7965FADC3C79"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Pro (12.9-inch) (2nd generation)",
        "udid" : "F934C773-A732-4614-89E5-4DF7A18D04CD"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "iPad Pro (10.5-inch)",
        "udid" : "2B30B393-30C3-48DF-B353-25631FF42D16"
      }
    ],
    "iOS 11.3" : [
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 5s",
        "udid" : "603CB8C1-8BFD-4CD7-95D3-5825E52A4CF0"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 6",
        "udid" : "2798A83D-B2B7-4D5B-A96B-48B329323569"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 6 Plus",
        "udid" : "3077184F-BAC1-4D1F-B50A-F396182B3337"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 6s",
        "udid" : "4B2147E5-36B7-4C93-B397-17DE00C8B15C"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 6s Plus",
        "udid" : "AF3560DC-9CC0-4AA3-A725-C46F5515E06E"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 7",
        "udid" : "A68CEEAA-3D2A-4ADA-A9A0-6CCAC8E80983"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 7 Plus",
        "udid" : "0855E984-0217-458E-875E-A97A551E32A2"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 8",
        "udid" : "A6A9445C-D2B5-40DC-B73B-865AE2DC773B"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 8 Plus",
        "udid" : "3FEF14D2-4BB4-4759-AB28-A62B97B96140"
      },
      {
        "state" : "Booted",
        "availability" : "(available)",
        "name" : "iPhone SE",
        "udid" : "84E94F45-7565-48CB-A2CB-8B8B2025E429"
      },
      {
        "state" : "Booted",
        "availability" : "(available)",
        "name" : "iPhone X",
        "udid" : "44EE068E-D87A-4C65-96E4-2199E3C7A9AA"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Air",
        "udid" : "EE338735-A3A9-4A56-B7AC-496CA7B4BD83"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Air 2",
        "udid" : "690A65E5-7663-48F8-B160-DB580114B067"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad (5th generation)",
        "udid" : "3F2B99BD-E691-44AE-A228-A5BAD9D91D26"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Pro (9.7-inch)",
        "udid" : "195233B8-A2E6-46E0-BF4F-DADC7CAD55AA"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Pro (12.9-inch)",
        "udid" : "AADA2B8C-B945-4965-9D4B-EE8EEDAD854E"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Pro (12.9-inch) (2nd generation)",
        "udid" : "86FA30FD-6C92-45AE-942D-ECABAEFA25D6"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Pro (10.5-inch)",
        "udid" : "337934C5-227D-40AA-9346-6F3ABFE7F3AD"
      }
    ],
    "com.apple.CoreSimulator.SimRuntime.watchOS-4-0" : [
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch - 38mm",
        "udid" : "09D4FAAA-E67D-41F6-98C2-FAB1858A75AE"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch - 42mm",
        "udid" : "2E1BE5CD-79EE-4395-A516-8CA98F6FD009"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch Series 2 - 38mm",
        "udid" : "6495DD3E-FCFB-4BDF-98B3-1F845711C924"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch Series 2 - 42mm",
        "udid" : "B2705491-3E52-4E42-9F57-EF4D231F618A"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch Series 3 - 38mm",
        "udid" : "4B31D9A0-EDD2-404F-B99E-81C1BDF6E3EC"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch Series 3 - 42mm",
        "udid" : "A47E0E11-3473-4994-87D9-31F84AA46E9A"
      }
    ],
    "tvOS 11.3" : [
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "Apple TV",
        "udid" : "E2B26C9F-FDCC-4083-A1F9-EF7EFC8C8DAF"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "Apple TV 4K",
        "udid" : "923B5752-9737-4D90-9B8A-1700D264075F"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "Apple TV 4K (at 1080p)",
        "udid" : "99269E98-9415-490C-8ACC-A0F1F1155CC8"
      }
    ],
    "iOS 10.3" : [
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 5",
        "udid" : "E34593EB-705B-43A2-802B-6DA7858F71B3"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 5s",
        "udid" : "1F0C0D14-C80C-423F-B322-6FCFEF201CC0"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 6",
        "udid" : "24B8E500-0659-45E6-A7C3-615378F8BCCB"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 6 Plus",
        "udid" : "14353D97-AC5F-4322-A8A9-9F56806B4385"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 6s",
        "udid" : "FF3A1947-12F9-4B69-80C6-961381E7DBE3"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 6s Plus",
        "udid" : "9D4C662A-37A6-46FD-B4A7-CB3F9C6172B4"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 7",
        "udid" : "FF3CC3E1-9595-47E1-98A9-CBEDECB62EA9"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 7 Plus",
        "udid" : "4D6A21DE-5924-4678-9040-9A50344F6D36"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone SE",
        "udid" : "91E81004-7BE9-4E84-9976-F721E649D2E5"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Air",
        "udid" : "9180F9F4-2636-4886-8E5F-BC3AC669CE7D"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Air 2",
        "udid" : "82A566C2-9605-4422-9FE3-0CBC35542650"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad (5th generation)",
        "udid" : "8D8700CA-F83D-49A2-B5AF-66E9FEC79A81"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Pro (9.7 inch)",
        "udid" : "C088CA21-F2A5-4C78-85D1-6AAD2F6712F4"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Pro (12.9 inch)",
        "udid" : "67A278A9-1DC4-475B-BC39-31FDDF0396A1"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Pro (12.9-inch) (2nd generation)",
        "udid" : "08531627-8FEA-4BFC-A0CB-5B3B62C5E6FD"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Pro (10.5-inch)",
        "udid" : "F57390F6-F8E2-4628-969D-2D69C9FC48B5"
      }
    ],
    "com.apple.CoreSimulator.SimRuntime.tvOS-11-0" : [
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple TV",
        "udid" : "E6087758-CCE7-4144-93F6-E9D35EDA59D8"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple TV 4K",
        "udid" : "B01368EC-1745-436B-A5F3-054004BF4269"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple TV 4K (at 1080p)",
        "udid" : "7B1306C7-5055-4968-A9D0-C3F4B2471515"
      }
    ],
    "com.apple.CoreSimulator.SimRuntime.tvOS-11-1" : [
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple TV",
        "udid" : "ADCDD20B-453B-45AC-8A58-72D8A8BC3F66"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple TV 4K",
        "udid" : "9CF5A9F1-6B45-4044-8ED1-94D37FB12DF2"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple TV 4K (at 1080p)",
        "udid" : "A209C6B3-E118-472D-B781-EBE6AA50949F"
      }
    ],
    "com.apple.CoreSimulator.SimRuntime.watchOS-4-1" : [
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch - 38mm",
        "udid" : "E512ABE0-998D-4AAF-AA05-560909D38733"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch - 42mm",
        "udid" : "598A9275-BAC3-4F8B-94B6-937DFC5B6677"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch Series 2 - 38mm",
        "udid" : "BD56B8B6-BEE0-4DA7-9657-C62954EA51B7"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch Series 2 - 42mm",
        "udid" : "CEA09585-9305-4BAB-91C5-88298B6AA4D1"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch Series 3 - 38mm",
        "udid" : "FDC0A533-EDE7-4D88-A611-A75D9E32FD56"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple Watch Series 3 - 42mm",
        "udid" : "F7B70D07-B221-47BD-BB3B-5C05ACBC7ABB"
      }
    ],
    "com.apple.CoreSimulator.SimRuntime.tvOS-11-2" : [
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple TV",
        "udid" : "FD981F16-82BC-4FBD-A55D-265C999CCD86"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple TV 4K",
        "udid" : "02BAFD8A-96BE-48D3-BED8-4F6E6A652FA3"
      },
      {
        "state" : "Shutdown",
        "availability" : " (unavailable, runtime profile not found)",
        "name" : "Apple TV 4K (at 1080p)",
        "udid" : "F3ED5CE4-393B-40B2-89BC-B2A8A1BEF5A6"
      }
    ],
    "watchOS 4.3" : [
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "Apple Watch - 38mm",
        "udid" : "3330DABB-A6DD-4CA4-A42B-64CDE136F05B"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "Apple Watch - 42mm",
        "udid" : "BF9C15C9-15A2-49D7-AF58-257F4EA76624"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "Apple Watch Series 2 - 38mm",
        "udid" : "224A4A2D-263B-4883-95CC-4D48E468C0AD"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "Apple Watch Series 2 - 42mm",
        "udid" : "F154B0C6-0676-4984-92E0-388847A0535B"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "Apple Watch Series 3 - 38mm",
        "udid" : "A363160E-C83A-433A-8B8B-47F59CF65A7E"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "Apple Watch Series 3 - 42mm",
        "udid" : "9B7AB90E-ABBE-4155-ABF0-F5C6D92D4E26"
      }
    ],
    "iOS 9.3" : [
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 4s",
        "udid" : "C1A3ECA0-707B-4D85-AA4A-FBD6757AA05A"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 5",
        "udid" : "FFD0F6B4-C2AC-4CEE-BF5B-D12D253C9602"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 5s",
        "udid" : "5A2976DA-C788-49AF-80F4-D5820151D6E4"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 6",
        "udid" : "C57488CB-ED58-45BE-BCE4-D9566C13AB48"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 6 Plus",
        "udid" : "687B3B3B-1883-4395-81F4-D664B79069AE"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 6s",
        "udid" : "66834AF6-C085-45E6-929F-CB26FE9EE515"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPhone 6s Plus",
        "udid" : "76FC3DE0-515B-4B5F-8D92-74A28A709275"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad 2",
        "udid" : "CA00732F-C706-43F7-AF03-E9C41689B9DA"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Retina",
        "udid" : "9EDABAEB-21C0-4D3E-B21F-6FFAF4BFFC74"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Air",
        "udid" : "D3C1D008-8D8B-400E-A345-6403A11C2C07"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Air 2",
        "udid" : "D69FFDC3-6285-409E-9F0B-D50ADCB2D80D"
      },
      {
        "state" : "Shutdown",
        "availability" : "(available)",
        "name" : "iPad Pro",
        "udid" : "5A23CBEC-428F-4C03-A972-691F7168AE9D"
      }
    ]
  },
  "pairs" : {
    "6F658CDB-3390-4491-9E20-1E619B19C875" : {
      "watch" : {
        "name" : "Apple Watch Series 3 - 38mm",
        "udid" : "4B31D9A0-EDD2-404F-B99E-81C1BDF6E3EC",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 8",
        "udid" : "1F4DBABF-D608-4E10-AD3A-86475E1A046B",
        "state" : "Shutdown"
      },
      "state" : "(unavailable)"
    },
    "48484CF2-93AA-49F6-9594-7A1F984D3C9E" : {
      "watch" : {
        "name" : "Apple Watch Series 2 - 38mm",
        "udid" : "51D6BBAE-2E1A-45F5-BAF1-0860BC307CE3",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 7",
        "udid" : "88688DB3-8913-496A-89DA-7BEC882F0E4D",
        "state" : "Shutdown"
      },
      "state" : "(unavailable)"
    },
    "62F99E64-716F-4B40-9424-60292AAA1AAA" : {
      "watch" : {
        "name" : "Apple Watch Series 2 - 38mm",
        "udid" : "BD56B8B6-BEE0-4DA7-9657-C62954EA51B7",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 7",
        "udid" : "61604C22-78AA-431E-83D3-0C6F128FDF78",
        "state" : "Shutdown"
      },
      "state" : "(unavailable)"
    },
    "48796EB2-CBE0-4463-A270-890FD4FF4309" : {
      "watch" : {
        "name" : "Apple Watch Series 2 - 42mm",
        "udid" : "CF109962-BBB3-420F-8E6F-A639B7143954",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 7 Plus",
        "udid" : "66837742-12AC-477A-BC6D-73FCD257DB6C",
        "state" : "Shutdown"
      },
      "state" : "(unavailable)"
    },
    "83AA9866-A79C-479C-8FC7-4BB069744EE8" : {
      "watch" : {
        "name" : "Apple Watch Series 3 - 42mm",
        "udid" : "9B7AB90E-ABBE-4155-ABF0-F5C6D92D4E26",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 8 Plus",
        "udid" : "3FEF14D2-4BB4-4759-AB28-A62B97B96140",
        "state" : "Shutdown"
      },
      "state" : "(active, disconnected)"
    },
    "81837FFA-6276-42AE-B06C-FD405B2B4FB7" : {
      "watch" : {
        "name" : "Apple Watch Series 3 - 42mm",
        "udid" : "A47E0E11-3473-4994-87D9-31F84AA46E9A",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 8 Plus",
        "udid" : "772FB43E-1494-4D6B-B401-3AD4C75B7F72",
        "state" : "Shutdown"
      },
      "state" : "(unavailable)"
    },
    "94D11B4B-8F51-46C2-B5D3-30811CDD068E" : {
      "watch" : {
        "name" : "Apple Watch Series 3 - 42mm",
        "udid" : "6AF35574-2B66-497F-A9E7-8D1C868DF67C",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 8 Plus",
        "udid" : "35BC0E99-D08D-42CD-B5C2-32B11D55FEDC",
        "state" : "Shutdown"
      },
      "state" : "(unavailable)"
    },
    "56B1D8C3-9C33-4C2A-BED0-7F914132A833" : {
      "watch" : {
        "name" : "Apple Watch Series 3 - 38mm",
        "udid" : "FDC0A533-EDE7-4D88-A611-A75D9E32FD56",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 8",
        "udid" : "47C6DA35-1F36-4133-98D1-CE4F61AFBF02",
        "state" : "Shutdown"
      },
      "state" : "(unavailable)"
    },
    "EAAC764C-4847-487A-9F0C-AFD4DDCCD682" : {
      "watch" : {
        "name" : "Apple Watch Series 2 - 42mm",
        "udid" : "B2705491-3E52-4E42-9F57-EF4D231F618A",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 7 Plus",
        "udid" : "B62C34C5-A9C0-4400-A190-89A01A792BEC",
        "state" : "Shutdown"
      },
      "state" : "(unavailable)"
    },
    "20FAD64F-5436-4BEF-A117-CD4DDF0997BC" : {
      "watch" : {
        "name" : "Apple Watch Series 2 - 42mm",
        "udid" : "F154B0C6-0676-4984-92E0-388847A0535B",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 7 Plus",
        "udid" : "0855E984-0217-458E-875E-A97A551E32A2",
        "state" : "Shutdown"
      },
      "state" : "(active, disconnected)"
    },
    "09F78AFB-DCB6-48E6-B070-3F862851B3BE" : {
      "watch" : {
        "name" : "Apple Watch Series 2 - 38mm",
        "udid" : "224A4A2D-263B-4883-95CC-4D48E468C0AD",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 7",
        "udid" : "A68CEEAA-3D2A-4ADA-A9A0-6CCAC8E80983",
        "state" : "Shutdown"
      },
      "state" : "(active, disconnected)"
    },
    "DF04E208-877A-4DBB-BE08-699DC667025D" : {
      "watch" : {
        "name" : "Apple Watch Series 3 - 38mm",
        "udid" : "A363160E-C83A-433A-8B8B-47F59CF65A7E",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 8",
        "udid" : "A6A9445C-D2B5-40DC-B73B-865AE2DC773B",
        "state" : "Shutdown"
      },
      "state" : "(active, disconnected)"
    },
    "158061DE-9780-435F-A97D-DAF0A15EEBD2" : {
      "watch" : {
        "name" : "Apple Watch Series 2 - 38mm",
        "udid" : "6495DD3E-FCFB-4BDF-98B3-1F845711C924",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 7",
        "udid" : "A8681872-CF83-47A0-800B-B348691CFE59",
        "state" : "Shutdown"
      },
      "state" : "(unavailable)"
    },
    "2E2DD249-6125-4C98-B646-3EB710E6EA53" : {
      "watch" : {
        "name" : "Apple Watch Series 3 - 42mm",
        "udid" : "F7B70D07-B221-47BD-BB3B-5C05ACBC7ABB",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 8 Plus",
        "udid" : "BFC73CA5-4711-404B-8D86-DFFB402B7D57",
        "state" : "Shutdown"
      },
      "state" : "(unavailable)"
    },
    "E942A605-5836-425D-9018-3B36B858E11E" : {
      "watch" : {
        "name" : "Apple Watch Series 3 - 38mm",
        "udid" : "AE2EE4E0-12CA-450C-8586-DAE706C11B69",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 8",
        "udid" : "7410154D-27B7-4A46-816B-A46C965AFD57",
        "state" : "Shutdown"
      },
      "state" : "(unavailable)"
    },
    "9D1D3B7C-DECC-47B8-B5C6-BEFD1559EE73" : {
      "watch" : {
        "name" : "Apple Watch Series 2 - 42mm",
        "udid" : "CEA09585-9305-4BAB-91C5-88298B6AA4D1",
        "state" : "Shutdown"
      },
      "phone" : {
        "name" : "iPhone 7 Plus",
        "udid" : "5F2803A6-2C9C-4F1B-86A9-2DD5D4040461",
        "state" : "Shutdown"
      },
      "state" : "(unavailable)"
    }
  }
}
"""
    
    lazy var jsonDictioary = try! JSONSerialization.jsonObject(with: json.data(using: .utf8)!, options: []) as! [String: Any]
    
    func testDevices_iOS11_2() {
        let devices = Simulators.devices(withOS: "iOS", andVersion: "11.0", from: jsonDictioary, andTarget: ["iPhone 7", "iPhone 7 Plus"])
        XCTAssertEqual(devices, [
            Simulators.Device(name: "iPhone 7", udid: "A8681872-CF83-47A0-800B-B348691CFE59", availability: [Simulators.Device.Availability.unavailable, Simulators.Device.Availability.runtimeProfileNotFound], state: Simulators.Device.State.shutdown),
            Simulators.Device(name: "iPhone 7 Plus", udid: "B62C34C5-A9C0-4400-A190-89A01A792BEC", availability: [Simulators.Device.Availability.unavailable, Simulators.Device.Availability.runtimeProfileNotFound], state: Simulators.Device.State.shutdown),
            ])
    }
    
    func testDevices_iOS11_3() {
        let devices = Simulators.devices(withOS: "iOS", andVersion: "11.3", from: jsonDictioary, andTarget: ["iPhone SE", "iPhone X"])
        XCTAssertEqual(devices, [
            Simulators.Device(name: "iPhone SE", udid: "84E94F45-7565-48CB-A2CB-8B8B2025E429", availability: [Simulators.Device.Availability.available], state: Simulators.Device.State.booted),
            Simulators.Device(name: "iPhone X", udid: "44EE068E-D87A-4C65-96E4-2199E3C7A9AA", availability: [Simulators.Device.Availability.available], state: Simulators.Device.State.booted),
            ])
    }
}
