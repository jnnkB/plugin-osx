# Return the path of the frontmost Finder window

function pfs
  if count $argv >/dev/null
    switch $argv[1]
      case -d --description
        echo "Return the path of the frontmost Finder window"
        return 0
    end
  end
  osascript 2>/dev/null -e '
      set output to ""
      tell application "Finder" to set the_selection to selection
      set item_count to count the_selection
      repeat with item_index from 1 to count the_selection
        if item_index is less than item_count then set the_delimiter to "\n"
        if item_index is item_count then set the_delimiter to ""
        set output to output & ((item item_index of the_selection as alias)\'s POSIX path) & the_delimiter
      end repeat'
end