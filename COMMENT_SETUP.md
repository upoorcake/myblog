# Waline评论系统部署指南

您的博客已经配置了Waline评论系统！以下是完整的部署步骤：

## 🚀 快速部署到Vercel

### 步骤1：准备工作
1. 注册 [Vercel](https://vercel.com) 账号（推荐使用GitHub登录）
2. 准备一个GitHub账号

### 步骤2：一键部署Waline
1. 点击下方按钮一键部署：

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fwalinejs%2Fwaline%2Ftree%2Fmain%2Fexample)

2. 登录Vercel并授权GitHub
3. 创建新的仓库名称（如：waline-comment）
4. 点击 "Deploy" 开始部署

### 步骤3：配置环境变量
部署完成后，在Vercel项目设置中添加环境变量：

```bash
# 必需配置
LEAN_ID=your_lean_id
LEAN_KEY=your_lean_key
LEAN_MASTER_KEY=your_lean_master_key

# 可选配置
SITE_NAME=这烦躁的秋天飘在我的头上
SITE_URL=https://your-blog.vercel.app
AUTHOR_EMAIL=your-email@example.com
```

### 步骤4：获取LeanCloud配置
1. 注册 [LeanCloud](https://console.leancloud.cn/) 账号
2. 创建新应用（开发版免费）
3. 进入设置 → 应用凭证，获取：
   - App ID (LEAN_ID)
   - App Key (LEAN_KEY)
   - Master Key (LEAN_MASTER_KEY)

### 步骤5：更新博客配置
将您的Waline服务器地址更新到 `_config.butterfly.yml`：

```yaml
waline:
  serverURL: https://your-waline-project.vercel.app
```

## 📝 使用说明

### 评论功能特性
- ✅ **多种登录方式**：支持匿名、邮箱等
- ✅ **Markdown支持**：丰富的文本格式
- ✅ **表情包**：内置各种可爱表情
- ✅ **邮件通知**：评论回复邮件提醒
- ✅ **管理后台**：评论管理和垃圾过滤
- ✅ **访问统计**：页面浏览量统计

### 管理后台
访问 `https://your-waline-server.vercel.app/ui` 进行评论管理

默认管理员是第一个评论的用户，建议先在自己博客评论建立管理员账号。

## 🔄 其他评论系统选择

如果您不想使用Waline，也可以选择其他评论系统：

### 1. Giscus (基于GitHub Discussions)
```yaml
comments:
  use: Giscus

giscus:
  repo: yourusername/your-blog
  repo_id: your_repo_id
  category_id: your_category_id
```

**优点**：完全免费，基于GitHub，无需单独部署
**缺点**：需要GitHub账号才能评论

### 2. Utterances (基于GitHub Issues)
```yaml
comments:
  use: Utterances

utterances:
  repo: yourusername/your-blog
  issue_term: pathname
```

**优点**：轻量级，基于GitHub Issues
**缺点**：需要GitHub账号才能评论

### 3. Artalk (自托管)
```yaml
comments:
  use: Artalk

artalk:
  server: https://your-artalk-server.com
  site: your-site-name
```

**优点**：功能丰富，完全自主控制
**缺点**：需要自己搭建服务器

## 💡 推荐配置

对于个人博客，推荐使用 **Waline** 的原因：

1. **免费易用**：Vercel + LeanCloud 免费额度足够个人使用
2. **功能完整**：支持邮件通知、管理后台、访问统计
3. **用户友好**：支持匿名评论，降低参与门槛
4. **中文优化**：专为中文用户设计，支持本土化服务

## 📞 技术支持

如果在配置过程中遇到问题：

- 📖 [Waline官方文档](https://waline.js.org/)
- 💬 [GitHub讨论区](https://github.com/walinejs/waline/discussions)
- 📧 博客留言板寻求帮助

---

配置完成后，您的博客就拥有了完整的评论功能！🎉
