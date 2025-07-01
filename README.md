# 我的个人博客

基于 Hexo + Vercel 的高性能个人博客，专注于快速加载和优质内容。

## 🚀 特性

- ⚡ **极速加载**：多种性能优化，首屏加载 < 2秒
- 📱 **响应式设计**：完美适配各种设备
- 🖼️ **图片懒加载**：节省流量，提升体验
- 🔍 **SEO优化**：搜索引擎友好
- 📝 **Markdown支持**：便捷的写作体验
- 🌐 **全球CDN**：Vercel提供的全球加速

## 🛠️ 技术栈

- **Hexo 7.3.0** - 静态博客生成器
- **Vercel** - 部署和CDN
- **GitHub** - 代码托管和版本控制

## 📦 性能优化插件

- `hexo-filter-optimize` - 资源压缩优化
- `hexo-lazyload-image` - 图片懒加载
- `hexo-generator-sitemap` - 网站地图生成
- `hexo-generator-feed` - RSS订阅支持

## 🚀 快速部署到Vercel

### 1. 推送到GitHub

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/yourusername/your-blog.git
git push -u origin main
```

### 2. 连接Vercel

1. 访问 [Vercel](https://vercel.com)
2. 使用GitHub账号登录
3. 点击 "New Project"
4. 选择您的博客仓库
5. 保持默认设置，点击 "Deploy"

### 3. 自定义域名（可选）

1. 在Vercel项目设置中添加自定义域名
2. 按照提示配置DNS记录
3. 等待SSL证书自动生成

## 📝 本地开发

```bash
# 安装依赖
npm install

# 本地预览
npm run server

# 清理缓存
npm run clean

# 生成静态文件
npm run build
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
tags: [标签1, 标签2]
categories: [分类]
description: 文章描述
---
```

### 图片使用

1. 将图片放在 `source/images/` 目录
2. 在文章中使用相对路径：`![描述](/images/image.jpg)`
3. 自动启用懒加载优化

## 🎨 主题自定义

当前使用 Landscape 主题，您可以：

1. 修改 `_config.landscape.yml` 自定义主题
2. 或安装其他主题：`npm install hexo-theme-theme-name`

## 📊 性能监控

建议使用以下工具监控网站性能：

- **Google PageSpeed Insights** - 性能评分
- **GTmetrix** - 详细性能分析
- **Vercel Analytics** - 访问统计

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License

---

⭐ 如果这个项目对您有帮助，请给个Star！
