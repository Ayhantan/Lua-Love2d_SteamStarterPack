# LuaSteamStarterPack

[![Lua Version](https://img.shields.io/badge/Lua-5.4-blue.svg)](https://www.lua.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Build Status](https://img.shields.io/badge/Build-Ready-brightgreen.svg)]()

---

## 🌟 Hakkında / About

**TR:**  
LuaSteamStarterPack, Steam uyumlu input, çözünürlük ölçekleme, ayarlar, save/load, çoklu dil ve logging sistemleri içeren modüler bir Love2D başlangıç çerçevesidir.  
Her projede sıfırdan altyapı yazma derdini ortadan kaldırır ve oyun geliştirmeye odaklanmanı sağlar.

**EN:**  
LuaSteamStarterPack is a modular Love2D game starter framework with Steam-ready input, resolution scaling, settings, save/load, localization, and logging systems.  
Designed to eliminate boilerplate and let you focus on gameplay.

---

## 📂 Klasör Yapısı / Folder Structure

- **LuaSteamStarterPack/**
  - **assets/**
    - `fonts/` → Fontlar / Fonts
    - `image/` → Görseller / Images
    - `lang/` → Dil dosyaları / Language files
    - `music/` → Müzikler / Music
    - `sounds/` → Ses efektleri / SFX
  - **src/**
    - `conf.lua` → Love2D config
    - `main.lua` → Ana giriş / Main entry
    - **core/**
      - `game.lua` → State manager
      - `input.lua` → Input sistemi / Input system
      - `scale.lua` → Resolution scaling / Letterbox
      - `settings.lua` → Ayarlar / Settings
      - `save.lua` → Save / Load
      - `config.lua` → Global config
      - `audio.lua` → Ses yönetimi / Audio
      - `localization.lua` → Çoklu dil / Multi-language
      - `logger.lua` → Log sistemi / Logger
      - `json.lua` → JSON wrapper
      - `dkjson.lua` → JSON encoder/decoder
    - **states/**
      - `boot.lua` → Başlangıç / Init state
      - `menu.lua` → Ana menü / Main menu
      - `settings.lua` → Ayarlar menüsü / Settings menu
      - `game.lua` → Oyun state’i / Game state
    - **locale/**
      - `en.lua` → İngilizce / English
      - `tr.lua` → Türkçe / Turkish
  - `launch.json` → VS Code debug ayarı
---

## 🚀 Özellikler / Features

| Özellik / Feature | Açıklama / Description |
|------------------|---------------------|
| 🎮 Input System | Keyboard + Gamepad (Steam-ready). Action-based input (confirm, cancel, pause). Tek basım (pressed) + basılı tutma (down). ALT+TAB güvenli. |
| 🖥 Resolution Scale | Sabit internal resolution. Letterbox/aspect ratio koruma. Resize-safe & fullscreen uyumlu. |
| ⚙️ Settings | Fullscreen toggle, VSync toggle, Master/Music/SFX volume. JSON olarak diske kaydedilir. Runtime apply. |
| 💾 Save / Load | Key-value save sistemi, otomatik JSON serialize. Oyundan bağımsız güvenli yapı. |
| 🌍 Localization | Çoklu dil desteği (TR / EN), string-key tabanlı, kolay genişletilebilir. |
| 📝 Logger | Debug / Info / Error logları. Konsol ve dosya uyumlu. Boot sürecini de loglar. |
| 🔁 State System | Game.register() / Game.switch(), clean lifecycle (enter, update, draw, exit). Menü → Settings → Game geçişleri hazır. |

---

## 🎯 Kimler İçin? / Who Is This For?

- 🎮 Indie game dev’ler / Indie game developers  
- 🧠 Game jam ekipleri / Game jam teams  
- 🧱 Kendi engine altyapısını kurmak isteyenler / Developers building their own engine  
- 🎯 Steam hedefli Love2D projeleri / Steam-targeted Love2D projects  

---

## 🔜 Sonraki Adımlar / Next Steps

- Steam Input API katmanı / Steam Input API layer  
- UI system (button, slider)  
- Save versioning  
- Rebindable controls  
- Example gameplay state  
- CI-ready build script  

---

## 📜 Lisans / License

istediğin gibi kullanabilirsin, referans yeterli. / MIT License – free to use, credit appreciated.

---

## 📌 Kısa Açıklama / Short Description

**TR:**  
LuaSteamStarterPack, Steam-ready input, resolution scaling, settings, save/load, localization ve logging sistemleri içeren modüler bir Love2D başlangıç çerçevesidir. Boilerplate derdini ortadan kaldırır, oyun geliştirmeye odaklanmanı sağlar.

**EN:**  
LuaSteamStarterPack is a modular Love2D game starter framework with Steam-ready input, resolution scaling, settings, save/load, localization, and logging systems. Designed to eliminate boilerplate and let you focus on gameplay.
