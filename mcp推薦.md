# MCP (Model Context Protocol) 伺服器推薦指南

## 簡介
MCP (Model Context Protocol) 是一種讓 AI 助理與外部工具/服務互動的協議。本文件介紹幾種實用的 MCP 伺服器及其應用場景。

## 安裝方法
```bash
# 安裝 sequential-thinking MCP
claude mcp add sequential-thinking -s user -- npx -y @modelcontextprotocol/server-sequential-thinking

# 安裝 context7 MCP 
claude mcp add context7 -s user -- npx -y @upstash/context7-mcp

# 安裝 figma MCP
claude mcp add figma -s user -- url http://127.0.0.1:3845/sse

# 安裝 magicui MCP
claude mcp add magicui -s user -- npx -y @magicuidesign/mcp@latest
```

---

## Sequential Thinking MCP Server

### 核心概念
專為結構化、漸進式問題解決設計的 MCP 伺服器，適合需要多步驟推理的場景。

### 主要功能
- **步驟分解**：將複雜任務拆解為可管理步驟
- **動態修正**：隨時調整先前思路
- **分支推理**：探索不同解決路徑
- **驗證機制**：確保每個步驟的正確性

### 參數說明
| 參數                | 類型    | 說明                          | 範例值                     |
|---------------------|---------|-----------------------------|---------------------------|
| `thought`           | string  | 當前思考步驟內容              | "分析用戶需求..."         |
| `nextThoughtNeeded` | boolean | 是否需要下一步                | true                      |
| `thoughtNumber`     | integer | 當前步驟編號                  | 3                         |
| `totalThoughts`     | integer | 預估總步驟數                  | 5                         |

### 使用範例
```xml
<use_mcp_tool>
  <server_name>sequential-thinking</server_name>
  <tool_name>sequentialthinking</tool_name>
  <arguments>
    {
      "thought": "分析用戶需求",
      "nextThoughtNeeded": true,
      "thoughtNumber": 1,
      "totalThoughts": 3
    }
  </arguments>
</use_mcp_tool>
```

---

## Context7 MCP Server

### 核心概念
提供最新官方文件與程式碼範例的 MCP 伺服器，解決 LLM 知識過時問題。

### 主要功能
- 即時獲取最新官方文件
- 版本精確匹配
- 支援多種開發工具整合

### 使用場景
1. **API 查詢**：
```xml
<use_mcp_tool>
  <server_name>context7</server_name>
  <tool_name>get-library-docs</tool_name>
  <arguments>
    {
      "context7CompatibleLibraryID": "/vercel/next.js",
      "topic": "getServerSideProps"
    }
  </arguments>
</use_mcp_tool>
```

2. **程式碼範例獲取**：
```xml
<use_mcp_tool>
  <server_name>context7</server_name>
  <tool_name>get-library-docs</tool_name>
  <arguments>
    {
      "context7CompatibleLibraryID": "/mongodb/docs",
      "tokens": 5000
    }
  </arguments>
</use_mcp_tool>
```

---

## MagicUI MCP Server

### 核心概念
提供精美 UI 元件與動畫效果的 MCP 伺服器。

### 可用元件分類
- **基礎元件**：按鈕、卡片、列表等
- **特殊效果**：粒子動畫、漸變效果
- **文字動畫**：打字機效果、文字漸變

### 使用範例
```xml
<use_mcp_tool>
  <server_name>magicui</server_name>
  <tool_name>getButtons</tool_name>
  <arguments>{}</arguments>
</use_mcp_tool>
```

---

## MCP 伺服器比較

| 功能特性          | Sequential Thinking | Context7 | MagicUI |
|------------------|---------------------|----------|---------|
| 主要用途         | 問題分解與思考      | 文件查詢 | UI 元件 |
| 即時資料         | ❌                  | ✅       | ❌      |
| 需要網路         | ❌                  | ✅       | ❌      |
| 適合場景         | 複雜問題解決        | API 開發 | 前端開發|

## 常見問題

### Q: 如何確認 MCP 伺服器是否運行正常？
```bash
claude mcp list
```

### Q: 可以同時使用多個 MCP 伺服器嗎？
✅ 可以，MCP 協議支援多伺服器並行運作

### Q: 如何更新 MCP 伺服器？
```bash
npx -y [package-name]@latest
```

## 最佳實踐
1. 為每個專案建立獨立的 MCP 配置
2. 定期更新 MCP 伺服器版本
3. 複雜任務優先使用 Sequential Thinking 進行拆解
4. 開發時結合 Context7 確保 API 正確性