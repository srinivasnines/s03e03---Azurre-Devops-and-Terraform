#GET BASE IMAGE (fULL .NET COR SDK)
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app

# copy csproj and restore 
COPY *.csproj ./
RUN dotnet restore

#copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

#Generate runtime images
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "weagtherapi.dll"]




