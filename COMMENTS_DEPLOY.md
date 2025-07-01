# 🚀 评论系统部署指南 - 三种方案

由于评论系统需要外部服务支持，本地开发环境中可能无法正常显示。以下是三种快速部署方案：

## 🌟 方案一：Giscus（推荐 - 完全免费）

**优势**：基于GitHub Discussions，无需额外服务器，完全免费

### 步骤：
1. **准备GitHub仓库**
   - 确保仓库是公开的
   - 启用Discussions功能（Settings > Features > Discussions）

2. **获取配置信息**
   - 访问 [giscus.app](https://giscus.app)
   - 输入仓库地址
   - 选择Discussion分类
   - 复制生成的配置代码

3. **更新配置**
   ```yaml
   comments:
     use: Giscus
   
   giscus:
     repo: 你的用户名/仓库名
     repo_id: 生成的仓库ID
     category_id: 生成的分类ID
     light_theme: light
     dark_theme: dark
   ```

## 💡 方案二：Valine（快速上手）

**优势**：配置简单，支持匿名评论

### 步骤：
1. **注册LeanCloud**
   - 访问 [leancloud.cn](https://leancloud.cn)
   - 免费注册并创建应用

2. **获取密钥**
   - 复制App ID和App Key

3. **更新配置**
   ```yaml
   comments:
     use: Valine
   
   valine:
     appId: 你的App ID
     appKey: 你的App Key
     avatar: mp
     option:
       placeholder: '欢迎留言~ 昵称和邮箱都是可选的 ✨'
       requiredFields: []
       meta: ['nick']
   ```

## 🔧 方案三：Twikoo（功能最丰富）

**优势**：功能强大，支持完全匿名

### 步骤：
1. **Vercel一键部署**
   ```bash
   # 克隆仓库并部署到Vercel
   git clone https://github.com/imaegoo/twikoo-vercel.git
   # 在Vercel中导入项目
   ```

2. **更新配置**
   ```yaml
   comments:
     use: Twikoo
   
   twikoo:
     envId: https://你的twikoo.vercel.app
     option:
       anonymousName: '匿名用户'
       anonymous: true
   ```

## 🛠️ 临时解决方案

如果暂时不想配置评论系统，可以：

1. **保持当前配置**
   ```yaml
   comments:
     use:  # 留空，暂时禁用评论
   ```

2. **添加联系方式**
   - 在页面中添加邮箱、社交媒体链接
   - 或使用第三方表单服务（如金数据、腾讯问卷）

## 📋 部署检查清单

- [ ] 选择评论系统方案
- [ ] 注册对应的服务（LeanCloud/GitHub等）
- [ ] 获取配置信息（ID、密钥等）
- [ ] 更新 `_config.butterfly.yml` 配置
- [ ] 重新构建和部署网站
- [ ] 测试评论功能

## 🔍 故障排除

### 评论框不显示
1. 检查配置格式是否正确
2. 确认服务状态正常
3. 查看浏览器控制台错误信息
4. 检查网络连接和CDN加载

### 评论无法提交
1. 验证服务密钥是否正确
2. 检查域名安全设置
3. 确认服务配额未超限

---

**推荐顺序**：Giscus > Valine > Twikoo

选择最适合您的方案，所有方案都支持匿名或半匿名评论！
