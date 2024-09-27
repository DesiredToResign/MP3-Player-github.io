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

String musicPath = "MP3s/";
String mp3FileName = ".mp3";
String[] musicNames = {
  "one",
  "two",
  "three"
};

// Global Variables
void setup() {
  size(900, 900);

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
