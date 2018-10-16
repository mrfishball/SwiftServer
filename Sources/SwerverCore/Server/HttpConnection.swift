import Foundation
import Socket

public class HttpConnection {

    private let httpRequestParser = HttpRequestParser()
    private let httpRouteProcessor = Router()
    private let httpResponseFormatter = HttpResponseFormatter()

    public init() {}

    public func handle(client: Socket) throws {
        let httpRequest = try parseRequest(clientSocket: client)
        try client.write(from: httpResponseFormatter.format(httpResponse: httpRouteProcessor.process(request: httpRequest)))
    }

    private func parseRequest(clientSocket: Socket) throws -> HttpRequest? {
        var readData: Data = Data(capacity: Swerver.bufferSize)
        let _ = try clientSocket.read(into: &readData)
        if let parsedData = String(data: readData, encoding: .utf8) {
            readData.count = 0
            logger.info(parsedData)
            return httpRequestParser.parse(request: parsedData)
        } else {
            readData.count = 0
            logger.info("Error decoding socket data")
            return httpRequestParser.parse(request: "")
        }
    }
}
