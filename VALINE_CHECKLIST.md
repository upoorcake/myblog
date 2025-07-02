# Valine 评论系统配置检查清单

## 🎯 当前状态
✅ 已清理配置文件，只保留 Valine 评论系统
✅ 已禁用 Waline、Twikoo、Giscus 等其他评论系统
✅ Valine 配置已优化为完全匿名、无门槛体验

## 📋 配置检查清单

### 1. _config.butterfly.yml 配置
```yaml
comments:
  use: Valine  # ✅ 已设置为仅使用 Valine

valine:
  appId: HRHpAOI2HZg7L97HEeaOmTzr-MdYXbMMI  # ✅ 您的 LeanCloud AppID
  appKey: 4lzc97Bv2aaFyW7wMeZ3zVRc  # ✅ 您的 LeanCloud AppKey
  serverURLs: https://hrhpaoi2.api.lncldglobal.com  # ✅ 国际版 API 地址
  option:
    placeholder: '说点什么吧~ 完全匿名，随意留言 ✨'
    requiredFields: []  # ✅ 完全匿名，无必填字段
    meta: []  # ✅ 隐藏昵称和邮箱输入框
    recordIP: false  # ✅ 不记录IP地址
```

### 2. LeanCloud 控制台检查
请在 LeanCloud 国际版控制台确认：

1. **应用信息**
   - [ ] AppID: `HRHpAOI2HZg7L97HEeaOmTzr-MdYXbMMI`
   - [ ] AppKey: `4lzc97Bv2aaFyW7wMeZ3zVRc`
   - [ ] API 地址: `https://hrhpaoi2.api.lncldglobal.com`

2. **Web 安全域名设置**
   - [ ] `https://upoorcake.cn`
   - [ ] `https://upoorcake.netlify.app`
   - [ ] `http://localhost:4000` (本地测试)

3. **服务设置**
   - [ ] 数据存储服务已启用
   - [ ] Comment 数据表已创建或自动创建

## 🔧 故障排除

### 如果评论区不显示：
1. 检查浏览器控制台是否有 JavaScript 错误
2. 确认网络连接正常（能访问 LeanCloud 国际版）
3. 清除浏览器缓存和 Cookies

### 如果出现 CORS 错误：
1. 确认 LeanCloud 安全域名设置包含当前访问的域名
2. 检查域名拼写是否正确（注意 http/https 协议）

### 如果出现 401 错误：
1. 确认 AppID 和 AppKey 正确
2. 确认使用的是国际版 API 地址

## 📊 测试步骤

1. **本地测试**
   ```bash
   hexo clean && hexo g && hexo s
   ```
   访问 `http://localhost:4000` 任意文章页面

2. **生产环境测试**
   ```bash
   hexo clean && hexo g && hexo d
   ```
   访问 `https://upoorcake.cn` 任意文章页面

3. **匿名评论测试**
   - 直接在评论框输入内容
   - 点击提交，无需填写昵称/邮箱
   - 评论应立即显示

## ⚡ 优势确认
- ✅ 真正匿名：无需注册/登录
- ✅ 国内可用：LeanCloud 国际版稳定访问
- ✅ 界面美观：与 Butterfly 主题完美融合
- ✅ 极简体验：一键提交评论
- ✅ 隐私友好：不记录 IP 地址

## 🚨 注意事项
1. LeanCloud 国际版免费额度：每天 3万次 API 调用
2. 如评论量大，建议升级为商用版本
3. 定期备份评论数据（LeanCloud 控制台可导出）
4. 考虑启用垃圾评论过滤（如需要）

## 📞 获取支持
如仍有问题，请检查：
1. LeanCloud 控制台设置是否与上述配置一致
2. 浏览器开发者工具中的网络请求和错误信息
3. 域名是否正确解析到网站

---
*更新时间：2024年* | *版本：V2.0*
