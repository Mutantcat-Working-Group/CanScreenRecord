Language: [简体中文](README.md) | English

<div align=center>
<img src="./icon.png" style="width:120px;" width="120"/>
<h2>CanScreenRecord</h2>
</div>

### 1. Product Overview

CanScreenRecord is an open-source desktop screen recorder and editor for creating walkthroughs, product demos, and tutorial videos quickly.

- Supports macOS, Windows, and Linux.
- Record a full display or a single app window, then jump straight into the editor.
- Built-in presentation tools such as auto-zoom suggestions, cursor polish, webcam bubble overlays, styled frames, and timeline editing.
- Export to MP4 or GIF, and save or resume work with `.recordly` project files.

### 2. Features

#### Recording

- Record a full display or a single app window
- Capture microphone audio and system audio
- Use native capture backends where supported
- Jump from recording directly into the editor
- Open existing recordings or project files from the app

#### Timeline and Editing

- Drag-and-drop timeline editing
- Trim clips and add manual or automatic zoom regions
- Add speed-up and slow-down regions
- Add text, image, and figure annotations
- Add extra audio regions on the timeline
- Crop the frame and choose an aspect ratio

#### Cursor and Frame Styling

- Show or hide the rendered cursor, with size, smoothing, blur, click bounce, and sway controls
- Webcam bubble overlay: mirror, size, position, margin, roundness, and shadow
- Built-in wallpapers, custom backgrounds, solid colors, or gradients
- Frame padding, rounded corners, background blur, and drop shadows

#### Export

- MP4 export
- GIF export with frame-rate, loop, and size presets
- Selectable export quality and reveal exported files in the system file manager

#### Extensions

- Community-driven extension system for cursor click sounds, device frames, browser mockups, wallpapers, render hooks, and more
- Extension marketplace: https://marketplace.recordly.dev/extensions

### 3. Installation and Downloads

#### Download a build

Download the installer for your platform from [Releases](https://github.com/Mutantcat-Working-Group/CanScreenRecord/releases):

- macOS: x64 / arm64 DMG
- Windows: x64 / arm64 NSIS installer
- Linux: AppImage

#### Arch Linux / Manjaro (yay)

```bash
yay -S recordly-bin
```

#### Build from source

Prerequisites:

- macOS: Xcode Command Line Tools (`xcode-select --install`)
- Linux (Ubuntu / Debian): `build-essential cmake libx11-dev libxtst-dev libxrandr-dev libxt-dev`
- Windows: Visual Studio 2022 (or Build Tools) with the C++ workload and CMake

```bash
git clone https://github.com/Mutantcat-Working-Group/CanScreenRecord.git canscreenrecord
cd canscreenrecord
npm install
npm run dev
```

For packaged builds:

```bash
npm run build
```

Platform-specific commands: `npm run build:mac` / `npm run build:win` / `npm run build:linux`

#### macOS: "App cannot be opened"

Locally built apps may be quarantined by macOS. Remove the quarantine flag with:

```bash
xattr -rd com.apple.quarantine /Applications/CanScreenRecord.app
```

### 4. Quick Start

1. Launch CanScreenRecord and choose a screen or window to record.
2. Select microphone and system-audio options, then start recording.
3. Stop recording to open the editor and add zooms, trims, speed regions, annotations, or webcam overlays.
4. Adjust frame styling and aspect ratio, then export to MP4 or GIF.

### 5. System Requirements and Limitations

| Platform | Minimum version | Notes |
|---|---|---|
| macOS | macOS 14.0 (Sonoma) | Required for ScreenCaptureKit audio and microphone capture |
| Windows | Windows 10 20H1 (Build 19041) | Required for native WGC capture and best cursor-hiding behavior |
| Linux | Modern distro | Records through Electron capture; system audio generally requires PipeWire |

Limitations:

- Linux does not currently support hiding the real system cursor.
- On Windows builds older than 19041, capture falls back to Electron and the real cursor may remain visible.
- System audio support varies by platform; Linux generally requires PipeWire.

### 6. How It Works

- Capture: Electron coordinates recording; macOS uses ScreenCaptureKit and Windows uses WGC plus system audio helpers.
- Editing: Timeline regions store zoom, trim, speed, audio, and annotation state.
- Rendering: PixiJS composes the scene.
- Export: Preview and export share the same scene logic to produce MP4 or GIF output.
- Projects: `.recordly` files store the source media path and editor state for later resumption.

### 7. Community and Contribution

- Bug reports and feature requests: https://github.com/Mutantcat-Working-Group/CanScreenRecord/issues
- Pull requests are welcome; keep changes focused and test record, edit, and export flows.
- License: AGPL 3.0
