// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get

extension Paths {
    public static var fetch: Fetch {
        Fetch(path: "/fetch")
    }

    public struct Fetch {
        /// Path: `/fetch`
        public let path: String

        /// Download web page content
        ///
        /// Use fetch endpoint to download web pages.
        public func post(_ body: DataflowKit.Fetchrequest) -> Request<String> {
            .post(path, body: body)
        }
    }
}

extension Paths {
    public static var serp: Serp {
        Serp(path: "/serp")
    }

    public struct Serp {
        /// Path: `/serp`
        public let path: String

        /// Collect search results from search engines
        ///
        /// To crawl search engine result pages, you can use `/serp` endpoint. SERP collection service extracts a list of organic results, news, images, and more.  Specify configuration parameters, such as country or languages, to customize output SERP data.
        /// The following search engines are supported
        /// 
        /// - google
        /// - google-image
        /// - google-news
        /// - google-shopping
        /// - bing
        /// - duckduckgo
        /// - baidu
        /// - yandex
        /// 
        /// 
        /// Generate ready-to-run code for your favorite language at [https://dataflowkit.com/serp](https://dataflowkit.com/serp)
        public func post(_ body: DataflowKit.Serprequest) -> Request<[String: AnyJSON]> {
            .post(path, body: body)
        }
    }
}

extension Paths {
    public static var parse: Parse {
        Parse(path: "/parse")
    }

    public struct Parse {
        /// Path: `/parse`
        public let path: String

        /// Extract structured data from web pages
        ///
        /// Dataflow kit uses CSS selectors to find HTML elements in web pages for later data extraction.
        /// 
        /// Open [visual point-and-click toolkit](https://dataflowkit.com/dfk) and click desired elements on a page to specify extracting data. 
        /// 
        /// 
        ///  Then you can send generated payload to `/parse` endpoint. We crawl web pages and extract data like text, links, or images for you following the specified rules. 
        /// 
        /// 
        /// Extracted data is returned in CSV, MS Excel, JSON, JSON(Lines) or XML format.
        public func post(_ body: DataflowKit.Parserequest) -> Request<[String: AnyJSON]> {
            .post(path, body: body)
        }
    }
}

extension Paths {
    public static var convert: Convert {
        Convert(path: "/convert")
    }

    public struct Convert {
        /// Path: `/convert`
        public let path: String
    }
}

extension Paths.Convert {
    public var url: URL {
        URL(path: path + "/url")
    }

    public struct URL {
        /// Path: `/convert/url`
        public let path: String
    }
}

extension Paths.Convert.URL {
    public var pdf: Pdf {
        Pdf(path: path + "/pdf")
    }

    public struct Pdf {
        /// Path: `/convert/url/pdf`
        public let path: String

        /// Save web page as PDF
        ///
        /// Automate URL to PDF Conversion right in your application.
        /// 
        /// Specify request parameters like URL, Proxy, and actions to render web pages to PDF using Headless Chrome.
        /// 
        /// Get resulted PDF even from websites blocked in your area for some reason utilizing our worldwide pool of proxies.
        /// 
        /// Simulate real-world human interaction with the page. For example, before saving a web page to PDF, you may need to scroll it.
        /// 
        /// Generate ready-to-run code for your favorite language at [https://dataflowkit.com/url-to-pdf](https://dataflowkit.com/url-to-pdf)
        public func post(_ body: DataflowKit.Url2pdfrequest) -> Request<String> {
            .post(path, body: body)
        }
    }
}

extension Paths.Convert.URL {
    public var screenshot: Screenshot {
        Screenshot(path: path + "/screenshot")
    }

    public struct Screenshot {
        /// Path: `/convert/url/screenshot`
        public let path: String

        /// Capture web page Screenshots.
        ///
        /// Automate URL to Screenshot Conversion right in your application.
        /// 
        /// Specify request parameters like URL, Proxy, and actions to convert web pages to screenshots using Headless Chrome.
        /// 
        /// Get resulted pictures in JPG or PNG formats even from websites blocked in your area for some reason utilizing our worldwide pool of proxies.
        /// 
        /// Simulate real-world human interaction with the page. For example, before capturing a web page, you may need to scroll it.
        /// 
        /// Generate ready-to-run code for your favorite language at [https://dataflowkit.com/url-to-screenshot](https://dataflowkit.com/url-to-screenshot)
        public func post(_ body: DataflowKit.Url2screenshotrequest) -> Request<String> {
            .post(path, body: body)
        }
    }
}

public enum Paths {}
