
被 Racket 弄烦之后想起 Chicken Scheme 还没细看过, 报一线希望
于是看到 [Eggs][eggs] 页面有好多的模块, 于是决定看一下 Chicken

[Chicken 的安装][install] 比较方便, 还可以添加 `~/.csirc ~/.csi.history` 记录历史
这样的话需要 `sudo chicken-install readline` 添加需要的模块
运行 REPL 的命令是 `csi`, 用 `-ss` 参数可以运行 `.csi` 脚本的 `main` 函数

下面的代码把脚本改写成 Unix 风格的可执行脚本
```bash
#!/bin/bash
#|
exec csi -ss $0 ${1+"$@"}
exit
|#
```
另外也能用 `csc -o hello hello.scm` 编译成二进制文件
不过这样不会执行默认的 `main` 函数, 也没有 REPL 里的一些常用模块

按照 [Chicken Wiki][chicken-wiki] 里的说法, 是采用了 C 作为中间语言
可以编译成 C, 获得 C 的可移植性. 具体的参数没有直接给出
Chicken 源自于 [1994年 Henry Baker 的论文][paper-1994], 等公里够了去看下

[关于 Chicken 的特性][pitch], 主要是 REPL, 启动速度和其他类库的引用
按介绍说的, 能有 C C++ Java Python Lua 写的类库可用
另一方面, Chicken 带了很多 Unix 风格, 轻便灵活
[文档给了和主流语言的对比][compare], 主要是 Ruby 部分特别长
Ruby 是面向对象的, Scheme 却不倾向于任何一种编程范式
在 [eggs 里有很多 OOP 的实现][oop-egg], 也许各不相同
Scheme 能模拟各种编程范式, 上边说包括 Prolog Erlang 等

Ruby 从 Lisp 借鉴了很多, 其他从 Smalltalk, 要强大先要过了入门这关
Ruby 的规范是这门语言实现的本身, 而 Scheme 却是有一个单独的标准
Scheme 定义的核心很小, 并且尽可能精简而做到足够的强大
现实中的编程需要和 OS 和网络做各种交互, 每种方言都在做扩展
最后方言相互不兼容, Chicken 好处在于可以兼容各种 OS 和 C 之类语言
Chicken 和 C 是能一某种方式相互潜入和调用的

我居然看到了含空格的变量名 `(define |a b c| 5)` 并且正常运行
`set!` 可以改写全局作用域的变量, 但这不建议经常使用
尾递归在 Scheme 很重要, 尾递归优化被写在规范里
在函数 `return` 后没其他操作的情况下无穷的递归可以的..

对比两段代码, 前者不是, 后者是尾递归, 尾递归速度应该更快
```scheme
(define (add-up-to x)
  (if (zero? x)
    0
    (+ (add-up-to (sub1 x)) x)))
(define (add-up-to x)
  (define (inner x y)
    (if (zero? x)
      y
      (inner (sub1 x) (+ y x))))
  (inner x 0))
```
前者在函数调用后需要有一个栈, 这样就会浪费很多内存了

[关于编辑器的配置][editor], 只有 Emacs 和 Vim

Scheme 里的列表更像链表, 复杂度在 O(n) n 是元素位置
用 `vector` 的话, 复杂就能到 O(1), 所以自己觉得用哪种

其他动态语言的数据在 Scheme 经常有多种, 像字符, Hash 都是
还有介绍了`eval define-macro` 这些, 后者 `not defined` 我没运行成功
尝试的代码用了我自己的 `reload guil` 两个命令, 在 `demo/` 里

[Chicken 支持的平台][platform] 还是蛮多的, 注意到有个 Haiku 好奇了下
Chicken 在 00 年发布时候的帖子: [Announcing the CHICKEN Scheme-to-C compiler][ANN]
[Chicken 的 Logo][logo] 感觉挺好看的, 网上有具体的各种图片


[logo]: http://wiki.call-cc.org/logos
[ANN]: https://groups.google.com/forum/?fromgroups=#!msg/comp.lang.scheme/QOil0WmRtWg/rp_Yb6Et--0J
[platform]: http://wiki.call-cc.org/portability
[editor]: http://wiki.call-cc.org/editors
[ppg-egg]: http://wiki.call-cc.org/chicken-projects/egg-index-4.html#oop
[compare]: http://wiki.call-cc.org/chicken-for-programmers-of-other-languages
[pitch]: http://wiki.call-cc.org/elevator-pitch
[paper-1994]: http://people.cs.umass.edu/~emery/classes/cmpsci691s-fall2004/papers/p677-cheney.pdf
[chicken-wiki]: http://zh.wikipedia.org/wiki/Chicken_\(Scheme\)
[install]: http://www.yellosoft.us/chicken-scheme-caveats
[eggs]: http://wiki.call-cc.org/chicken-projects/egg-index-4.html)
