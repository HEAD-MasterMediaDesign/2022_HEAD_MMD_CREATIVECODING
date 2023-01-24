// from 
// https://github.com/sparks/themidibus
 
// This means that you include everything from the library
// see https://processing.org/reference/import.html
import themidibus.*;

// Here, you define a variable of that library you will use
MidiBus myBus;

// Here, you define your variable to change.
// This will eventually be changed with values from your code.
float circleWidth = 100;

void setup() {
  size(400, 400);
  background(0);

  MidiBus.list(); // Here, the .list() lists all evailable inputs

  // Here, you assign an input to your library variable/instance;                    
  myBus = new MidiBus(this, 1, 0);

}

void draw() {
  background(0); 
  circle(width / 2, height / 2, circleWidth);

}

void noteOn(Note note) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+note.channel());
  println("Pitch:"+note.pitch());
  println("Velocity:"+note.velocity());
}

void noteOff(Note note) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+note.channel());
  println("Pitch:"+note.pitch());
  println("Velocity:"+note.velocity());
}

void controllerChange(ControlChange change) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+change.channel());
  println("Number:"+change.number());
  println("Value:"+change.value());
  
  // Here, you ssign the value of the controller change (through the input you assigned)
  // To the new value of the circleWidth;
  
  if( change.channel() == 0 ) circleWidth = change.value();
}
