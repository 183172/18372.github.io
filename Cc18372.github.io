<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <!-- PWA配置 -->
    <link rel="manifest" href="data:application/manifest+json,{
        &quot;name&quot;: &quot;Cc配置 · 认准即可&quot;,
        &quot;short_name&quot;: &quot;Cc配置&quot;,
        &quot;description&quot;: &quot;一键加群 · 每日一言&quot;,
        &quot;start_url&quot;: &quot;.&quot;,
        &quot;display&quot;: &quot;standalone&quot;,
        &quot;background_color&quot;: &quot;#0b1120&quot;,
        &quot;theme_color&quot;: &quot;#1e3c72&quot;,
        &quot;icons&quot;: [{
            &quot;src&quot;: &quot;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'%3E%3Ccircle cx='50' cy='50' r='45' fill='%231e3c72'/%3E%3Ctext x='50' y='70' font-size='50' text-anchor='middle' fill='%23fff' font-family='Arial'%3E🛡️%3C/text%3E%3C/svg%3E&quot;,
            &quot;sizes&quot;: &quot;192x192&quot;,
            &quot;type&quot;: &quot;image/svg+xml&quot;
        }]
    }">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="apple-mobile-web-app-title" content="Cc配置文件">
    <title>Cc配置文件</title>
    <style>
        /* ---------- 保持原有视觉变量 ---------- */
        :root {
            --primary-glow: #0af;
            --secondary-glow: #f0f;
            --card-bg: rgba(20, 30, 50, 0.4);
            --card-blur: 16px;
            --btn-qq: linear-gradient(135deg, #18b860, #0c7c3a);
            --btn-tg: linear-gradient(135deg, #2a9fd6, #1e6b9c);
            --btn-ks: linear-gradient(135deg, #b45cff, #8a2be2);
            --btn-search: linear-gradient(135deg, #ff6b6b, #ff1493);
            --toast-bg: rgba(10, 20, 30, 0.8);
            --shadow-color: rgba(0, 180, 255, 0.3);
            --text-primary: #aaf0ff;
            --text-secondary: #8ab;
            --bg-start: #0b1120;
            --bg-end: #030614;
            --accent-glow: rgba(0, 200, 255, 0.2);
            --stat-bg: rgba(0, 15, 30, 0.6);
            --border-glow: rgba(0, 200, 255, 0.3);
        }

        /* 亮色主题 (跟随系统) */
        @media (prefers-color-scheme: light) {
            :root {
                --card-bg: rgba(255, 255, 255, 0.3);
                --toast-bg: rgba(255, 255, 255, 0.8);
                --text-primary: #1e3c72;
                --text-secondary: #2a5298;
                --bg-start: #e0e8ff;
                --bg-end: #c0d0ff;
                --shadow-color: rgba(0, 100, 200, 0.3);
                --stat-bg: rgba(255,255,240,0.5);
                --border-glow: rgba(0, 100, 200, 0.3);
            }
            .card { color: #1e3c72; }
            .fps-counter, .device-info, .shortcuts, .security-status { color: #1e3c72; }
        }

        body.dark-theme {
            --card-bg: rgba(20, 30, 50, 0.5);
            --text-primary: #aaf0ff;
            --text-secondary: #8ab;
            --bg-start: #0b1120;
            --bg-end: #030614;
            --stat-bg: rgba(0, 15, 30, 0.7);
            --border-glow: rgba(0, 200, 255, 0.4);
        }
        body.dark-theme .card { color: #aaf0ff; }
        body.dark-theme .fps-counter,
        body.dark-theme .device-info,
        body.dark-theme .shortcuts,
        body.dark-theme .security-status { color: #aaf0ff; }

        ::-webkit-scrollbar { width: 8px; height: 8px; }
        ::-webkit-scrollbar-track { background: var(--bg-start); }
        ::-webkit-scrollbar-thumb { background: #2a5298; border-radius: 4px; box-shadow: 0 0 10px #0af; }
        ::-webkit-scrollbar-thumb:hover { background: #3a6ab8; box-shadow: 0 0 15px #f0f; }

        body.desktop { cursor: none; }
        .custom-cursor {
            position: fixed; width: 30px; height: 30px; border: 2px solid #0af; border-radius: 50%;
            pointer-events: none; z-index: 99999; transform: translate(-50%, -50%);
            transition: width 0.2s, height 0.2s, border-color 0.2s, box-shadow 0.2s;
            box-shadow: 0 0 15px #0af, inset 0 0 10px #0af; backdrop-filter: blur(2px);
        }
        .custom-cursor.hover { width: 50px; height: 50px; border-color: #f0f; box-shadow: 0 0 20px #f0f, inset 0 0 15px #f0f; }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif; }

        body {
            min-height: 100vh;
            background: radial-gradient(circle at 30% 30%, var(--bg-start), var(--bg-end));
            display: flex; align-items: center; justify-content: center; padding: 2rem;
            position: relative; overflow-x: hidden;
            transition: background 0.3s;
        }

        .card {
            background: var(--card-bg);
            backdrop-filter: blur(var(--card-blur)) saturate(180%);
            -webkit-backdrop-filter: blur(var(--card-blur)) saturate(180%);
            border-radius: 3rem;
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.7), 0 0 0 1px rgba(255, 255, 255, 0.15) inset, 0 0 40px var(--shadow-color);
            max-width: 1000px; width: 100%; padding: 3.5rem 3rem; text-align: center;
            position: relative; z-index: 2;
            animation: cardFloat 1.2s cubic-bezier(0.23, 1, 0.32, 1);
            border: 1px solid rgba(255,255,255,0.1);
            background-image: linear-gradient(rgba(0, 255, 255, 0.03) 1px, transparent 1px),
                              linear-gradient(90deg, rgba(0, 255, 255, 0.03) 1px, transparent 1px);
            background-size: 40px 40px;
            transition: box-shadow 0.3s;
        }
        .card.glow-effect {
            box-shadow: 0 40px 80px rgba(0, 150, 255, 0.4), 0 0 0 2px rgba(255,255,255,0.2) inset, 0 0 60px #0af;
        }

        .shield-icon {
            position: absolute; top: 20px; left: 20px; font-size: 2.5rem;
            filter: drop-shadow(0 0 15px #0ff); animation: shieldPulse 3s infinite alternate;
            z-index: 5; cursor: pointer; transition: transform 0.2s;
        }
        .shield-icon:hover { transform: scale(1.2) rotate(5deg); }
        @keyframes shieldPulse { 0% { filter: drop-shadow(0 0 10px #0ff); } 100% { filter: drop-shadow(0 0 20px #f0f); } }

        .security-status {
            position: absolute; bottom: 15px; right: 20px; font-size: 0.7rem; color: var(--text-primary);
            background: rgba(0,20,0,0.6); padding: 4px 12px; border-radius: 20px; border: 1px solid #0fa;
            box-shadow: 0 0 15px #0fa; backdrop-filter: blur(4px); letter-spacing: 1px;
            animation: statusGlow 3s infinite alternate; z-index: 5; pointer-events: none;
        }
        @keyframes statusGlow { 0% { border-color: #0fa; box-shadow: 0 0 10px #0fa; color: #afa; } 100% { border-color: #f0f; box-shadow: 0 0 20px #f0f; color: #faf; } }

        @keyframes cardFloat { 0% { opacity: 0; transform: scale(0.92) translateY(20px); } 100% { opacity: 1; transform: scale(1) translateY(0); } }

        .qq-icon {
            background: linear-gradient(145deg, #1e4c9c, #0f2c5c); width: 100px; height: 100px; border-radius: 35px;
            display: flex; align-items: center; justify-content: center; margin: 0 auto 1.8rem;
            box-shadow: 0 20px 30px -5px rgba(0, 0, 0, 0.8), 0 0 20px #00a8ff, 0 0 0 2px rgba(255,255,255,0.3) inset;
            animation: iconGlow 4s infinite alternate;
        }
        @keyframes iconGlow { 0% { box-shadow: 0 20px 30px -5px #000, 0 0 10px #0088ff, 0 0 0 2px rgba(255,255,255,0.2) inset; } 100% { box-shadow: 0 20px 40px -5px #000, 0 0 30px #2ad4ff, 0 0 0 3px rgba(255,255,255,0.5) inset; } }
        .qq-icon svg { width: 58px; height: 58px; filter: drop-shadow(0 2px 10px rgba(255,255,255,0.6)); }

        h1 { font-size: 2.4rem; font-weight: 700; background: linear-gradient(135deg, #fff, #b0e0ff); -webkit-background-clip: text; background-clip: text; color: transparent; margin-bottom: 0.4rem; text-shadow: 0 0 20px #0af, 0 0 40px #0af; }

        .top-info { display: flex; justify-content: center; margin-bottom: 1rem; color: var(--text-primary); font-size: 0.9rem; background: rgba(0,0,0,0.2); backdrop-filter: blur(4px); padding: 0.5rem 1rem; border-radius: 50px; border: 1px solid rgba(255,255,255,0.1); }
        .clock { display: flex; align-items: center; gap: 0.3rem; }

        .greeting { font-size: 1.1rem; font-weight: 400; color: var(--text-primary); text-shadow: 0 0 10px #0af; margin-bottom: 0.5rem; animation: greetingGlow 4s infinite alternate; }
        @keyframes greetingGlow { 0% { opacity: 0.8; text-shadow: 0 0 5px #0af; } 100% { opacity: 1; text-shadow: 0 0 15px #f0f; } }

        .group-number { background: rgba(0, 40, 70, 0.6); backdrop-filter: blur(4px); padding: 0.6rem 2rem; border-radius: 60px; display: inline-block; margin-bottom: 0.8rem; font-size: 1.5rem; font-weight: 600; color: var(--text-primary); border: 1px solid rgba(0, 200, 255, 0.6); box-shadow: 0 0 20px rgba(0, 180, 255, 0.3), inset 0 2px 5px rgba(255,255,255,0.2); animation: borderPulse 4s infinite alternate; }
        @keyframes borderPulse { 0% { border-color: rgba(0, 200, 255, 0.6); box-shadow: 0 0 15px rgba(0,180,255,0.5); } 100% { border-color: rgba(255, 100, 200, 0.8); box-shadow: 0 0 30px #f0f; } }

        .cc-tagline { font-size: 1.2rem; font-weight: 500; margin-bottom: 1.8rem; background: linear-gradient(135deg, #ffd966, #ff99cc); -webkit-background-clip: text; background-clip: text; color: transparent; text-shadow: 0 0 15px rgba(255, 200, 0, 0.8), 0 0 30px #ff00aa; letter-spacing: 2px; animation: taglineGlow 4s infinite alternate; display: inline-block; border-bottom: 1px dashed rgba(255, 150, 200, 0.5); padding-bottom: 0.2rem; }
        @keyframes taglineGlow { 0% { text-shadow: 0 0 10px #ffaa00, 0 0 20px #ff00aa; } 100% { text-shadow: 0 0 20px #ff00aa, 0 0 40px #ffaa00; } }

        .fps-counter { margin: 0.5rem 0 1rem; font-size: 1rem; background: var(--stat-bg); padding: 0.3rem 1rem; border-radius: 30px; display: inline-flex; align-items: center; gap: 0.5rem; border: 1px solid var(--border-glow); backdrop-filter: blur(5px); animation: counterGlow 4s infinite alternate; color: var(--text-primary); }
        .fps-counter .dot { width: 10px; height: 10px; background: #0f0; border-radius: 50%; box-shadow: 0 0 10px #0f0; animation: dotPulse 2s infinite; }
        @keyframes dotPulse { 0% { opacity: 0.5; transform: scale(0.8); } 100% { opacity: 1; transform: scale(1.2); } }
        @keyframes counterGlow { 0% { border-color: var(--border-glow); box-shadow: 0 0 10px #2af; } 100% { border-color: #f6f; box-shadow: 0 0 20px #f6f; } }

        /* 按钮样式 */
        .action-btn {
            border: none; width: 100%; padding: 1.5rem 0; border-radius: 80px; font-size: 2rem; font-weight: 700;
            color: white; display: flex; align-items: center; justify-content: center; gap: 0.8rem;
            cursor: pointer; transition: all 0.2s ease; margin-bottom: 1.8rem;
            border: 1px solid rgba(255,255,255,0.3); position: relative; overflow: hidden;
            animation: btnPop 0.6s 0.3s both; z-index: 10; box-shadow: 0 15px 25px -8px rgba(0,0,0,0.5);
        }
        .action-btn::before { content: ''; position: absolute; top: 0; left: -100%; width: 100%; height: 100%; background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent); transition: left 0.6s; }
        .action-btn:hover::before { left: 100%; }
        .action-btn:hover { transform: scale(1.03) translateY(-2px); filter: brightness(1.3); box-shadow: 0 0 40px currentColor; text-shadow: 0 0 10px white; }
        .action-btn:active { transform: scale(0.98) translateY(2px); }
        @keyframes btnPop { 0% { opacity: 0; transform: scale(0.9); } 70% { transform: scale(1.02); } 100% { opacity: 1; transform: scale(1); } }

        .btn-qq { background: var(--btn-qq); box-shadow: 0 10px 20px -5px #0f3, 0 4px 0 0 #0a5324 inset, 0 -2px 0 0 #8fdc9c inset; }
        .btn-telegram { background: var(--btn-tg); box-shadow: 0 10px 20px -5px #2af, 0 4px 0 0 #0f4c7a inset, 0 -2px 0 0 #9fd9ff inset; }
        .btn-kuaishou { background: var(--btn-ks); box-shadow: 0 10px 20px -5px #c45cff, 0 4px 0 0 #5a1e9e inset, 0 -2px 0 0 #e0b0ff inset; }
        .btn-search { background: var(--btn-search); box-shadow: 0 10px 20px -5px #ff6b6b, 0 4px 0 0 #c71585 inset, 0 -2px 0 0 #ffb6c1 inset; }

        .btn-telegram.loading { opacity: 0.7; pointer-events: none; filter: grayscale(0.5); }

        .force-link { margin-top: -1rem; margin-bottom: 1rem; font-size: 0.9rem; }
        .force-link a { color: #ffaa00; text-decoration: none; border-bottom: 1px dotted #ffaa00; cursor: pointer; transition: 0.2s; }
        .force-link a:hover { color: #ffdd44; border-bottom-color: #ffdd44; text-shadow: 0 0 8px #ffaa00; }

        /* 实用卡片网格 (只保留一言卡片) */
        .utility-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            justify-content: center;
            margin: 1.5rem 0 1.8rem;
        }
        .utility-card {
            background: var(--stat-bg);
            backdrop-filter: blur(8px);
            border: 1px solid var(--border-glow);
            border-radius: 2rem;
            padding: 1rem 1.2rem;
            min-width: 180px;
            flex: 1 1 180px;
            color: var(--text-primary);
            text-align: left;
            box-shadow: 0 0 20px var(--shadow-color);
            transition: transform 0.2s;
            position: relative;
            overflow: hidden;
        }
        .utility-card:hover {
            transform: translateY(-4px);
            border-color: #f0f;
            box-shadow: 0 0 30px #f0f;
        }
        .utility-card .card-header {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 1rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--text-secondary);
        }
        .utility-card .card-content {
            font-size: 0.95rem;
            line-height: 1.5;
            min-height: 4rem;
            word-break: break-word;
        }
        .utility-card .refresh-btn {
            position: absolute;
            top: 0.5rem;
            right: 0.8rem;
            cursor: pointer;
            font-size: 1.2rem;
            opacity: 0.6;
            transition: opacity 0.2s;
        }
        .utility-card .refresh-btn:hover {
            opacity: 1;
            transform: rotate(90deg);
        }

        /* 原实时统计 */
        .live-stats {
            display: flex; justify-content: center; gap: 1.5rem; margin: 1rem 0 1.5rem;
            background: var(--stat-bg); backdrop-filter: blur(5px); border-radius: 60px;
            padding: 0.6rem 1.5rem; border: 1px solid var(--border-glow); color: var(--text-primary);
            font-size: 0.95rem; flex-wrap: wrap; box-shadow: 0 0 15px var(--shadow-color);
        }
        .live-stats span { display: flex; align-items: center; gap: 0.3rem; }
        .live-stats i { font-style: normal; color: #ffaa00; font-weight: 700; }

        .toolbar { position: fixed; bottom: 30px; right: 30px; z-index: 1000; display: flex; flex-direction: column; align-items: flex-end; gap: 10px; }
        .toolbar-btn { width: 50px; height: 50px; background: var(--card-bg); backdrop-filter: blur(10px); border: 1px solid rgba(0, 200, 255, 0.6); border-radius: 50%; color: white; font-size: 1.8rem; display: flex; align-items: center; justify-content: center; cursor: pointer; box-shadow: 0 0 20px var(--shadow-color); transition: 0.2s; }
        .toolbar-btn:hover { transform: scale(1.2); border-color: #f0f; box-shadow: 0 0 30px #f0f; }
        .toolbar-menu { background: var(--card-bg); backdrop-filter: blur(10px); border: 1px solid rgba(0, 200, 255, 0.6); border-radius: 20px; padding: 0.8rem; display: none; flex-direction: column; gap: 0.5rem; min-width: 170px; }
        .toolbar-menu.show { display: flex; }
        .toolbar-menu-item { color: var(--text-primary); text-decoration: none; padding: 0.5rem 1rem; border-radius: 30px; transition: 0.2s; font-size: 0.9rem; display: flex; align-items: center; gap: 0.5rem; cursor: pointer; }
        .toolbar-menu-item:hover { background: rgba(0, 200, 255, 0.2); color: white; }

        #easter-egg-canvas { position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 99999; }

        .footnote { color: var(--text-primary); font-size: 0.9rem; margin-top: 1.5rem; border-top: 1px dashed rgba(100, 180, 255, 0.4); padding-top: 1.2rem; text-shadow: 0 0 8px rgba(0,200,255,0.4); }
        .footnote a { color: var(--text-primary); font-weight: 600; text-decoration: none; border-bottom: 1px dotted #7df; transition: 0.2s; }
        .footnote a:hover { color: white; border-bottom-color: white; text-shadow: 0 0 10px cyan; }

        .shortcuts { margin-top: 1rem; font-size: 0.8rem; color: var(--text-secondary); background: rgba(0,20,30,0.4); padding: 0.4rem 1rem; border-radius: 30px; backdrop-filter: blur(5px); border: 1px solid rgba(150,200,255,0.2); display: inline-block; }
        .shortcuts span { margin: 0 0.5rem; color: #ffaa00; font-weight: 600; }

        .device-info { margin-top: 1rem; font-size: 0.8rem; color: var(--text-secondary); background: rgba(0,20,30,0.4); padding: 0.5rem 1rem; border-radius: 30px; backdrop-filter: blur(5px); border: 1px solid rgba(150,200,255,0.2); display: inline-block; text-shadow: 0 0 5px #2af; animation: deviceGlow 5s infinite alternate; }
        @keyframes deviceGlow { 0% { border-color: rgba(150,200,255,0.2); box-shadow: 0 0 5px #2af; } 100% { border-color: rgba(255,100,200,0.5); box-shadow: 0 0 15px #f0f; } }

        .loading .arrow { animation: spin 1s infinite linear; }
        @keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }

        @media (max-width: 480px) {
            .card { padding: 2rem 1.2rem; }
            h1 { font-size: 2rem; }
            .action-btn { font-size: 1.8rem; padding: 1.2rem 0; }
            .cc-tagline { font-size: 1rem; }
            .shield-icon { font-size: 2rem; top: 10px; left: 10px; }
            .security-status { font-size: 0.6rem; bottom: 5px; right: 10px; }
            .utility-grid { flex-direction: column; }
            .utility-card { min-width: 100%; }
        }

        .toast-container { position: fixed; top: 20px; left: 50%; transform: translateX(-50%) translateY(-100px); z-index: 10000; transition: transform 0.3s ease; pointer-events: none; }
        .toast-container.show { transform: translateX(-50%) translateY(0); }
        .toast-message { background: var(--toast-bg); backdrop-filter: blur(12px); color: var(--text-primary); font-size: 1rem; padding: 0.8rem 1.5rem; border-radius: 50px; border: 1px solid rgba(0, 200, 255, 0.6); box-shadow: 0 0 30px rgba(0, 200, 255, 0.5); display: flex; align-items: center; gap: 0.5rem; }
        .toast-message::before { content: '✓'; font-size: 1.2rem; color: #0f0; filter: drop-shadow(0 0 8px #0f0); }

        /* 弹窗样式 */
        .modal-overlay { position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); backdrop-filter: blur(12px); display: flex; align-items: center; justify-content: center; z-index: 9999; opacity: 0; visibility: hidden; transition: opacity 0.3s ease, visibility 0.3s; }
        .modal-overlay.show { opacity: 1; visibility: visible; }
        .modal-card { background: rgba(10, 20, 40, 0.7); backdrop-filter: blur(20px); border-radius: 3rem; padding: 2.5rem 2rem; max-width: 400px; width: 85%; text-align: center; box-shadow: 0 40px 80px rgba(0, 0, 0, 0.8), 0 0 0 2px rgba(100, 200, 255, 0.5) inset, 0 0 60px #00aaff; border: 1px solid rgba(255,255,255,0.2); transform: scale(0.8) translateY(20px); transition: transform 0.4s cubic-bezier(0.34, 1.56, 0.64, 1); }
        .modal-overlay.show .modal-card { transform: scale(1) translateY(0); }
        .modal-close { position: absolute; top: 15px; right: 20px; font-size: 2rem; color: #fff; cursor: pointer; transition: 0.2s; width: 40px; height: 40px; display: flex; align-items: center; justify-content: center; border-radius: 50%; background: rgba(255,255,255,0.1); }
        .modal-close:hover { background: rgba(255,100,100,0.3); transform: scale(1.1); }
        .modal-icon { font-size: 4rem; line-height: 1; margin-bottom: 0.5rem; filter: drop-shadow(0 0 15px cyan); }
        .modal-title { font-size: 2.2rem; font-weight: 700; background: linear-gradient(135deg, #fff, #a0d0ff); -webkit-background-clip: text; background-clip: text; color: transparent; margin-bottom: 1rem; text-shadow: 0 0 20px #0af; }
        .modal-message { font-size: 1.4rem; color: #ccf0ff; margin-bottom: 2rem; text-shadow: 0 0 10px #3af; }
        .modal-btn { background: linear-gradient(145deg, #1a4f8c, #0d2d5a); border: none; color: white; font-size: 1.8rem; font-weight: 600; padding: 1rem 2rem; border-radius: 60px; cursor: pointer; box-shadow: 0 10px 20px -5px #000, 0 0 20px #2af, 0 2px 0 #8cf inset; transition: all 0.2s; width: 100%; display: flex; align-items: center; justify-content: center; gap: 0.5rem; }
        .modal-btn:hover { transform: scale(1.02); box-shadow: 0 10px 30px -5px #00f, 0 0 30px #6cf, 0 2px 0 #fff inset; filter: brightness(1.2); }
        .manual-link { margin-top: 1rem; font-size: 0.9rem; }
        .manual-link a { color: #ffaa00; text-decoration: none; border-bottom: 1px dotted #ffaa00; }
        #vpnAlertModal .modal-card { border-color: rgba(255, 100, 100, 0.6); box-shadow: 0 40px 80px rgba(0,0,0,0.8), 0 0 0 2px rgba(255,100,100,0.5) inset, 0 0 60px #f66; }
        #vpnAlertModal .modal-icon { filter: drop-shadow(0 0 15px #f66); }
    </style>
</head>
<body>
    <div class="custom-cursor" id="customCursor"></div>
    <div id="toast" class="toast-container"><div class="toast-message" id="toastMessage"></div></div>

    <div class="card" id="mainCard">
        <div class="shield-icon" id="shieldIcon" onclick="handleShieldClick()">🛡️</div>
        <div class="security-status">🛡️ 桌面美化 · 每日一言</div>

        <div class="top-info">
            <div class="clock" id="clockWidget"><span>⏰</span><span id="clockText"></span></div>
        </div>

        <div class="qq-icon">
            <svg viewBox="0 0 24 24" fill="white">
                <path d="M22 11.5C22 16.7467 17.7467 21 12.5 21H11.5C6.2533 21 2 16.7467 2 11.5V8.5C2 3.2533 6.2533 1 11.5 1H12.5C17.7467 1 22 3.2533 22 8.5V11.5Z" stroke="white" stroke-width="1.5" fill="none"/>
                <circle cx="9" cy="10" r="2" fill="white"/><circle cx="15" cy="10" r="2" fill="white"/>
                <path d="M8.5 15.5C8.5 15.5 10 17.5 12 17.5C14 17.5 15.5 15.5 15.5 15.5" stroke="white" stroke-width="1.5" stroke-linecap="round"/>
            </svg>
        </div>

        <h1>加入交流群</h1>
        <div class="greeting" id="greeting"></div>
        <div class="group-number">QQ群 · 1082223192</div>
        <div class="cc-tagline">✨ 认准 Cc配置文件 官方渠道✨</div>

        <!-- 原有实时群统计 -->
        <div class="live-stats" id="liveStats">
            <span>👥 在线 <i id="onlineCount">386</i> 人</span>
            <span>📥 今日 <i id="todayJoin">29</i> 人</span>
            <span>⏱️ 上次访问: <i id="lastVisit">刚刚</i></span>
        </div>

        <!-- 实用卡片区域 (仅保留每日一言) -->
        <div class="utility-grid">
            <div class="utility-card" id="hitokotoCard">
                <div class="card-header"><span>💬</span> 每日一言 <span class="refresh-btn" onclick="refreshHitokoto()">↻</span></div>
                <div class="card-content" id="hitokotoContent">加载中...</div>
            </div>
        </div>

        <div class="fps-counter" id="fpsCounter"><span class="dot"></span><span>当前帧率 <span id="fpsValue">--</span> FPS</span></div>

        <button class="action-btn btn-qq" onclick="handleQQClick()"><span>🐧</span> 一键复制QQ群号 <span class="arrow">➡️</span></button>
        <button id="telegramBtn" class="action-btn btn-telegram" onclick="handleTelegramClick()"><span>✈️</span> 一键进入Telegram的Cc官方频道 <span class="arrow">➡️</span></button>
        <div class="force-link"><a href="#" onclick="forceTelegramJump(); return false;">⚡ 强制跳转（不检测）</a></div>
        <button class="action-btn btn-kuaishou" onclick="handleKuaiShouClick()"><span>📱</span> 一键进入Cc快手主页 <span class="arrow">➡️</span></button>
        <button class="action-btn btn-search" onclick="handleSearchBlackSilk()"><span>🔥</span> 一键查找美女视频 <span class="arrow">➡️</span></button>

        <div class="footnote">
            ⚡ 点击QQ按钮复制群号并尝试打开QQ<br>✈️ Telegram 需开启VPN，点击自动检测<br>📱 快手主页: <a href="#" onclick="copyKuaiShou()">Tg-CCAV886</a>（唤起App）<br>🔥 黑丝搜索: <a href="#" onclick="copyBlackSilk()">黑丝</a>（唤起App搜索）<br>
            (手动复制: <a href="#" onclick="copyQQ()">1082223192</a> / <a href="#" onclick="copyTG()">t.me/CCAV886</a>) 
            <button class="notify-btn" onclick="requestNotificationPermission()">🔔 开启通知</button>
            <span style="opacity:0.5;">✨ v31.0 每日一言</span>
        </div>

        <div class="shortcuts">⌨️ 快捷键: <span>C</span> 复制QQ <span>T</span> 跳转TG <span>K</span> 快手 <span>V</span> 黑搜 <span>D</span> 切换主题</div>
        <div class="device-info" id="deviceInfo">正在检测设备...</div>
    </div>

    <!-- 悬浮工具栏 -->
    <div class="toolbar">
        <div class="toolbar-btn" onclick="toggleToolbarMenu()">⚙️</div>
        <div class="toolbar-menu" id="toolbarMenu">
            <a class="toolbar-menu-item" onclick="copyQQ(); return false;">📋 复制QQ群号</a>
            <a class="toolbar-menu-item" onclick="copyTG(); return false;">📋 复制Telegram</a>
            <a class="toolbar-menu-item" onclick="copyKuaiShou(); return false;">📋 复制快手ID</a>
            <a class="toolbar-menu-item" onclick="copyBlackSilk(); return false;">🔥 复制“黑丝”</a>
            <a class="toolbar-menu-item" onclick="sharePage()">📤 分享此页</a>
            <a class="toolbar-menu-item" onclick="toggleTheme()">🌓 切换深色/亮色</a>
            <a class="toolbar-menu-item" onclick="changeWallpaper(); return false;">🖼️ 切换壁纸</a>
            <a class="toolbar-menu-item" onclick="location.reload();">🔄 刷新页面</a>
        </div>
    </div>

    <canvas id="easter-egg-canvas"></canvas>

    <!-- 弹窗 -->
    <div id="welcomeModal" class="modal-overlay"><div class="modal-card"><div class="modal-close" onclick="closeModal('welcomeModal')">✕</div><div class="modal-icon">⚡</div><div class="modal-title">Cc 配置文件</div><div class="modal-message">Cc官方渠道为你服务</div><button class="modal-btn" onclick="closeModal('welcomeModal')"><span>✨</span> 进 入 <span>✨</span></button></div></div>
    <div id="vpnAlertModal" class="modal-overlay"><div class="modal-card"><div class="modal-close" onclick="closeModal('vpnAlertModal')">✕</div><div class="modal-icon" id="vpnAlertIcon">⚠️</div><div class="modal-title" id="vpnAlertTitle">提示</div><div class="modal-message" id="vpnAlertMessage"></div><div class="manual-link"><a href="#" onclick="copyTGManual(); return false;">📋 手动复制链接</a></div><button class="modal-btn" onclick="closeModal('vpnAlertModal')" style="margin-top:1rem;"><span>✨</span> 确 认 <span>✨</span></button></div></div>

    <script>
        (function() {
            // ---------- 工具函数 ----------
            function closeModal(modalId) { document.getElementById(modalId).classList.remove('show'); }
            function showModal(modalId) { document.getElementById(modalId).classList.add('show'); }

            window.showVPNAlert = function(icon, title, message) {
                document.getElementById('vpnAlertIcon').textContent = icon;
                document.getElementById('vpnAlertTitle').textContent = title;
                document.getElementById('vpnAlertMessage').textContent = message;
                showModal('vpnAlertModal');
            };
            window.copyTGManual = function() { copyToClipboard(TG_LINK).then(() => { showToast('Telegram链接已复制'); closeModal('vpnAlertModal'); }); };

            function showToast(message) { const t=document.getElementById('toast'), m=document.getElementById('toastMessage'); m.textContent=message; t.classList.add('show'); setTimeout(()=>t.classList.remove('show'),2000); }
            function copyToClipboard(text) { return new Promise((resolve, reject) => { if (navigator.clipboard && window.isSecureContext) { navigator.clipboard.writeText(text).then(resolve).catch(reject); } else { const ta = document.createElement('textarea'); ta.value = text; ta.style.position = 'fixed'; ta.style.opacity = '0'; document.body.appendChild(ta); ta.select(); try { document.execCommand('copy') ? resolve() : reject(); } catch (err) { reject(err); } document.body.removeChild(ta); } }); }
            function vibrate(p=20) { if (window.navigator && window.navigator.vibrate) window.navigator.vibrate(p); }

            window.requestNotificationPermission = function() { if (!('Notification' in window)) { showToast('浏览器不支持通知'); return; } if (Notification.permission === 'granted') { showToast('通知权限已开启'); } else if (Notification.permission !== 'denied') { Notification.requestPermission().then(permission => { if (permission === 'granted') showToast('通知已开启'); }); } };
            function sendNotification(title, options) { if (!('Notification' in window) || Notification.permission !== 'granted') return; new Notification(title, options); }

            const TG_LINK = 'https://t.me/CCAV886';
            const QQ_NUM = '1082223192';
            const KUAISHOU_ID = 'Tg-CCAV886';
            const KUAISHOU_SCHEME = 'kwai://profile/' + KUAISHOU_ID;
            const KUAISHOU_WEB = 'https://www.kuaishou.com/profile/' + KUAISHOU_ID;
            const SEARCH_KEYWORD = '黑丝';
            const SEARCH_SCHEME = `kwai://search?keyword=${encodeURIComponent(SEARCH_KEYWORD)}`;
            const SEARCH_WEB = `https://www.kuaishou.com/search/${encodeURIComponent(SEARCH_KEYWORD)}`;

            // 光标
            const cursor = document.getElementById('customCursor');
            if (cursor && !/Mobi|Android|iPhone|iPad|iPod/i.test(navigator.userAgent)) {
                document.body.classList.add('desktop');
                document.addEventListener('mousemove', (e) => { cursor.style.left = e.clientX + 'px'; cursor.style.top = e.clientY + 'px'; });
                document.querySelectorAll('a, button, .toolbar-btn, .shield-icon').forEach(el => { el.addEventListener('mouseenter', () => cursor.classList.add('hover')); el.addEventListener('mouseleave', () => cursor.classList.remove('hover')); });
                const card = document.getElementById('mainCard');
                document.addEventListener('mousemove', (e) => {
                    const rect = card.getBoundingClientRect();
                    const distX = e.clientX - (rect.left + rect.width/2);
                    const distY = e.clientY - (rect.top + rect.height/2);
                    const distance = Math.sqrt(distX*distX + distY*distY);
                    if (distance < 300) card.classList.add('glow-effect');
                    else card.classList.remove('glow-effect');
                });
            } else { cursor.style.display = 'none'; }

            // 时钟 & 问候
            function updateClock() { const now=new Date(); document.getElementById('clockText').textContent=now.toLocaleTimeString('zh-CN',{hour12:false}); }
            setInterval(updateClock,1000); updateClock();

            function updateGreeting() { const hour=new Date().getHours(); let g='', e=''; if(hour>=5&&hour<12){g='早上好';e='🌅';}else if(hour<14){g='中午好';e='☀️';}else if(hour<18){g='下午好';e='⛅';}else if(hour<22){g='晚上好';e='🌙';}else{g='夜深了';e='🌃';} const emojis=[e,'✨','🌟','💫']; const re=emojis[Math.floor(Math.random()*emojis.length)]; document.getElementById('greeting').textContent=`${g}，现在是 ${new Date().toLocaleTimeString('zh-CN',{hour12:false,hour:'2-digit',minute:'2-digit'})} ${re}`; }
            setInterval(updateGreeting,1000); updateGreeting();

            // 帧率
            const fpsEl=document.getElementById('fpsValue'); const fpsCounter=document.getElementById('fpsCounter'); let frameCount=0,lastTime=performance.now();
            function measureFPS(now) { frameCount++; const delta=now-lastTime; if(delta>=1000) { const fps=Math.round((frameCount*1000)/delta); if(fpsEl) fpsEl.textContent=fps; if(fpsCounter) { if(fps>=55) fpsCounter.style.color='#9cf'; else if(fps>=30) fpsCounter.style.color='#ffaa00'; else fpsCounter.style.color='#ff5555'; } frameCount=0; lastTime=now; } requestAnimationFrame(measureFPS); }
            requestAnimationFrame(measureFPS);

            // 设备信息 (简略版)
            function getDeviceInfo() { const ua=navigator.userAgent; let os='未知OS',b='未知浏览器'; if(ua.indexOf('Windows NT 10.0')!==-1) os='Windows 10'; else if(ua.indexOf('Windows NT 11.0')!==-1) os='Windows 11'; else if(ua.indexOf('Mac OS X')!==-1) os='macOS'; else if(ua.indexOf('iPhone')!==-1) os='iOS'; else if(ua.indexOf('iPad')!==-1) os='iPadOS'; else if(ua.indexOf('Android')!==-1) os='Android'; else if(ua.indexOf('Linux')!==-1) os='Linux'; if(ua.indexOf('Edg/')!==-1) b='Edge'; else if(ua.indexOf('Chrome/')!==-1) b='Chrome'; else if(ua.indexOf('Firefox/')!==-1) b='Firefox'; else if(ua.indexOf('Safari/')!==-1 && ua.indexOf('Chrome')===-1) b='Safari'; else if(ua.indexOf('OPR/')!==-1||ua.indexOf('Opera/')!==-1) b='Opera'; return `${os} · ${b}`; }
            document.getElementById('deviceInfo').textContent = getDeviceInfo();

            // 实时统计
            function randomInt(min,max){ return Math.floor(Math.random()*(max-min+1))+min; }
            function updateStats(){ document.getElementById('onlineCount').innerText=randomInt(350,420); document.getElementById('todayJoin').innerText=randomInt(20,45); }
            setInterval(updateStats,8000); updateStats();
            const last = localStorage.getItem('lastVisitTime');
            document.getElementById('lastVisit').innerText = last || '第一次来';
            localStorage.setItem('lastVisitTime', new Date().toLocaleTimeString('zh-CN', {hour:'2-digit', minute:'2-digit'}));

            // ========== 每日一言 (中文，每日更新) ==========
            const hitokotoContent = document.getElementById('hitokotoContent');
            
            // 获取当前日期字符串 (YYYY-MM-DD)
            function getTodayDateStr() {
                const d = new Date();
                return `${d.getFullYear()}-${(d.getMonth()+1).toString().padStart(2,'0')}-${d.getDate().toString().padStart(2,'0')}`;
            }

            // 从API获取新句子并存储到localStorage
            function fetchAndStoreHitokoto() {
                return new Promise((resolve, reject) => {
                    const script = document.createElement('script');
                    const callbackName = 'hitokotoCallback_' + Date.now();
                    window[callbackName] = function(data) {
                        // 确保是中文 (hitokoto默认就是中文，但我们可以检查)
                        let text = `“${data.hitokoto}” —— ${data.from}`;
                        // 存储到localStorage
                        const today = getTodayDateStr();
                        localStorage.setItem('hitokoto_text', text);
                        localStorage.setItem('hitokoto_date', today);
                        // 更新显示
                        hitokotoContent.innerHTML = text;
                        // 清理
                        delete window[callbackName];
                        document.body.removeChild(script);
                        resolve();
                    };
                    script.src = `https://v1.hitokoto.cn/?encode=json&callback=${callbackName}`;
                    script.onerror = () => {
                        hitokotoContent.innerHTML = '一言加载失败，请刷新重试';
                        delete window[callbackName];
                        document.body.removeChild(script);
                        reject();
                    };
                    document.body.appendChild(script);
                });
            }

            // 初始化每日一言
            function initHitokoto() {
                const today = getTodayDateStr();
                const storedDate = localStorage.getItem('hitokoto_date');
                const storedText = localStorage.getItem('hitokoto_text');
                
                if (storedDate === today && storedText) {
                    // 当天已存储，直接显示
                    hitokotoContent.innerHTML = storedText;
                } else {
                    // 无存储或日期不对，从API获取新句子
                    hitokotoContent.innerHTML = '加载中...';
                    fetchAndStoreHitokoto().catch(() => {
                        hitokotoContent.innerHTML = '加载失败，点击刷新重试';
                    });
                }
            }

            // 手动刷新 (由刷新按钮调用)
            window.refreshHitokoto = function() {
                hitokotoContent.innerHTML = '加载中...';
                fetchAndStoreHitokoto().catch(() => {
                    hitokotoContent.innerHTML = '加载失败，请重试';
                });
            };

            // 执行初始化
            initHitokoto();

            // ---------- 按钮功能 ----------
            window.handleQQClick = function() { copyToClipboard(QQ_NUM).then(()=>{ showToast('已复制: '+QQ_NUM); vibrate(); const iframe=document.createElement('iframe'); iframe.style.display='none'; iframe.src='mqq://'; document.body.appendChild(iframe); setTimeout(()=>{ document.body.removeChild(iframe); const iframe2=document.createElement('iframe'); iframe2.style.display='none'; iframe2.src='tencent://'; document.body.appendChild(iframe2); setTimeout(()=>document.body.removeChild(iframe2),800); },800); }).catch(()=>prompt('复制失败，请手动复制',QQ_NUM)); };
            window.copyQQ = function(e) { e?.preventDefault(); copyToClipboard(QQ_NUM).then(()=>{ showToast('已复制: '+QQ_NUM); vibrate(); }); };
            window.copyTG = function(e) { e?.preventDefault(); copyToClipboard(TG_LINK).then(()=>{ showToast('已复制: '+TG_LINK); vibrate(); }); };
            window.copyKuaiShou = function(e) { e?.preventDefault(); copyToClipboard(KUAISHOU_ID).then(()=>{ showToast('已复制: '+KUAISHOU_ID); vibrate(); }); };
            window.copyBlackSilk = function(e) { e?.preventDefault(); copyToClipboard(SEARCH_KEYWORD).then(()=>{ showToast('已复制: '+SEARCH_KEYWORD); vibrate(); }); };
            window.handleKuaiShouClick = function() { vibrate(30); showToast('尝试唤起快手...'); window.location.href = KUAISHOU_SCHEME; setTimeout(()=>{ if(document.visibilityState==='visible') window.open(KUAISHOU_WEB,'_blank'); },500); };
            window.handleSearchBlackSilk = function() { vibrate(30); showToast('搜索黑丝...'); window.location.href = SEARCH_SCHEME; setTimeout(()=>{ if(document.visibilityState==='visible') window.open(SEARCH_WEB,'_blank'); },500); };
            window.forceTelegramJump = function() { vibrate(30); window.open(TG_LINK,'_blank'); };

            // Telegram检测
            window.handleTelegramClick = function() { const btn=document.getElementById('telegramBtn'); const originalHTML=btn.innerHTML; btn.classList.add('loading'); btn.innerHTML='<span>⏳</span> 检测网络中... <span class="arrow">⏱️</span>'; let successCount=0; const testUrls=['https://core.telegram.org/favicon.ico?t='+Date.now(),'https://www.google.com/favicon.ico?t='+Date.now(),'https://telegram.org/favicon.ico?t='+Date.now()]; let completed=0; function testWithImage(url){ return new Promise((resolve)=>{ const img=new Image(); const to=setTimeout(()=>{ img.src=''; resolve(false); },5000); img.onload=()=>{ clearTimeout(to); resolve(true); }; img.onerror=()=>{ clearTimeout(to); resolve(false); }; img.src=url; }); } const promises=testUrls.map(url=>testWithImage(url).then(r=>{ if(r) successCount++; completed++; })); const timeout=setTimeout(()=>{ if(successCount===0){ resetButton(btn,originalHTML); showVPNAlert('⏳','连接超时','检测超时，请确认VPN已开启并设置为全局模式。'); } },8000); Promise.all(promises).then(()=>{ clearTimeout(timeout); if(successCount>0){ resetButton(btn,originalHTML); vibrate(30); window.open(TG_LINK,'_blank'); sendNotification('Telegram连接成功',{body:'即将跳转至群组'}); } else { resetButton(btn,originalHTML); showVPNAlert('✈️','未检测到Telegram','请确认VPN已开启，或尝试手动复制链接: '+TG_LINK); } }); };
            function resetButton(btn,html){ btn.classList.remove('loading'); btn.innerHTML=html; }

            // 快捷键
            document.addEventListener('keydown', (e) => { const key=e.key.toLowerCase(); if(key==='c'&&!e.ctrlKey){ e.preventDefault(); copyToClipboard(QQ_NUM).then(()=>showToast('已复制群号 (C)')); } else if(key==='t'){ e.preventDefault(); forceTelegramJump(); } else if(key==='k'){ e.preventDefault(); handleKuaiShouClick(); } else if(key==='v'){ e.preventDefault(); handleSearchBlackSilk(); } else if(key==='d'){ e.preventDefault(); toggleTheme(); showToast('主题已切换 (D)'); } });

            // 弹窗
            setTimeout(()=>showModal('welcomeModal'),200);
            document.getElementById('welcomeModal').addEventListener('click',function(e){ if(e.target===this) closeModal('welcomeModal'); });
            document.getElementById('vpnAlertModal').addEventListener('click',function(e){ if(e.target===this) closeModal('vpnAlertModal'); });
            window.closeModal = closeModal;

            // 工具栏
            window.toggleToolbarMenu = function() { document.getElementById('toolbarMenu').classList.toggle('show'); };
            document.addEventListener('click', function(e) { const m=document.getElementById('toolbarMenu'), btn=document.querySelector('.toolbar-btn'); if(btn&&!btn.contains(e.target) && !m.contains(e.target)) m.classList.remove('show'); });

            // 壁纸 & 主题
            const wallpapers = ['radial-gradient(circle at 30% 30%, #0b1120, #030614)','radial-gradient(circle at 70% 30%, #1a2a4a, #0b1a2a)','radial-gradient(circle at 30% 70%, #2a1a4a, #1a0b2a)','linear-gradient(145deg, #0b1120, #2a5298)'];
            let wpIndex = 0;
            window.changeWallpaper = function() { wpIndex = (wpIndex+1)%wallpapers.length; document.body.style.background = wallpapers[wpIndex]; document.body.style.backgroundSize = 'cover'; };
            window.toggleTheme = function() { document.body.classList.toggle('dark-theme'); };
            window.sharePage = function() { if (navigator.share) { navigator.share({ title:'Cc配置精简版', text:'加入交流群，认准Cc配置', url:window.location.href }).catch(()=>{}); } else { copyToClipboard(window.location.href).then(()=>showToast('链接已复制，可手动分享')); } };

            // 盾牌彩蛋
            let shieldClickCount = 0;
            window.handleShieldClick = function() { shieldClickCount++; if(shieldClickCount>=5) { triggerEasterEgg(); shieldClickCount=0; } };
            function triggerEasterEgg() { const canvas=document.getElementById('easter-egg-canvas'), ctx=canvas.getContext('2d'); canvas.width=window.innerWidth; canvas.height=window.innerHeight; const particles=[]; for(let i=0;i<100;i++) { particles.push({ x:canvas.width/2, y:canvas.height/2, vx:(Math.random()-0.5)*20, vy:(Math.random()-0.5)*20, life:1, color:`hsl(${Math.random()*360},100%,50%)` }); } function animate() { ctx.clearRect(0,0,canvas.width,canvas.height); let alive=false; particles.forEach(p=>{ p.x+=p.vx; p.y+=p.vy; p.vy+=0.5; p.life-=0.01; if(p.life>0) { alive=true; ctx.globalAlpha=p.life; ctx.fillStyle=p.color; ctx.fillRect(p.x,p.y,4,4); } }); if(alive) requestAnimationFrame(animate); else ctx.clearRect(0,0,canvas.width,canvas.height); } animate(); }

            // 问候语音
            let audioContext = null;
            let greetingSoundPlayed = false;
            function playGreetingSound() {
                if (greetingSoundPlayed) return;
                greetingSoundPlayed = true;
                try {
                    if (!audioContext) {
                        audioContext = new (window.AudioContext || window.webkitAudioContext)();
                    }
                    const playSound = () => {
                        if (!audioContext) return;
                        const osc = audioContext.createOscillator();
                        const gain = audioContext.createGain();
                        osc.type = 'sine';
                        osc.frequency.value = 880;
                        gain.gain.value = 0.15;
                        osc.connect(gain);
                        gain.connect(audioContext.destination);
                        osc.start();
                        osc.stop(audioContext.currentTime + 0.15);
                    };
                    if (audioContext.state === 'suspended') {
                        audioContext.resume().then(playSound).catch(() => {});
                    } else {
                        playSound();
                    }
                } catch (e) {}
            }
            function setupGreetingSound() {
                const events = ['click', 'touchstart', 'keydown'];
                function handler() {
                    playGreetingSound();
                    events.forEach(e => document.removeEventListener(e, handler));
                }
                events.forEach(e => document.addEventListener(e, handler, { passive: true }));
            }
            setupGreetingSound();
        })();
    </script>
</body>
</html>
