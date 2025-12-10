FROM mcr.microsoft.com/dotnet/sdk:9.0@sha256:6c7713b7d107f743015b863f6bb028fca7430192140536779c0464f1ece899bc
WORKDIR /scip-dotnet
ADD . /scip-dotnet
RUN dotnet pack
ENV PATH="/root/.dotnet/tools:${PATH}"
RUN dotnet tool install --framework net9.0 --add-source ScipDotnet/bin/Release/ --global scip-dotnet
RUN dotnet clean
WORKDIR /app
RUN rm -rf /scip-dotnet
