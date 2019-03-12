#!/bin/bash

cd HandyJSON
swift package update
swift build --configuration release -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.14"

cd ../Marshall
swift package update
swift build --configuration release -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.14"

cd ../ObjectMapper
swift package update
swift build --configuration release -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.14"

cd ../PMJSON
swift package update
swift build --configuration release -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.14"

cd ../Codable
swift package update
swift build --configuration release -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.14"

cd ../SwiftProtobuf
swift package update
swift build --configuration release -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.14"

cd ../NetCore
dotnet build --configuration=release