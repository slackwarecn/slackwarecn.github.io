title: SlackBuild 管理机制已经变更
date: 2016-08-06 17:53:08
categories: [ 社区信息发布 ]
tags: [ SlackBuild ]

---

社区的 SlackBuild 的管理方式已经较之前有了变化，现在 SlackBuild 由一个单独的 GitHub 组织[slackwarecn-slackbuilds](https://github.com/slackwarecn-slackbuilds) 存放，而不再与其他项目仓库混合放置。

在 SlackBuild 进行了整体的迁移之后，我们新增了一个项目[repo](https://github.com/slackwarecn/repo) 用来以子模组的方式呈现这些 SlackBuilds。这种管理方式相较之前更加清晰，在 SlackBuild 增多的情况下不易带来混乱，同时也为我们带来了一个简单的审查制度，这使得控制 SlackBuild 的质量初步可行。

为了减轻 SlackBuild 脚本本身的混乱状况，我们新增了项目[slackbuild-guidelines](https://github.com/slackwarecn/slackbuild-guidelines)，用来表达我们对 SlackBuild 的编写要求和期望。为了方便 SlackBuild 的编写，在这个项目中我们修改了来自[SlackBuild.org](https://slackbuilds.org/) 的模板，以便能够方便的使用于社区之中。你可以在[这里](https://github.com/slackwarecn/slackbuild-guidelines/tree/master/templates)找到这些模板并方便地使用它们。

以上就是这次管理机制的主要变更，从着手工作到初步切换到新的管理方式大约花了一周的时间。从效果来看这项工作是值得的，它为社区带来一套相对清晰和有效的 SlackBuild 管理机制。

祝你愉快！

The Slackware Linux CN Community
