# 评论系统配置指南

## 🎯 推荐方案对比

### 方案一：Waline（推荐）⭐
**优点：**
- ✅ 支持匿名评论，无需注册
- ✅ 自动昵称生成
- ✅ 国内访问稳定
- ✅ 支持表情、图片、Markdown
- ✅ 后台管理功能强大

**部署步骤：**
1. **一键部署到Vercel**
   - 访问：https://vercel.com/new/clone?repository-url=https://github.com/walinejs/waline
   - 使用GitHub登录
   - 点击"Create"部署

2. **配置环境变量**（在Vercel项目设置中）
   ```
   LEAN_ID=HRHpAOI2HZg7L97HEeaOmTzr-MdYXbMMI
   LEAN_KEY=4lzc97Bv2aaFyW7wMeZ3zVRc
   LEAN_MASTER_KEY=您的LeanCloud MasterKey
   ```

3. **更新博客配置**
   ```yaml
   # 将serverURL替换为您的Vercel地址
   serverURL: https://your-waline.vercel.app
   ```

### 方案二：Giscus（GitHub讨论）
**优点：**
- ✅ 完全免费
- ✅ 基于GitHub讨论功能
- ✅ 支持反应表情
- ✅ 无需额外服务器

**设置步骤：**
1. **启用GitHub讨论**
   - 进入仓库：https://github.com/upoorcake/myblog
   - Settings → General → Features → 勾选"Discussions"

2. **获取配置信息**
   - 访问：https://giscus.app/zh-CN
   - 输入仓库：upoorcake/myblog
   - 选择页面⟷讨论映射方式：pathname
   - 选择讨论分类：General
   - 复制生成的配置代码

## 🔧 当前状态

- ✅ 已将评论系统从Valine切换到Waline
- ⏳ 需要您完成Waline服务器部署
- ⏳ 更新配置中的serverURL

## 📝 推荐操作

**最简单的方案：使用Waline**
1. 访问 https://vercel.com/new/clone?repository-url=https://github.com/walinejs/waline
2. 一键部署
3. 获得服务器地址后，更新博客配置
4. 重新部署博客

您想选择哪个方案？我可以提供详细的步骤指导！
