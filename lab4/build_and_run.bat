@echo off

for /f "tokens=2 delims==" %%i in ('findstr /r "^APP_PORT=" .env') do set APP_PORT=%%i

echo Using APP_PORT=%APP_PORT%

echo Building system image...
docker build -f Dockerfile.system -t system .

echo Building build image...
docker build -f Dockerfile.build -t build .

echo Building run image...
docker build --build-arg APP_PORT=%APP_PORT% -f Dockerfile.run -t run .

echo Running the container...
docker run --rm -p %APP_PORT%:%APP_PORT% run

echo Done.
pause