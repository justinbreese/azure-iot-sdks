del *.nupkg
nuget pack Microsoft.Azure.IoTHub.HttpTransport.nuspec
nuget pack Microsoft.Azure.IoTHub.AmqpTransport.nuspec
nuget pack Microsoft.Azure.IoTHub.IoTHubClient.nuspec
nuget pack Microsoft.Azure.IoTHub.Common.nuspec

rem because nuget cannot access absolute files given by environment variables
mkdir paho_outputs
cd paho_outputs
mkdir Win32
cd Win32
rem: for when build_paho will build release: mkdir Release
mkdir Debug
cd ..

rem when build_paho will build x64
rem mkdir x64
rem cd x64
rem mkdir Release
rem mkdir Debug
rem cd ..
cd ..
copy "%PAHO_PATH%\org.eclipse.paho.mqtt.c\Windows Build\paho-mqtt3cs\Debug\paho-mqtt3cs.lib" paho_outputs\Win32\Debug
copy "%PAHO_PATH%\org.eclipse.paho.mqtt.c\Windows Build\paho-mqtt3cs\Debug\paho-mqtt3cs.pdb" paho_outputs\Win32\Debug
copy "%PAHO_PATH%\org.eclipse.paho.mqtt.c\Windows Build\paho-mqtt3cs\Debug\paho-mqtt3cs.dll" paho_outputs\Win32\Debug

mkdir openssl_outputs
cd openssl_outputs
mkdir Win32
cd Win32
mkdir Debug
cd ..
cd ..
copy "%OpenSSLDir%\out32dll\libeay32.dll" openssl_outputs\Win32\Debug
copy "%OpenSSLDir%\out32dll\libeay32.lib" openssl_outputs\Win32\Debug
copy "%OpenSSLDir%\out32dll\libeay32.exp" openssl_outputs\Win32\Debug
copy "%OpenSSLDir%\out32dll\libeay32.pdb" openssl_outputs\Win32\Debug
copy "%OpenSSLDir%\out32dll\ssleay32.dll" openssl_outputs\Win32\Debug
copy "%OpenSSLDir%\out32dll\ssleay32.lib" openssl_outputs\Win32\Debug
copy "%OpenSSLDir%\out32dll\ssleay32.exp" openssl_outputs\Win32\Debug
copy "%OpenSSLDir%\out32dll\ssleay32.pdb" openssl_outputs\Win32\Debug

nuget pack Microsoft.Azure.IoTHub.MqttTransport.nuspec

rmdir paho_outputs /S /Q
rmdir openssl_outputs /S /Q

nuget pack Microsoft.Azure.IoTHub.Serializer.nuspec