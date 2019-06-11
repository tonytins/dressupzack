// Anthony Wilcox licenses this file to you under the GPL license.
// See the LICENSE file in the project root for more information.
using Godot;

public class TitleScn : Node {

    void _on_PlayBtn_pressed() {
        GetTree().ChangeScene("res://scn/GameScn.tscn");
    }

    void _on_CreditsBtn_pressed() {
        GetTree().ChangeScene("res://scn/CreditsScn.tscn");
    }

    void _on_LicenseBtn_pressed() {
        var licenseWin = GetNode<Control> ("WinDialogs/LicenseWin");
        licenseWin.Show ();
    }
}