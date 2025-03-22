FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS base
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

USER app

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["devopsapp/devopsapp.csproj", "devopsapp/"]
RUN dotnet restore "./devopsapp/devopsapp.csproj"

COPY . .
WORKDIR "/src/devopsapp"
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./devopsapp.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false


FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "devopsapp.dll"]