// Anthony Wilcox licenses this file to you under the GPL license.
// See the LICENSE file in the project root for more information.
using Godot;

public class Soundtrack : AudioStreamPlayer
{
    public override void _Ready () {
        //Connect ("finished", this, "PlayRandomSong");
        //PlayRandomSong();
    }

    void PlayRandomSong () {
        var rand = new RandomNumberGenerator();
        rand.Randomize ();

        var tracks = new string[] {
            "reminiscing",
            "together_again",
            "at_the_lake",
            "mushrooms",
        };
        var index = rand.RandiRange(0, tracks.Length);
        var audiostream = ResourceLoader.Load<AudioStream>($"res://music/{tracks[index]}.ogg");
        Stream = audiostream;
        Play();
    }
}