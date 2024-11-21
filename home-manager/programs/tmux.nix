{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    shortcut = "a";
    terminal = "screen-256color";
    extraConfig = ''
      # ウィンドウを閉じた時に番号を詰める
      set-option -g renumber-windows on

      # ステータスバーの非表示
      set -g status off

      # Ctrl-o でペインをローテーションしながら移動
      bind -n C-o select-pane -t :.+
      # Prefix + | でペインを垂直分割する
      bind | split-window -h -c "#{pane_current_path}"
      # Prefix + - でペインを水平分割する
      bind - split-window -v -c "#{pane_current_path}"
    '';
  };
}
