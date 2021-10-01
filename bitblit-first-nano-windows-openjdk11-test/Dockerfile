FROM mcr.microsoft.com/windows:20H2
#FROM mcr.microsoft.com/windows/nanoserver:1803-amd64
#FROM microsoft/windowsservercore (Needs login? or old example)

LABEL Description="Chris weiss sample nano server example"

ENV NODE_VERSION="14.18.0"
ENV NODE_SHA256="262ec7222031430cb25fee4c3e932a94afe65a3614ecc8b68e47cfac4f76e7b3"

#RUN PS C:\Users\Administrator> $env:PSModulePath

#WORKDIR C:/node

#RUN powershell Add-WindowsFeature Web-server, NET-Framework-45-ASPNET, Web-Asp-Net45
#RUN powershell Install-WindowsFeature Web-server, NET-Framework-45-ASPNET, Web-Asp-Net45

RUN powershell Invoke-WebRequest -OutFile node.exe "https://nodejs.org/dist/v$($env:NODE_VERSION)/win-x64/node.exe" -UseBasicParsing; \
    if ((Get-FileHash node.exe -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ;

COPY . /usr/src/myapp
#WORKDIR /usr/src/myapp
#RUN javac Main.java
#CMD ["java", "Main"]
#CMD ["node", "--version"]
#CMD echo Hello World2!
#CMD dir \usr\src\myapp
#CMD type \usr\src\myapp\test-file-01.txt
#CMD dir \usr\src\myapp
#CMD node --version
CMD node \usr\src\myapp\test-file-02.js