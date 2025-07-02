# 这烦躁的秋天飘在我的头上 ✨

基于 Hexo + Butterfly 主题的个人博客，专注于CV、C4D科研绘图和生活分享。

🌐 **在线访问**: [https://upoorcake.cn](https://upoorcake.cn)

## 🚀 特性

- 🎨 **Butterfly主题**：美观现代的设计风格
- 📱 **响应式设计**：完美适配各种设备
- 💬 **Valine评论系统**：支持匿名评论，无需注册
- 🖼️ **图片懒加载**：优化加载性能
- 🔍 **本地搜索**：快速检索文章内容
- 🌙 **深色模式**：护眼体验
- 📝 **Markdown支持**：便捷的写作体验
- � **SEO优化**：搜索引擎友好

## 🛠️ 技术栈

- **Hexo 5.3.5** - 静态博客生成器
- **Butterfly主题** - 美观的博客主题
- **Netlify** - 静态网站托管和CDN
- **GitHub** - 代码托管和版本控制
- **LeanCloud** - 评论系统后端服务

## 📦 功能插件

- `hexo-theme-butterfly` - 主题支持
- `hexo-generator-search` - 本地搜索功能
- `hexo-generator-sitemap` - 网站地图生成
- `hexo-generator-feed` - RSS订阅支持
- `hexo-wordcount` - 文章字数统计
- `hexo-filter-optimize` - 资源压缩优化

## 🚀 部署到Netlify

### 1. 推送到GitHub

```bash
git add .
git commit -m "更新博客内容"
git push origin master
```

### 2. Netlify自动部署

博客已配置Netlify自动部署：
1. 代码推送到GitHub后自动触发构建
2. 构建命令：`hexo generate`
3. 发布目录：`public`
4. 自动绑定域名：`upoorcake.cn`

## 📄 主要页面

- 🏠 **首页**: 最新文章展示
- 📝 **归档**: 按时间浏览所有文章
- 🏷️ **标签**: 按标签分类浏览
- 📁 **分类**: 按分类浏览文章
- 💬 **留言板**: 访客留言互动
- ❤️ **关于**: 个人介绍页面

## 📝 本地开发

```bash
# 安装依赖
npm install

# 清理缓存
hexo clean

# 生成静态文件
hexo generate

# 本地预览
hexo server
# 访问 http://localhost:4000
```

## ✍️ 写作指南

### 创建新文章

```bash
hexo new post "文章标题"
```

### 文章头部格式

```yaml
---
title: 文章标题
date: 2025-07-01 10:00:00
tags: [CV, C4D, 技术]
categories: [技术分享]
description: 文章描述
cover: /img/cover.jpg  # 可选：文章封面
---
```

### 图片使用

1. 将图片放在 `source/img/` 目录
2. 在文章中使用：`![描述](/img/image.jpg)`
3. 支持多种格式：jpg, png, gif等

## 🎨 主题配置

### Butterfly主题特色
- **多种布局模式**：支持多种文章列表布局
- **丰富的组件**：标签云、归档时间轴、分类统计等
- **自定义配置**：颜色主题、字体、背景等
- **代码高亮**：支持多种代码高亮主题

### 主要配置文件
- `_config.yml` - Hexo主配置
- `_config.butterfly.yml` - 主题配置

## � 评论系统

使用Valine评论系统，特点：
- ✅ **无需注册**：访客可直接评论
- ✅ **匿名友好**：昵称可选，自动生成
- ✅ **简洁美观**：界面简约，体验流畅
- ✅ **实时通知**：支持邮件通知（可选）

## 📊 内容分类

- **技术分享**：CV、机器学习相关
- **科研绘图**：C4D制图技巧和经验
- **生活随笔**：个人感悟和日常分享
- **学习笔记**：各种学习心得

## 🤝 贡献与反馈

欢迎通过以下方式参与：
- 🐛 **问题反馈**：提交Issue报告Bug
- 💡 **功能建议**：分享您的创意想法
- 💬 **留言互动**：在博客留言板分享观点

## 📞 联系方式

- 📧 **邮箱**: athenass_u@foxmail.com
- 🐙 **GitHub**: [@upoorcake](https://github.com/upoorcake)
- 🌐 **博客**: [https://upoorcake.cn](https://upoorcake.cn)

## 📄 许可证

本项目采用 MIT License 开源协议。

## 🙏 致谢

- [Hexo](https://hexo.io/) - 优秀的静态博客框架
- [Butterfly](https://butterfly.js.org/) - 美观的Hexo主题
- [Netlify](https://www.netlify.com/) - 稳定的静态网站托管
- [LeanCloud](https://www.leancloud.cn/) - 评论系统后端支持

---

💝 **"守候是我一生的追逐"** - 感谢每一位访客的陪伴！

⭐ 如果喜欢这个博客，欢迎给个Star支持！
