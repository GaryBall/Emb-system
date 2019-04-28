import UIKit
import WebKit

class ViewController: UIViewController , WKUIDelegate{
    
    var webView: WKWebView!
    
    
    override func loadView() {
        
        let conf = WKWebViewConfiguration()
        conf.userContentController = WKUserContentController()
        conf.preferences.javaScriptEnabled = true
        conf.selectionGranularity = WKSelectionGranularity.character
        conf.allowsInlineMediaPlayback = true
        //注册 js 消息通道
        conf.userContentController.add(self , name: "msgBridge")
        
        webView = WKWebView(frame: .zero, configuration: conf)  //.zero
        webView.uiDelegate = self
        //禁止顶部下拉 和 底部上拉效果
        webView.scrollView.bounces = false
        //解决全屏播放视频 状态栏闪现导致的底部白条  never:表示不计算内边
        webView.scrollView.isScrollEnabled = false;
        
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**加载 https 链接  **/
        //let myURL = URL(string: "https://garyball.github.io/flappy_bird/")
        //let myRequest = URLRequest(url: myURL!)
        //webView.load(myRequest)
        
        /**加载本地 HTML文件**/
        //从主Bundle获取 HTML 文件的 url
        let fileURL =  Bundle.main.url(forResource: "birthday-basic/index", withExtension: "html" )
        webView.loadFileURL(fileURL!,allowingReadAccessTo:Bundle.main.bundleURL);
        
        /**加载 html 内容**/
        //webView.loadHTMLString("<h1>h1</h1><img src='.html/images/h.png'>", baseURL: Bundle.main.bundleURL);
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

extension ViewController: WKNavigationDelegate {
    
}

//js 和 swift 的交互
extension ViewController: WKScriptMessageHandler {
    
    //接收 js 发来的消息
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        //判断消息通道
        if(message.name == "msgBridge"){
            //TODO ...
            //message.body（any 类型） 即前端 js 传来的数据，如果传字符串这里接收的就是字符串，如果传 json 对象或 js 对象 则这里是 NSDictionary
            print(message.body)
            let msg = message.body as! NSDictionary;
            
            //swift 调 js函数
            webView.evaluateJavaScript("funcforswift('\( msg["msg"]  as! String)')", completionHandler: {
                (any, error) in
                if (error != nil) {
                    print(error ?? "err")
                }
            })
        }
        
    }
}
