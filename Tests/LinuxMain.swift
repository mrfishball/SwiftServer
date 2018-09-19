import XCTest
import Quick

@testable import SwerverTests

QCKMain([
    HttpRequestSpec.self,
    HttpRequestParserSpec.self,
    HttpResponseSpec.self,
    ResponseConstructorSpec.self,
    ResponseFormatterSpec.self,
    StatusCodeSpec.self,
    RouterSpec.self,
])