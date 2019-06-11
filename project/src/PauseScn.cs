using Godot;

public class PauseScn : Control
{
    void IsGamePaused(bool isPaused)
    {
        if (isPaused)
            GetTree().Paused = true;
        else
            GetTree().Paused = false;
    }

    public override void _Ready()
    {

    }

    public override void _Process(float delta)
    {
        if (Input.IsActionPressed("ui_pause"))
        {
            GetNode<Popup>("PauseWin").Show();
            IsGamePaused(true);
        }
    }

    void _on_ExitBtn_pressed()
    {
        IsGamePaused(false);
        GetTree().ChangeScene("res://scn/TitleScn.tscn");
    }

    void _on_SettingsBtn_pressed()
    {
        GetNode<Popup>("SettingsWin").Show();
    }

    void _on_ResumeBtn_pressed()
    {
        GetNode<Popup>("PauseWin").Hide();
        IsGamePaused(false);
    }
}
