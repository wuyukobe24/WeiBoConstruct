# WeiBoConstruct
仿新浪微博加号弹出动画

//向上弹出动画

    -(void)openConstructButtonLocation{

    NSArray * upArray = @[_calendarButton,_projectButton,_photoButton,_soundButton,_recordButton];
    [upArray enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL*stop) {
        
        UIButton * btn = obj;
        
        CGFloat x = btn.frame.origin.x;
        CGFloat y = btn.frame.origin.y;
        CGFloat width = btn.frame.size.width;
        CGFloat height = btn.frame.size.height;
        
        btn.frame = CGRectMake(x, self.frame.size.height - height, width, height);
        
        btn.alpha = 0.0;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(idx * 0.1 * NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
            //1 0.16 0.4 1
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:100 initialSpringVelocity:40 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
                btn.alpha = 1;                
                btn.frame = CGRectMake(x, y, width, height);
                
            }completion:^(BOOL finished) {
                
            }];
            
        });
        
    }];
    }

//向下滑走动画

    - (void)closeConstructButtonLocation{

    NSArray * downArray = @[_recordButton,_soundButton,_photoButton,_projectButton,_calendarButton];
    [downArray enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL*stop) {
        
        UIButton * btn = obj;
        
        CGFloat x = btn.frame.origin.x;
        CGFloat y = btn.frame.origin.y;
        CGFloat width = btn.frame.size.width;
        CGFloat height = btn.frame.size.height;

        btn.frame = CGRectMake(x, y, width, height);
        
        btn.alpha = 1.0;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(idx *0.06*NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:100 initialSpringVelocity:25 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
                btn.alpha = 0.0;
                btn.frame = CGRectMake(x, self.frame.size.height - height, width, height);
                
            }completion:^(BOOL finished) {
                
                if (_constructBlock) {
                    _constructBlock(0,YES);
                }
            }];
            
        });
        
    }];
    }

//十字按钮旋转45度动画

    - (void)cancelButtonClick:(UIButton *)sender{

    sender.selected = !sender.selected;
    
    if (sender.selected) {
        
        [UIView animateWithDuration:0.3f animations:^{
            sender.transform = CGAffineTransformMakeRotation(M_PI/4);
        }];
        
    }else{
        
        [self closeConstructButtonLocation];
        
        [UIView animateWithDuration:0.3f animations:^{
            sender.transform = CGAffineTransformMakeRotation(M_PI*4);
        }];        
        
    }
    }

实现效果截图：

![image](https://github.com/wuyukobe24/WeiBoConstruct/blob/master/construct.png)
