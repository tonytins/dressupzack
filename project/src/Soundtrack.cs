using System;
using Godot;

public class Soundtrack : AudioStreamPlayer {
    // Declare member variables here. Examples:
    // private int a = 2;
    // private string b = "text";

    // Called when the node enters the scene tree for the first time.
    public override void _Ready () {
        Connect ("finished", this, "PlayRandomSong");
        PlayRandomSong ();
    }

    void PlayRandomSong () {
        var rand = new RandomNumberGenerator ();
        rand.Randomize ();

        var tracks = new string[] {
            "reminiscing",
            "together_again",
            "at_the_lake",
            "mushrooms",
        };
        var randDb = rand.Randi () % tracks.Length;
        // var audiostream = this.
        Play ();
    }
}