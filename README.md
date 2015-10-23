BMLine!
=====

方便的为你的View增加线条吧！
------


  
加入你的工程？
-------

只需将BMLine文件夹及里面相应的文件拷入你的项目即可！


如何使用？
-------

最简单的，在View的上方增加一条直线：
```
[_View addLineWithType:BMLineTypeCustomDefault color:nil position:BMLinePostionCustomTop];
```
在一个View四周加上线条：
```
[_VIew addLineWithType:BMDashLineWidth color:[UIColor blueColor] position:BMLinePostionCustomAll];
```
删除这个View上某个位置的一条线：
```
[_VIew removeLineWithPosition:BMLinePostionCustomCenterY];
```
删除这个View上所有的BMLine：
```
[_mid2VIew removeAllLines];
```

一些参数说明：
------
BMLineTypeCustomDefault  ======直线

BMLineTypeCustomDash     ======虚线

BMLineTypeCustomDot      ======小圆点

BMLineTypeCustomTriangle ======小三角



BMLinePostionCustomTop        ======View上方

BMLinePostionCustomCenterX    ======View水平中间

BMLinePostionCustomBottom     ======View下方

BMLinePostionCustomRight      ======View右方

BMLinePostionCustomCenterY    ======View垂直中间

BMLinePostionCustomLeft       ======View左方

BMLinePostionCustomAll        ======View四周

关于线条的大小？
-------
可以在defines.h的相应区域内找到一些可定制的参数

注意事项？
--------
如果你使用自动布局，请不要在viewDidLoad和viewWillAppear中一上来就使用噢，那会View的frame其实还没计算好，很容易出现大小不对的问题~建议在viewDidAppear中使用

另外还做了一些防Crash的处理，有问题和好的建议可以和我联系：QQ 188561521
-------
