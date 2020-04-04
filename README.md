# iOS-ChildViewController-demo
a demo shows how to use child viewController

>Adding a child view controller to a container

```
- (void) displayContentController: (UIViewController*) content {
   [self addChildViewController:content];
   content.view.frame = [self frameForContentController];
   [self.view addSubview:self.currentClientView];
   [content didMoveToParentViewController:self];
}
```

> Removing a child view controller from a container

```
- (void) hideContentController: (UIViewController*) content {
   [content willMoveToParentViewController:nil];
   [content.view removeFromSuperview];
   [content removeFromParentViewController];
}

```

> 手动管理子控制器的 viewWillAppear, viewDidAppear, viewWillDisappear, viewDidDisappear

```
- (BOOL) shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}
-(void) viewWillAppear:(BOOL)animated {
    [self.child beginAppearanceTransition: YES animated: animated];
}
 
-(void) viewDidAppear:(BOOL)animated {
    [self.child endAppearanceTransition];
}
 
-(void) viewWillDisappear:(BOOL)animated {
    [self.child beginAppearanceTransition: NO animated: animated];
}
 
-(void) viewDidDisappear:(BOOL)animated {
    [self.child endAppearanceTransition];
}
```

> Let a child view controller determine the status bar style

```
override var childForStatusBarStyle: UIViewController? {
    
    if child.parent != nil {
        return child
    }
    return nil
    
}
    
override var childForStatusBarHidden: UIViewController? {
    
    if child.parent != nil {
        return child
    }
    return nil
}
    
override var childForHomeIndicatorAutoHidden: UIViewController? {
    
    if child.parent != nil {
        return child
    }
    return nil
}

//更新 statusBar 

func didAdd() {
//....
 setNeedsStatusBarAppearanceUpdate()
}


```




