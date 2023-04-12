@echo off

CALL :build

EXIT /B %ERRORLEVEL%

:build
echo "building react"
DEL /S "dist/*"
export "INLINE_RUNTIME_CHUNK=false"
export "GENERATE_SOURCEMAP=false"
react-scripts "build"
mkdir "-p" "dist"
COPY  "build/*" "dist"
mv "dist\index.html" "dist\popup.html"
EXIT /B 0