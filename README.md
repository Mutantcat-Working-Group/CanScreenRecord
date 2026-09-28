语言：简体中文 | [English](README.en.md)

<div align=center>
<img src="./icon.png" style="width:120px;" width="120"/>
<h2>能录屏</h2>
</div>

### 一、产品概述

能录屏（CanScreenRecord）是一款开源的桌面屏幕录制与编辑器，帮助你快速做出操作讲解、产品演示和视频教程。

- 支持 macOS、Windows、Linux。
- 支持录制整个显示器或单个应用窗口，录制后可直接进入编辑器。
- 内置自动缩放建议、光标润色、摄像头气泡叠加、样式化画面、时间线编辑等演示向工具。
- 支持 MP4 / GIF 导出，支持 `.recordly` 项目保存与继续编辑。

### 二、功能说明

#### 录制

- 录制整个显示器或单个应用窗口
- 支持麦克风音频与系统音频
- 在支持的平台上使用原生捕获后端
- 录制完成后直接进入编辑器
- 支持打开已有录像或项目文件

#### 时间线与编辑

- 拖拽式时间线编辑
- 裁剪片段、添加手动或自动缩放区域
- 添加加速、减速区域
- 添加文本、图片和图形注释
- 添加额外音频区域
- 裁切画面并选择宽高比

#### 光标与画面

- 显示或隐藏渲染光标，支持大小、平滑、模糊、点击弹跳与摆动
- 摄像头气泡叠加：镜像、尺寸、位置、边距、圆角、阴影
- 内置壁纸、自定义背景、纯色或渐变背景
- 画面留白、圆角、背景模糊、投影阴影

#### 导出

- MP4 导出
- GIF 导出，支持帧率、循环与尺寸预设
- 可选择导出质量，导出后可在文件管理器中定位文件

#### 扩展

- 社区驱动扩展系统，可安装光标音效、设备边框、浏览器模拟外壳、壁纸、渲染钩子等扩展
- 扩展市场：https://marketplace.recordly.dev/extensions

### 三、安装与下载

#### 下载安装包

从 [Releases](https://github.com/Mutantcat-Working-Group/CanScreenRecord/releases) 下载对应平台的安装包：

- macOS：x64 / arm64 DMG
- Windows：x64 / arm64 NSIS 安装包
- Linux：AppImage

#### Arch Linux / Manjaro（yay）

```bash
yay -S recordly-bin
```

#### 从源码构建

前置依赖：

- macOS：Xcode Command Line Tools（`xcode-select --install`）
- Linux（Ubuntu / Debian）：`build-essential cmake libx11-dev libxtst-dev libxrandr-dev libxt-dev`
- Windows：Visual Studio 2022（或 Build Tools）的 C++ 工作负载与 CMake

```bash
git clone https://github.com/Mutantcat-Working-Group/CanScreenRecord.git canscreenrecord
cd canscreenrecord
npm install
npm run dev
```

打包构建：

```bash
npm run build
```

平台专用命令：`npm run build:mac` / `npm run build:win` / `npm run build:linux`

#### macOS 打开报错

本地构建的应用可能被 macOS 隔离，可执行：

```bash
xattr -rd com.apple.quarantine /Applications/CanScreenRecord.app
```

### 四、快速上手

1. 启动能录屏，选择要录制的屏幕或窗口。
2. 选择麦克风与系统音频选项，开始录制。
3. 停止录制后进入编辑器，添加缩放、裁剪、变速、注释或摄像头叠加。
4. 调整画面样式与宽高比，导出 MP4 或 GIF。

### 五、系统要求与限制

| 平台 | 最低版本 | 说明 |
|---|---|---|
| macOS | macOS 14.0（Sonoma） | ScreenCaptureKit 音频与麦克风捕获所需 |
| Windows | Windows 10 20H1（Build 19041） | 原生 WGC 捕获与最佳光标隐藏效果所需 |
| Linux | 现代发行版 | 通过 Electron 捕获录制，系统音频一般需要 PipeWire |

限制说明：

- Linux 目前不支持隐藏真实系统光标。
- Windows 19041 之前会回退到 Electron 捕获，真实光标可能仍会出现在录制中。
- 系统音频支持因平台而异，Linux 一般需要 PipeWire。

### 六、工作原理

- 捕获：Electron 负责录制流程，macOS 使用 ScreenCaptureKit，Windows 使用 WGC 与系统音频辅助程序。
- 编辑：时间线区域保存缩放、裁剪、变速、音频与注释等状态。
- 渲染：PixiJS 负责场景合成。
- 导出：预览与导出共用同一套场景逻辑，输出 MP4 或 GIF。
- 项目：`.recordly` 文件保存源媒体路径与编辑器状态，可随时继续编辑。

### 七、社区与贡献

- 问题反馈与功能建议：https://github.com/Mutantcat-Working-Group/CanScreenRecord/issues
- 欢迎提交 Pull Request，保持改动聚焦并测试录制、编辑、导出流程。
- 许可证：AGPL 3.0
