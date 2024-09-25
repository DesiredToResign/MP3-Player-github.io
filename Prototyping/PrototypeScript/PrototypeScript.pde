import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
int numberOfSongs = 3;
AudioPlayer[] songs = new AudioPlayer[numberOfSongs];
int currentSongIndex = 0;

int appWidth, appHeight;
float musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight;
float stopX, stopY, stopWidth, stopHeight;

String musicPath = "MP3s/";
String mp3FileName = ".mp3";
String[] musicNames = {
  "one",
  "two",
  "three"
};

// Global Variables
void setup() {
  size(900, 600);
  appWidth = width;
  appHeight = height;
  // button variables
  musicButtonWidth = appWidth*1/2;
  musicButtonHeight = appHeight*1/2;
  musicButtonX = musicButtonWidth - musicButtonWidth*1/2;
  musicButtonY = musicButtonHeight - musicButtonHeight*1/2;
  if (musicButtonWidth >= musicButtonHeight) {
    //musicButtonWidth needs to change
    musicButtonWidth = musicButtonHeight;
  } else {
    musicButtonHeight = musicButtonWidth;
  }
  float padding = 1.0/4.0;
  float stopButtonSize = 1.0-(1.0/4.0);
  
  stopWidth = musicButtonWidth*stopButtonSize; 
  stopHeight = musicButtonHeight*stopButtonSize;

  stopX = musicButtonX+=padding;
  stopY = musicButtonY+=padding; 

  minim = new Minim(this);

  // Load Music
  for (int i = 0; i < numberOfSongs; i++) {
    songs[i] = minim.loadFile(musicPath + musicNames[i] + mp3FileName);
  }

  // songs[currentSongIndex].play();
} // End Setup

void draw() {
  String[] musicNames = {
    "one",
    "two",
    "three"
  };

  background(0);
  fill(255, 0, 0);
  textSize(32);
  text("Now Playing: " + musicNames[currentSongIndex], 50, height / 2);
  text("Press SPACE to switch songs", 50, height / 2 + 40);
  rect(musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight);
  rect(stopX, stopY, stopWidth, stopHeight);

  // rect(X, Y, Width, Height);
  // rect();
  // rect();
} // End draw

void mousePressed() {
} // End mousePressed

void keyPressed() {
  if (key == ' ') {
    for (AudioPlayer song : songs) {
      song.close();
    }
    currentSongIndex = (currentSongIndex + 1) % numberOfSongs;
    // not playing for some reason (cant find track?) // songs[currentSongIndex].play();
  }
} // End keyPressed
