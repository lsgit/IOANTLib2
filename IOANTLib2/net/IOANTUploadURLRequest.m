//
//  IOANTUploadURLRequest.m
//  02.Post上传
//
//  Created by liushuai on 14-10-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IOANTUploadURLRequest.h"
static NSString *boundaryStr = @"--";
@interface IOANTUploadURLRequest ()
-(NSString *)getTopStrWithMimeType:(NSString *)mimeType fileName:(NSString *)fileName uploadID:(NSString *)uploadID;
- (NSString *)getRequestBottomString;
@end

@implementation IOANTUploadURLRequest

-(void)dealloc
{
    [_randomStr release];
    [_requestDataM release];
    [super dealloc];
}
-(id)initWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval randomStr:(NSString *)randomStr
{
    if ([super initWithURL:URL cachePolicy:cachePolicy timeoutInterval:timeoutInterval]) {
        _randomStr = randomStr;
        _requestDataM =[[NSMutableData alloc]init];
    }
    return self;
}
-(void)addFileByName:(NSString *)name withContentType:(NSString *)contentType upLoadID:(NSString *)uploadID andData:(NSData *)data
{
    NSMutableData *datam = [[NSMutableData alloc]init];
    NSString *dataTopStr = [self getTopStrWithMimeType:contentType fileName:name uploadID:uploadID];
    [datam appendData:[dataTopStr dataUsingEncoding:NSUTF8StringEncoding]];
    //当文本文件与流文件在一起同时提交给服务器时，要将流信息后面添加一个换行
    //image/jpeg
    if ([@"audio/mpeg" isEqualToString:contentType]||[@"image/jpeg" isEqualToString:contentType]) {
        [datam appendData:[data copy]];
        [datam appendData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }else{
        [datam appendData:[data copy]];
    }
    [_requestDataM appendData:datam];
    [datam release];
    [data release];
}
-(void)addFinished
{
    NSString *bottomDataStr = [self getRequestBottomString];
    NSData *data = [bottomDataStr dataUsingEncoding:NSUTF8StringEncoding];
    [_requestDataM appendData:data];
    // dataM出了作用域就会被释放,因此不用copy
    self.HTTPBody = _requestDataM;
    
    // 2> 设置Request的头属性
    self.HTTPMethod = @"POST";
    
    // 3> 设置Content-Length
    NSString *strLength = [NSString stringWithFormat:@"%ld", (unsigned long)_requestDataM.length];
    NSLog(@"%ld",(unsigned long)_requestDataM.length);
    [self setValue:strLength forHTTPHeaderField:@"Content-Length"];
    
    // 4> 设置Content-Type
    NSString *strContentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", self.randomStr];
    [self setValue:strContentType forHTTPHeaderField:@"Content-Type"];
}

-(NSString *)getTopStrWithMimeType:(NSString *)mimeType fileName:(NSString *)fileName uploadID:(NSString *)uploadID
{
    NSMutableString *strM = [NSMutableString string];
    
    [strM appendFormat:@"%@%@\n", boundaryStr, self.randomStr];
    [strM appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\n", uploadID, fileName];
    [strM appendFormat:@"Content-Type: %@\n\n", mimeType];
    
    NSLog(@"%@", strM);
    return [strM copy];
}
- (NSString *)getRequestBottomString
{
    NSMutableString *strM = [NSMutableString string];
    
    [strM appendFormat:@"%@%@\n", boundaryStr, self.randomStr];
    [strM appendString:@"Content-Disposition: form-data; name=\"submit\"\n\n"];
    [strM appendString:@"Submit\n"];
    [strM appendFormat:@"%@%@--\n", boundaryStr, self.randomStr];
    
    NSLog(@"%@", strM);
    return [strM copy];
}
@end
