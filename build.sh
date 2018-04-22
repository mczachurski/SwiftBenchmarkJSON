#!/bin/bash

cd HandyJSON
swift build --configuration release

cd ../Marshall
swift build --configuration release

cd ../ObjectMapper
swift build --configuration release

cd ../PMJSON
swift build --configuration release

cd ../Codable
swift build --configuration release

cd ../SwiftProtobuf
swift build --configuration release

cd ../NetCore
dotnet build --configuration=release