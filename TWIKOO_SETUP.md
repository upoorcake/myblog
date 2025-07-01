# Twikoo评论系统部署指南

## 什么是Twikoo？
Twikoo是一个简洁、安全、免费的静态网站评论系统，支持匿名评论，无需注册即可参与讨论。

## 主要特色
- 🎭 **完全匿名**：用户无需填写昵称和邮箱即可评论
- 🚀 **加载迅速**：轻量级设计，加载速度极快
- 📱 **移动友好**：完美适配移动设备
- 🛡️ **垃圾过滤**：内置垃圾评论过滤机制
- 🔔 **邮件通知**：支持评论回复邮件通知（可选）

## 免费部署方案

### 方案一：Vercel部署（推荐）

1. **访问Vercel**
   - 前往 [vercel.com](https://vercel.com)
   - 使用GitHub账号登录

2. **部署Twikoo**
   ```bash
   # 克隆Twikoo仓库
   git clone https://github.com/imaegoo/twikoo.git
   cd twikoo
   
   # 在Vercel中新建项目，选择这个仓库
   # 或者直接使用一键部署：
   ```
   
3. **配置环境变量**
   在Vercel项目设置中添加：
   ```
   TWIKOO_ENV_ID=your-environment-id
   ```

4. **获取部署地址**
   部署完成后，获得类似 `https://your-twikoo.vercel.app` 的地址

### 方案二：腾讯云CloudBase

1. 注册腾讯云账号并开通CloudBase
2. 创建环境，选择按量计费
3. 在环境中部署Twikoo云函数
4. 获得环境ID用于配置

## 博客配置

在 `_config.butterfly.yml` 中配置：

```yaml
comments:
  use: Twikoo

twikoo:
  envId: https://your-twikoo.vercel.app  # 你的Twikoo部署地址
  region: 
  visitor: true
  option:
    anonymousName: '匿名用户'
    anonymous: true
    avatar: 'mp'
    requiredFields: []
    placeholder:
      nickname: '昵称 (可选)'
      mail: '邮箱 (可选)'  
      link: '网站 (可选)'
      comment: '说点什么吧... ✨'
```

## 匿名评论配置说明

- `anonymousName`: 匿名用户的默认昵称
- `anonymous: true`: 允许匿名评论
- `requiredFields: []`: 不强制要求任何字段
- `avatar: 'mp'`: 使用Monster头像（随机生成）

## 常见问题

### Q: 如何完全隐藏昵称和邮箱输入框？
A: 可以通过CSS隐藏输入框：
```css
.tk-input[name="nick"], 
.tk-input[name="mail"] {
  display: none !important;
}
```

### Q: 评论数据存储在哪里？
A: 
- Vercel方案：数据存储在云端数据库
- CloudBase方案：存储在腾讯云数据库

### Q: 如何备份评论数据？
A: Twikoo提供数据导出功能，可在管理面板中操作

### Q: 是否支持多级回复？
A: 支持，用户可以回复特定评论形成讨论串

## 性能优化建议

1. **启用CDN**：使用CDN加速Twikoo资源加载
2. **懒加载**：在主题中启用评论懒加载
3. **预加载**：可选择性预加载评论数据

## 管理和维护

- **管理员登录**：通过特定链接访问管理界面
- **评论审核**：可设置评论需要审核后显示
- **垃圾过滤**：自动过滤垃圾评论
- **数据统计**：查看评论数量和活跃度

---

这样配置后，用户可以完全匿名评论，系统会自动生成随机昵称和头像，为用户提供无负担的评论体验！
