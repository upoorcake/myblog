# Valine评论系统调试指南

## 当前问题
- ✅ 评论框正常显示
- ❌ 无法提交评论（点击提交没有记录）

## 必须检查的LeanCloud设置

### 1. 安全域名配置
登录 [LeanCloud控制台](https://console.leancloud.app/) → 选择你的应用 → 设置 → 安全中心 → Web 安全域名

**必须添加以下域名：**
```
你的域名.com
www.你的域名.com
localhost:4000
127.0.0.1:4000
```

### 2. 服务设置
在 LeanCloud 控制台 → 数据存储 → 结构化数据 → 创建 Class

**必须创建的Class：**
- `Comment` (评论数据表)
- `Counter` (访问统计表，如果启用visitor)

**ACL权限设置：**
- Comment表：公开读，公开写
- Counter表：公开读，公开写

### 3. AppID和AppKey确认
```
AppID: HRHpAOI2HZg7L97HEeaOmTzr-MdYXbMMI
AppKey: 4lzc97Bv2aaFyW7wMeZ3zVRc
```

### 4. 浏览器控制台检查
打开浏览器开发者工具 → Console标签页，查看是否有错误信息：

常见错误：
- `403 Forbidden` - 安全域名未配置
- `401 Unauthorized` - AppKey错误
- `Class 'Comment' does not exist` - 未创建Comment表

## 调试步骤

### 步骤1：检查网络请求
1. 打开浏览器开发者工具 → Network标签页
2. 尝试发表评论
3. 查看是否有向LeanCloud的API请求
4. 检查请求状态码和响应内容

### 步骤2：检查控制台错误
1. 打开Console标签页
2. 刷新页面
3. 尝试发表评论
4. 记录所有错误信息

### 步骤3：手动创建数据表
如果LeanCloud没有自动创建表，手动创建：

1. 登录LeanCloud控制台
2. 数据存储 → 结构化数据
3. 创建Class → 名称：`Comment`
4. 权限：公开读，公开写

## 常见解决方案

### 方案1：重新配置安全域名
```
1. 登录LeanCloud控制台
2. 设置 → 安全中心 → Web安全域名
3. 添加你的网站域名
4. 保存并等待生效（可能需要几分钟）
```

### 方案2：检查AppKey权限
```
1. 确认使用的是AppKey，不是MasterKey
2. 确认AppKey有写入权限
3. 如有问题，重新生成AppKey
```

### 方案3：使用CDN加速
如果网络问题，可以配置serverURLs：
```yaml
serverURLs: https://your-app-id.api.lncldglobal.com
```

## 测试用例

发表测试评论时使用以下内容：
```
昵称：测试用户
邮箱：test@example.com（可选）
内容：这是一条测试评论，用于验证Valine是否正常工作。
```

## 联系支持

如果以上步骤都无法解决：
1. 检查LeanCloud服务状态
2. 查看LeanCloud官方文档
3. 确认账户余额和配额
