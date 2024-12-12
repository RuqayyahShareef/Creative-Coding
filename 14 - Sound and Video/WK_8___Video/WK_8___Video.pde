import processing.video.*;    // Needed to display video.
 
Movie myVideo;                // Stores the video object.
 
void setup()
{
  size(640, 360);
  myVideo = new Movie(this, "HelloWorldClip.mov");
  myVideo.play();
}
 
void draw()
{
  // Display the video at position (0,0) at its natural size.
  image(myVideo, 0, 0);
}
 
// This is needed to read in the movie while it is playing.
void movieEvent(Movie videoBuffer)
{
  //feeds new frames to the sketch as they come along
  videoBuffer.read();
}
