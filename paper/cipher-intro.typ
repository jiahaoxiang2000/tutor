#import "@preview/touying:0.6.1": *
#import themes.simple: *
#import "@preview/cetz:0.3.2"
#import "@preview/fletcher:0.5.5" as fletcher: edge, node
#import "@preview/numbly:0.1.0": numbly
#import "@preview/theorion:0.3.2": *
#import cosmos.clouds: *
#show: show-theorion

// cetz and fletcher bindings for touying
#let cetz-canvas = touying-reducer.with(reduce: cetz.canvas, cover: cetz.draw.hide.with(bounds: true))
#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)

// Color shorthand functions
#let redt(content) = text(fill: red, content)
#let bluet(content) = text(fill: blue, content)
#let greent(content) = text(fill: green, content)
#let yellowt(content) = text(fill: yellow, content)
#let oranget(content) = text(fill: orange, content)
#let purplet(content) = text(fill: purple, content)
#let greyt(content) = text(fill: gray, content)
#let grayt(content) = text(fill: gray, content)

// Set Chinese fonts using Source Han VF fonts
#set text(
  font: (
    "Songti SC"
  ),
)

#show heading: set text(font: "Lantinghei SC", weight: "bold")  // 黑体标题
// #show raw: set text(font: "Source Han Code JP")                      // 等宽代码字体

#show: simple-theme.with(aspect-ratio: "16-9", footer: [密码技术研究进展])

#title-slide[
  = 我们在密码技术研究上的进展
  #v(2em)

  主讲：向嘉豪

  #v(2em)
  #datetime.today().display()
]

= 目录

#text(size: 24pt)[
  - 密码研究背景
  - 密码研究热点
  - 论文书写投稿
]


= 密码研究背景

== IoT发展现状

=== 01 相关背景

过去十年，物联网稳步发展，被纳入：

#pause

- #bluet[智能电网]、智能城市、智能家庭
- 农业、健康、智能交通、交通监控等场景

#pause

#align(center)[
  #redt[2022年]：142亿台互联设备正在使用中

  #v(0.5em)

  #redt[2025年预测]：270亿台设备（Gartner公司）
]

#pause

#align(center)[
  #text(size: 14pt, fill: gray)[图1：2015年至2025年全球互联设备数量增长趋势]
]

== 网络安全威胁

=== 01 相关背景 - 安全威胁

#align(center)[
  #redt[网络安全问题日趋严峻]
]

#pause

典型安全事件：

#pause

- 加拿大空军供应商遭勒索
- 人脸信息滥用、简历泄露等乱象
- 特斯拉车内高清摄像曝光

#pause

#align(center)[
  各地发生多起重大网络安全事件，既有#redt[公民信息遭泄露]，

  也发生多起因为遭遇#redt[勒索软件攻击]而被迫停工停产事件。
]


== IoT设备限制

=== 01 相关背景 - 设备约束

物联网设备具有许多限制因素：

#pause

- 计算能力、RAM大小、ROM大小
- 寄存器宽度、不同的操作环境等

#pause

#align(center)[
  #redt[传统安全方案无法适用]

  #v(0.5em)

  #bluet[轻量级密码应运而生]
]

#pause

#align(center)[
  #cetz-canvas({
    import cetz.draw: *

    circle((0, 0), radius: 2, name: "center")
    content("center", [#text(size: 12pt)[Cryptography Challenges in IoT devices]])

    let items = (
      "Small Memory",
      "Real-time Response",
      "Small Computing Power",
      "Small Physical Area",
      "Low Battery Power",
    )

    for (i, item) in items.enumerate() {
      let angle = i * 72deg - 90deg
      let pos = (2.5 * calc.cos(angle), 2.5 * calc.sin(angle))
      content(pos, [#text(size: 10pt, fill: red)[#item]], anchor: "center")
      line((1.8 * calc.cos(angle), 1.8 * calc.sin(angle)), pos, stroke: gray)
    }
  })
]


== 轻量级密码特点

=== 02 轻量级密码（LWC）具有的特点

#align(center)[
  #cetz-canvas({
    import cetz.draw: *

    circle((0, 0), radius: 1.5, name: "center")
    content("center", [#text(size: 14pt, fill: blue)[LWC的特点]])

    let features = (
      "低计算量",
      "低能耗",
      "低处理",
      "低存储容量",
      "低内存占用",
    )

    for (i, feature) in features.enumerate() {
      let angle = i * 72deg - 90deg
      let pos = (2.8 * calc.cos(angle), 2.8 * calc.sin(angle))
      content(pos, [#text(size: 12pt, fill: red)[#feature]], anchor: "center")
      line((1.3 * calc.cos(angle), 1.3 * calc.sin(angle)), pos, stroke: blue)
    }
  })
]

#pause

#align(center)[
  #text(size: 16pt, fill: gray)[以及更多特征...]
]


== 标准化历程(1)

=== 03 轻量级密码的标准化工作 - 早期发展

#align(left)[
  #bluet[1994年] Neecham等人提出描述简洁、实现简单的
  #redt[Tiny Encryption Algorithm (TEA)]

  #pause

  #bluet[2004年] 欧洲国家成立ECRYPT/eSTREAM项目：
  80bits密钥在受限硬件资源中的应用

  #pause

  #bluet[2012年] IEC发布29192《轻量级密码》标准系列

  #pause

  #bluet[2012年] IEC发布29167标准系列，至今仍在扩展

  #pause

  #bluet[2013年] NIST启动轻量级密码研究项目

  #pause

  #bluet[2013年] 日本CRYPTREC启动轻量级密码研究项目
]


== 标准化历程(2)

=== 03 轻量级密码的标准化工作 - 近期发展

#align(left)[
  #bluet[2017年] NIST发布轻量级密码调查联合报告NISTIR 8114

  #pause

  #bluet[2018年] NIST发布轻量级密码算法征集需求和评估标准通知

  #pause

  #bluet[2019年4月] NIST公布了前两轮候选算法筛选结果

  #pause

  #bluet[2021年3月] NIST宣布进入最终轮的10个轻量级密码算法

  #pause

  下一步，将对最终轮算法进行为期约12个月的标准化工作，
  最终形成#redt[NIST轻量级密码算法标准]。
]

#pause

#align(center)[
  #text(size: 12pt, fill: gray)[图3 轻量级密码研究发展时间简表]
]


== 设计考虑要素

=== 设计规范与标准

根据这些轻量级分组密码算法的设计规范与标准，
轻量级分组密码在设计上应考虑以下7点：

#pause

#grid(
  columns: 2,
  gutter: 20pt,
  [
    1. #redt[安全强度]

    2. #redt[灵活性]

    3. #redt[多重功能下的低开销]

    4. #redt[密文扩展]
  ],
  [
    5. #redt[侧信道]

    6. #redt[明文-密文对的数量限制]

    7. #redt[相关密钥攻击以及其他一些基本的攻击方法]
  ],
)


= 密码研究热点

== 三类研究方法概述

01 轻量级密码构造的三类主要研究方法

#align(center)[
  #v(2em)
  #text(size: 18pt, fill: blue)[
    三类主要研究方法
  ]
  #v(2em)
]


=== 硬件优化实现(1)

#align(center)[
  #text(size: 18pt, fill: red)[
    1. 对已有的轻量级密码分组密码算法进行硬件优化实现
  ]
]

#pause

#v(1em)

#bluet[以《Implementation of PRINCE with resource-efficient structures based on FPGAs》为例]

#pause

针对PRINCE算法提出了#redt[3种新的硬件架构实现]。


=== 硬件优化实现(2)


#align(center)[
  #text(size: 18pt, fill: red)[
    1. 对已有的轻量级密码分组密码算法进行硬件优化实现
  ]
]

#pause

#v(2em)

#align(center)[
  实验量少，关键在论文的书写。

  #v(1em)

  只需进行#bluet[不同的硬件优化架构实现]，比较#bluet[硬件参数]。
]


=== 结构改进方法(1)


#align(center)[
  #text(size: 18pt, fill: red)[
    2. 基于分组密码，对密码算法的结构或部件进行改进
  ]
]

#pause

#grid(
  columns: 2,
  gutter: 20pt,
  [
    #align(center)[
      #bluet[Feistel结构]

      #v(0.5em)

      #raw(
        "
        Plaintext
           |
          IP
           |
        L1   R1
         |   |
         F   |
        /|   |
       k1    |
        |    |
        L2   R2
        ...
        ",
      )
    ]
  ],
  [
    #align(center)[
      #bluet[SPN结构]

      #v(0.5em)

      #raw(
        "
        Plaintext
           |
       Substitution
           |
       Permutation
           |
       Substitution
           |
       Permutation
           |
       Ciphertext
        ",
      )
    ]
  ],
)

#pause

#align(center)[
  #bluet[PX结构]
]


=== 结构改进方法(2)

#align(center)[
  #text(size: 18pt, fill: red)[
    2. 基于分组密码，对密码算法的结构或部件进行改进
  ]
]

#v(2em)

#grid(
  columns: 2,
  gutter: 40pt,
  [
    #align(center)[
      #text(size: 16pt, fill: blue)[QTL结构]
    ]
  ],
  [
    #align(center)[
      #text(size: 16pt, fill: blue)[ARX结构]
    ]
  ],
)


=== 应用场景设计


#align(center)[
  #text(size: 18pt, fill: red)[
    3. 针对特定应用场景或者需求进行设计的轻量级分组密码算法
  ]
]

#pause

#v(1em)

典型算法示例：

#pause

- #bluet[(1)] 面向软硬件灵活实现的LBlock算法
- #bluet[(2)] 专注低能耗指标设计的Midori算法
- #bluet[(3)] 基于低延迟理念设计的PRINCE算法
- #bluet[(4)] 面向IC打印的PRINTcipher算法

==== 3. 针对特定应用场景设计 - LBlock算法

#align(center)[
  #text(size: 16pt, fill: red)[
    (1) 面向软硬件灵活实现的LBlock算法
  ]
]

#pause

#grid(
  columns: 2,
  gutter: 20pt,
  [
    #align(center)[
      #text(size: 12pt)[LBlock算法加密流程图]

      #raw(
        "
        X0     X1
        |      |
        |   <<<8
        |      |
        F      |
        |      |
        X32   X33
        ",
      )
    ]
  ],
  [
    LBlock采用了#bluet[4位逐字排列]，使得算法不仅可以在硬件中廉价实现，而且可以在软件环境中廉价实现。

    #pause

    #text(size: 12pt)[
      - 硬件：需要1320GE，吞吐量200Kbps
      - 软件：8位微控制器，加密64位数据需要3955个时钟周期
      - 算法每一轮只使用一半数据，另一半使用简单移位
      - 密钥调度以流密码方式设计
    ]
  ],
)

==== 3. 针对特定应用场景设计 - Midori算法

#align(center)[
  #text(size: 16pt, fill: red)[
    (2) 专注低能耗指标设计的Midori算法
  ]
]

#pause

#grid(
  columns: 2,
  gutter: 20pt,
  [
    #text(size: 12pt)[
      (1) 列混淆使用4×4几乎MDS二进制矩阵，在面积和信号延迟方面比4×4 MDS矩阵更有效。

      #pause

      (2) 使用了一个轻量级、小延迟的4位S-box。该S盒中的信号延迟分别是PRINCE和PRESENT的1.5倍和2倍。

      #pause

      (3) 低轮数。

      #pause

      (4) Midori算法的加密和解密功能相互转换时，只需要通过在电路中的小调整就可以达到加解密一致。
    ]
  ],
  [
    #align(center)[
      #text(size: 12pt)[Midori算法加密流程图]

      #raw(
        "
        KA(WK)
           |
          SB
           |
          SC
           |
          MC
           |
        KA(RKi)
           |
          SB
           |
        KA(WK)

        15轮
        ",
      )
    ]
  ],
)

==== 3. 针对特定应用场景设计 - PRINCE算法

#align(center)[
  #text(size: 16pt, fill: red)[
    (3) 基于低延迟理念设计的PRINCE算法
  ]
]

#pause

#align(center)[
  #text(size: 12pt)[PRINCE算法加密流程图]
]

#pause

PRINCE算法低延迟主要的方式是#bluet[轮数尽可能地少]，轮函数中的部件尽量采用#bluet[低延迟]。

#pause

因此，PRINCE的轮数只有#redt[12轮]，还采用了一个#bluet[几乎MDS矩阵]，这样有助于为各种类型攻击提供更好边界，进而可以允许减少轮数，从而减少延迟。

#pause

除此之外，PRINCE的加密结构也很新颖，具有#redt[对合性]。


==== 3. 针对特定应用场景设计 - PRINTcipher算法

#align(center)[
  #text(size: 16pt, fill: red)[
    (4) 面向IC打印的PRINTcipher算法
  ]
]

#pause

由于IC打印中使用到的#bluet[电子产品代码（EPC）]的长度为96位，因此PRINTcipher使用的明文长度为#redt[48bit和96bit]两个版本，密钥长度为#redt[160bit]，两个版本分别对应的轮数为#redt[48，96轮]。

#pause

常规的IC为了节省开销，一般要求IC中的使用密钥不进行更改，因此，PRINTcipher算法的#bluet[没有密钥扩展部分]，设计者通过使用一种排列方法，使得算法可以根据不同的密钥具有不同的加密流程。

#pause

#align(center)[
  #text(size: 12pt)[PRINTcipher的S盒部分的排列方法]
]


== S盒构造方法(1)

=== 02 侧重低延迟或侧重轻量的S盒构造方法

目前，为了能快速优化4×4的S盒，研究人员主要采用#bluet[自动化的方法搜索S盒]，
具体可以细分为两个方向。

#pause

#align(center)[
  #text(size: 16pt, fill: red)[
    方向一：首先获得具有良好密码特性的S盒，然后通过某种方法优化S盒的硬件逻辑电路
  ]
]

#pause

#text(size: 12pt)[
  Jean等人应用#bluet[LIGHTER]搜索给定4×4 S盒的面积优化实现。但LIGHTER的一个缺失考虑因素是实现延迟的度量。Stoffelen将寻找最佳位片实现的整个问题建模为SAT求解器可以解决的问题。然而，与其他启发式方法相比，在处理一些"强"S盒时，效率并不令人满意。进一步的，Bao等人优化了搜索效率提出了一个名为#bluet[PEIGEN]的平台来评估安全性，为给定的S盒找到有效的软件/硬件实现。
]

==== 02 侧重低延迟或侧重轻量的S盒构造方法

#align(center)[
  #text(size: 16pt, fill: red)[
    方向二：首先从硬件逻辑层创建紧凑的S盒，然后检查其密码特性
  ]
]

#pause

#text(size: 12pt)[
  Watanabe等人使用对#bluet[基本可逆函数的迭代]来生成初始S盒集，然后将约束添加到初始S盒集中以获得目标S盒。

  #pause

  Guo等人提出了一种在#bluet[ASIC中寻找电路深度优化]的实现的方法。本质上，该工具首先给定S盒和每个单元操作的成本，作为初始S盒集。然后，输出查询结果和四个坐标的深度中的最大值。
]

==== 03 侧重低延迟和比特切片的线性矩阵构造方法

为了快速找到性能优良的矩阵，研究人员主要采用#bluet[启发式算法搜索矩阵]，
具体可以细分为三个方向。

#pause

#text(size: 14pt, fill: red)[方向一：] 首先搜索一个性能好的矩阵，然后再搜索该矩阵的良好硬件实现

#pause

#text(size: 14pt, fill: red)[方向二：] 首先从逻辑层搜索可行的矩阵构造，然后检查其矩阵分支数特性

#pause

#text(size: 14pt, fill: red)[方向三：] 首先确定轻量的小规格矩阵，然后通过递归、子域构造的方法构造性能良好的大规格矩阵


== 线性层构造详述(1)


#align(center)[
  #text(size: 16pt, fill: red)[
    首先搜索一个性能好的矩阵，然后再搜索该矩阵的良好硬件实现
  ]
]

#pause

#text(size: 12pt)[
  Guo、Peyrin等人提出了一种减少实现占用空间的方法是找到一个轻量级矩阵A，使A^k其满足MDS。A^k的实现可以通过递归"执行"A的实现k次来获得。从而通过低的资源实现矩阵。
]


== 线性层构造详述(2)


#align(center)[
  #text(size: 16pt, fill: red)[
    首先从逻辑层搜索可行的矩阵构造，然后检查其矩阵分支数特性
  ]
]

#pause

#text(size: 12pt)[
  Spook设计人员对潜在的矩阵实现进行搜索，直到获得具有良好分支数的LBox；Gaëtan Leurent等人通过考虑一次对3个或4个字进行操作的线性层来扩展Spook的构造。
]


== 线性层构造详述(3)

#align(center)[
  #text(size: 16pt, fill: red)[
    (1) 一种高扩散、低延迟的轻量级分组密码LTLBC的设计与实现
  ]
]

#pause

#grid(
  columns: 2,
  gutter: 20pt,
  [
    #text(size: 12pt)[
      • #bluet[线性层设计方案]：一方面采用类似GIFT中置换操作的设计方法，并进行扩展。另一方面，增加一个简单的基于字的对合映射，筛选得到一组综合效果最优的移位参数。

      #pause

      研究高效的#redt[比特置换层]

      #pause

      研究操作简单的#redt[对合映射]
    ]
  ],
  [
    #align(center)[
      #text(size: 10pt)[线性层结构示意图]

      #raw(
        "
        16  16  16  16
        |   |   |   |
        |   |   |   |
        64
        |
        64
        |   |   |   |
        16  16  16  16
        ",
      )
    ]
  ],
)


== LTLBC研究(4)

#align(center)[
  #text(size: 16pt, fill: red)[
    (1) 一种高扩散、低延迟的轻量级分组密码LTLBC的设计与实现
  ]
]

#pause

• #bluet[硬件架构]：算法的轮函数与密钥更新操作使得算法可以以基于轮的架构和基于全展开的架构高效实现。

#pause

#grid(
  columns: 2,
  gutter: 20pt,
  [
    #align(center)[
      #text(size: 12pt, fill: blue)[基于轮的实现架构]

      #raw(
        "
        Plaintext  Key
            |      |
            64     64
            |      |
        [0:63] [64:127]
            |      |
        Add_key    |
            |  <<<21
        Sub_cells  |
            |      |
        S-LM       |
            |      |
        Permutebits|
            |      |
            64    64
            |     |
        Ciphertext
        ",
      )
    ]
  ],
  [
    #align(center)[
      #text(size: 12pt, fill: blue)[基于全展开的实现架构]

      #raw(
        "
        128    128
         |      |
        64     64
         |      |
      Mux    Mux
       2:1    2:1
        |      |
      Reg_0  Reg_1
        |      |
      Add_con  |
        |      |
        RCi   456
         |     |
         S     4
        ",
      )
    ]
  ],
)


= 论文书写及投稿


== 论文书写以及投稿过程中的思考与分析


#align(center)[
  #text(size: 18pt)[
    #bluet[PART 01] 读论文

    #v(1em)

    #bluet[PART 02] 写论文

    #v(1em)

    #bluet[PART 03] 投论文
  ]
]


== 研究热点锁定

=== 01 读论文

#align(center)[
  #text(size: 16pt, fill: red)[
    如何在入门阶段快速锁定研究热点：
  ]
]

#pause

#bluet[步骤1] 看综述论文。
- 近一年的博士、硕士大论文综述部分。
- 近一年的高水平期刊收录的综述论文。

#pause

#bluet[步骤2] 看相关领域顶会顶刊收录的论文（近两年）。


=== 科学问题寻找

#align(center)[
  #text(size: 16pt, fill: red)[
    如何寻找科学问题：
  ]
]

#pause

(1) 在亲身研究和实践中，遇到的问题（#redt[主要方法]）。

#pause

(2) 通过读文献，察觉到前人未解决的问题或未意识到的问题。

#pause

(3) 借鉴"它山之石"，有了攻克悬而未决老问题的奇思妙想。


=== 论文阅读概述

#align(center)[
  #text(size: 16pt, fill: red)[
    好的创意来自于好的论文阅读。
  ]
]

#pause

#v(1em)

怎样寻找好论文以及阅读论文：

#pause

#grid(
  columns: 3,
  gutter: 20pt,
  [
    #align(center)[
      #bluet[下载相关论文集]
    ]
  ],
  [
    #align(center)[
      #bluet[三步阅读法]
    ]
  ],
  [
    #align(center)[
      #bluet[文献管理]
    ]
  ],
)


=== 论文集下载


主要下载近3年的文献，可以通过以下几种方式获得论文：

#pause

(1) 综述论文中的参考文献（入门时使用）。

#pause

(2) 熊猫学术或三大数据库搜索关键字。

#pause

下载论文可以使用：

#text(size: 12pt)[
  - (1) 熊猫学术（https://panda321.com/）
  - (2) SPIS学术下载（http://spis.hnlat.com/）
  - (3) 衡阳师范学院文献互助群（572761699）
]


== 三步阅读法(1)


#align(center)[
  #text(size: 16pt, fill: red)[
    第一步（粗读）
  ]
]

#pause

(1) 仔细阅读标题、摘要与引言。

#pause

(2) 细读每个章节与子章节的标题（忽略其他的内容）。

#pause

(3) 细读总结。

#pause

(4) 浏览参考文献，标记自己已经读过的。


== 三步阅读法(2)


第一步完成后对论文将会有如下认知，或者提出一些问题：

#pause

(1) #bluet[文章类别]：这篇文章是什么种类的？轻量级分组密码？分组密码？优化？密码分析？侧信道分析？

#pause

(2) #bluet[文章内容]：有哪些其他相关文章？文章中的问题分析是基于哪个理论？

#pause

(3) #bluet[正确性]：文中的假设或提出的理论是否合理正确？

#pause

(4) #bluet[贡献]：文章的主要贡献是什么？#bluet[清晰性]：文章的写作是否足够好？


== 三步阅读法(3)


#pause

(1) 细心阅读图、表

#pause

(2) 记得标记相关的未读的参考文献（这是一种非常好的了解论文背景的方法）

#pause

在第二步中，更细心地读文章，特别是背景，可忽略一些细节如理论的证明（可以作一些注释）。


== 三步阅读法(4)


完成第二步，论文中仍然会有许多你不理解的地方，比如一些细分领域的背景理解不够或是证明的理论或实验不能理解。这时可以：

#pause

(a) 把这篇论文先放边。

#pause

(b) 稍后再拿起来认真阅读，特别注意背景部分。

#pause

(c) 直接进入第三步。


== 三步阅读法(5)


#align(center)[
  #text(size: 16pt, fill: red)[
    第三步（实验复现）
  ]
]

#pause

为了完全地理解这篇文章，并能够在此基础上进行改进，需要做的最关键的步骤是对论文实验的重构，即#redt[站在作者的角度，重复他的工作]。


== 文献管理


每读一篇好论文，需要对其进行管理，这有两个好处，一是可以方便再调出来看，二是引用的时候非常方便。主要的管理方法：

#pause

(1) 建立自顶向下建立文件夹。大方向→小方向→好论文。论文的文件夹命名（年份+名字+期刊/会议）

#pause

(2) 画思维导图

#pause

(3) 文件管理软件（#bluet[Mendeley Desktop]，#bluet[JabRef]）


== 写论文概述


通过前面的论文阅读与文献收集管理，此时应该内心会产生一些想法和思路，先在理论上对自己提出的想法进行推论验证。然后开始设计实验，由于前期做了复现论文的准备，因此在实验上会相对比较顺利。


== 论文结构


在完成最初的想法构思或创新的方法后，在理论上对方法进行抽象，实验验证方法的正确性与优势，开始撰写论文。一般，实证型论文的结构包括：

#pause

#grid(
  columns: 2,
  gutter: 20pt,
  [
    (1) 题目

    (2) 引言

    (3) 方法

    (4) 实验结果和讨论
  ],
  [
    (5) 结论

    (6) 致谢

    (7) 参考文献
  ],
)

#pause

由于学科差异、研究内容差异以及期刊的不同要求，论文的主体部分也会有不同的形式，这里大家在阅读不同期刊的论文的时候要注意留意。


== 摘要五个语步


摘要部分通常涉及（或者说就是）五个语步：

#pause

#bluet[语步1]：概述研究现状或主要问题。

#pause

#bluet[语步2]：介绍本研究的内容和目的。

#pause

#bluet[语步3]：介绍研究方法。

#pause

#bluet[语步4]：指出主要研究发现和结果。

#pause

#bluet[语步5]：总述结论、研究价值、应用前景或建议。


== 引言三个语步


通常引言部分有三个语步：

#pause

#bluet[语步1]：介绍研究领域。突出研究话题的意义、价值和重要性，回顾相关文献。

#pause

#bluet[语步2]：确定研究动机。指出先前研究的不足或扩展现有知识。

#pause

#bluet[语步3]：描述当前研究。提出研究目的、研究性质或研究问题，或宣布重要的研究结果，明确研究的意义，概括全文的框架结构。


== 方法部分语步


方法部分一般如下：

#pause

#bluet[语步1]：介绍研究目的、研究问题或假设。

#pause

#bluet[语步2]：介绍研究步骤。

#pause

#bluet[语步3]：介绍数据分析方法。


== 结果讨论语步


实验结果和讨论部分一般如下：

#pause

#bluet[语步1]：提供背景信息。实验环境，实验参数设置。

#pause

#bluet[语步2]：以文本形式呈现研究结果，并进行讨论（一般使用对比法）

#pause

#bluet[语步3]：以非文本形式（如图、表等）呈现研究结果。


== 结论部分语步


结论部分通常是文章正文最后一节，说明研究的意义或应用前景。

#pause

#bluet[语步1]：概括当前的研究。回顾研究动机、目的、主要的研究结果。

#pause

#bluet[语步2]：评价研究结果的价值。

#pause

#bluet[语步3]：讨论研究的不足之处。指出研究存在的问题并给予解释。（这一步通常不写）

#pause

#bluet[语步4]：对研究做出推论，指出未来的研究启示及方向。


== 写作工具


写论文过程中一些非常有用的工具：

#pause

#bluet[文字处理]：word

#pause

#bluet[文字排版]：latex: TeX live + TeX studio、CTeX、Sublime等

#pause

#bluet[实验绘图]：matlab、python、Origin等

#pause

#bluet[结构绘图]：Visio、smartdraw、Adobe Illustrator等


== 投稿过程


论文初稿完成后，进行修改与优化，下一个步骤便是进行投稿，这一步骤涉及：

#pause

(1) #bluet[期刊选择]。

#text(size: 12pt)[
  借助LetPub网站查询期刊相关信息。（中科院分区，影响因子，年文章数，投稿周期，网友经验等）

  https://www.letpub.com.cn/

  期刊官网。了解期刊投稿范围和要求。
]

#pause

(2) 提交相关文档。


== 审稿返修


审稿与返修阶段主要涉及审稿意见解读、稿件修改、写response等，几轮之后，论文将被决定是否接受。

#pause

#align(center)[
  #text(size: 16pt, fill: red)[
    如何回复审稿人意见
  ]
]

#pause

#text(size: 12pt)[
  (1) 所有问题必须逐条回答。如果存在一段审稿意见多个问题，进行拆分回复。回复格式一般为：感谢+回复+附上手稿中的修改部分。

  (2) 尽量满足意见中需要补充的实验。

  (3) 满足不了的也不要回避，说明不能做的合理理由。

  (4) 审稿人推荐的文献一定要引用，并讨论透彻。

  (5) 回复审稿人关于稿件的修改一定要全部使用现在完成时，不要使用一般过去时。
]


== 审稿人意见(1)


主要的一些审稿人意见：

#pause

(1) 文章格式错误、拼写错误、图表标错、语句有歧义等等。

#pause

(2) 要求加文献。仔细阅读审稿人推荐的参考文献，在意见回复中要讨论透彻。

#pause

(3) 要求补充或修改手稿的内容。比如引言增加相关文献讨论，摘要或总结修改。

#pause

(4) 要求语法修改。

#pause

(5) 要求调整说法。

#pause

(6) 质疑内容的创新性。感谢审稿人的评论+阐述论文的创新点和优势，适当引用顶会顶刊的论文做依据。


== 审稿人意见(2)


主要的一些审稿人意见（续）：

#pause

(7) #bluet[建议补充实验]。

#pause

#text(size: 12pt)[
  • #redt[做这个实验]。同意审稿人的观点+新的实验数据。

  #pause

  • #redt[没有实验条件]，或者不能在短时期内做这个实验。看看现有数据能不能同样说明科学问题，也可以补充其他相关实验数据辅助说明，实在不行，可以查阅文献（最好是顶会或顶刊），告诉审稿人其他文献也存在同样的情况。

  #pause

  • #redt[觉得没有必要补实验]。这个时候需要给出自己的理由。最好罗列一些证据，或者引用其它文献（最好是顶会或顶刊）来支撑自己的观点。
]


== 致谢

#align(center)[
  #text(size: 32pt, fill: red)[
    THANKS
  ]

  #v(2em)

  #text(size: 18pt)[
    祝各位早日发自己的SCI论文！
  ]
]

