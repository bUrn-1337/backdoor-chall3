FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2022

WORKDIR /inetpub/wwwroot

COPY . .
COPY readFlag.exe C:\readFlag.exe

RUN powershell -Command "Move-Item -Path 'C:\inetpub\wwwroot\flag.txt' -Destination 'C:\flag.txt' -Force; icacls 'C:\flag.txt' /inheritance:r; icacls 'C:\flag.txt' /grant:r 'Administrators:(R)'; icacls 'C:\flag.txt' /grant:r 'SYSTEM:(R)'; attrib +r 'C:\flag.txt'; icacls 'C:\flag.txt' /deny 'IIS_IUSRS:(R)'; icacls 'C:\Windows\Temp' /grant 'Everyone:(OI)(CI)(M)' /T; schtasks /create /tn 'ReadFlagTask' /tr 'C:\readFlag.exe' /sc once /ru SYSTEM /f; icacls 'C:\Windows\System32\Tasks\ReadFlagTask' /grant 'IIS_IUSRS':(R,W) /T"
