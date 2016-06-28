# AuXue_CustomHUD

/**
 *  设置显示内容以及等待时间
 *
 *  @param time    等待时间
 *  @param content 显示内容
 */
 
+(void)createHudCustomTime:(CGFloat)time showContent:(NSString *)content;


/**
 *  设置显示内容
 *
 *  @param content 显示内容
 */
 
+(void)createHudCustomShowContent:(NSString *)content;


/**
 *  仅显示提示语
 *
 *  @param content 提示语
 */
 
+(void)createShowContent:(NSString *)content;
