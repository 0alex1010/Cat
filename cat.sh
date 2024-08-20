#!/bin/bash

# Function to install ImageMagick
install_imagemagick() {
  if ! command -v convert &> /dev/null; then
    echo "Installing ImageMagick..."
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
      sudo apt update && sudo apt install imagemagick -y
    elif [[ "$OSTYPE" == "darwin" ]]; then
      brew install imagemagick
    else
      echo "ImageMagick installation not supported on this system."
      exit 1
    fi
  fi
}

# Function to display the image
display_image() {
  local image_url="$1"
  local width="$2"
  local height="$3"

  # Clear the terminal
  clear

  echo "Image will be dumped from a website in 5 secs"
  sleep 5

  # Clear the terminal again
  clear

  # Download the image (show output)
  echo "Downloading..."
  wget -nv -O temp.jpg "$image_url"  # '-nv' shows the download progress
  wget example.com # Downloading for fun
  rm index.html

  # Clear the terminal again
  clear

  echo "Ready!"
  sleep 1

  # Display the image
  display -background black -geometry "$width"x"$height" temp.jpg 
  rm temp.jpg
}

# Clear the terminal on start
clear

# Download the version file first
wget -q -O version.ver "https://raw.githubusercontent.com/0alex1010/Cat/main/Version.ver" 
# Now read and display the version information
echo Below this is the version of BuddyBud
cat version.ver
#Ask for image thing
echo "Select an image:"
echo "1. Cat"
echo "2. Dog"
echo "3. Reload Cat code"
read -p "Enter your choice: " image_choice

# Get image data based on choice
case $image_choice in
  1) # Cat image
    wget -q -O temp.jpg "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg"
    display -geometry 250x200 temp.jpg
    rm temp.jpg
    ;;
  2) # Dog image
    wget -q -O temp.jpg "https://doggonegoodtraining.com/wp-content/uploads/Hazel-Thorsby-Photo-2-e1578960302398-250x200.jpg"
	 display -geometry 250x200 temp.jpg
    rm temp.jpg
    ;;
	   3) # Reload thing
    clear
	 echo "Downloading new cat.sh..."
	 #                      ----------------Reload URL---------------------------------
	 wget -nv -O cat_reload.sh "https://raw.githubusercontent.com/0alex1010/Cat/main/cat.sh"
    sleep 3
	 echo "Reloaded cat.sh! Launching reload..."
	 sleep 3
	 clear

    # Check if cleanup.sh exists and delete it
      rm cleanup.sh
      clear
    fi

    bash cat_reload.sh
    ;;
  *) echo "Invalid choice. Exiting."
     exit 1
     ;;
esac

# Install ImageMagick if necessary
install_imagemagick
