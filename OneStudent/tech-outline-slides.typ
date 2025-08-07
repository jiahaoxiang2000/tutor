#import "@preview/touying:0.6.1": *
#import themes.simple: *
#import "@preview/cetz:0.3.2"
#import "@preview/fletcher:0.5.5" as fletcher: edge, node
#import "@preview/numbly:0.1.0": numbly
#import "@preview/theorion:0.3.2": *
#import cosmos.clouds: *
#show: show-theorion

// Set Chinese fonts for the presentation
#set text(
  font: (
    "Noto Serif CJK SC", // Alternative Chinese serif font
  ),
  lang: "zh",
  region: "cn",
)

// Color shorthand functions
#let redt(content) = text(fill: red, content)
#let bluet(content) = text(fill: blue, content)
#let greent(content) = text(fill: green, content)

// Additional font customization
#show heading: set text(font: "Noto Sans CJK SC", weight: "bold")
#show raw: set text(font: "Noto Sans Mono CJK SC")

#show: simple-theme.with(aspect-ratio: "16-9", footer: [私有云服务器密码机项目])

#title-slide[
  = 私有云服务器密码机
  #v(2em)

  向嘉豪

  #v(1em)
  一生一系统项目

  #v(2em)
  #datetime.today().display()
]

= 教学目标


== 能力培养目标

四个方面的能力培养：


1. *技术基础*：加强对加密技术基础知识的掌握和理解

#pause

2. *设计能力*：培养设计思维和逻辑思考能力

#pause

3. *协作能力*：增强团队合作与沟通能力

#pause

4. *安全意识*：提高对信息安全的重视和意识

== 预期成果

- 完成发明专利申请
- 获得软件著作权
- 参加互联网+、挑战杯等竞赛并获奖

= 课程内容

== 什么是密码机？

*密码机*是运用密码对信息实施加（解）密处理和认证的专用设备

*工作原理*：
- 加密过程：明文→密码运算→密文
- 传输过程：密文在公开信道传输
- 解密过程：密文→密码逆变换→明文

#pagebreak()

*现代密码机分类*：
- 通用型服务器密码机（我们的研究重点）
- 签名验签服务器
- 金融数据密码机

== 项目目标

*核心目标*：编程HSM(Hardware Security Module)模块，将其作为服务器开放，让其他计算机通过网络使用密码服务

#pause

*系统架构*：
- 客户端远程调用
- 网络层（HTTP/HTTPS）RESTful API
- 应用层（密码服务程序）
- HSM层（硬件安全模块）


== 第一阶段：密码学基础（2-3个月）

*核心密码算法实现*：
- AES加密算法：对称加密的核心
- RSA算法：非对称加密
- SHA算法：消息摘要

#pause

*实践项目*：用C语言实现基础的AES加解密程序


== 第二阶段：HSM编程技术（3-4个月）


*核心技术栈*：
- PKCS#11标准：HSM设备的标准编程接口
- C语言：HSM驱动程序开发
- Linux系统编程：设备驱动和系统调用
- OpenSSL Engine：集成HSM到OpenSSL框架

#pagebreak()

*学习重点*：
- PKCS#11 API调用HSM加密功能
- 密钥管理：生成、存储、使用密钥
- 硬件抽象：理解HSM硬件特性和限制
- 性能优化：充分利用HSM并发处理能力

#pause

*实践工具*：
- SoftHSM项目：软件模拟HSM用于开发测试
- OpenSC项目：开源HSM支持库

== 第三阶段：网络服务开发（2-3个月）

*Linux服务器编程*：
- Socket网络编程：TCP/UDP通信
- Linux系统服务：systemd服务管理
- 网络安全：TLS/SSL加密通信
- RESTful API：设计密码服务接口

#pause

*实践项目*：
- 开发HSM网络代理服务器
- 实现密码服务的RESTful API
- 编写客户端SDK

== 主要参考资料

*基础理论*：
- 《密码工程学》
- 《轻量级分组密码》
- PKCS#11官方文档

#pause

*技术实践*：
- 阿里云PKCS#11中文API文档
- SoftHSM项目：软件模拟HSM
- Linux网络编程第3版

== 应用场景与产业案例

*核心应用场景*：
- 电子商务和Web3应用：数据加密保护
- 金融服务：金融数据密码机(EVSM)和通用服务器密码机(GVSM)

#pause

*主流厂商方案*：
- 腾讯云：云加密机服务
- 阿里云：KMS密钥管理服务结合CloudHSM
- AWS：CloudHSM专用硬件安全模块

= 注意事项

== 要求

项目模式：

- 周四下午2点前，发送学习周报于指导学长邮箱
- 周五晚8点开始腾讯会议，汇报学习进度
- 3-4人小组，分工合作

#redt[注意:]

- 周报和汇报，计入课程成绩，#redt[超过三次无故缺席，课程不及格]

== 问答环节

#v(3em)
#align(center)[
  *欢迎提问和讨论*

  #v(2em)

  联系方式：`simple.xjh@qq.com`
]
