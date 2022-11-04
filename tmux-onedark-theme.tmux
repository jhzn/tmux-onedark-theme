#!/bin/bash

src() {
	[ -f "$1" ] && source "$1"
}
src ~/.cache/tmux_theme

onedark_background=${onedark_background:-"#282c34"}
onedark_foreground=${onedark_foreground:-"#aab2bf"}
onedark_blue=${onedark_blue:-"#61afef"}
onedark_yellow=${onedark_yellow:-"#e5c07b"}
onedark_red=${onedark_red:-"#e06c75"}
onedark_green=${onedark_green:-"#98c379"}
onedark_highlights=${onedark_highlights:-"#3e4452"}
onedark_comment_grey=${onedark_comment_grey:-"#5c6370"}

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$onedark_foreground"
set "message-bg" "$onedark_background"

set "message-command-fg" "$onedark_foreground"
set "message-command-bg" "$onedark_background"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$onedark_background"
setw "window-status-bg" "$onedark_background"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$onedark_background"
setw "window-status-activity-fg" "$onedark_background"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "pane-border-fg" "$onedark_foreground"
set "pane-border-bg" "$onedark_background"
set "pane-active-border-fg" "$onedark_green"
set "pane-active-border-bg" "$onedark_background"

set "display-panes-active-colour" "$onedark_yellow"
set "display-panes-colour" "$onedark_blue"

set "status-bg" "$onedark_background"
set "status-fg" "$onedark_foreground"

set "@prefix_highlight_fg" "$onedark_background"
set "@prefix_highlight_bg" "$onedark_green"
set "@prefix_highlight_copy_mode_attr" "fg=$onedark_background,bg=$onedark_green"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@onedark_widgets")
time_format=$(get "@onedark_time_format" "%R")
date_format=$(get "@onedark_date_format" "%d/%m/%Y")

set "status-right" "#[fg=$onedark_foreground,bg=$onedark_background,nounderscore,noitalics]${time_format}  ${date_format} #[fg=$onedark_highlights,bg=$onedark_background]#[fg=$onedark_highlights,bg=$onedark_highlights]#[fg=$onedark_foreground, bg=$onedark_highlights]${status_widgets} #[fg=$onedark_green,bg=$onedark_highlights,nobold,nounderscore,noitalics]#[fg=$onedark_background,bg=$onedark_green,bold] #h #[fg=$onedark_yellow, bg=$onedark_green]#[fg=$onedark_red,bg=$onedark_yellow]"
set "status-left" "#[fg=$onedark_background,bg=$onedark_green,bold] #S #{prefix_highlight}#[fg=$onedark_green,bg=$onedark_background,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$onedark_background,bg=$onedark_background,nobold,nounderscore,noitalics]#[fg=$onedark_foreground,bg=$onedark_background] #I  #W #[fg=$onedark_background,bg=$onedark_background,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$onedark_background,bg=$onedark_highlights,nobold,nounderscore,noitalics]#[fg=$onedark_foreground,bg=$onedark_highlights,nobold] #I  #W #[fg=$onedark_highlights,bg=$onedark_background,nobold,nounderscore,noitalics]"
