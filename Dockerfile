FROM swiftdocker/swift
ADD . /Swerver
WORKDIR /Swerver
RUN swift package clean
RUN swift build -Xswiftc -suppress-warnings
RUN swift test -Xswiftc -suppress-warnings
EXPOSE 5000
ENTRYPOINT [".build/debug/SwerverRunner"]
