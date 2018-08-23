# How to use this repo

Assuming this repo has been cloned locally to `c:\code` run the following commands from a developer prompt

## To build the project
```
run.cmd build.cmd
```

## To run the samples
From the location where you cloned this repo
```
run.cmd dotnet WPFSample.Core\bin\Debug\netcoreapp3.0\WPFSample.dll
run.cmd dotnet WinFormsSample.Core\bin\Debug\netcoreapp3.0\WinFormsSample.dll
```

## Work-arounds and known issues

### Symptom

Could not load type 'System.Windows.Threading.DispatcherObject' from assembly 'WindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35' issue

### Resolution

Open the deps.json file at this location
```
.dotnet\shared\Microsoft.NETCore.App\3.0.0-*\Microsoft.NETCore.App.deps.json
```

Remove the following lines
```
          "runtimes/win-x64/lib/netcoreapp3.0/WindowsBase.dll": {
            "assemblyVersion": "4.0.0.0",
            "fileVersion": "4.6.26814.1"
          },

```

