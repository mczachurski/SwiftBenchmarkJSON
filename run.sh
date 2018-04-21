#!/bin/bash

./HandyJSON/.build/x86_64-apple-macosx10.10/release/Benchmark
./Marshall/.build/x86_64-apple-macosx10.10/release/Benchmark
./ObjectMapper/.build/x86_64-apple-macosx10.10/release/Benchmark
./PMJSON/.build/x86_64-apple-macosx10.10/release/Benchmark
./SwiftJson/.build/x86_64-apple-macosx10.10/release/Benchmark
./SwiftProtobuf/.build/x86_64-apple-macosx10.10/release/Benchmark
dotnet ./NetCore/bin/release/netcoreapp2.0/NetCore.dll
