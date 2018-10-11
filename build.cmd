@echo off
setlocal

if not defined WPF_REPO (
  echo Set Environment variable WPF_REPO to the path to your WPF repo.
  echo Also edit global.json to set the version of Microsoft.NET.Sdk.WPF that is produced by yor WPF repo.
  exit /b 1
)

@echo on 

:: build PBT
msbuild /m /v:m %WPF_REPO%\src\WPF\src\PresentationBuildTasks || goto :eof

:: build Microsoft.NET.Sdk.Wpf
msbuild /m /v:m %WPF_REPO%\pkg\microsoft.net.sdk.wpf || goto :eof

:: clear package cache
if exist %~dp0.packages ( 
  rd /s /q %~dp0.packages || goto :eof
)


:: build sample rpoject
call %~dp0run.cmd dotnet build %~dp0WPFSample.Core /bl