FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8

WORKDIR /inetpub/wwwroot

# copy site into IIS wwwroot
COPY . .

# move flag out of wwwroot and set ACLs (single RUN so Docker parses it correctly)
RUN powershell -Command \
    "Move-Item -Path 'C:\inetpub\wwwroot\flag.txt' -Destination 'C:\flag.txt' -Force; \
     icacls 'C:\flag.txt' /inheritance:r; \
     icacls 'C:\flag.txt' /grant:r 'Administrators:(R)'; \
     icacls 'C:\flag.txt' /grant:r 'SYSTEM:(R)'; \
     attrib +r 'C:\flag.txt'"
