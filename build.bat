@echo off

call "%VS100COMNTOOLS%\..\..\VC\vcvarsall.bat" x86

pushd %~dp0

msbuild root.msbuild /p:Configuration=Release /p:BUILD_NUMBER=1.2.3.4
msbuild UnitTests.msbuild /p:Configuration=Release
rem msbuild IntegrityCheckCreator.msbuild /p:Configuration=Release
msbuild PrepareSetup.msbuild /p:Configuration=Release
msbuild BuildSetup.msbuild /p:Configuration=Release
msbuild Artifacts.msbuild /p:Configuration=Release

pause