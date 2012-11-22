
Chicken 有两个页面列出了[扩展][extension]和[标准以外][non-stand]的一些语法
过了一遍没明白多少, 看来要等熟悉了之后回头看这里的说法了

首页给了一个叫做的 [Chickadee][chickadee] 的文档搜索工具, 速度挺快的
一看是个 Chicken 写的叫做 [Spiffy][spiffy] 的 Web Server..

[Eggs][about-eggs] 是 Chicken 的扩展库. 其中存放的是源码, 可自动下载安装
本地可以做一个 [Mirror][mirror], 操作不多, 需要的时候再去细看了
eggs 扩展的安装和加载代码精简, 大概是:
```
chicken-install name
chicken-install -r name           ; to obtain the source code to an egg
```
加载分的情形多, 到后边再看细节:
```scheme
(require-extension egg-name)      ; load library code, import identifiers
(require-library gopher)          ; load library code
(import (prefix gopher gopher:))  ; import identifiers with a prefix
```

[Eggs Tutorial][eggs-tutor] 是要讲怎么写一个 eggs 扩展
扩展可以是包装 C/C++ 和自身还有其他语言的
看来 eggs 是用 svn 作为分布式管理工具的, 难怪 Github 上没影子
教程提说的就是写元信息还有提供测试之类, 另外用 svn 管理
我在 [Github 上有搜到 chicken-scheme 的 repo][repo], 于是好奇怎么成了 svn 了

松散的内容过一遍之后, 学习的路径就剩下下面几个列表了
* [chicken-doc][doc]
* [Chicken Scheme tutorials][tutorials]
* [Tips and tricks && Code snippets][tips]
* [The CHICKEN User's Manual][manual]

[manual]: http://wiki.call-cc.org/man/4/The%20User%27s%20Manual
[doc]: http://wiki.call-cc.org/eggref/4/chicken-doc
[tutorials]: http://wiki.call-cc.org/tutorials
[tips]: http://wiki.call-cc.org/tips%20and%20tricks
[repo]: https://github.com/alaricsp/chicken-scheme
[eggs-tutor]: http://wiki.call-cc.org/eggs%20tutorial
[about-eggs]: http://wiki.call-cc.org/eggs
[mirror]: http://wiki.call-cc.org/running-an-egg-mirror
[spiffy]: http://api.call-cc.org/doc/spiffy
[chickadee]: http://api.call-cc.org/doc/
[extension]: http://wiki.call-cc.org/man/4/Extensions%20to%20the%20standard#extended-dsssl-style-lambda-lists
[non-standard]: http://wiki.call-cc.org/man/4/Non-standard%20read%20syntax

-------

根据 chicken-doc, `(chicken-home)` 可以查看文档在本地存放的位置
或者自己设置环境变量 `export CHICKEN_DOC_REPOSITORY=/path/to/repository`

文档的结构和扩展的丛书结构是对应的, 具体再看
里边的关于 `doc` 的命令默认没有安装, 还好 AUR 里 grep 到了
不好, 太久没维护无法正常安装了... 先跳过


Chicken 通过 [SWIG (Simplified Wrapper and Interface Generator)][swig] 调用 C/C++ 代码
[readline][readline] 是开发需要的基本模块, 在 REPL 中也有用到
通过 `load "name.scm"` 这个函数可以夹在别的文件的里代码

[readline]: http://wiki.call-cc.org/eggref/4/readline
[swig]: http://www.swig.org/

`-ss` 参数将脚本执行时脚本中需要有 `main` 函数
此外, `main` 接收 `argv` 参数, 来自命令行的参数, 一个列表
用 `csc` 命令可以编译脚本到二进制的可执行文件
`-dynamic` 参数用来编译到 `.so` 的动态链接库, 奇怪只有一条连字符
`-o` 参数用来把脚本编译成 `.o` 的对象文件, C 的内容
通过 `declare` 函数, 不同的文件编译成 `.o`, 之后链接在一起
``` bash
$ csc -c pal-proc.scm
$ csc -c pal-user.scm
$ csc -o pal-separate pal-proc.o pal-user.o
$ ./pal-separate level
level is a palindrome
```

Chicken 还可以通过 `#<>#` 来嵌入 C 代码, 借此调用 C 函数
在编译阶段链接到一起形成可执行文件. 估计我不会去用
[`csc`][csc] 命令的参数一看真是相当多, 编译器..

[FAQ][faq] 里提了许多关于使用的细节, 包括一些教程没写的细节
可以用 `load file.so` 夹在编译过的动态链接库. 但要 `-shared` 参数
还有 `module` 的用法和 `declare` 相近, FAQ 没详细写
关于[递归在 Chicken 的实现][collection], 又讲了一遍
使用非标准语法需要 `(require-library chicken-syntax)`
提到一个[并行模块 mpi][mpi], 我突然觉得 Chicken 也好难学..

[mpi]: http://wiki.call-cc.org/eggref/4/mpi
[collection]: http://wiki.call-cc.org/man/4/faq#why-does-a-loop-that-doesnt-consstill-trigger-garbage-collections
[faq]: http://wiki.call-cc.org/man/4/faq
[csc]: http://wiki.call-cc.org/man/4/Using%20the%20compiler
