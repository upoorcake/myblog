# Twikoo 评论系统配置指南

## 🎯 为什么选择 Twikoo？

- ✅ **完全匿名** - 无需注册、无需登录
- ✅ **国内稳定** - 使用 MongoDB Atlas 国内节点  
- ✅ **免费方案** - MongoDB Atlas 免费 512MB 存储
- ✅ **简单配置** - 一次部署，长期使用
- ✅ **美观现代** - 支持 Markdown、表情、回复

## 🚀 快速部署（10分钟完成）

### 步骤1：一键部署 Twikoo 到 Vercel

1. 点击一键部署：
   [![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/git/external?repository-url=https%3A%2F%2Fgithub.com%2Fimaegoo%2Ftwikoo%2Ftree%2Fmain%2Fsrc%2Fvercel)

2. 在 Vercel 页面：
   - 选择 GitHub 登录
   - 项目名设为：`twikoo-comments`
   - 点击 `Deploy`

3. 部署完成后，获得地址：`https://你的项目名.vercel.app`

### 步骤2：创建免费 MongoDB 数据库

1. 访问 [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. 注册账号（或用 Google 账号登录）
3. 选择免费计划（M0 Sandbox）
4. 选择地区：`Asia Pacific (Hong Kong)` 或 `Asia Pacific (Singapore)`
5. 创建集群

### 步骤3：配置数据库连接

1. 在 MongoDB Atlas：
   - 点击 `Database Access`
   - 创建数据库用户（记住用户名和密码）
   - 点击 `Network Access`
   - 添加 IP 地址：`0.0.0.0/0`（允许所有 IP）

2. 获取连接字符串：
   - 点击 `Connect`
   - 选择 `Connect your application`
   - 复制连接字符串，格式类似：
     `mongodb+srv://用户名:密码@cluster0.xxxxx.mongodb.net/myFirstDatabase?retryWrites=true&w=majority`

### 步骤4：配置环境变量

1. 回到 Vercel 项目：
   - 进入 `Settings` > `Environment Variables`
   - 添加变量：
     - `MONGODB_URI`: `你的MongoDB连接字符串`
     - `TWIKOO_SITE_URL`: `https://upoorcake.cn`（你的博客地址）

2. 在 Vercel 重新部署：
   - 进入 `Deployments`
   - 点击最新部署右侧的 `...`
   - 选择 `Redeploy`

### 步骤5：更新博客配置

1. 修改 `_config.butterfly.yml` 中的 Twikoo 配置：
   ```yaml
   twikoo:
     envId: https://你的项目名.vercel.app
   ```

2. 重新生成并部署博客：
   ```bash
   hexo clean
   hexo g
   git add .
   git commit -m "配置 Twikoo 评论系统"
   git push
   ```

## 🎨 功能特点

- **匿名评论**：无需注册，直接输入昵称即可评论
- **Markdown 支持**：支持代码高亮、链接、图片等
- **表情包**：丰富的表情选择
- **邮件通知**：新评论自动邮件提醒
- **后台管理**：访问 `https://你的项目名.vercel.app` 进行管理
- **反垃圾**：内置反垃圾机制和关键词过滤

## 🔧 高级配置

### 邮件通知配置

在 Vercel 环境变量中添加：
```
SMTP_SERVICE=QQ        # 邮件服务商
SMTP_USER=你的QQ邮箱    # 发件邮箱
SMTP_PASS=你的授权码    # 邮箱授权码
SITE_NAME=穷蛋糕的小站  # 网站名称
SITE_URL=https://upoorcake.cn
BLOGGER_EMAIL=你的邮箱  # 博主邮箱
```

### 自定义样式

在博客中添加自定义 CSS：
```css
/* Twikoo 样式优化 */
.twikoo {
  max-width: 100%;
}
.twikoo .tk-submit {
  background: linear-gradient(45deg, #667eea 0%, #764ba2 100%);
}
```

## 📞 技术支持

- [Twikoo 官方文档](https://twikoo.js.org/)
- [GitHub Issues](https://github.com/imaegoo/twikoo/issues)
- 部署遇到问题可随时询问

## ⚠️ 注意事项

1. **MongoDB 免费额度**：512MB 存储，足够数万条评论
2. **Vercel 限制**：每月 100GB 流量，对个人博客完全够用
3. **备份重要**：定期导出评论数据备份
4. **域名绑定**：可以在 Vercel 绑定自定义域名

---

**配置完成后，您的博客将拥有一个完全匿名、美观、稳定的评论系统！**

---

这样配置后，用户可以完全匿名评论，系统会自动生成随机昵称和头像，为用户提供无负担的评论体验！
