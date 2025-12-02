FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8
WORKDIR /inetpub/wwwroot
COPY . .
RUN powershell -Command Move-Item -Path 'C:\inetpub\wwwroot\flag.txt' -Destination 'C:\flag.txt' -Force
RUN powershell -Command `
    icacls 'C:\flag.txt' /inheritance:r ; `
    icacls 'C:\flag.txt' /grant:r 'Administrators:(R)' ; `
    icacls 'C:\flag.txt' /grant:r 'SYSTEM:(R)'
