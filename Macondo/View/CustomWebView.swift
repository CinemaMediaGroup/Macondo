//
//  CustomWebView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/1/9.
//

/// see https://stackoverflow.com/questions/62962063/implement-webkit-with-swiftui-on-macos-and-create-a-preview-of-a-webpage

import SwiftUI
import WebKit
import Combine

class CustomWebViewModel : ObservableObject {
    @Published var html: String
    @Published var didFinishLoading: Bool = false
    @Published var pageTitle: String
    
    init(html : String) {
        self.html = html
        self.pageTitle = ""
    }
}

struct SwiftUIWebView : NSViewRepresentable {
    
    public typealias NSViewType = WKWebView
    @ObservedObject var viewModel : CustomWebViewModel

    private let webView : WKWebView = WKWebView()
    public func makeNSView(context : NSViewRepresentableContext<SwiftUIWebView>) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator as? WKUIDelegate
        //webView.load(URLRequest(url: URL(string: viewModel.link)!))
        webView.loadHTMLString(viewModel.html, baseURL: nil)
        return webView
    }

    public func updateNSView(_ nsView : WKWebView, context : NSViewRepresentableContext<SwiftUIWebView>) { }

    public func makeCoordinator() -> Coordinator {
        return Coordinator(viewModel)
    }
    
    class Coordinator : NSObject, WKNavigationDelegate {
        private var viewModel: CustomWebViewModel

        init(_ viewModel : CustomWebViewModel) {
           self.viewModel = viewModel
        }
        
        public func webView(_ : WKWebView, didFail : WKNavigation!, withError : Error) { }

        public func webView(_ : WKWebView, didFailProvisionalNavigation : WKNavigation!, withError : Error) { }

        public func webView(_ web : WKWebView, didFinish : WKNavigation!) {
            self.viewModel.pageTitle = web.title!
            self.viewModel.html = web.url!.absoluteString
            self.viewModel.didFinishLoading = true
        }

        public func webView(_ webView : WKWebView, didStartProvisionalNavigation navigation : WKNavigation!) { }

        public func webView(_ webView : WKWebView, decidePolicyFor navigationAction : WKNavigationAction, decisionHandler : @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }
    }
}

struct SafariWebView: View {
    @ObservedObject var model: CustomWebViewModel

    init(html: String) {
        self.model = CustomWebViewModel(html : html)
    }
    
    var body: some View {
        SwiftUIWebView(viewModel: model)
    }
}
