msbuild Scripts\root.msbuild /p:Configuration=Release /p:BUILD_NUMBER=1.2.3.4
msbuild Scripts\UnitTests.msbuild /p:Configuration=Release
msbuild Scripts\PrepareSetup.msbuild /p:Configuration=Release