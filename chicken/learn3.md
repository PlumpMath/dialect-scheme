
[extensions][extensions] 里讲的是怎样自己写 Chicken 扩展功能

[extensions]: http://wiki.call-cc.org/man/4/Extensions

比较难懂. 大意是要系统能支持动态加载代码的机制, Windows 平台都是模拟的
技术上主要是动态编译和加载代码还有各种元信息的管理
再就是安装, 移除和检索扩展的工具

`chicken-install` 命令下载包, 并使用 `setup` 脚本进行安装
`setup` 脚本使用 `Scheme` 写的, 被 `chicken-install` 解释执行
类库是在代码运行过程中被加载进去的

代码先被 `build`, 然后触发如 `install-extension install-program install-script`
这些命令会把一些编译结果 copy 到本地存放可执行文件的位置
如果信息里没有给出命令, 会按命令行所在路径生成

创建扩展时应该注意让文件名相同

我尝试抄了一遍教程上的例子, 觉得比 NPM 第一次上手时轻松, 除了 my-lib 例子出错了

