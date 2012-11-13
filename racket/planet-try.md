决定尝试一下 Racket 模块引用的方法, 文档在 [PLaneT](http://docs.racket-lang.org/planet/) 的页面上.
这里相当于操作记录, 可能就会这混乱, 等到熟悉了, 我会回头修改这里的描述.

加载模块用到 `require` 函数, [BNF 语法一大串](http://docs.racket-lang.org/reference/require.html), 等待深入
Racket 的包在[仓库](http://planet.racket-lang.org/)可以检索, [也可以看简短的列表](http://planet.racket-lang.org/servlets/pkg-info.ss)
信息的排列比如 ` ("gh" "http.plt" (1 1))` 对应 `<owner> <pkg> <maj> <min>`
代码中可以用两种语法引用, 后一种是兼容旧语法:
比如 `gh http` 可以在[ PLaneT 是对应页面找到](http://planet.racket-lang.org/display.ss?package=http.plt&owner=gh)具体信息.
```racket
("gh" "http.plt" (1 1))
(require (planet "main.rkt" ("gh" "http.plt" 1 1)))
```
尝试时候, 前面提到在 PLaneT 可以自动和手动下载, 半天没弄明白
后来看到 `raco planet` 命令的说明, 尝试用下面的命令下载:
```
raco planet install gh http.plt 1 1
```
刚开始命令运行很慢, 一度以为命令不对, 最后发现文件下载到了
```
/.racket/planet/300/packages
```
接着我写了一个脚本测试, 注意要写 `#lang` 这一行, 运行终于没有报错
```racket
#lang racket
(require (planet gh/http:1:1))
(display "done")
```
接下来按照[文章, Racket 常用的语法比 Guile 的差别这样没错](http://www.dreamincode.net/forums/topic/178313-intro-to-plt-schemeracket-part-i/)
```racket
#lang racket
;; (require (planet gh/http:1:1))
#|
  (display "done")
  comments
|#

(print "Hello, world!")

(define x 5)
(set! x 3/5)
(set! x "yes")
(set! x 5.26)
(set! x #t)

(+ 10 5)
(+ 1 2 3)
(print (* 2 3))

(define (functionName)
  (print 4))
(functionName)

(define (add x y)
  (define result (+ x y))
  result)
(print (add 2 3))

(if (> 5 4)
  "5 greater"
  "4 greater")
```

[Sublime 的 Scheme 语法高亮插件](https://github.com/masondesu/sublime-scheme-syntax) 我在 Github 找到了
到 Sublime 配置文件的 `Package/` 目录下添加文件就可以
```
git clone git://github.com/masondesu/sublime-scheme-syntax.git Scheme
```

[Racket 的查找顺序](http://docs.racket-lang.org/planet/search-order.html)是可以从网络自动下载的
首先是在 linkage table 里找到符合代码里写明了需要的模块
如果没有, 就到已安装和 development link 里同时查找符合条件的
如果没有, 从网络加载满足或者最新符合条件的版本进行下载
如果无法连接网络, 查找以卸载软件和其他的 cache 来加载模块
后边应该就是报错了...

似乎 [Guide](http://docs.racket-lang.org/guide/index.html) 才是学习应该看的文档
其中说到 DrRacket 才是 Racket 的 Environment, `racket`只是核心的编译命令
因为 DrRacket 当中有很多 Racket 的变种, 于是需要 `#lang racket`
另外可以用 `raco exe filename.ss` 生成可执行文件
Unix 风格的 `#!` 也是可行的, 别忘记 `chmod +x filename.ss`

点号很让我困惑, 还好 Scheme 里不推荐这个写法, 尽管合法
此外点好可以用在中缀表达式里 `(1 . < . 2)` 等于 `(< 1 2)`

`+inf.0 -inf.0 +nan.0 -nan.0` 的用法还是第一次看到
此外还有精确浮点数还有进制之间的转化, 体现在语法上
```racket
#lang racket

#e0.4
#e2/3

#i0.4
#i2/3

(inexact->exact 0.4)
(inexact->exact 2/3)

(exact->inexact 0.4)
(exact->inexact 2/3)

#b11
#o11
#x11
#x11
```
从例子看, 分数相对浮点数来说运算速度不是一般的慢

字符的话, 看看 `#\λ` 怎么打印是主要的
```racket
#lang racket

#\u03bb
(char->integer #\u03bb)
```
byte strings 我第一次没看懂, 细看里边的数字是 8 进制的
```racket
#lang racket

(display "A")
(display #"A")
(display "\316\273")
(display #"\316\273")
(display #"\1\377")

(display "\n")

(bytes-ref #"\50" 0)

#o377

(bytes->string/utf-8 #"\316\273")
(bytes->string/latin-1 #"\316\273")
```

留着手册, 明天看
http://docs.racket-lang.org/reference/
