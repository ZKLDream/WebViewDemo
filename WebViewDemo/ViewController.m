//
//  ViewController.m
//  WebViewDemo
//
//  Created by 千锋 on 16/3/22.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIWebView *WebView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置UIWEBView的委托
    self.WebView.delegate=self;
    
    
   //加载一个URL请求
    NSURL *baiduURL=[NSURL URLWithString:@"http://www.baidu.com"];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:baiduURL];
    [self.WebView loadRequest:request];
}

#pragma mark -UIWebViewDelegate
//UIWebView开始加载网页

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSLog(@"开始加载");
}

//加载完成

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"加载完成");
    //通过UIWebView执行JavaScript代码获取标题
 NSString *title=[self.WebView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.titleLable.text=title;
    //实现百度中自动搜索
    //1.填充文本输入框的内容
    [self.WebView stringByEvaluatingJavaScriptFromString:@"document.getElementById('index-kw').value='CBA';"];
    
    //2.模拟点击按钮
    [self.WebView stringByEvaluatingJavaScriptFromString:@"document.getElementById('index-bn').click();"];
    
    
}



/**
 *  //UIWebView 询问是否可以加载某个请求
 *
 *  @param webView
 *  @param request        请求
 *  @param navigationType 导航请求
 *
 *  @return yes表示可以跳转 no表示不可以
// */
//UIWebViewNavigationTypeLinkClicked,
//UIWebViewNavigationTypeFormSubmitted,
//UIWebViewNavigationTypeBackForward,
//UIWebViewNavigationTypeReload,
//UIWebViewNavigationTypeFormResubmitted,
//UIWebViewNavigationTypeOther

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *requestURL=request.URL.absoluteString;
    NSLog(@"%@",requestURL);
    if ([requestURL containsString:@"baidu.com"]) {
        return YES;
    }
    
    return NO;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
