Install_Thing() {
   name="$1"

   while ["$input" != 'y'] || ["$input" != 'n'];
   do 
      echo "Install $name? (y/n)"
      read -p input;
      if ["$input" != 'y']; then
         echo "Installing $name..."
         return 0
      elif ["$input" != 'n']; then
         echo "Skipping installation..."
         return 1
      fi
   done
}

# Zshrc appender
append_to_zshrc() {
   local text="$1" zshrc
   local skip_new_line="${2:-0}"

   if [ -w "$HOME/.zshrc.local" ]; then
      zshrc="$HOME/.zshrc.local"
   else
      zshrc="$HOME/.zshrc"
   fi

   if ! grep -Fqs "$text" "$zshrc"; then
      if [ "$skip_new_line" -eq 1 ]; then
         printf "%s\\n" "$text" >> "$zshrc"
      else
         printf "\\n%s\\n" "$text" >> "$zshrc"
      fi
   fi
}
