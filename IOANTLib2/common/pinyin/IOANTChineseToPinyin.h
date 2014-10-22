#import <UIKit/UIKit.h>


@interface IOANTChineseToPinyin : NSObject {

}
/** 将中文语句转化为拼音 每个汉字字母全部大写
中国 ZHONGGUO */
+ (NSString *) pinyinFromChiniseStringAllUpper:(NSString *)string;
/** 将中文语句转化为拼音 每个汉字首字母大写
中国 ZhongGuo */
+ (NSString *) pinyinFromChiniseStringCapitalUpper:(NSString *)string;
+ (char) sortSectionTitle:(NSString *)string; 
@end
