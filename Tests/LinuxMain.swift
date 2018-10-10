import XCTest
import Quick

@testable import SwerverTests

QCKMain([
    GetActionSpec.self,
    HeadActionSpec.self,
    NotAllowedActionSpec.self,
    NotFoundActionSpec.self,
    OptionsActionSpec.self,

    HttpRequestSpec.self,
    HttpRequestParserSpec.self,

    HttpResponseSpec.self,
    ResponseBuilderSpec.self,
    ResponseFormatterSpec.self,
    StatusCodeSpec.self,

    RouterSpec.self,
    RouteSpec.self,
    RoutesSpec.self,
])