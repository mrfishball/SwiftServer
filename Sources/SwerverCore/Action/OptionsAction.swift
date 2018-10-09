import Foundation

public class OptionsAction: HttpAction {
    
    private let responseBuilder = ResponseBuilder()
    private let routes: Routes
    private let route: URL
    
    public init(routes: Routes, route: URL) {
        self.routes = routes
        self.route = route
    }
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: .ok)
            .withContentType(contentType: .text)
            .setHeader(header: .allow, value: getAllowedMethods())
            .build()
    }
    
    private func getAllowedMethods() -> String {
        var allowedMethodList: [String] = []
        for (method, _) in routes.fetchRoute(url: route) {
            allowedMethodList.append(method.rawValue)
        }
        return allowedMethodList.sorted(by: <).joined(separator: ", ")
    }
}
